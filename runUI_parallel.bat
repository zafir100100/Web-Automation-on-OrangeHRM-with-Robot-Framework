:: ---------------------------------------------------------------------------------------------------------------------
ECHO Starting Automation Tests...
:: ---------------------------------------------------------------------------------------------------------------------
:: INFO: To install the required libraries
:: pip install -r requirements.txt
:: ---------------------------------------------------------------------------------------------------------------------
:: INFO: To execute robot scripts locally
call pabot ^
  --testlevelsplit ^
  --verbose ^
  --processes 4 ^
  --outputdir Results ^
  --variable Environment:sandbox ^
  --variable BROWSER:headlesschrome ^
  --variable BROWSER_WIDTH:1440 ^
  --variable BROWSER_HEIGHT:1024 ^
  --loglevel TRACE ^
  --include Regression ^
  UI/TestCases

::  --verbose ^
::  --include Login ^
::  --include Admin ^
::  --include My_Info ^
::  --include PIM ^
