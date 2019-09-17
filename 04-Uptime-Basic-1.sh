source "${TEST_DIR}/funcs.bash"

test_start "Basic Uptime Formatting"

expected_uptime="Uptime: 17 days, 5 hours, 38 minutes, 55 seconds"
reported_uptime=$(./inspector -p "${TEST_DIR}/fakeproc" -s | grep -i 'Uptime')
compare --ignore-all-space --ignore-case \
    <(echo "${expected_uptime}") <(echo "${reported_uptime}") || test_end 1

test_end
