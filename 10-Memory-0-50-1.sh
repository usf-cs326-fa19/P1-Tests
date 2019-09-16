source "${TEST_DIR}/funcs.bash"

expected_mem1="Memory Usage: [--------------------] 0.0% (0.0 GB / 500.0 GB)"
expected_mem2="Memory Usage: [##########----------] 50.0% (250.0 GB / 500.0 GB)"

test_start "Memory: 0%, 50% Usage" \
    "Checks the output and progress bar when memory usage is 0% and 50%."

cp "${TEST_DIR}/mem/zero" "${TEST_DIR}/fakeproc/meminfo"
reported_mem=$(./inspector -p "${TEST_DIR}/fakeproc" -r \
    | grep -i 'Memory[[:space:]]*Usage')
cp "${TEST_DIR}/mem/original" "${TEST_DIR}/fakeproc/meminfo"
compare --ignore-all-space \
    <(echo "${expected_mem1}") <(echo "${reported_mem}") || test_end 1

cp "${TEST_DIR}/mem/50" "${TEST_DIR}/fakeproc/meminfo"
reported_mem=$(./inspector -p "${TEST_DIR}/fakeproc" -r \
    | grep -i 'Memory[[:space:]]*Usage')
cp "${TEST_DIR}/mem/original" "${TEST_DIR}/fakeproc/meminfo"
compare --ignore-all-space \
    <(echo "${expected_mem2}") <(echo "${reported_mem}") || test_end 1

test_end
