source "${TEST_DIR}/funcs.bash"

cp "${TEST_DIR}/orig_uptime" "${TEST_DIR}/fakeproc/uptime"
expected_uptime="Uptime: 17 days, 5 hours, 38 minutes, 55 seconds"

test_start "Basic Uptime Formatting"

run ./inspector -p "${TEST_DIR}/fakeproc" -s

filter 'Uptime'

compare --ignore-all-space --ignore-case \
    <(echo "${expected_uptime}") <(echo "${filtered_output}") || test_end

test_end
