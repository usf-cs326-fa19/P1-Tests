source "${TEST_DIR}/funcs.bash"

test_start "Correct task list contents and sub-task count (9256)"

./inspector -p "${TEST_DIR}/fakeproc" -l \
    | grep '88888' | sed 's/[[:space:]]//g' \
    | grep '9256$'

test_end
