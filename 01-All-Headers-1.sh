source "${TEST_DIR}/funcs.bash"

expected_headings1="Hardware Information
System Information
Task Information"

expected_headings2="Hardware Information"

expected_headings3="System Information"

expected_headings4="Task Information"

expected_headings5="System Information
Task Information"

test_start "System/Hardware/Task Headers" \
    "Tests that the various heading combinations are present."

reported_headings=$(./inspector -a \
    | grep -E 'System Information|Hardware Information|Task Information' | sort)
compare --ignore-all-space \
    <(echo "${expected_headings1}") <(echo "${reported_headings}") || test_end 1

reported_headings=$(./inspector -r \
    | grep -E 'System Information|Hardware Information|Task Information' | sort)
compare --ignore-all-space \
    <(echo "${expected_headings2}") <(echo "${reported_headings}") || test_end 1

reported_headings=$(./inspector -s \
    | grep -E 'System Information|Hardware Information|Task Information' | sort)
compare --ignore-all-space \
    <(echo "${expected_headings3}") <(echo "${reported_headings}") || test_end 1

reported_headings=$(./inspector -t \
    | grep -E 'System Information|Hardware Information|Task Information' | sort)
compare --ignore-all-space \
    <(echo "${expected_headings4}") <(echo "${reported_headings}") || test_end 1

reported_headings=$(./inspector -ts \
    | grep -E 'System Information|Hardware Information|Task Information' | sort)
compare --ignore-all-space \
    <(echo "${expected_headings5}") <(echo "${reported_headings}") || test_end 1


test_end
