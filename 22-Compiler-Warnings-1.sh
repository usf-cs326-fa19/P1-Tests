source "${TEST_DIR}/funcs.bash"

test_start "Compiler warnings check" \
    "To pass, eliminate all compiler warnings/errors"

gcc "${TEST_DIR}"/../*.c

test_end
