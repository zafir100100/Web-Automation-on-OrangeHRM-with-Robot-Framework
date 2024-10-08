#!/bin/bash

# ---------------------------------------------------------------------------------------------------------------------
echo "Starting Automation Tests..."
# ---------------------------------------------------------------------------------------------------------------------
# INFO: To install the required libraries
# pip install -r requirements.txt
# ---------------------------------------------------------------------------------------------------------------------
# INFO: To execute robot scripts locally
robot \
  --outputdir Results \
  --variable Environment:sandbox \
  --variable BROWSER:headlesschrome \
  --variable BROWSER_WIDTH:1440 \
  --variable BROWSER_HEIGHT:1024 \
  --loglevel TRACE \
  --include Regression \
  UI/TestCases/*.robot
