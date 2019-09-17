source "${TEST_DIR}/funcs.bash"

expected_line="88888 |       zombie | really_really_long_named_ | $(whoami) |  9256"

test_start "Correct Process Info, Name Truncation, and Sub-Task Count (9256)"

reported_line=$(./inspector -p "${TEST_DIR}/fakeproc" -t | grep '88888')
compare --ignore-all-space \
    <(echo "${expected_line}") <(echo "${reported_line}") || test_end 1

test_end
