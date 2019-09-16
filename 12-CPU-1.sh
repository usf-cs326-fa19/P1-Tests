source "${TEST_DIR}/funcs.bash"

expected_cpu="CPU Usage:    [--------------------] 0.0%"

test_start "CPU Usage" \
    "CPU usage should register as 0% when both samples are identical"

reported_cpu=$(./inspector -p "${TEST_DIR}/fakeproc" -r \
    | grep -i 'CPU[[:space:]]Usage')
compare --ignore-all-space \
    <(echo "${expected_cpu}") <(echo "${reported_cpu}") || test_end 1

test_end
