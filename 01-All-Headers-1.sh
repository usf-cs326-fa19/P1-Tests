source "${TEST_DIR}/funcs.bash"

test_start "System/Hardware/Task Headers"

# This checks that each of the required headers is present. For the task list,
# each column heading is checked (note that spaces are ignored).

output_text=$(./inspector -a)
grep -q 'System Information' <<< "${output_text}" \
    && grep -q 'Hardware Information' <<< "${output_text}" \
    && grep -q 'Task Information' <<< "${output_text}" \
    && sed 's/[[:space:]]//g' <<< "${output_text}" \
        | grep -q 'PID|State|TaskName|User|Tasks'
test_end
