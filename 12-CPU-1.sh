source "${TEST_DIR}/funcs.bash"

test_start "CPU Usage" \
    "CPU usage should register as 0% when both samples are identical"

./inspector -p "${TEST_DIR}/fakeproc" -r | sed 's/[[:space:]]//g' \
    | grep -i 'CPUUsage:\[--------------------\]0.0%'

test_end
