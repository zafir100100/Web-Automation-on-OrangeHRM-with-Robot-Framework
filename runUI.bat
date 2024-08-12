:: ---------------------------------------------------------------------------------------------------------------------
ECHO Starting Automation Tests...
:: ---------------------------------------------------------------------------------------------------------------------
:: INFO: To install the required libraries
:: pip install -r requirements.txt
:: ---------------------------------------------------------------------------------------------------------------------
:: INFO: To execute robot scripts locally
call robot ^
  --outputdir Results ^
  --variable Environment:sandbox ^
  --variable BROWSER:headlesschrome ^
  --variable BROWSER_WIDTH:1440 ^
  --variable BROWSER_HEIGHT:1024 ^
  --loglevel TRACE ^
  TestSuites/*.robot
:: ---------------------------------------------------------------------------------------------------------------------
:: INFO: Explanation of the command options used above
::
:: call robot ^: Calls the Robot Framework's robot command to start running the tests. The ^ character is used to break the command across multiple lines for readability.
:: --outputdir NextGenIRIS/Results ^: Specifies where the test results should be saved.
:: --variable Environment:sandbox ^: Sets the environment variable Environment to sandbox, which can alter the test behavior depending on the environment.
:: --variable BROWSER:headlesschrome ^: Runs the tests in Chrome's headless mode, meaning the browser runs without a UI.
:: --variable BROWSER_WIDTH:1440 ^: Sets the width of the browser window to 1440 pixels.
:: --variable BROWSER_HEIGHT:1024 ^: Sets the height of the browser window to 1024 pixels.
:: --variable Report_Jirakey:%EMPTY% ^: Assigns a value to the Report_Jirakey variable, which might be used to associate the test run with a Jira ticket, though it is set to empty in this instance.
:: --loglevel TRACE ^: Sets the logging level to TRACE, ensuring that detailed logs are captured during the test run.
:: --include GetLinkFromEmail ^: Filters the test cases to include only those tagged with GetLinkFromEmail.
:: --listener RetryFailed:0 ^: Adds a listener that handles retries for failed tests, with the retry count set to 0.
:: NextGenIRIS/UI/testcases/*.robot: Specifies the directory containing the Robot Framework test cases to be executed.