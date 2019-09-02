source "${TEST_DIR}/funcs.bash"

test_start "Kernel Version"
reported_version=$(./inspector -p "${TEST_DIR}/fakeproc" -s \
    | grep -i '^Kernel Version:' | awk '{print $3}')
expected_version="1.33.7-111.1.1.el7.x86_64"

actual_version=$(./inspector -s | grep -i '^Kernel Version:' | awk '{print $3}')
expected_actual_version=$(uname -r)

[ "${reported_version}" = "${expected_version}" ] \
    && [ "${actual_version}" = "${expected_actual_version}" ]
test_end
