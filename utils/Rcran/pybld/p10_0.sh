#/bash/bin

# put pileline upstream via:
fly -t conda-concourse-server sp -p kais_test_py \
  -c ./pipeline10_0.yaml -l ~/Code/oss/automated-build/c3i_configurations/anaconda_public/config.yml
fly -t conda-concourse-server up -p kais_test_py

fly -t conda-concourse-server trigger-job -j kais_test_py/build_py_script0-on-osx
fly -t conda-concourse-server trigger-job -j kais_test_py/build_py_script0-on-linux_64
fly -t conda-concourse-server trigger-job -j kais_test_py/build_py_script0-on-winbuilder
echo "1 jobs triggered"
