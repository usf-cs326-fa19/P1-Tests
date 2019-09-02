source "${TEST_DIR}/funcs.bash"

test_start "Hostname Check"
reported_hostname=$(./inspector -p "${TEST_DIR}/fakeproc" -s \
    | grep '^Hostname:' | awk '{print $2}')
expected_hostname="deus-ex-machina"

actual_hostname=$(./inspector -s \
    | grep '^Hostname:' | awk '{print $2}')
expected_actual_hostname=$(hostname)

[ "${reported_hostname}" = "${expected_hostname}" ] \
    && [ "${actual_hostname}" = "${expected_actual_hostname}" ]
test_end
