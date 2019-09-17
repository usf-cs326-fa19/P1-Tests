source "${TEST_DIR}/funcs.bash"

expected_usage1="Memory Usage: [###################-] 94.9% (474.5 GB / 500.0 GB)"
expected_usage2="Memory Usage: [####################] 100.0% (500.0 GB / 500.0 GB)"

test_start "Memory: 94.9%, 100% Usage" \
    "Checks the output and progress bar when memory usage is 94.9% and 100%."

cp "${TEST_DIR}/mem/95" "${TEST_DIR}/fakeproc/meminfo"
reported_usage1=$(./inspector -p "${TEST_DIR}/fakeproc" -r \
    | grep -i 'Memory[[:space:]]*Usage')
cp "${TEST_DIR}/mem/original" "${TEST_DIR}/fakeproc/meminfo"
compare --ignore-all-space --ignore-case \
    <(echo "${expected_usage1}") <(echo "${reported_usage1}") || test_end 1

cp "${TEST_DIR}/mem/100" "${TEST_DIR}/fakeproc/meminfo"
reported_usage2=$(./inspector -p "${TEST_DIR}/fakeproc" -r \
    | grep -i 'Memory[[:space:]]*Usage')
cp "${TEST_DIR}/mem/original" "${TEST_DIR}/fakeproc/meminfo"
compare --ignore-all-space --ignore-case \
    <(echo "${expected_usage2}") <(echo "${reported_usage2}") || test_end 1

test_end
