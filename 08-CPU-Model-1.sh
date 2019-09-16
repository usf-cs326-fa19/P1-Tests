source "${TEST_DIR}/funcs.bash"

test_start "CPU Model"

expected_model="CPU Model: AMD EPYC 7281 16-Core Processor"
reported_model=$(./inspector -p "${TEST_DIR}/fakeproc" -r \
    | grep -i 'CPU[[:space:]]*Model')
compare --ignore-all-space \
    <(echo "${expected_model}") <(echo "${reported_model}") || test_end 1

expected_model="CPU Model: $(grep 'model name' /proc/cpuinfo \
    | sed 's/.*: //' | head -n 1 )"
reported_model=$(./inspector -r | grep -i 'CPU[[:space:]]*Model')
compare --ignore-all-space \
    <(echo "${expected_model}") <(echo "${reported_model}") || test_end 1

test_end
