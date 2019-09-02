source "${TEST_DIR}/funcs.bash"

test_start "Load Average"

reported_load=$(./inspector -p "${TEST_DIR}/fakeproc" -r \
    | grep -i 'Load Average' | awk '{print $(NF - 2), $(NF - 1), $(NF)}')
expected_load="1.87 1.27 1.07"

#actual_load=$(./inspector -r | grep -i 'Load Average' \
#    | awk '{print $(NF - 2), $(NF - 1), $(NF)}')
#expected_actual_load=$(awk '{ print $1, $2, $3 }' /proc/loadavg)

[ "${reported_load}" = "${expected_load}" ]
test_end
