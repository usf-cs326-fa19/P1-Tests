source "${TEST_DIR}/funcs.bash"

test_start "Hostname Check"

expected_hostname="Hostname: deus-ex-machina"
actual_hostname=$(./inspector -p "${TEST_DIR}/fakeproc" -s | grep 'Hostname')
compare --ignore-all-space \
    <(echo "${expected_hostname}") <(echo "${actual_hostname}") || test_end 1

expected_hostname="Hostname: $(hostname)"
actual_hostname=$(./inspector -s | grep 'Hostname')
compare --ignore-all-space \
    <(echo "${expected_hostname}") <(echo "${actual_hostname}") || test_end 1

test_end
