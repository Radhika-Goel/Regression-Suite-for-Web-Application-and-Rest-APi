*** Settings ***
Suite Setup       Common.Open Browser with title Validation    ${My_Juniper_Testing}
Resource          ../../Common.robot
Resource          ../../Variables.txt
Library           Selenium2Library
Library           BuiltIn
Library           Collections

*** Variables ***
@{Links Under Menu}    Products & Services\ntrending_flat    Support\ntrending_flat    Training\ntrending_flat    How to Buy\ntrending_flat    About Juniper    Partners    Community
@{Links Under Products Services}    keyboard_backspaceBack    Products & Services    Products\ntrending_flat    Solutions    Services    Tech Library    Design & Architecture Center
@{Links Under Products}    keyboard_backspaceBack    Application Management & Orchestration    Identity and Policy Control    Network Edge Services    Network Management    Network Operating System    Packet Optical
...               Routers    Security    Software Defined Networking    Switches    All Products A-Z    End of Life
@{Links Under Support}    keyboard_backspaceBack    Support    MyJuniper    Case Management\ntrending_flat    Downloads & Docs\ntrending_flat    Contracts & Licenses\ntrending_flat
@{Links Under CaseManagement}    keyboard_backspaceBack    Cases / RMAs\ntrending_flat    Managing\ntrending_flat
@{Links Under Download & Docs }    keyboard_backspaceBack    Platforms\ntrending_flat    Documentation\ntrending_flat    Troubleshooting\ntrending_flat
@{Links Under Contracts & Licences}    keyboard_backspaceBack    Contracts / Products\ntrending_flat    Licenses\ntrending_flat    Security\ntrending_flat
@{Links Under Cases/RMAs}    keyboard_backspaceBack    Your Open Cases    Your Open RMAs    Create a Case/RMA
@{Links Under Managing}    keyboard_backspaceBack    Contact Support    Product Warranty    Guidelines    Repair and Return Policy    Global RMA Locations
@{Links Under Platforms}    keyboard_backspaceBack    Junos    ScreenOS    Junos Space    All Downloads
@{Links Under Documentation}    keyboard_backspaceBack    TechLibrary    Pathfinder
@{Links Under TroubleShooting}    keyboard_backspaceBack    Knowledge Base    Service Now    Service Insight    Problem Report Search
@{Links Under Contracts&products}    keyboard_backspaceBack    Product & Subscription Registration    Serial Number Entitlement    Search Contracts/Products    Order Status    Update Installed Base
@{Contracts Under Licenses }    keyboard_backspaceBack    Generate Product Licenses    Find License Keys    Generate RMA Licenses    License Activation Instructions
@{Links Under Security}    keyboard_backspaceBack    Security Intelligence    Report a Vulnerability
@{Links Under Training}    keyboard_backspaceBack    Training\ntrending_flat    Certification\ntrending_flat    Academic Alliance
@{links_under_how2buy}    keyboard_backspaceBack    How to Buy    Contact Sales    Request a Quote    Buy from a Local Partner    Find a Sales Office    All Buying Options
@{links_under_training_training}    keyboard_backspaceBack    Courses    Learning Paths    Getting Started    Learning Bytes
@{links_under_certification}    keyboard_backspaceBack    Getting Started    Already Certified    Exam Registration    Fast Track Program

*** Test Cases ***
Elements at Menu Link
    [Tags]    test
    Selenium2Library.Mouse Over    //div[@id="horz-menu-hamburger"]/span/i
    Selenium2Library.Click Element    //div[@id="horz-menu-hamburger"]/span/i
    Selenium2Library.Mouse Over    //div[@id="mdl-sub-quicklink-grid"]
    BuiltIn.Sleep    5s
    ${web_elements_under_menu}    Selenium2Library.Get Webelements    //div[@id="mdl-sub-quicklink-grid"]/div/div/ul/li
    Log    ${web_elements_under_menu}
    ${all_links_under_menu}    Common.Getting Text from all WebElements    ${web_elements_under_menu}
    Collections.Lists Should Be Equal    ${all_links_under_menu}    ${Links Under Menu}

Links Under Products and Services
    [Tags]    test
    Selenium2Library.Mouse Over    //li[@id='products-services']
    Selenium2Library.Click Element    //li[@id='products-services']
    BuiltIn.Sleep    2s
    ${all_webelements_under_PS}    Selenium2Library.Get Webelements    //div[@id="mdl-sub-quicklink-grid"]/div/div/ul/li
    Log    ${all_webelements_under_PS}
    ${all_links_under_PS}    Common.Getting Text from all WebElements    ${all_webelements_under_PS}
    Collections.Lists Should Be Equal    ${all_links_under_PS}    ${Links Under Products Services}
    BuiltIn.sleep    5s
    Selenium2Library.Click Element    //li[@id='products']
    BuiltIn.Sleep    2s
    ${all_webelements_under_Products}    Selenium2Library.Get Webelements    //div[@id="mdl-sub-quicklink-grid"]/div/div/ul/li
    Log    ${all_webelements_under_Products}
    ${all_links_under_Products}    Common.Getting Text from all WebElements    ${all_webelements_under_Products}
    Collections.Lists Should Be Equal    ${all_links_under_Products}    ${Links Under Products}

Links under Support
    [Tags]    test
    BuiltIn.Sleep    5s
    Selenium2Library.Click Element    //div[@id='mdl-sub-quicklink-grid']/div/div/ul/li[1]
    Selenium2Library.Mouse Over    //div[@id='mdl-sub-quicklink-grid']/div/div/ul/li[1]
    Selenium2Library.Click Element    //div[@id='mdl-sub-quicklink-grid']/div/div/ul/li[1]
    BuiltIn.sleep    5s
    Selenium2Library.Click Element    //li[@id='support']
    BuiltIn.Sleep    2s
    ${all_webelements_under_Support}    Selenium2Library.Get Webelements    //div[@id="mdl-sub-quicklink-grid"]/div/div/ul/li
    ${all_links_under_Support}    Common.Getting Text from all WebElements    ${all_webelements_under_Support}
    Collections.Lists Should Be Equal    ${all_links_under_Support}    ${Links Under Support}
    Selenium2Library.Click Element    //li[@id='case-management']
    BuiltIn.Sleep    2s
    ${all_webelements_under_CaseManagement}    Selenium2Library.Get Webelements    //div[@id="mdl-sub-quicklink-grid"]/div/div/ul/li
    ${all_links_under_CaseManagement}    Common.Getting Text from all WebElements    ${all_webelements_under_CaseManagement}
    Collections.Lists Should Be Equal    ${all_links_under_CaseManagement}    ${Links Under CaseManagement}
    Selenium2Library.Click Element    //li[@id='cm-cases-rmas']
    BuiltIn.Sleep    2s
    ${all_webelements_under_Cases/RMAs}    Selenium2Library.Get Webelements    //div[@id="mdl-sub-quicklink-grid"]/div/div/ul/li
    ${all_links_under_Cases/RMAs}    Common.Getting Text from all WebElements    ${all_webelements_under_Cases/RMAs}
    Collections.Lists Should Be Equal    ${all_links_under_Cases/RMAs}    ${Links Under Cases/RMAs}
    BuiltIn.Sleep    5s
    Selenium2Library.Mouse Over    //div[@id='mdl-sub-quicklink-grid']/div/div/ul/li[1]
    Selenium2Library.Click Element    //div[@id='mdl-sub-quicklink-grid']/div/div/ul/li[1]
    BuiltIn.Sleep    5s
    Selenium2Library.Click Element    //li[@id='managing']
    BuiltIn.Sleep    2s
    ${all_webelements_under_Managing}    Selenium2Library.Get Webelements    //div[@id="mdl-sub-quicklink-grid"]/div/div/ul/li
    ${all_links_under_Managing}    Common.getting elements text from allwebelements    ${all_webelements_under_Managing}
    Collections.Lists Should Be Equal    ${all_links_under_Managing}    ${Links Under Managing}
    Selenium2Library.Mouse Over    //div[@id='mdl-sub-quicklink-grid']/div/div/ul/li[1]
    Selenium2Library.Click Element    //div[@id='mdl-sub-quicklink-grid']/div/div/ul/li[1]
    BuiltIn.Sleep    5s
    Selenium2Library.Click Element    //div[@id='mdl-sub-quicklink-grid']/div/div/ul/li[1]
    BuiltIn.Sleep    5s
    Selenium2Library.Click Element    //li[@id='support']
    BuiltIn.Sleep    2s
    Selenium2Library.Click Element    //li[@id='downloads-docs']
    BuiltIn.Sleep    2s
    ${all_webelements_under_Download_Docs}    Selenium2Library.Get Webelements    //div[@id="mdl-sub-quicklink-grid"]/div/div/ul/li
    ${all_links_under_Download_Docs}    Common.getting elements text from allwebelements    ${all_webelements_under_Download_Docs}
    Collections.Lists Should Be Equal    ${all_links_under_Download_Docs}    ${Links Under Download & Docs }
    BuiltIn.Sleep    5s
    Selenium2Library.Click Element    //li[@id='platforms']
    BuiltIn.Sleep    5s
    ${all_webelements_under_Platforms}    Selenium2Library.Get Webelements    //div[@id="mdl-sub-quicklink-grid"]/div/div/ul/li
    ${all_links_under_Platforms}    Common.getting elements text from allwebelements    ${all_webelements_under_Platforms}
    Collections.Lists Should Be Equal    ${all_links_under_Platforms}    ${Links Under Platforms}
    Selenium2Library.Mouse Over    //div[@id='mdl-sub-quicklink-grid']/div/div/ul/li[1]
    Selenium2Library.Click Element    //div[@id='mdl-sub-quicklink-grid']/div/div/ul/li[1]
    BuiltIn.Sleep    5s
    Selenium2Library.Click Element    //li[@id='documentation']
    BuiltIn.Sleep    5s
    ${all_webelements_under_documentation}    Selenium2Library.Get Webelements    //div[@id="mdl-sub-quicklink-grid"]/div/div/ul/li
    ${all_links_under_documentation}    Common.getting elements text from allwebelements    ${all_webelements_under_documentation}
    Collections.Lists Should Be Equal    ${all_links_under_documentation}    ${Links Under Documentation}
    Selenium2Library.Mouse Over    //div[@id='mdl-sub-quicklink-grid']/div/div/ul/li[1]
    Selenium2Library.Click Element    //div[@id='mdl-sub-quicklink-grid']/div/div/ul/li[1]
    BuiltIn.Sleep    5s
    Selenium2Library.Click Element    //li[@id='troubleshooting']
    BuiltIn.Sleep    5s
    ${all_webelements_under_troubleShooting}    Selenium2Library.Get Webelements    //div[@id="mdl-sub-quicklink-grid"]/div/div/ul/li
    ${all_links_under_troubleshooting}    Common.getting elements text from allwebelements    ${all_webelements_under_troubleShooting}
    Collections.Lists Should Be Equal    ${all_links_under_troubleshooting}    ${Links Under TroubleShooting}
    Selenium2Library.Mouse Over    //div[@id='mdl-sub-quicklink-grid']/div/div/ul/li[1]
    Selenium2Library.Click Element    //div[@id='mdl-sub-quicklink-grid']/div/div/ul/li[1]
    BuiltIn.Sleep    5s
    BuiltIn.Sleep    5s
    Selenium2Library.Click Element    //div[@id='mdl-sub-quicklink-grid']/div/div/ul/li[1]
    BuiltIn.Sleep    5s
    Selenium2Library.Click Element    //li[@id='support']
    BuiltIn.Sleep    2s
    Selenium2Library.Click Element    //li[@id='contracts-licenses']
    BuiltIn.Sleep    2s
    ${all_webelements_under_Contracts_Licences}    Selenium2Library.Get Webelements    //div[@id="mdl-sub-quicklink-grid"]/div/div/ul/li
    ${all_links_under_Contracts_Licences}    Common.getting elements text from allwebelements    ${all_webelements_under_Contracts_Licences}
    Collections.Lists Should Be Equal    ${all_links_under_Contracts_Licences}    ${Links Under Contracts & Licences}
    BuiltIn.Sleep    5s
    Selenium2Library.Click Element    //li[@id='contracts']
    BuiltIn.Sleep    5s
    ${all_webelements_under_Contracts_n_Products}    Selenium2Library.Get Webelements    //div[@id="mdl-sub-quicklink-grid"]/div/div/ul/li
    ${all_links_under_Contracts_n_products}    Common.getting elements text from allwebelements    ${all_webelements_under_Contracts_n_Products}
    Collections.Lists Should Be Equal    ${all_links_under_Contracts_n_products}    ${Links Under Contracts&products}
    Selenium2Library.Mouse Over    //div[@id='mdl-sub-quicklink-grid']/div/div/ul/li[1]
    Selenium2Library.Click Element    //div[@id='mdl-sub-quicklink-grid']/div/div/ul/li[1]
    BuiltIn.Sleep    5s
    Selenium2Library.Click Element    //li[@id='licenses']
    BuiltIn.Sleep    5s
    ${all_webelements_under_licenses}    Selenium2Library.Get Webelements    //div[@id="mdl-sub-quicklink-grid"]/div/div/ul/li
    ${all_links_under_licenses}    Common.getting elements text from allwebelements    ${all_webelements_under_licenses}
    Collections.Lists Should Be Equal    ${all_links_under_licenses}    ${Contracts Under Licenses }
    Selenium2Library.Mouse Over    //div[@id='mdl-sub-quicklink-grid']/div/div/ul/li[1]
    Selenium2Library.Click Element    //div[@id='mdl-sub-quicklink-grid']/div/div/ul/li[1]
    BuiltIn.Sleep    5s
    Selenium2Library.Click Element    //li[@id='security']
    BuiltIn.Sleep    5s
    ${all_webelements_under_security}    Selenium2Library.Get Webelements    //div[@id="mdl-sub-quicklink-grid"]/div/div/ul/li
    ${all_links_under_security}    Common.getting elements text from allwebelements    ${all_webelements_under_security}
    Collections.Lists Should Be Equal    ${all_links_under_security}    ${Links Under Security}

Link Under Training
    [Tags]    test
    BuiltIn.Sleep    5s
    Selenium2Library.Click Element    //div[@id='mdl-sub-quicklink-grid']/div/div/ul/li[1]
    Selenium2Library.Mouse Over    //div[@id='mdl-sub-quicklink-grid']/div/div/ul/li[1]
    Selenium2Library.Click Element    //div[@id='mdl-sub-quicklink-grid']/div/div/ul/li[1]
    BuiltIn.sleep    5s
    Selenium2Library.Click Element    //li[@id='training']
    BuiltIn.Sleep    2s
    ${all_webelements_under_training}    Selenium2Library.Get Webelements    //div[@id="mdl-sub-quicklink-grid"]/div/div/ul/li
    ${all_links under_training}    Common.Getting Text from all WebElements    ${all_webelements_under_training}
    Collections.Lists Should Be Equal    ${all_links under_training}    ${Links Under Training}
    BuiltIn.sleep    5s
    Selenium2Library.Click Element    //li[@id='sub-training']
    BuiltIn.Sleep    2s
    ${all_webelements_under_training_training}    Selenium2Library.Get Webelements    //div[@id="mdl-sub-quicklink-grid"]/div/div/ul/li
    ${all_links_under_training_training}    Common.Getting Text from all WebElements    ${all_webelements_under_training_training}
    Collections.Lists Should Be Equal    ${all_links_under_training_training}    ${links_under_training_training}
    Selenium2Library.Mouse Over    //div[@id='mdl-sub-quicklink-grid']/div/div/ul/li[1]
    Selenium2Library.Click Element    //div[@id='mdl-sub-quicklink-grid']/div/div/ul/li[1]
    BuiltIn.Sleep    5s
    Selenium2Library.Click Element    //li[@id='certification']
    BuiltIn.Sleep    2s
    ${all_webelements_under_certification}    Selenium2Library.Get Webelements    //div[@id="mdl-sub-quicklink-grid"]/div/div/ul/li
    ${all_links_under_certification}    Common.Getting Text from all WebElements    ${all_webelements_under_certification}
    Collections.Lists Should Be Equal    ${all_links_under_certification}    ${links_under_certification}

Links Under How to Buy
    [Tags]    test
    BuiltIn.Sleep    5s
    Selenium2Library.Click Element    //div[@id='mdl-sub-quicklink-grid']/div/div/ul/li[1]
    Selenium2Library.Mouse Over    //div[@id='mdl-sub-quicklink-grid']/div/div/ul/li[1]
    Selenium2Library.Click Element    //div[@id='mdl-sub-quicklink-grid']/div/div/ul/li[1]
    BuiltIn.sleep    5s
    Selenium2Library.Click Element    //li[@id='how-to-buy']
    BuiltIn.Sleep    2s
    ${all_webelements_under_how_2_buy}    Selenium2Library.Get Webelements    //div[@id="mdl-sub-quicklink-grid"]/div/div/ul/li
    ${all_links under_how_2_buy}    Common.Getting Text from all WebElements    ${all_webelements_under_how_2_buy}
    Collections.Lists Should Be Equal    ${all_links under_how_2_buy}    ${links_under_how2buy}
