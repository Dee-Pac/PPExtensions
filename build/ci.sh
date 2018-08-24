#!/bin/bash

export HOME=$(pwd)
export BUILD_DIR=${HOME}/build
export WORK_DIR=${HOME}/.tmp

source ${BUILD_DIR}/functions.sh
source ${BUILD_DIR}/env.sh

export args=$*

write_log "Arguments --> ${args}"

write_log "####################  Install PPExtensions ####################"

run_cmd "pip install ppextensions"

write_log "########################  BUILD SUCCESS ###############################"

