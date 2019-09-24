source "${TEST_DIR}/funcs.bash"

expected_line1="88888 |       zombie | really_really_long_named_ | $(whoami) |  9256"
expected_line2="88888 |       zombie | really_really_long_named_ | root      |  9256"

test_start "Correct Process Info, Name Truncation, and Sub-Task Count (9256)" \
    "Note that there are TWO possible correct outputs"

reported_line=$(./inspector -p "${TEST_DIR}/fakeproc" -t | grep '88888')
compare --ignore-all-space \
    <(echo "${expected_line1}") <(echo "${reported_line}")
result1=$?

compare --ignore-all-space \
    <(echo "${expected_line2}") <(echo "${reported_line}")
result2=$?

if [[ $result1 -ne 0 && $result2 -ne 0 ]]; then
    test_end 1
fi

test_end
