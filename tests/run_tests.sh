#!/usr/bin/env bash
# Minimal tests for the five assignment scripts. Run: bash tests/run_tests.sh
cd "$(dirname "$0")/.." || exit 1
fail=0
check() { # check <description> <command...>
    local desc=$1; shift
    if "$@"; then echo "ok   - $desc"; else echo "FAIL - $desc"; fail=1; fi
}
tmp=$(mktemp -d); trap 'rm -rf "$tmp"' EXIT

printf 'Error one\nall fine\nERROR two\nan [error] with a.b\nnothing\n' > "$tmp/log"

out=$(bash script4_log_analyzer.sh "$tmp/log")
check "script4 counts case-insensitively" grep -q "found 3 time(s)" <<<"$out"
out=$(bash script4_log_analyzer.sh "$tmp/log" "a.b")
check "script4 treats the keyword as plain text (a.b matches only a.b)" grep -q "found 1 time(s)" <<<"$out"
out=$(bash script4_log_analyzer.sh "$tmp/log" "[error]")
check "script4 accepts regex metacharacters" grep -q "found 1 time(s)" <<<"$out"
out=$(bash script4_log_analyzer.sh "$tmp/log" "-x")
check "script4 accepts a keyword starting with a dash" grep -q "found 0 time(s)" <<<"$out"
check "script4 fails without arguments" bash -c '! bash script4_log_analyzer.sh >/dev/null'
check "script4 fails for a missing file" bash -c '! bash script4_log_analyzer.sh /nonexistent >/dev/null'

seq 1 20000 | sed 's/$/ line error/' > "$tmp/big"
start=$SECONDS
bash script4_log_analyzer.sh "$tmp/big" >/dev/null
check "script4 handles 20,000 lines quickly (< 10 s)" test $((SECONDS - start)) -lt 10

cd "$tmp" || exit 1
printf 'vim\\n\nfree\\dom\nmy\\app\n' | bash "$OLDPWD/script5_manifesto_generator.sh" >/dev/null
check "script5 keeps backslashes from user input" grep -qF 'free\dom' "manifesto_$(whoami).txt"
cd - >/dev/null || exit 1

check "script1 runs" bash -c "bash script1_system_identity.sh >/dev/null"
check "script3 runs" bash -c "bash script3_disk_auditor.sh >/dev/null"
if command -v dpkg >/dev/null; then
    check "script2 reports an unknown package as not installed" bash -c 'bash script2_package_inspector.sh no-such-package-xyz | grep -q "NOT INSTALLED"'
else
    check "script2 explains that dpkg is required" bash -c 'bash script2_package_inspector.sh 2>&1 | grep -q "dpkg not found"'
fi

exit $fail
