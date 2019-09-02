source "${TEST_DIR}/funcs.bash"

test_start "Invalid /proc directory" \
"If the directory given for -p is invalid, print an error message and exit.
Return EXIT_FAILURE or similar. Test fails if return = 0 or segfault."

./inspector -a -p /this/directory/does/not/exist
[[ ${?} -ne 0 && ${?} -ne 139 ]];
test_end
