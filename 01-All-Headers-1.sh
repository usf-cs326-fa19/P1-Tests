source "${TEST_DIR}/funcs.bash"

test_start "System/Hardware/Task Headers"
output_text=$(./inspector -a)
grep -q 'System Information' <<< "${output_text}" \
    && grep -q 'Hardware Information' <<< "${output_text}" \
    && grep -q 'Task Information' <<< "${output_text}" \
    && sed 's/[[:space:]]//g' <<< "${output_text}" | grep -q 'PID|State|TaskName|User|Tasks'
test_end
