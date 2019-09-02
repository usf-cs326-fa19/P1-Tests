source "${TEST_DIR}/funcs.bash"

test_start "Basic Uptime Formatting"
reported_uptime=$(./inspector -p "${TEST_DIR}/fakeproc" -s \
    | grep -i '^Uptime:' | tr -s ' ')
expected_uptime="Uptime: 17 days, 5 hours, 38 minutes, 55 seconds"
[ "${reported_uptime}" = "${expected_uptime}" ]
test_end
