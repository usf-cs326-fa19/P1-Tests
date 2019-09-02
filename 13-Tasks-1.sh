source "${TEST_DIR}/funcs.bash"

test_start "Task Count"

tasks=$(./inspector -p "${TEST_DIR}/fakeproc" -t | grep -i 'tasks' \
    | awk -F': ' '{ print $2 }')

[ "${tasks}" = "1487" ]
test_end
