#!/bin/bash

export REPO_HOME=$(pwd)
export BUILD_DIR=${REPO_HOME}/build
export WORK_DIR=${REPO_HOME}/.tmp

source ${BUILD_DIR}/functions.sh
source ${BUILD_DIR}/env.sh

export args=$*

write_log "Arguments --> ${args}"

write_log "################### Cleanup #####################

run_cmd "rm -rf ${WORK_DIR}"
run_cmd "mkdir ${WORK_DIR}"

write_log "#################### Install Requisite Packages ###############

write_log " ----------- Install Tableau SDK ------------- "

run_cmd "cd ${WORK_DIR}"
run_cmd "wget ${TABLEAU_URL}"
run_cmd "tar -xvf ${TABLEAU_TAR_BALL}"
run_cmd "export TABLEAU_DIR=$(ls | grep Tableau | grep -v gz)"
run_cmd "python ${TABLEAU_DIR}/setup.py install"
run_cmd "cd .."

write_log "####################  Install PPExtensions ####################"

run_cmd "pip install ppextensions"

write_log "################### Final Cleanup #########################"

rm -rf ${WORK_DIR}

write_log "########################  BUILD SUCCESS ###############################"

