source "${TEST_DIR}/funcs.bash"

test_start "Task States" \
    "Checks for the various task states in the output"

matches=$(./inspector -p "${TEST_DIR}/fakeproc" -t \
    | grep 'tracing stop' | wc -l)

list=$(./inspector -p "${TEST_DIR}/fakeproc" -t)

# Now check for each process state (running, sleeping, disk sleep, zombie, dead)
[ ${matches} -eq 1 ] \
    && grep 'sleeping' <<< "${list}" &>/dev/null \
    && grep 'running' <<< "${list}" &>/dev/null \
    && grep 'zombie' <<< "${list}" &>/dev/null
test_end
