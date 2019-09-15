source "${TEST_DIR}/funcs.bash"

test_start "Processing Units"

expected_units="Processing Units: 64"
reported_units=$(./inspector -p "${TEST_DIR}/fakeproc" -r \
    | grep -i 'Processing.*:')
compare --ignore-all-space \
    <(echo "${expected_units}") <(echo "${reported_units}") || test_end 1

expected_units="Processing Units: $(grep '^processor' /proc/cpuinfo | wc -l)"
reported_units=$(./inspector -r | grep -i 'Processing.*:')
compare --ignore-all-space \
    <(echo "${expected_units}") <(echo "${reported_units}") || test_end 1

test_end
