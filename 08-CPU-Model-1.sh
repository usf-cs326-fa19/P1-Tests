source "${TEST_DIR}/funcs.bash"

test_start "CPU Model"

./inspector -p "${TEST_DIR}/fakeproc" -r \
    | grep -i 'CPU Model:.*AMD EPYC 7281 16-Core Processor'
model_correct=${?}

actual_model=$(./inspector -r | grep -i 'CPU Model:' | sed 's/.*:\s*//')
expected_actual_model=$(grep 'model name' /proc/cpuinfo \
    | sed 's/.*: //' | head -n 1 )

[ ${model_correct} -eq 0 ] \
    && [ "${actual_model}" == "${expected_actual_model}" ]
test_end
