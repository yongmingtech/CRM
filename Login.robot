*** Settings ***
Documentation     A resource file with reusable keywords and variables.
...
...               The system specific keywords created here form our own
...               domain specific language. They utilize keywords provided
...               by the imported Selenium2Library.
Resource          Resource.robot
Resource          Library.robot

*** Variables ***
${DELAY}          0
${SERVER}         http://10.32.86.127/CRM/#/    # Backend

*** Keywords ***
Open Broser to Login Page
    Open Browser    ${SERVER}    ${BROWSER}    1
    Maximize Browser Window
    Set Selenium Speed    ${DELAY}

Input Username
    Input Text    inputUsername    ALISON

Input Password
    Input Text    inputPassword    02260406

Submit Credentials
    Click Element    xpath=//*[@id="loginform"]/div[4]/div/div[1]/button

Open Broser and Login automatically
    Open Broser to Login Page
    Input Username
    Input Password
    Submit Credentials
