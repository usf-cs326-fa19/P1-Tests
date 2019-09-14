source "${TEST_DIR}/funcs.bash"

test_start "Uptime Formatting: Short Timespan"

prev_uptime=$(cat "${TEST_DIR}/fakeproc/uptime")
echo "135.17 93892480.110" > "${TEST_DIR}/fakeproc/uptime"

expected_uptime="Uptime: 2 minutes, 15 seconds"
reported_uptime=$(./inspector -p "${TEST_DIR}/fakeproc" -s | grep -i 'Uptime')
echo "${prev_uptime}" > "${TEST_DIR}/fakeproc/uptime"

compare --ignore-all-space \
    <(echo "${expected_uptime}") <(echo "${reported_uptime}") || test_end 1

test_end
