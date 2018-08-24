#!/bin/bash

export HOME=$(pwd)
export BUILD_DIR=${HOME}/build
export WORK_DIR=${HOME}/.tmp

source ${BUILD_DIR}/functions.sh
source ${BUILD_DIR}/env.sh

export args=$*

write_log "Arguments --> ${args}"

write_log "####################  Install Prerequisites ####################"

write_log " --------------- Cleanup temporary dir ----------------- "

write_log "Recreating ${WORK_DIR} if already exists ..."
run_cmd "rm -rf ${WORK_DIR}"
run_cmd "mkdir ${WORK_DIR}"

write_log " ------------- Setup Python in the local environment ------------- "

run_cmd "cd ${WORK_DIR}"
run_cmd "wget ${PYTHON_URL}"
run_cmd "tar xjf ${PYTHON_TAR_BALL} --directory ${WORK_DIR}"
run_cmd "source ${WORK_DIR}/home/travis/virtualenv/python${PYTHON_VERSION}/bin/activate"
write_log "setting the python path ..."
run_cmd "export PATH=${WORK_DIR}/home/travis/virtualenv/python${PYTHON_VERSION}/bin:${PATH}"

write_log " ----------- Install Tableau SDK ------------- "

run_cmd "wget ${TABLEAU_URL}"
run_cmd "tar -xvf ${TABLEAU_TAR_BALL}"
run_cmd "cd $(ls | grep Tableau | grep -v gz)"
run_cmd "python setup.py install"

write_log "####################  Install ppextensions ####################"

run_cmd "cd ${HOME}"
run_cmd "pip install ppextensions"
run_cmd "rm -rf ${WORK_DIR}"

write_log "########################  BUILD SUCCESS ###############################"

