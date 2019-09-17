source "${TEST_DIR}/funcs.bash"

test_start "Hostname Check"

expected_hostname="Hostname: deus-ex-machina"
reported_hostname=$(./inspector -p "${TEST_DIR}/fakeproc" -s \
    | grep -i 'Hostname')
compare --ignore-all-space --ignore-case \
    <(echo "${expected_hostname}") <(echo "${reported_hostname}") || test_end 1

expected_hostname="Hostname: $(hostname)"
reported_hostname=$(./inspector -s | grep -i 'Hostname')
compare --ignore-all-space --ignore-case \
    <(echo "${expected_hostname}") <(echo "${reported_hostname}") || test_end 1

test_end
