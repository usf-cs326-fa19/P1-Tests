source "${TEST_DIR}/funcs.bash"

expected_loads=$(cat <<EOM
Load Average (1/5/15 min): 0.99 0.99 0.99
Load Average (1/5/15 min): 1.00 1.00 1.11
Load Average (1/5/15 min): 78.10 40.40 40.40
Load Average (1/5/15 min): 99.99 99.99 99.99
EOM
)

expected_cpus=$(cat <<EOM
CPU Usage:    [--------------------] 0.0%
CPU Usage:    [--------------------] 0.3%
CPU Usage:    [####################] 100.0%
CPU Usage:    [###-----------------] 16.8%
CPU Usage:    [--------------------] 2.4%
CPU Usage:    [#####---------------] 26.3%
CPU Usage:    [######--------------] 33.5%
CPU Usage:    [######--------------] 33.7%
CPU Usage:    [--------------------] 4.2%
CPU Usage:    [##########----------] 52.5%
CPU Usage:    [##########----------] 54.3%
CPU Usage:    [###########---------] 56.5%
CPU Usage:    [############--------] 60.4%
CPU Usage:    [#-------------------] 7.8%
EOM
)

expected_mems=$(cat <<EOM
Memory Usage: [--------------------] 0.0% (0.0 GB / 1245.5 GB)
Memory Usage: [--------------------] 0.1% (1.0 GB / 1245.5 GB)
Memory Usage: [####################] 100.0% (1245.5 GB / 1245.5 GB)
Memory Usage: [####----------------] 22.0% (274.0 GB / 1245.5 GB)
Memory Usage: [##########----------] 54.3% (676.1 GB / 1245.5 GB)
Memory Usage: [#################---] 88.9% (1107.0 GB / 1245.5 GB)
Memory Usage: [##################--] 92.0% (1145.9 GB / 1245.5 GB)
EOM
)

test_start "Live View" 

output=$(FAKE_MEMINFO="${TEST_DIR}/virtualproc/meminfo" \
FAKE_LOADAVG="${TEST_DIR}/virtualproc/loadavg" \
FAKE_STAT="${TEST_DIR}/virtualproc/stat" \
LD_PRELOAD="${TEST_DIR}/virtualproc/virtualproc.so" \
    timeout 1 ./inspector -l 2> /dev/null)

reported_loads=$(echo "${output}" | \
    grep -io 'Load[[:space:]]*Average[[:space:]]*(1/5/15 min):[[:space:]]*\([0-9.]*\)[[:space:]]*\([0-9.]*\)[[:space:]]*\([0-9.]*\)' | sort | uniq)
compare --ignore-all-space --ignore-case \
    <(echo "${expected_loads}") <(echo "${reported_loads}") || test_end 1

reported_cpus=$(echo "${output}" | grep -io 'CPU[[:space:]]*Usage:.*%' | sort | uniq)
compare --ignore-all-space --ignore-case \
    <(echo "${expected_cpus}") <(echo "${reported_cpus}") || test_end 1

reported_mems=$(echo "${output}" | grep -io 'Memory[[:space:]]*Usage:.*% (.*/.*B)' | sort | uniq)
compare --ignore-all-space --ignore-case \
    <(echo "${expected_mems}") <(echo "${reported_mems}") || test_end 1

test_end 0
