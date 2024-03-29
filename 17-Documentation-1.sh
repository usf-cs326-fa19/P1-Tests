source "${TEST_DIR}/funcs.bash"

test_start "Documentation Check" \
    "Ensures documentation is provided for each function and data structure"

if ! ( which doxygen &> /dev/null ); then
    # "Doxygen is not installed. Please install (as root) with:"
    # "pacman -Sy doxygen"
    test_end 1
fi

doxygen "${TEST_DIR}/Doxyfile" 2>&1 \
    | grep -v '(variable)' \
    | grep -v '(macro definition)' \
    | grep 'is not documented' \
        && test_end 1

test_end 0
