source "${TEST_DIR}/funcs.bash"

test_start "Kernel Version"

expected_version="Kernel Version: 1.33.7-111.1.1.el7.x86_64"
reported_version=$(./inspector -p "${TEST_DIR}/fakeproc" -s | grep -i 'kernel')
compare --ignore-all-space --ignore-case \
    <(echo "${expected_version}") <(echo "${reported_version}") || test_end 1

expected_version="Kernel Version: $(uname -r)"
reported_version=$(./inspector -s | grep -i 'Kernel')
compare --ignore-all-space --ignore-case \
    <(echo "${expected_version}") <(echo "${reported_version}") || test_end 1

test_end
