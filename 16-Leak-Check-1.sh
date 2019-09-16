source "${TEST_DIR}/funcs.bash"

test_start "Memory Leak Check"

valgrind ./inspector -p "${TEST_DIR}/fakeproc" 2>&1 \
    | grep 'no leaks are possible'

test_end
