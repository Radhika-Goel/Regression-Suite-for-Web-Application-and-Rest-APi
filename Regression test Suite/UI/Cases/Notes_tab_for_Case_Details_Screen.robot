*** Settings ***
Suite Setup       Common.Suite Setup for Case Details
Resource          ../../Common.robot
Resource          ../../Variables.txt

*** Test Cases ***
Click on Notes tab
    BuiltIn.Sleep    5s
    Selenium2Library.Click Element    //a[@id='caseNotesLink']
