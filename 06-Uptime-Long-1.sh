source "${TEST_DIR}/funcs.bash"

test_start "Uptime Formatting: Long Timespan"
prev_uptime=$(cat "${TEST_DIR}/fakeproc/uptime")
echo "126146404.41 93892480.110" > "${TEST_DIR}/fakeproc/uptime"
reported_uptime=$(./inspector -p "${TEST_DIR}/fakeproc" -s \
    | grep -i '^Uptime:' | tr -s ' ')
echo "${prev_uptime}" > "${TEST_DIR}/fakeproc/uptime"
expected_uptime="Uptime: 4 years, 40 minutes, 4 seconds"
[ "${reported_uptime}" = "${expected_uptime}" ]
test_end
