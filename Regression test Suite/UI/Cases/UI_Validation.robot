*** Settings ***
Resource          ../../Variables.txt
Resource          ../../Common.robot

*** Variables ***
${UserName_Input}    //input[@id='userid']
${UserName_Password}    //input[@id='password']
${Username1}      jarroded@icloud.com
${Password1}      juniper
${submit_login}    //input[@value=' Login ']

*** Test Cases ***
FireFox_NGCSC_Title_Validation
    Selenium2Library.Close All Browsers
    ${IP}    String.Replace String    http://url    url    ${My_Juniper_Testing}
    Selenium2Library.Open Browser    ${IP}    firefox
    Maximize Browser Window
    Sleep    5
    Selenium2Library.Title Should Be    Login : Juniper Networks
    Selenium2Library.Close Browser

Chrome_NGCSC_Tiltle_Validation
    Selenium2Library.Close All Browsers
    ${IP}    String.Replace String    http://url    url    ${My_Juniper_Testing}
    Selenium2Library.Open Browser    ${IP}    Google Chrome
    Maximize Browser Window
    Sleep    5
    Selenium2Library.Title Should Be    Login : Juniper Networks
    Selenium2Library.Close Browser

Internet_Explorer_NGCSC_Title_Validation
    Selenium2Library.Close All Browsers
    ${IP}    String.Replace String    http://url    url    ${My_Juniper_Testing}
    Selenium2Library.Open Browser    ${IP}    Internet Explorer
    Maximize Browser Window
    Sleep    5
    Selenium2Library.Title Should Be    Login : Juniper Networks
    Selenium2Library.Close Browser

Login_Page_Title_Validation
    Selenium2Library.Close All Browsers
    ${IP}    String.Replace String    http://url    url    ${My_Juniper_Testing}
    Selenium2Library.Open Browser    ${IP}    Google Chrome
    Maximize Browser Window
    Sleep    5
    Selenium2Library.Title Should Be    Login : Juniper Networks
    Selenium2Library.Close Browser

External_Link_Edit_Account_Validation_Login
    Selenium2Library.Close All Browsers
    ${IP}    String.Replace String    http://url    url    ${My_Juniper_Testing}
    Selenium2Library.Open Browser    ${IP}    Google Chrome
    Maximize Browser Window
    Sleep    5
    Selenium2Library.Title Should Be    Login : Juniper Networks
    Sleep    3
    Input Text    ${UserName_Input}    ${Username1}
    Input Password    ${UserName_Password}    ${Password1}
    Sleep    3
    Click Element    ${submit_login}
    Sleep    5
    Title Should Be    MyJuniper
    Sleep    3
    Click Element    ${Click_Login_Menu_Link}
    Sleep    5
    Click Element    ${Edit_Account}
    Sleep    3
    Select Window    Title=Login : Juniper Networks
    Title Should Be    Login : Juniper Networks

External_Link_Reset_Password_Page_Validation_Login
    Selenium2Library.Close All Browsers
    ${IP}    String.Replace String    http://url    url    ${My_Juniper_Testing}
    Selenium2Library.Open Browser    ${IP}    Google Chrome
    Maximize Browser Window
    Sleep    5
    Selenium2Library.Title Should Be    Login : Juniper Networks
    Sleep    3
    Input Text    ${UserName_Input}    ${Username1}
    Input Password    ${UserName_Password}    ${Password1}
    Sleep    3
    Click Element    ${submit_login}
    Sleep    5
    Title Should Be    MyJuniper
    Sleep    3
    Click Element    ${Click_Login_Menu_Link}
    Sleep    5
    Click Element    ${Reset_Password}
    Sleep    3
    Select Window    Title=Login : Juniper Networks
    Title Should Be    Login : Juniper Networks

External_Link_Login_Assistance_Page_Validation_Login
    Selenium2Library.Close All Browsers
    ${IP}    String.Replace String    http://url    url    ${My_Juniper_Testing}
    Selenium2Library.Open Browser    ${IP}    Google Chrome
    Maximize Browser Window
    Sleep    5
    Selenium2Library.Title Should Be    Login : Juniper Networks
    Sleep    3
    Input Text    ${UserName_Input}    ${Username1}
    Input Password    ${UserName_Password}    ${Password1}
    Sleep    3
    Click Element    ${submit_login}
    Sleep    5
    Title Should Be    MyJuniper
    Sleep    3
    Click Element    ${Click_Login_Menu_Link}
    Sleep    5
    Click Element    ${Login_Assistance_link}
    Sleep    5
    Select Window    Title=Create User Account - Juniper Networks Account Management
    Title Should Be    Create User Account - Juniper Networks Account Management

Login_Page_Valid_Credentials
    Selenium2Library.Close All Browsers
    ${IP}    String.Replace String    http://url    url    ${My_Juniper_Testing}
    Selenium2Library.Open Browser    ${IP}    Google Chrome
    Maximize Browser Window
    Sleep    5
    Selenium2Library.Title Should Be    Login : Juniper Networks
    Sleep    3
    Input Text    ${UserName_Input}    ${Username1}
    Input Password    ${UserName_Password}    ${Password1}
    Sleep    3
    Click Element    ${submit_login}
    Sleep    5
    Title Should Be    MyJuniper
    Sleep    3
    Click Element    ${Click_Login_Menu_Link}
    Sleep    5
    Click Element    ${Click_Logout_button}

Super_Tab_Addition_Validation
    Selenium2Library.Close All Browsers
    ${IP}    String.Replace String    http://url    url    ${My_Juniper_Testing}
    Selenium2Library.Open Browser    ${IP}    Google Chrome
    Maximize Browser Window
    Sleep    5
    Selenium2Library.Title Should Be    Login : Juniper Networks
    Sleep    3
    Input Text    ${UserName_Input}    ${Username1}
    Input Password    ${UserName_Password}    ${Password1}
    Sleep    3
    Click Element    ${submit_login}
    Sleep    5
    Title Should Be    MyJuniper
    Sleep    3
    Click Element    ${Add_button}
    Sleep    2
    Input Text    ${Add_Custom_Tab_Window}    ABDCE
    Sleep    1
    Click Button    ${Save_Custom_tab_Window}
    Sleep    3
    Click Element    ${Click_Login_Menu_Link}
    Sleep    3
    Click Element    ${Click_Logout_button}
    Selenium2Library.Close Browser
