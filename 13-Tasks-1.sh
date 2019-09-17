source "${TEST_DIR}/funcs.bash"

expected_tasks="Tasks running: 1487"

test_start "Task Count"

reported_tasks=$(./inspector -p "${TEST_DIR}/fakeproc" -t \
    | grep -i 'Tasks[[:space:]]*running')
compare --ignore-all-space --ignore-case \
    <(echo "${expected_tasks}") <(echo "${reported_tasks}") || test_end 1

test_end
