source "${TEST_DIR}/funcs.bash"

test_start "Correct Process Name Truncation"

./inspector -p "${TEST_DIR}/fakeproc" -l \
    | grep '88888' | sed 's/[[:space:]]//g' \
    | grep '|really_really_long_named_|'

test_end
