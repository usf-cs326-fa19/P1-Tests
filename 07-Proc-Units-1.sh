source "${TEST_DIR}/funcs.bash"

test_start "Processing Units"

reported_units=$(./inspector -p "${TEST_DIR}/fakeproc" -r \
    | grep -i 'Processing Units:' | awk '{print $3}')
expected_units=64

actual_units=$(./inspector -r | grep -i 'Processing Units:' | awk '{print $3}')
expected_actual_units=$(grep '^processor' /proc/cpuinfo | wc -l)

[ ${reported_units} -eq ${expected_units} ] \
    && [ ${actual_units} -eq ${expected_actual_units} ]
test_end
