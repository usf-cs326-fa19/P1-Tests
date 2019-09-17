source "${TEST_DIR}/funcs.bash"

test_start "Uptime Formatting: Long Timespan"

prev_uptime=$(cat "${TEST_DIR}/fakeproc/uptime")
echo "126146404.41 93892480.110" > "${TEST_DIR}/fakeproc/uptime"

expected_uptime="Uptime: 4 years, 40 minutes, 4 seconds"
reported_uptime=$(./inspector -p "${TEST_DIR}/fakeproc" -s | grep -i 'Uptime')
compare --ignore-all-space --ignore-case \
    <(echo "${expected_uptime}") <(echo "${reported_uptime}") || test_end 1

echo "${prev_uptime}" > "${TEST_DIR}/fakeproc/uptime"

test_end
