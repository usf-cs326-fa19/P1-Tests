source "${TEST_DIR}/funcs.bash"

test_start "Memory: 0%, 50% Usage" \
    "Checks the output and progress bar when memory usage is 0% and 50%."

cp "${TEST_DIR}/mem/zero" "${TEST_DIR}/fakeproc/meminfo"
# Spaces are removed before doing the string comparison:
./inspector -p "${TEST_DIR}/fakeproc" -r | sed 's/[[:space:]]//g' \
    | grep -i 'MemoryUsage:\[--------------------\]0.0%(0.0GB/5....GB)'
result1=${?}
cp "${TEST_DIR}/mem/50" "${TEST_DIR}/fakeproc/meminfo"
./inspector -p "${TEST_DIR}/fakeproc" -r | sed 's/[[:space:]]//g' \
    | grep -i 'MemoryUsage:\[##########----------\]50.0%(2....GB/5....GB)'
result2=${?}
cp "${TEST_DIR}/mem/original" "${TEST_DIR}/fakeproc/meminfo"
[ ${result1} -eq 0 ] && [ ${result2} -eq 0 ]
test_end
