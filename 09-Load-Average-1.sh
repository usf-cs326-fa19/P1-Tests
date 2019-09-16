source "${TEST_DIR}/funcs.bash"

test_start "Load Average"

expected_load="Load Average (1/5/15 min): 1.87 1.27 1.07"
reported_load=$(./inspector -p "${TEST_DIR}/fakeproc" -r \
    | grep -i 'Load[[:space:]]*Average')
compare --ignore-all-space \
    <(echo "${expected_load}") <(echo "${reported_load}") || test_end 1

test_end
