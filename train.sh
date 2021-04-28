#! /bin/bash

RUN_SCRIPT_NAME=$(cat /opt/ml/input/config/hyperparameters.json)

python3 $RUN_SCRIPT_NAME
