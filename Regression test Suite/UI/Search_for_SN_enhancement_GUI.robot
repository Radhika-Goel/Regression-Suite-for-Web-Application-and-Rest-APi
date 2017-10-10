*** Settings ***
Suite Setup       Common.Setup For Search SN Enhancement
Resource          ../Common.robot
Resource          ../Variables.txt
Library           Selenium2Library
Library           ngcscCommonMethods
Library           DateTime
Library           Collections

*** Test Cases ***
Verifying Total Number of Records for Cases and Products
    [Tags]    SN
    Selenium2Library.Input Text    //section[@id='nxcsc-global-search-container']/input    SUB00019940428
    Selenium2Library.Press Key    //section[@id='nxcsc-global-search-container']/input    \\13
    Sleep    5s
    Selenium2Library.Mouse Over    //div[@id='result-content']/section/ul/li[3]
    Selenium2Library.Click Element    //div[@id='result-content']/section/ul/li[3]
    Sleep    5s
    ${total_cases_record}    Selenium2Library.Get Text    //div[@id='jnprDataTableContent_search_function_tab_cases']/div/div/div[4]/table/tbody/tr/td[2]/span[1]
    ${splitted_string}    String.Split String    ${total_cases_record}    :
    ${total_records}    Collections.Get From List    ${splitted_string}    -1
    Comment    Should Be Equal As Integers    ${total_records}    1
    ${cases_search_text}    Selenium2Library.Get Text    //section[@id='nxcsc-globalsearch-result']/div[2]/span
    BuiltIn.Should Be Equal As Strings    ${cases_search_text}    Serial # / Software Support Ref #: SUB00019940428
    ${all_cases_elements}    Selenium2Library.Get Webelements    //div[@id='jnprDataTableContent_search_function_tab_cases']/div/div/div[2]/div/div[1]/div[2]/div/div[1]/div[2]/div/div/div[2]/div[1]/span[1]
    ${cases_field}    Common.getting elements text from allwebelements    ${all_cases_elements}
    Collections.List Should Contain Value    ${cases_field}    Software Support Ref #
    BuiltIn.Sleep    10s
    Selenium2Library.Mouse Over    //span[@id='nxcsc-globalsearch-btn-close']/i
    Selenium2Library.Click Element    //span[@id='nxcsc-globalsearch-btn-close']/i
    BuiltIn.Sleep    5s
    Selenium2Library.Input Text    //section[@id='nxcsc-global-search-container']/input    RTU00000050128
    Selenium2Library.Press Key    //section[@id='nxcsc-global-search-container']/input    \\13
    BuiltIn.Sleep    5s
    ${products_text}    Selenium2Library.Get Text    //div[@id='jnprDataTableContent_search_function_tab_products']/div/div/div[4]/table/tbody/tr/td[2]/span[1]
    ${splitted_text}    String.Split String    ${products_text}    :
    ${total_records}    Collections.Get From List    ${splitted_text}    -1
    Comment    Should Be Equal As Integers    ${total_records}    1
    ${products_search_text}    Selenium2Library.Get Text    //section[@id='nxcsc-globalsearch-result']/div[2]/span
    BuiltIn.Should Be Equal As Strings    ${products_search_text}    Serial # / Software Support Ref #: RTU00000050128
    ${all_product_elements}    Selenium2Library.Get Webelements    //div[@id='jnprDataTableContent_search_function_tab_products']/div/div/div[2]/div/div[1]/div[2]/div/div[1]/div[2]/div/div/div[2]/div[1]/span[1]
    ${products_fields}    Common.getting elements text from allwebelements    ${all_product_elements}
    Collections.List Should Contain Value    ${products_fields}    Software Support Ref #

Verify the serial global search with spaces at left and right
    [Tags]    SN
    Selenium2Library.Mouse Over    //span[@id='nxcsc-globalsearch-btn-close']/i
    Selenium2Library.Click Element    //span[@id='nxcsc-globalsearch-btn-close']/i
    BuiltIn.Sleep    5s
    Selenium2Library.Input Text    //section[@id='nxcsc-global-search-container']/input    ${SPACE}SUB00019940428${SPACE}
    Selenium2Library.Press Key    //section[@id='nxcsc-global-search-container']/input    \\13
    BuiltIn.Sleep    10s
    Selenium2Library.Mouse Over    //div[@id='result-content']/section/ul/li[3]
    Selenium2Library.Click Element    //div[@id='result-content']/section/ul/li[3]
    Sleep    5s
    ${total_cases_record}    Selenium2Library.Get Text    //div[@id='jnprDataTableContent_search_function_tab_cases']/div/div/div[4]/table/tbody/tr/td[2]/span[1]
    ${splitted_string}    String.Split String    ${total_cases_record}    :
    ${total_records}    Collections.Get From List    ${splitted_string}    -1
    Comment    Should Be Equal As Integers    ${total_records}    1
    ${cases_search_text}    Selenium2Library.Get Text    //section[@id='nxcsc-globalsearch-result']/div[2]/span
    BuiltIn.Should Be Equal As Strings    ${cases_search_text}    Serial # / Software Support Ref #: SUB00019940428
    ${all_cases_elements}    Selenium2Library.Get Webelements    //div[@id='jnprDataTableContent_search_function_tab_cases']/div/div/div[2]/div/div[1]/div[2]/div/div[1]/div[2]/div/div/div[2]/div[1]/span[1]
    ${cases_field}    Common.getting elements text from allwebelements    ${all_cases_elements}
    Collections.List Should Contain Value    ${cases_field}    Software Support Ref #
    BuiltIn.Sleep    10s
    Selenium2Library.Mouse Over    //span[@id='nxcsc-globalsearch-btn-close']/i
    Selenium2Library.Click Element    //span[@id='nxcsc-globalsearch-btn-close']/i
    BuiltIn.Sleep    5s
    Selenium2Library.Input Text    //section[@id='nxcsc-global-search-container']/input    ${SPACE}RTU00000050128${SPACE}
    Selenium2Library.Press Key    //section[@id='nxcsc-global-search-container']/input    \\13
    BuiltIn.Sleep    5s
    ${products_text}    Selenium2Library.Get Text    //div[@id='jnprDataTableContent_search_function_tab_products']/div/div/div[4]/table/tbody/tr/td[2]/span[1]
    ${splitted_text}    String.Split String    ${products_text}    :
    ${total_records}    Collections.Get From List    ${splitted_text}    -1
    Comment    Should Be Equal As Integers    ${total_records}    1
    ${products_search_text}    Selenium2Library.Get Text    //section[@id='nxcsc-globalsearch-result']/div[2]/span
    BuiltIn.Should Be Equal As Strings    ${products_search_text}    Serial # / Software Support Ref #: RTU00000050128
    ${all_product_elements}    Selenium2Library.Get Webelements    //div[@id='jnprDataTableContent_search_function_tab_products']/div/div/div[2]/div/div[1]/div[2]/div/div[1]/div[2]/div/div/div[2]/div[1]/span[1]
    ${products_fields}    Common.getting elements text from allwebelements    ${all_product_elements}
    Collections.List Should Contain Value    ${products_fields}    Software Support Ref #

Verify global search of serial Number having hyphen
    [Tags]    SN
    Selenium2Library.Mouse Over    //span[@id='nxcsc-globalsearch-btn-close']/i
    Selenium2Library.Click Element    //span[@id='nxcsc-globalsearch-btn-close']/i
    Sleep    5s
    Selenium2Library.Input Text    //section[@id='nxcsc-global-search-container']/input    RTU0000-000745122
    Selenium2Library.Press Key    //section[@id='nxcsc-global-search-container']/input    \\13
    BuiltIn.Sleep    10s
    ${products_text}    Selenium2Library.Get Text    //div[@id='result-content']/section/ul/li[1]
    BuiltIn.Should Be Equal As Strings    ${products_text}    Products

Verify global Search of Serial Number having special Characters
    [Tags]    SN
    Selenium2Library.Mouse Over    //span[@id='nxcsc-globalsearch-btn-close']/i
    Selenium2Library.Click Element    //span[@id='nxcsc-globalsearch-btn-close']/i
    Sleep    5s
    Selenium2Library.Input Text    //section[@id='nxcsc-global-search-container']/input    RTU00000@00745122
    Selenium2Library.Press Key    //section[@id='nxcsc-global-search-container']/input    \\13
    BuiltIn.Sleep    10s
    ${products_text}    Selenium2Library.Get Text    //div[@id='result-content']/section/ul/li[1]
    BuiltIn.Should Be Equal As Strings    ${products_text}    Knowledge Base

Verify Total Records under Cases and Products for SSRN global search
    [Tags]    SN
    Selenium2Library.Mouse Over    //span[@id='nxcsc-globalsearch-btn-close']/i
    Selenium2Library.Click Element    //span[@id='nxcsc-globalsearch-btn-close']/i
    Sleep    5s
    Selenium2Library.Input Text    //section[@id='nxcsc-global-search-container']/input    152115123000
    Selenium2Library.Press Key    //section[@id='nxcsc-global-search-container']/input    \\13
    Sleep    5s
    Selenium2Library.Mouse Over    //div[@id='result-content']/section/ul/li[3]
    Selenium2Library.Click Element    //div[@id='result-content']/section/ul/li[3]
    Sleep    5s
    ${total_cases_record}    Selenium2Library.Get Text    //div[@id='jnprDataTableContent_search_function_tab_cases']/div/div/div[4]/table/tbody/tr/td[2]/span[1]
    ${splitted_string}    String.Split String    ${total_cases_record}    :
    ${total_records}    Collections.Get From List    ${splitted_string}    -1
    Should Be Equal As Integers    ${total_records}    2
    ${cases_search_text}    Selenium2Library.Get Text    //section[@id='nxcsc-globalsearch-result']/div[2]/span
    BuiltIn.Should Be Equal As Strings    ${cases_search_text}    Serial # / Software Support Ref #: 152115123000
    ${all_cases_elements}    Selenium2Library.Get Webelements    //div[@id='jnprDataTableContent_search_function_tab_cases']/div/div/div[2]/div/div[1]/div[2]/div/div[1]/div[2]/div/div/div[2]/div[1]/span[1]
    ${cases_field}    Common.getting elements text from allwebelements    ${all_cases_elements}
    Collections.List Should Contain Value    ${cases_field}    Software Support Ref #
    BuiltIn.Sleep    10s
    Selenium2Library.Mouse Over    //span[@id='nxcsc-globalsearch-btn-close']/i
    Selenium2Library.Click Element    //span[@id='nxcsc-globalsearch-btn-close']/i
    BuiltIn.Sleep    5s
    Selenium2Library.Input Text    //section[@id='nxcsc-global-search-container']/input    15000001
    Selenium2Library.Press Key    //section[@id='nxcsc-global-search-container']/input    \\13
    Sleep    5s
    Selenium2Library.Mouse Over    //div[@id='result-content']/section/ul/li[3]
    Selenium2Library.Click Element    //div[@id='result-content']/section/ul/li[3]
    Sleep    5s
    ${products_text}    Selenium2Library.Get Text    //div[@id='jnprDataTableContent_search_function_tab_products']/div/div/div[4]/table/tbody/tr/td[2]/span[1]
    ${splitted_text}    String.Split String    ${products_text}    :
    ${total_records}    Collections.Get From List    ${splitted_text}    -1
    Should Be Equal As Integers    ${total_records}    6
    ${products_search_text}    Selenium2Library.Get Text    //section[@id='nxcsc-globalsearch-result']/div[2]/span
    BuiltIn.Should Be Equal As Strings    ${products_search_text}    Serial # / Software Support Ref #: 15000001
    ${all_product_elements}    Selenium2Library.Get Webelements    //div[@id='jnprDataTableContent_search_function_tab_products']/div/div/div[2]/div/div[1]/div[2]/div/div[1]/div[2]/div/div/div[2]/div[1]/span[1]
    ${products_fields}    Common.getting elements text from allwebelements    ${all_product_elements}
    Collections.List Should Contain Value    ${products_fields}    Software Support Ref #

Verify ssrn global search with spaces at left and right
    [Tags]    SN
    Sleep    5s
    Selenium2Library.Mouse Over    //span[@id='nxcsc-globalsearch-btn-close']/i
    Selenium2Library.Click Element    //span[@id='nxcsc-globalsearch-btn-close']/i
    BuiltIn.Sleep    5s
    Selenium2Library.Input Text    //section[@id='nxcsc-global-search-container']/input    ${SPACE}152115123000${SPACE}
    Selenium2Library.Press Key    //section[@id='nxcsc-global-search-container']/input    \\13
    BuiltIn.Sleep    10s
    Selenium2Library.Mouse Over    //div[@id='result-content']/section/ul/li[3]
    Selenium2Library.Click Element    //div[@id='result-content']/section/ul/li[3]
    Sleep    5s
    ${total_cases_record}    Selenium2Library.Get Text    //div[@id='jnprDataTableContent_search_function_tab_cases']/div/div/div[4]/table/tbody/tr/td[2]/span[1]
    ${splitted_string}    String.Split String    ${total_cases_record}
    ${total_records}    Collections.Get From List    ${splitted_string}    -1
    Should Be Equal As Integers    ${total_records}    1
    ${cases_search_text}    Selenium2Library.Get Text    //section[@id='nxcsc-globalsearch-result']/div[2]/span
    BuiltIn.Should Be Equal As Strings    ${cases_search_text}    Serial # / Software Support Ref #: 152115123000
    ${all_cases_elements}    Selenium2Library.Get Webelements    //div[@id='jnprDataTableContent_search_function_tab_cases']/div/div/div[2]/div/div[1]/div[2]/div/div[1]/div[2]/div/div/div[2]/div[1]/span[1]
    ${cases_field}    Common.getting elements text from allwebelements    ${all_cases_elements}
    Collections.List Should Contain Value    ${cases_field}    Software Support Ref #

Verify total records and text under Cases for Case ID Pattern Search
    [Documentation]    Verify the records when searching for /^\d{4}-\d{4}-\d{4}|\d{4}-\d{4}-(t|T)-\d{4}$/ \ pattern
    [Tags]    SN
    Sleep    5s
    Selenium2Library.Mouse Over    //span[@id='nxcsc-globalsearch-btn-close']/i
    Selenium2Library.Click Element    //span[@id='nxcsc-globalsearch-btn-close']/i
    BuiltIn.Sleep    5s
    Selenium2Library.Input Text    //section[@id='nxcsc-global-search-container']/input    ${Case ID}
    Selenium2Library.Press Key    //section[@id='nxcsc-global-search-container']/input    \\13
    BuiltIn.Sleep    5s
    ${total_cases_record}    Selenium2Library.Get Text    //div[@id='case-search-simple-table-view']/div/div/div/div[4]/table/tbody/tr/td[2]/span[1]
    ${splitted_string}    String.Split String    ${total_cases_record}    :
    ${total_records}    Collections.Get From List    ${splitted_string}    -1
    Should Be Equal As Integers    ${total_records}    2
    ${cases_search_text}    Selenium2Library.Get Text    //section[@id='nxcsc-globalsearch-result']/div[2]/span
    BuiltIn.Should Be Equal As Strings    ${cases_search_text}    Case ID: ${Case ID}
    ${all_cases_elements}    Selenium2Library.Get Webelements    //div[@id='jnprDataTableContent_search_function_tab_cases']/div/div/div[2]/div/div[1]/div[2]/div/div[1]/div[2]/div/div/div[2]/div[1]/span[1]
    ${cases_field}    Common.getting elements text from allwebelements    ${all_cases_elements}
    Collections.List Should Contain Value    ${cases_field}    Software Support Ref #

Verify case id global search having spaces at left and right
    [Tags]    SN
    Sleep    5s
    Selenium2Library.Mouse Over    //span[@id='nxcsc-globalsearch-btn-close']/i
    Selenium2Library.Click Element    //span[@id='nxcsc-globalsearch-btn-close']/i
    BuiltIn.Sleep    5s
    Selenium2Library.Input Text    //section[@id='nxcsc-global-search-container']/input    ${SPACE}${Case ID}${SPACE}
    Selenium2Library.Press Key    //section[@id='nxcsc-global-search-container']/input    \\13
    BuiltIn.Sleep    10s
    ${total_cases_record}    Selenium2Library.Get Text    //div[@id='case-search-simple-table-view']/div/div/div/div[4]/table/tbody/tr/td[2]/span[1]
    ${splitted_string}    String.Split String    ${total_cases_record}    :
    ${total_records}    Collections.Get From List    ${splitted_string}    -1
    Should Be Equal As Integers    ${total_records}    1
    ${cases_search_text}    Selenium2Library.Get Text    //section[@id='nxcsc-globalsearch-result']/div[2]/span
    BuiltIn.Should Be Equal As Strings    ${cases_search_text}    Case ID: ${Case ID}
    ${all_cases_elements}    Selenium2Library.Get Webelements    //div[@id='jnprDataTableContent_search_function_tab_cases']/div/div/div[2]/div/div[1]/div[2]/div/div[1]/div[2]/div/div/div[2]/div[1]/span[1]
    ${cases_field}    Common.getting elements text from allwebelements    ${all_cases_elements}
    Collections.List Should Contain Value    ${cases_field}    Software Support Ref #

Verify records for Case Synopsis Search
    [Documentation]    Verify Records when searching with alphanumeric string without hyphen
    [Tags]    SN
    Sleep    5s
    Selenium2Library.Mouse Over    //span[@id='nxcsc-globalsearch-btn-close']/i
    Selenium2Library.Click Element    //span[@id='nxcsc-globalsearch-btn-close']/i
    BuiltIn.Sleep    5s
    Selenium2Library.Input Text    //section[@id='nxcsc-global-search-container']/input    testing Admin case
    Selenium2Library.Press Key    //section[@id='nxcsc-global-search-container']/input    \\13
    BuiltIn.Sleep    5s
    Selenium2Library.Mouse Over    //div[@id='result-content']/section/ul/li[2]
    Selenium2Library.Click Element    //div[@id='result-content']/section/ul/li[2]
    Sleep    5s
    ${total_cases_record}    Selenium2Library.Get Text    //div[@id='case-search-simple-table-view']/div/div/div/div[4]/table/tbody/tr/td[2]/span[1]
    ${splitted_string}    String.Split String    ${total_cases_record}    :
    ${total_records}    Collections.Get From List    ${splitted_string}    -1
    Comment    Should Be Equal As Integers    ${total_records}    1
    ${cases_search_text}    Selenium2Library.Get Text    //section[@id='nxcsc-globalsearch-result']/div[2]/span
    BuiltIn.Should Be Equal As Strings    ${cases_search_text}    Synopsis: testing Admin case
    ${all_cases_elements}    Selenium2Library.Get Webelements    //div[@id='jnprDataTableContent_search_function_tab_cases']/div/div/div[2]/div/div[1]/div[2]/div/div[1]/div[2]/div/div/div[2]/div[1]/span[1]
    ${cases_field}    Common.getting elements text from allwebelements    ${all_cases_elements}
    Collections.List Should Contain Value    ${cases_field}    Software Support Ref #

Case synopsis search with hypen
    [Tags]    SN
    Sleep    5s
    Selenium2Library.Mouse Over    //span[@id='nxcsc-globalsearch-btn-close']/i
    Selenium2Library.Click Element    //span[@id='nxcsc-globalsearch-btn-close']/i
    BuiltIn.Sleep    5s
    Selenium2Library.Input Text    //section[@id='nxcsc-global-search-container']/input    test desc tech-testing
    Selenium2Library.Press Key    //section[@id='nxcsc-global-search-container']/input    \\13
    BuiltIn.Sleep    5s
    Selenium2Library.Mouse Over    //div[@id='result-content']/section/ul/li[2]
    Selenium2Library.Click Element    //div[@id='result-content']/section/ul/li[2]
    Sleep    5s
    ${total_cases_record}    Selenium2Library.Get Text    //div[@id='case-search-simple-table-view']/div/div/div/div[4]/table/tbody/tr/td[2]/span[1]
    ${splitted_string}    String.Split String    ${total_cases_record}    :
    ${total_records}    Collections.Get From List    ${splitted_string}    -1
    Comment    Should Be Equal As Integers    ${total_records}    1
    ${cases_search_text}    Selenium2Library.Get Text    //section[@id='nxcsc-globalsearch-result']/div[2]/span
    BuiltIn.Should Be Equal As Strings    ${cases_search_text}    Synopsis: test desc tech-testing
    ${all_cases_elements}    Selenium2Library.Get Webelements    //div[@id='jnprDataTableContent_search_function_tab_cases']/div/div/div[2]/div/div[1]/div[2]/div/div[1]/div[2]/div/div/div[2]/div[1]/span[1]
    ${cases_field}    Common.getting elements text from allwebelements    ${all_cases_elements}
    Collections.List Should Contain Value    ${cases_field}    Software Support Ref #

Case Synopsis search with spaces at both side
    [Tags]    SN
    Sleep    5s
    Selenium2Library.Mouse Over    //span[@id='nxcsc-globalsearch-btn-close']/i
    Selenium2Library.Click Element    //span[@id='nxcsc-globalsearch-btn-close']/i
    BuiltIn.Sleep    5s
    Selenium2Library.Input Text    //section[@id='nxcsc-global-search-container']/input    ${SPACE}test desc tech-testing${SPACE}
    Selenium2Library.Press Key    //section[@id='nxcsc-global-search-container']/input    \\13
    BuiltIn.Sleep    5s
    Selenium2Library.Mouse Over    //div[@id='result-content']/section/ul/li[2]
    Selenium2Library.Click Element    //div[@id='result-content']/section/ul/li[2]
    Sleep    5s
    ${total_cases_record}    Selenium2Library.Get Text    //div[@id='case-search-simple-table-view']/div/div/div/div[4]/table/tbody/tr/td[2]/span[1]
    ${splitted_string}    String.Split String    ${total_cases_record}    :
    ${total_records}    Collections.Get From List    ${splitted_string}    -1
    Comment    Should Be Equal As Integers    ${total_records}    1
    ${cases_search_text}    Selenium2Library.Get Text    //section[@id='nxcsc-globalsearch-result']/div[2]/span
    BuiltIn.Should Be Equal As Strings    ${cases_search_text}    Synopsis: test desc tech-testing
    ${all_cases_elements}    Selenium2Library.Get Webelements    //div[@id='jnprDataTableContent_search_function_tab_cases']/div/div/div[2]/div/div[1]/div[2]/div/div[1]/div[2]/div/div/div[2]/div[1]/span[1]
    ${cases_field}    Common.getting elements text from allwebelements    ${all_cases_elements}
    Collections.List Should Contain Value    ${cases_field}    Software Support Ref #

Case Synopsis Search for alpha numeric string
    [Tags]    SN
    Sleep    5s
    Selenium2Library.Mouse Over    //span[@id='nxcsc-globalsearch-btn-close']/i
    Selenium2Library.Click Element    //span[@id='nxcsc-globalsearch-btn-close']/i
    BuiltIn.Sleep    5s
    Selenium2Library.Input Text    //section[@id='nxcsc-global-search-container']/input    WQ:@#$%^&*()
    Selenium2Library.Press Key    //section[@id='nxcsc-global-search-container']/input    \\13
    BuiltIn.Sleep    5s
    Selenium2Library.Mouse Over    //div[@id='result-content']/section/ul/li[2]
    Selenium2Library.Click Element    //div[@id='result-content']/section/ul/li[2]
    Sleep    5s
    ${total_cases_record}    Selenium2Library.Get Text    //div[@id='case-search-simple-table-view']/div/div/div/div[4]/table/tbody/tr/td[2]/span[1]
    ${splitted_string}    String.Split String    ${total_cases_record}    :
    ${total_records}    Collections.Get From List    ${splitted_string}    -1
    Comment    Should Be Equal As Integers    ${total_records}    1
    ${cases_search_text}    Selenium2Library.Get Text    //section[@id='nxcsc-globalsearch-result']/div[2]/span
    BuiltIn.Should Be Equal As Strings    ${cases_search_text}    Synopsis: WQ:@#$%^&*()
    ${all_cases_elements}    Selenium2Library.Get Webelements    //div[@id='jnprDataTableContent_search_function_tab_cases']/div/div/div[2]/div/div[1]/div[2]/div/div[1]/div[2]/div/div/div[2]/div[1]/span[1]
    ${cases_field}    Common.getting elements text from allwebelements    ${all_cases_elements}
    Collections.List Should Contain Value    ${cases_field}    Software Support Ref #

Verify records , text and all elements under Contracts for Contract ID global Search
    [Documentation]    Verify Records when seraching with 8 numbers appended with 2 zeros at beginning without any alphabet
    [Tags]    SN
    Sleep    5s
    Selenium2Library.Mouse Over    //span[@id='nxcsc-globalsearch-btn-close']/i
    Selenium2Library.Click Element    //span[@id='nxcsc-globalsearch-btn-close']/i
    BuiltIn.Sleep    5s
    Selenium2Library.Input Text    //section[@id='nxcsc-global-search-container']/input    0060133102
    Selenium2Library.Press Key    //section[@id='nxcsc-global-search-container']/input    \\13
    BuiltIn.Sleep    5s
    ${total_cases_record}    Selenium2Library.Get Text    //div[@id='contract-search-simple-table-view']/div/div/div/div[4]/table/tbody/tr/td[2]/span[1]
    ${splitted_string}    String.Split String    ${total_cases_record}    :
    ${total_records}    Collections.Get From List    ${splitted_string}    -1
    Should Be Equal As Integers    ${total_records}    3
    ${cases_search_text}    Selenium2Library.Get Text    //section[@id='nxcsc-globalsearch-result']/div[2]/span
    BuiltIn.Should Be Equal As Strings    ${cases_search_text}    Contract ID: 0060133102
    Comment    ${all_cases_elements}    Selenium2Library.Get Webelements    //div[@id='jnprDataTableContent_search_function_tab_cases']/div/div/div[2]/div/div[1]/div[2]/div/div[1]/div[2]/div/div/div[2]/div[1]/span[1]
    Comment    ${cases_field}    Common.getting elements text from allwebelements    ${all_cases_elements}
    Comment    Collections.List Should Contain Value    ${cases_field}    Software Support Ref #

Verify records , text and all elements under Contracts for 8-digit Contract ID global Search
    [Documentation]    Verify Records when seraching with 8 numbers appended with 2 zeros at beginning without any alphabet
    [Tags]    SN
    Sleep    5s
    Selenium2Library.Mouse Over    //span[@id='nxcsc-globalsearch-btn-close']/i
    Selenium2Library.Click Element    //span[@id='nxcsc-globalsearch-btn-close']/i
    BuiltIn.Sleep    5s
    Selenium2Library.Input Text    //section[@id='nxcsc-global-search-container']/input    60133102
    Selenium2Library.Press Key    //section[@id='nxcsc-global-search-container']/input    \\13
    BuiltIn.Sleep    5s
    ${total_cases_record}    Selenium2Library.Get Text    //div[@id='contract-search-simple-table-view']/div/div/div/div[4]/table/tbody/tr/td[2]/span[1]
    ${splitted_string}    String.Split String    ${total_cases_record}    :
    ${total_records}    Collections.Get From List    ${splitted_string}    -1
    Should Be Equal As Integers    ${total_records}    3
    ${cases_search_text}    Selenium2Library.Get Text    //section[@id='nxcsc-globalsearch-result']/div[2]/span
    BuiltIn.Should Be Equal As Strings    ${cases_search_text}    Contract ID: 60133102
    Comment    ${all_cases_elements}    Selenium2Library.Get Webelements    //div[@id='jnprDataTableContent_search_function_tab_cases']/div/div/div[2]/div/div[1]/div[2]/div/div[1]/div[2]/div/div/div[2]/div[1]/span[1]
    Comment    ${cases_field}    Common.getting elements text from allwebelements    ${all_cases_elements}
    Comment    Collections.List Should Contain Value    ${cases_field}    Software Support Ref #

Verify records , text and all elements under Contracts for 8-digit Contract ID global Search with spaces at both side
    [Documentation]    Verify records when searching with spaces at left and right of alphanumeric string
    [Tags]    SN
    Sleep    5s
    Selenium2Library.Mouse Over    //span[@id='nxcsc-globalsearch-btn-close']/i
    Selenium2Library.Click Element    //span[@id='nxcsc-globalsearch-btn-close']/i
    BuiltIn.Sleep    5s
    Selenium2Library.Input Text    //section[@id='nxcsc-global-search-container']/input    ${SPACE}60133102${SPACE}
    Selenium2Library.Press Key    //section[@id='nxcsc-global-search-container']/input    \\13
    BuiltIn.Sleep    5s
    ${total_cases_record}    Selenium2Library.Get Text    //div[@id='contract-search-simple-table-view']/div/div/div/div[4]/table/tbody/tr/td[2]/span[1]
    ${splitted_string}    String.Split String    ${total_cases_record}    :
    ${total_records}    Collections.Get From List    ${splitted_string}    -1
    Should Be Equal As Integers    ${total_records}    3
    ${cases_search_text}    Selenium2Library.Get Text    //section[@id='nxcsc-globalsearch-result']/div[2]/span
    BuiltIn.Should Be Equal As Strings    ${cases_search_text}    Contract ID: 60133102
    Comment    ${all_cases_elements}    Selenium2Library.Get Webelements    //div[@id='jnprDataTableContent_search_function_tab_cases']/div/div/div[2]/div/div[1]/div[2]/div/div[1]/div[2]/div/div/div[2]/div[1]/span[1]
    Comment    ${cases_field}    Common.getting elements text from allwebelements    ${all_cases_elements}
    Comment    Collections.List Should Contain Value    ${cases_field}    Software Support Ref #

Verify alphanumeric global Search which executed KB API first
    [Tags]    SN
    Sleep    5s
    Selenium2Library.Mouse Over    //span[@id='nxcsc-globalsearch-btn-close']/i
    Selenium2Library.Click Element    //span[@id='nxcsc-globalsearch-btn-close']/i
    BuiltIn.Sleep    5s
    Selenium2Library.Input Text    //section[@id='nxcsc-global-search-container']/input    WQ:@#$%^&*()
    Selenium2Library.Press Key    //section[@id='nxcsc-global-search-container']/input    \\13
    BuiltIn.Sleep    5s
    ${products_text}    Selenium2Library.Get Text    //div[@id='result-content']/section/ul/li[1]
    BuiltIn.Should Be Equal As Strings    ${products_text}    Knowledge Base
    Sleep    5s
    ${cases_search_text}    Selenium2Library.Get Text    //section[@id='nxcsc-globalsearch-result']/div[2]/span
    BuiltIn.Should Be Equal As Strings    ${cases_search_text}    Knowledge Base
