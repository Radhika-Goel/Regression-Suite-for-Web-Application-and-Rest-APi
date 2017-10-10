*** Settings ***
Suite Setup       Common.Suite Setup For Contracts UI    ${My_Juniper_Testing}    ${NGCSC1_token}    Active
Library           Selenium2Library
Library           Process
Library           Collections
Resource          ../../Variables.txt
Resource          ../../Common.robot

*** Variables ***
${username}       ngcsc1@ngcsc.33mail.com
${password}       juniper
${URL}            http://staging-myjuniper/
${Click_Login_Link}    xpath=//div[@id='horz-menu-login']/i
${Click_Login_button}    xpath=//input[@value='Login']
${Create_User_Account}    xpath=//a[contains(@href, 'https://www.juniper.net/entitlement/setupAccountInfo.do')]
${Reset_Password}    xpath=//a[contains(@href, 'https://www.juniper.net/entitlement/changePassword.do')]
${Login_Assistance}    xpath=//a[contains(@href, 'https://www.juniper.net/entitlement/loginAssistance.do')]
${Click_HELP_Link}    xpath=//div[@id='horz-menu-help']/span[2]
${Contact_Support}    xpath=(//a[@href='http://www.juniper.net/support/requesting-support.html'])[2]
${Getting_Started_Support}    xpath=//a[@href='http://kb.juniper.net/InfoCenter/index?page=content&id=KB10910']
${Guidelines_Policies}    xpath=(//a[@href='http://www.juniper.net/support/guidelines.html'])[2]
${Customer_Care_Guide}    xpath=//a[contains(@href, 'https://www.juniper.net/customers/support/downloads/7100156-001-EN.pdf')]
${JTAC_User_Guide}    xpath=//a[@href='http://www.juniper.net/us/en/local/pdf/resource-guides/7100059-en.pdf']
${JTAC_Fact_Sheet}    xpath=//a[contains(@href, 'https://www.juniper.net/customers/support/downloads/3000050-EN.pdf')]
${UserName_Input}    xpath=//form[@id='Login']/div/input
${UserName_Password}    xpath=//input[@id='password']
${Click_Logout_link}    xpath=//div/div/div/div/div/div/span[2]
${Click_Logout_button}    xpath=.//*[@id='btnLogout']
${submit_login}    xpath=//input[@value=' Login ']
${Click_Login_Menu_Link}    xpath=//div[@id='horz-menu-profile']/i
${Add_button}     xpath=.//*[@id='supertab-add-icon']
${Add_Custom_Tab_Window}    xpath=//input[@id='nxcsc-addtab-name']
${Save_Custom_tab_Window}    xpath=//div[@id='nxcsc-add-tab-custom-wrapper']/section/div/button[2]
${Click_Custom_Super_tab}    xpath=//div[@id='nxcsc-tab-opt-drag-ABDCE']
${Text_Super_tab_2}    ABDCE
${Click_Widget_Selector}    //*[@id='nxcsc-tab-opt-settings-abdce']
${Click_Table_Option}    xpath=//div[@id='contracts_tabview_contracts_tabbed_table']/div/section/div/div/div/div[1]/button[1]
${Click_Clear_Filters}    xpath=//div[@id='contracts_tabview_contracts_tabbed_table']/div/section/div/div/div[1]/section/aside/div[2]/div[3]/section/div[1]/span[2]
${Case_Id_Filter}    xpath=//input[@id='rc-input-srId']
${Click_Case_Id}    xpath=//a[contains(text(),'2016-1129-T-0013')]
${Click_Priority_DropDown}    xpath=//div[2]/div/div/div[2]
${Deselect_All_Priority}    xpath=//div/div[2]/ul/li
${Click_P1_Priority}    //div[@id='rc-filter-section-priority']/div/div[2]/ul/li[3]
${Cases_Synopsis_Field}    xpath=//input[@id='rc-input-synopsis']
${Cases_Product_Series_Field}    xpath=//input[@id='rc-input-prodSeries']
${Get_Product_Series_Value}    xpath=.//*[@id='jnprDataTableContent_cases_ngcsc_subtab_my_reported_cases']/div[2]/div/div[1]/div[3]/div/div/div/div[2]/div/div[6]/div/div/div/div/span
${x_location}     0
${y_location}     600
${x_inside_location}    0
${y_inside_location}    100
${Inside_Window_Size}    xpath=//input[@class='rc-filter-view']
${Scroll_Down_Inside_View_Filter}    xpath=//div[14]
${Cases_Platform_Field}    xpath=//input[@id='rc-input-platform']
${Get_Platform_Value}    xpath=.//*[@id='jnprDataTableContent_cases_ngcsc_subtab_my_reported_cases']/div[2]/div/div[1]/div[3]/div/div/div/div[2]/div/div[7]/div/div/div/div/span
${Cases_SerialNo_Field}    xpath=//input[@id='rc-input-serialNo']
${Get_SerialNo_Value}    xpath=.//*[@id='jnprDataTableContent_cases_ngcsc_subtab_my_reported_cases']/div[2]/div/div[1]/div[3]/div/div/div/div[2]/div/div[10]/div/div/div/div/span
${x_horizontalcases_location}    900
${y_horizontalcases_location}    0
${Cases_Horizontal_Scroll}    xpath=//section/div/div/section/div/div
${Cases_Vertical_Scroll}    xpath=//section/div/div/section/div/div
${Login_Assistance_link}    xpath=//a[contains(@href, 'https://www.juniper.net/entitlement/loginAssistance.do')]
${Edit_Account}    xpath=//a[contains(@href, 'https://www.juniper.net/entitlement/editAcctInfo.do')]
${System_Default_View}    xpath=//button[2]
${Save_View_Name}    xpath=//li/div/input
${Add_Button_Save_View}    xpath=//div/ul/li/div/div
${Cancel_Button_Add_Tab}    //*[@id='nxcsc-add-tab-custom-wrapper']/section/div/button[1]
${Global_Search_Input}    xpath=//section[@id='nxcsc-global-search-container']/input
${Sort_CaseId_Element_Click}    xpath=//div[@id='jnprDataTableContent_cases_ngcsc_subtab_my_reported_cases']/div[2]/div/div/div[2]/div/div/div[2]/div/div/div[2]/div/span[2]
${Get_Cell_Value_CaseId}    xpath=//div[@id='jnprDataTableContent_cases_ngcsc_subtab_my_reported_cases']/div[2]/div/div/div[3]/div/div/div/div[2]/div/div/div/div/div/div/span/a
${Click_Ascend_Case_Priority}    xpath=//div[@id='jnprDataTableContent_cases_ngcsc_subtab_my_reported_cases']/div[2]/div/div/div[2]/div/div/div[2]/div/div[2]/div[2]/div/span[2]
${Get_Text_Value_Ascend_Case_Priority}    xpath=//div[@id='jnprDataTableContent_cases_ngcsc_subtab_my_reported_cases']/div[2]/div/div/div[3]/div/div/div/div[2]/div/div[2]/div/div/div/div/span
${Cancel_Add_button}    xpath=//div[@id='nxcsc-add-tab-custom-wrapper']/section/div/button
${Click_Ascend_Case_Type}    xpath=//div[@id='jnprDataTableContent_cases_ngcsc_subtab_my_reported_cases']/div[2]/div/div/div[2]/div/div/div[2]/div/div[3]/div[2]/div/span[2]
${Get_Text_Ascend_Case_Type}    xpath=//div[@id='jnprDataTableContent_cases_ngcsc_subtab_all_open_cases']/div[2]/div/div/div[3]/div/div/div/div[2]/div/div[3]/div/div/div/div/span
${Account_Selection_ID}    xpath=//div[@id='contracts_tabview_contracts_tabbed_table']/div/section//div/div/div[1]/section/aside/nav/ul/li[1]
${DeSelect_All}    //*[@id='nxcsc-table-view290']/div/div/div[1]/section/aside/div[2]/div[1]/section/div[1]/div[1]/label
${Get_Text_No_Record_Found}    //*[@id='jnprDataTableContent_cases_ngcsc_subtab_my_reported_cases']/div[1]/span
${Column_Tab_Selection}    xpath=//aside/nav/ul/li[2]
${Deselect_All_Columns}    //*[@id='nxcsc-table-view290']/div/div/div[1]/section/aside/div[2]/div[2]/section/div[1]/div[1]/label
${Click_Add_Chart}    xpath=//div[@id='nxcsc-widget-chooser-inner']/div/div/span/ul/li/span/div
${Open_Cases_By_Series_Product_Priority}    xpath=//div[@id='nxcsc-widget-chooser-inner']/div/div/div[2]/div/div/div/span
${Click_Widget_Selector_Cases}    xpath=//button[@id='nxcsc-tab-opt-settings-cases']
${Open_Cases_Created_To_Closed}    xpath=//div[@id='nxcsc-widget-chooser-inner']/div/div/div[2]/div/div/div[2]/span
${Click_Add_Product}    xpath=//div[@id='nxcsc-widget-chooser-inner']/div/div/span[2]/ul/li/span/div[2]
${Product_Announced_EOL_Summary}    xpath=//div[@id='nxcsc-widget-chooser-inner']/div/div/div[2]/div/div/div/span
${Registration_Summary}    xpath=//div[@id='nxcsc-widget-chooser-inner']/div/div/div[2]/div/div/div[2]/span
${Distribution_Products_Country}    xpath=//div[@id='nxcsc-widget-chooser-inner']/div/div/div[2]/div/div/div[3]/span
${Click_Add_Contract}    xpath=//div[@id='nxcsc-widget-chooser-inner']/div/div/span[3]/ul/li/span/div[2]
${Contracts_Summary}    xpath=//div[@id='nxcsc-widget-chooser-inner']/div/div/div[2]/div/div/div/span
${Username1}      jarroded@icloud.com
${Password1}      juniper
${Get_Text_Value_Series_Product_Priority}    xpath=//*[@id='OpenCases by Product Series/Priority']
${Click_Series_Product_Priority_Value_first_graph}    //*[@id='cases_cur_open_cases_by_prodseries_priority']
${Click_P1_Graph}    xpath=//*[@id='cases_cur_open_cases_by_prodseries_priority']/header/section/ul/li[1]
${ClickToProductsTab}    //*[@id='mCSB_1_container']/li[3]
${Click_Filter_Products}    xpath=//div[2]/div/button
${UserName2}      ngcsc2@ngcsc.33mail.com
${Password2}      juniper
${SerialNumber_Id_Filter}    xpath=//div[@id='rc-filter-section-serialNumber']/div/input
${Click_Product_Serial_Number}    xpath=//div[@id='jnprDataTableContent_installbases_ngcsc_subtab_my_installed_base']/div[2]/div/div/div[3]/div/div/div/div[2]/div/div[2]/div/div/div/div/span
${ProductName_Id_Filter}    xpath=//div[@id='rc-filter-section-productName']/div/input
${Get_Cell_Value_Product_Name}    //div[@id='jnprDataTableContent_installbases_ngcsc_subtab_my_installed_base']/div[2]/div/div/div[3]/div/div/div/div[2]/div/div[4]/div/div/div/div/span    # //div[@id='jnprDataTableContent_installbases_ngcsc_subtab_my_installed_base']/div[2]/div/div/div[3]/div/div/div/div[2]/div/div[4]/div/div/div/div/span
${MaterialItemCategory_Filter}    //*[@id='rc-input-materialItemCategory']
${Get_Cell_Value_MaterialItemCategory}    //div[@id='jnprDataTableContent_installbases_ngcsc_subtab_my_installed_base']/div[2]/div/div/div[3]/div/div/div/div[2]/div/div[5]/div/div/div/div/span    # //div[@id='jnprDataTableContent_installbases_ngcsc_subtab_my_installed_base']/div[2]/div/div/div[3]/div/div/div/div[2]/div/div[5]/div/div/div/div/span
${Get_Cell_Value_AssemblyNumber}    //*[@id='jnprDataTableContent_installbases_ngcsc_subtab_my_installed_base']/div[1]/span
${AssemblyNumber_Filter}    //*[@id='rc-input-assemblyRev']
${AssemblyRev}    //*[@id='rc-input-assemblyRev']
${Get_Cell_Value_Rev}    //*[@id='jnprDataTableContent_installbases_ngcsc_subtab_my_installed_base']/div[1]/span
${AssemblyHardwareRev}    //div[@id='rc-filter-section-assemblyHardwareRev']/div/input
${Get_Cell_Value_AssemblyHardwareRev}    //*[@id='jnprDataTableContent_installbases_ngcsc_subtab_my_installed_base']/div[2]/div/div[1]/div[3]/div/div/div[1]/div[2]/div/div[7]/div/div/div/div/span
${Inner_Scroll}    //div[19]
${SalesOrderNumber}    //*[@id='rc-input-salesOrderNumber']
${Get_Cell_Value_SalesOrderNumber}    //*[@id='jnprDataTableContent_installbases_ngcsc_subtab_my_installed_base']/div[2]/div/div[1]/div[3]/div/div/div[1]/div[2]/div/div[8]/div/div/div/div/span    # .//*[@id='jnprDataTableContent_installbases_ngcsc_subtab_my_installed_base']/div[2]/div/div[1]/div[3]/div/div/div[1]/div[2]/div/div[8]/div/div/div/div/span
${Horizontal_location}    200
${Vertical_location}    0
${Inner_Horizontal_Scroll}    //*[@id='jnprDataTableContent_installbases_ngcsc_subtab_my_installed_base']/div[2]/div/div[2]/div/div
${Get_Cell_Text_Value_Sales_Order_Number}    //div[3]/div/div/div/div/span    # //div[3]/div/div/div/div/span
${Filter_Products_Click}    //aside/div/div/i
${ClickToContractsTab}    //*[@id='mCSB_1_container']/li[4]
${Contract_Id_Filter}    //*[@id='rc-input-contractId']
${Get_Cell_Value_Contract_ID}    //div[3]/div/div/div/div[2]/div/div/div/div/div/div/span
${Contract_Start_Date_Filter}    //div[@id='rc-custom-datepickerstartDate']/div/div[2]/div/input
${Get_Cell_Value_Start_Date}    //div[2]/div/div[2]/div/div/div/div/span
${Click_Month_Contract_DropDown}    //div[@id='ui-datepicker-div']/div/div/select
${Click_Month_Contract}    //div[@id='ui-datepicker-div']/div/div/select/option[12]
${Click_Year_Contract_DropDown}    //div[@id='ui-datepicker-div']/div/div/select[2]
${Click_Year_Contract}    //div[@id='ui-datepicker-div']/div/div/select[2]/option[18]    # //div[@id='ui-datepicker-div']/div/div/select[2]/option[18]
${Click_Date}     //div[@id='ui-datepicker-div']/table/tbody/tr[4]/td[4]/a    # //div[@id='ui-datepicker-div']/table/tbody/tr[4]/td[4]/a
${Click_Start_Date_Contract}    //div[@id='rc-custom-datepickerstartDate']/div/div[2]/div/input
${Click_End_Date_Contract}    //div[@id='rc-custom-datepickerendDate']/div/div[2]/div/input
${Click_Month_Contract_DropDown_End_Date}    //div[@id='rc-custom-datepickerendDate']/div/div[2]/div/input
${Click_Month_Contract_End_Date}    //div/select/option[7]
${Click_Year_Contract_DropDown_End_Date}    //div[@id='ui-datepicker-div']/div/div/select[2]
${Click_Year_Contract_End_Date}    //div[@id='ui-datepicker-div']/div/div/select[2]/option[21]
${Click_End_Date}    //div[@id='ui-datepicker-div']/table/tbody/tr[6]/td/a
${Get_Cell_Value_End_Date}    //*[@id='jnprDataTableContent_contracts_ngcsc_subtab_all_active']/div[2]/div/div[1]/div[3]/div/div/div[1]/div[2]/div/div[3]/div/div/div/div/span
${Support_Coverage_Filter}    //*[@id='rc-input-supportCoverage']
${SalesOrderLineItem}    //*[@id='rc-input-salesOrderLineItem']
${Get_Cell_Value_SalesOrderLineItem}    //div[3]/div/div/div/div/span    # //div[3]/div/div/div/div/span
${Product_City}    //*[@id='rc-input-city']
${Get_Cell_Value_Product_City}    //div[3]/div/div/div/div/span    # //div[3]/div/div/div/div/span
${Inner_Small_Horizontal_Scroll}    //*[@id='jnprDataTableContent_installbases_ngcsc_subtab_my_installed_base']/div[2]/div/div[2]/div/div/div
${Product_Country}    //*[@id='rc-input-country']
${Get_Cell_Value_Product_Country}    //div[4]/div/div/div/div/span
${Click_PR_Date_Product}    //div[@id='rc-custom-datepickerproductRegistrationDate']/div/div[2]/div/input    # //div[@id='rc-custom-datepickerproductRegistrationDate']/div/div[2]/div/input
${Click_Month_Product_DropDown_PR_Date}    //div/select    # .//*[@id='ui-datepicker-div']/div/div/select[1]
${Click_Month_Product_PR_Date}    //div[@id='ui-datepicker-div']/div/div/select/option[8]    # //div[@id='ui-datepicker-div']/div/div/select/option[8]
${Click_Year_Product_DropDown_PR_Date}    //div[@id='ui-datepicker-div']/div/div/select[2]
${Click_Year_Product_PR_Date}    //div[@id='ui-datepicker-div']/div/div/select[2]/option[21]
${Click_PR_Date}    //td[2]/a
${Get_Cell_Value_PR_Date}    //*[@id='jnprDataTableContent_installbases_ngcsc_subtab_my_installed_base']/div[2]/div/div[1]/div[3]/div/div/div[1]/div[2]/div/div[6]/div/div/div/div/span    # .//*[@id='jnprDataTableContent_installbases_ngcsc_subtab_my_installed_base']/div[2]/div/div[1]/div[3]/div/div/div[1]/div[2]/div/div[6]/div/div/div/div/span
${Inner_Deep_Vertical_Scroll}    //*[@class='ps-scrollbar-y']
${Get_Filter_Value_PR_Date}    //*[@id='rc-custom-datepickerproductRegistrationDate']/label
${Global_Search_Enter_Input_button}    //*[@id='nxcsc-global-search-container']/input    # .//*[@id='nxcsc-global-search-container']/input
${Get_Cell_Value_Global_Search_Contracts_Text}    //*[@id='jnprDataTableContent_search_function_tab_contracts']/div/div/div[2]/div/div/div[3]/div/div/div/div[2]/div/div[1]/div/div/div/div/span
${Get_Cell_Value_Global_Search_Product_Text}    //div[@id='jnprDataTableContent_search_function_tab_products']/div/div/div[2]/div/div/div[3]/div/div/div/div[2]/div/div/div/div/div/div/span    # //div[@id='jnprDataTableContent_search_function_tab_products']/div/div/div[2]/div/div/div[3]/div/div/div/div[2]/div/div/div/div/div/div/span
${Click_Column_Tab}    //aside/nav/ul/li[2]
${Click_Select_All}    //div[2]/section/div/div/label
${Click_DeSelect_All}    //input[@id='contracts_ngcsc_subtab_all_activeidmultiselect-all']
${Click_Suuport_Coverage_Column}    //div[2]/section/div[2]/ul/li[6]    # //div[2]/section/div[2]/ul/li[6]
${Get_Cell_Value_SupportCoverage}    //*[@id='jnprDataTableContent_contracts_ngcsc_subtab_all_active']/div[2]/div/div/div[3]/div/div/div/div[2]/div/div[2]/div/div/div/div/span
${Serial_Filter}    //*[@id='rc-input-serialNo']
${Click_Serial_Column}    //div[2]/section/div[2]/ul/li[7]    # //div[2]/section/div[2]/ul/li[7]
${Get_Cell_Value_Serial_Contract}    //*[@id='jnprDataTableContent_contracts_ngcsc_subtab_all_active']/div[2]/div/div/div[3]/div/div/div/div[2]/div/div[2]/div/div/div/div/span
${Product_Filter}    //*[@id='rc-input-product']
${Click_Product_Column}    //div[2]/section/div[2]/ul/li[9]
${Get_Cell_Value_Product_Contract}    //*[@id='jnprDataTableContent_contracts_ngcsc_subtab_all_active']/div[2]/div/div/div[3]/div/div/div/div[2]/div/div[2]/div/div/div/div/span
${Click_Ship_Date_Contracts}    ${EMPTY}
${ShipDate_Filter}    //div[@id='rc-custom-datepickershipDate']/div/div[2]/div/input
${Click_Warranty_Date_Contracts}    //div[@id='rc-custom-datepickerwarrantyExpDate']/div/div[2]/div/input
${City_Filter}    //*[@id='rc-input-city']
${Inner_Vertical_Scroll_Column_Contract}    //div[2]/section/div[2]/div[2]/div    # //div[2]/section/div[2]/div[2]/div
${Click_City_Column}    //div[2]/section/div[2]/ul/li[12]    # //div[2]/section/div[2]/ul/li[12]
${Get_Cell_Value_City_Contract}    //div[4]/div/div/div/div/span    # //div[4]/div/div/div/div/span
${ll}             //div[2]/section/div[2]/div[2]
${Click_Start}    //div[2]/section/div[2]/ul/li[2]/span
${Click_End}      //div[2]/div[2]/section/div[2]/ul/li[3]
${Contract_id_column}    //div[2]/div[2]/section/div[2]/ul/li[1]
${Get_Cell_Value_Detailed_Contract_ID}    //*[@id='jnprDataTableContent_contracts_ngcsc_subtab_all_active_detail_view']/div[2]/div/div[1]/div[3]/div/div/div[1]/div[2]/div/div[1]/div/div/div/div/span
${Get_Cell_Value_SerialNumber}    //div[@id='jnprDataTableContent_installbases_ngcsc_subtab_my_installed_base']/div[2]/div/div/div[3]/div/div/div/div[2]/div/div[2]/div/div/div/div/span    # //div[@id='jnprDataTableContent_installbases_ngcsc_subtab_my_installed_base']/div[2]/div/div/div[3]/div/div/div/div[2]/div/div[2]/div/div/div/div/span
${Get_Cell_Value_Detailed_SerialNumber}    //*[@id='jnprDataTableContent_installbases_ngcsc_subtab_my_installed_base_detail_view']/div[2]/div/div[1]/div[2]/div/div[1]/div[2]/div/div[1]/div[2]/div[3]/span[2]    # .//*[@id='jnprDataTableContent_installbases_ngcsc_subtab_my_installed_base_detail_view']/div[2]/div/div[1]/div[2]/div/div[1]/div[2]/div/div[1]/div[2]/div[3]/span[2]
${Inside_Y_Scroll}    //div[2]/section/div[2]/div[2]
${Get_Cell_Value_City_Column_Contract}    //*[@id='jnprDataTableContent_contracts_ngcsc_subtab_all_active']/div[2]/div/div/div[3]/div[1]/div/div/div[2]/div/div[3]/div/div/div/div/span
${State_Filter}    //*[@id='rc-input-state']
${Click_State_Column}    //div[2]/section/div[2]/ul/li[12]/span
${Get_Cell_Value_State_Column_Contract}    //*[@id='jnprDataTableContent_contracts_ngcsc_subtab_all_active']/div[2]/div/div/div[3]/div[1]/div/div/div[2]/div/div[3]/div/div/div/div/span
${Country_Filter}    //*[@id='rc-input-country']
${Click_Country_Column}    //div[2]/section/div[2]/ul/li[13]/span
${Get_Cell_Value_Country_Column_Contract}    //div[@id='jnprDataTableContent_contracts_ngcsc_subtab_all_active']/div[2]/div/div[1]/div[3]/div[3]/div/div/div[2]/div/div[6]/div/div/div/div/span
${Click__Product_Ship_Date}    //div[@id='rc-custom-datepickershipDate']/div/div[2]/div/input
${Click_Month_Product_DropDown_Ship_Date}    //div[@id='ui-datepicker-div']/div/div/select
${Click_Month_Product_Ship_Date}    //div[@id='ui-datepicker-div']/div/div/select/option[4]
${Click_Year_Product_DropDown_Ship_Date}    //div[@id='ui-datepicker-div']/div/div/select[2]
${Click_Year_Product_Ship_Date}    //div[@id='ui-datepicker-div']/div/div/select[2]/option[19]
${Click_Ship_Product_Date}    //div[@id='ui-datepicker-div']/table/tbody/tr/td[3]/a
${Get_Cell_Value_Ship_Date}    //div[4]/div/div/div/div/span
${Click_Ship_Date_Product}    //div[@id='rc-custom-datepickershipDate']/div/div[2]/div/input
${Horizontal_Scroll_Product}    //*[@id='jnprDataTableContent_installbases_ngcsc_subtab_my_installed_base']/div[2]/div/div[2]/div/div/div    # .//*[@id='jnprDataTableContent_installbases_ngcsc_subtab_my_installed_base']/div[2]/div/div[2]/div/div/div
${Click_Product_Name_Column}    //div[2]/section/div[2]/ul/li[3]
${Click_Warranty_Date_Column}    //div[2]/section/div[2]/ul/li[20]/span
${Get_Cell_Value_Warranty_Date}    //*[@id='jnprDataTableContent_installbases_ngcsc_subtab_my_installed_base']/div[2]/div/div/div[3]/div/div/div/div[2]/div/div[4]/div/div/div/div/span
${Click_Select_All_Cases}    //input[@id='cases_ngcsc_subtab_my_reported_casesaccountIdmultiselect-all']
${Click_Priority}    //div[2]/section/div[2]/ul/li[2]    # //div[2]/section/div[2]/ul/li[2]
${Click_Serial_Case_Column}    //li[10]
${Get_Cell_Value_Serial_Number_Cases}    //div[6]/div/div/div/div/span    # //div[2]/div/div[2]/div/div/div/div/span
${Get_Cell_Value_Router_Name_Cases}    //*[@id='jnprDataTableContent_cases_ngcsc_subtab_my_reported_cases']/div[1]/span    # .//*[@id='jnprDataTableContent_cases_ngcsc_subtab_my_reported_cases']/div[1]/span
${Click_City_Case_Column}    //div[2]/section/div[2]/ul/li[9]/span
${Get_Cell_Value_EOL_Date}    //*[@id='jnprDataTableContent_installbases_ngcsc_subtab_my_installed_base']/div[1]/span
${Click_Month_Cases_CreatedOn_Date}    //div[@id='ui-datepicker-div']/div/div/select/option[6]
${Click_Year_Cases_CreatedOn_Date}    //div[@id='ui-datepicker-div']/div/div/select[2]/option[22]
${Click_Cases_Created_On_Date}    //tr[5]/td[3]/a
${Click_Priority_Column}    //div[2]/section/div[2]/ul/li[2]/span
${Click_CreatedOn_Case_Column}    //li[14]    # //li[14]
${Get_Cell_Value_CreatedOn_Cases}    //div[6]/div/div/div/div/span    # //div[2]/div/div[2]/div/div/div/div/span
${Click_Case_Type}    //*[@id='rc-filter-section-caseType']/div/div[1]/div[1]
${Click_Case_Admin_Tech}    //*[@id='rc-filter-section-caseType']/div/div[2]/ul/li[2]
${Get_Cell_Value_Admin_Tech}    //*[@id='jnprDataTableContent_cases_ngcsc_subtab_all_open_cases']/div[2]/div/div[1]/div[3]/div/div/div[1]/div[2]/div/div[3]/div/div/div/div/span
${Firefox}        firefox
${Google_Chrome}    Google Chrome
${SSRN_Filter}    //*[@id='rc-input-softwareSupportReferenceNumber']
${Sales_Order_Column_Select}    //div[2]/section/div[2]/ul/li[8]
${Sales_Order_Line_Item_Column_Select}    //div[2]/section/div[2]/ul/li[9]
${y_contracts_location}    400
${x_contracts_location}    400
${Click_Start_Date_Column}    //div[2]/section/div[2]/ul/li[2]/span[2]
${Click_End_Date_Column}    //div[2]/section/div[2]/ul/li[3]/span[2]
${Click_Status_Column}    //div[2]/section/div[2]/ul/li[4]/span[2]
${Click_Location_Column}    //div[2]/section/div[2]/ul/li[5]/span[2]
${Click_Support_Coverage_Column}    //div[2]/section/div[2]/ul/li[6]/span[2]
${Click_Serial_No_Column}    //div[2]/section/div[2]/ul/li[7]/span[2]
${Click_SSRN_Column}    //div[2]/section/div[2]/ul/li[8]/span[2]
${Click_Product_Names_Column}    //div[2]/section/div[2]/ul/li[9]/span[2]
${State_Contract_Filter}    //*[@id='rc-input-state']
${Get_Text_State_Column_Contract}    //div[5]/div/div/div/div/span    # //div[5]/div/div/div/div/span
${Click_SSRN_IB}    //div[2]/section/div[2]/ul/li[2]/span[2]
${Click_MaterialCategory_IB}    //div[2]/section/div[2]/ul/li[4]/span[2]
${Click_AssemblyNumber_IB}    //div[2]/section/div[2]/ul/li[5]/span[2]
${Click_AssemblyRev_IB}    //div[2]/section/div[2]/ul/li[6]/span[2]
${Click_AssemblyHardwareRev_IB}    //div[2]/section/div[2]/ul/li[7]/span[2]
${Click_SalesOrderNumber_IB}    //div[2]/section/div[2]/ul/li[8]/span[2]
${Click_SalesOrderLineItem_IB}    //div[2]/section/div[2]/ul/li[9]/span[2]
${Get_Cell_Value_Product_State}    //div[5]/div/div/div/div/span
${Click_City_IB}    //div[2]/section/div[2]/ul/li[10]/span[3]
${Click_State_IB}    //div[2]/section/div[2]/ul/li[11]/span[2]
${Click_Country_IB}    //div[2]/section/div[2]/ul/li[12]/span[2]
${Click_Address_IB}    //div[2]/section/div[2]/ul/li[13]/span[2]
${Click_InstalledAt_IB}    //div[2]/section/div[2]/ul/li[14]/span[2]
${Click_Reseller_IB}    //div[2]/section/div[2]/ul/li[15]/span[2]
${Click_Distributor_IB}    //div[2]/section/div[2]/ul/li[16]/span[2]
${Click_PRDate_IB}    //div[2]/section/div[2]/ul/li[17]/span[2]
${Cases_Filter_tab}    //aside/nav/ul/li[3]
${CASE ID}        2017-0606-T-0024

*** Test Cases ***
Filter_Contracts_ID_Validation
    Comment    Sleep    5
    Comment    Click Element    ${ClickToContractsTab}
    Sleep    5
    Click Element    //div[@id='contracts_tabview_contracts_tabbed_table']/div/section/div/div/div/div[1]/button[1]
    Sleep    5
    Click Element    //div[@id='contracts_tabview_contracts_tabbed_table']/div/section/div/div/div[1]/section/aside/div[2]/div[3]/section/div[1]/span[2]
    Sleep    8
    Input Text    ${Contract_Id_Filter}    0060082684
    Sleep    8
    ${Get_Text_ContractsID}    Get Text    ${Get_Cell_Value_Contract_ID}
    Sleep    5
    Should Be Equal    ${Get_Text_ContractsID}    0060082684

Detailed_Hierarchy_Contracts
    Comment    Click Element    //div[@id='contracts_tabview_contracts_tabbed_table']/div/section/div/div/div[1]/section/aside/nav/ul/li[3]
    Comment    Sleep    5
    Click Element    ${Click_Clear_Filters}
    Sleep    5s
    Input Text    ${Contract_Id_Filter}    0066022344
    Sleep    5s
    ${Get_Text_ContractsID}    Get Text    ${Get_Cell_Value_Contract_ID}
    Sleep    5
    Should Be Equal    ${Get_Text_ContractsID}    0066022344
    Sleep    5
    Click Element    ${Get_Cell_Value_Contract_ID}
    Sleep    5
    ${Get_Text_Detailed_ContractsID}    Get Text    ${Get_Cell_Value_Detailed_Contract_ID}
    Sleep    5
    Should Be Equal    ${Get_Text_Detailed_ContractsID}    0066022344
    Sleep    5
    Selenium2Library.Click Element    //div[@id='detailview-contracts_ngcsc_subtab_all_active_detail_view']/section/div/header/div/span/i

SaveViewContracts
    [Setup]
    Comment    Comment    Sleep    5
    Comment    Click Element    ${ClickToContractsTab}
    Comment    Click Element    //div[@id='contracts_tabview_contracts_tabbed_table']/div/section/div/div/div/div[1]/button[1]    #Table
    Sleep    3
    Click Element    //div[@id='contracts_tabview_contracts_tabbed_table']/div/section/div/div/div[1]/section/aside/div[2]/div[3]/section/div[1]/span[2]    #Clear ALL
    Sleep    3
    Input Text    ${Contract_Id_Filter}    0066025503
    Sleep    5
    Comment    Click Element    ${Cancel_Button_Add_Tab}
    Comment    Sleep    5
    Click Element    ${System_Default_View}
    Sleep    3
    Input Text    ${Save_View_Name}    abc
    Sleep    3
    Click Element    ${Add_Button_Save_View}

Filter_Contracts_Start_Date_Validation
    Sleep    5
    Click Element    ${Click_Clear_Filters}
    Sleep    8
    Input Text    ${Contract_Id_Filter}    0060082684
    Sleep    8
    Click Element    ${Click_Start_Date_Contract}
    Sleep    8
    Click Element    ${Click_Month_Contract_DropDown}
    Sleep    5
    Click Element    ${Click_Month_Contract}
    Sleep    5
    Click Element    ${Click_Year_Contract_DropDown}
    Sleep    5
    Click Element    ${Click_Year_Contract}
    Sleep    5
    Click Element    ${Click_Date}
    Sleep    8
    ${Get_Text_Start_Date}    Get Text    ${Get_Cell_Value_Start_Date}
    Sleep    5
    Should Be Equal    ${Get_Text_Start_Date}    25-DEC-2013

Filter_Contracts_End_Date_Validation
    Comment    Sleep    5
    Comment    Click Element    ${ClickToContractsTab}
    Comment    Sleep    5
    Comment    Click Element    ${Click_Filter_Products}
    Sleep    5
    Click Element    ${Click_Clear_Filters}
    Sleep    8
    Input Text    ${Contract_Id_Filter}    0060082684
    Sleep    8
    Click Element    ${Click_End_Date_Contract}
    Sleep    8
    Click Element    ${Click_Month_Contract_DropDown}
    Sleep    5
    Click Element    ${Click_Month_Contract}
    Sleep    5
    Click Element    ${Click_Year_Contract_DropDown}
    Sleep    5
    Click Element    //div[@id='ui-datepicker-div']/div/div/select[2]/option[21]
    Sleep    5
    Click Element    //div[@id='ui-datepicker-div']/table/tbody/tr[4]/td[7]/a
    Sleep    8
    ${Get_Text_End_Date}    Get Text    ${Get_Cell_Value_End_Date}
    Sleep    5
    Should Be Equal    ${Get_Text_End_Date}    24-DEC-2016

Filter_Contracts_Support_Coverage_Validation
    Click Element    ${Click_Clear_Filters}
    Sleep    8
    Input Text    ${Contract_Id_Filter}    0060082684
    Sleep    8
    Input Text    ${Support_Coverage_Filter}    SVC-SD-MPC4E-2CGE8XGE-R    #SVC-ND-MX-MPC-3D-16XG
    Sleep    8
    Click Element    ${Click_Column_Tab}
    Sleep    8
    Click Element    ${Click_Select_All}
    Sleep    2
    Sleep    5
    Click Element    ${Click_Suuport_Coverage_Column}
    Sleep    5
    ${Get_Text_SupportCoverage}    Get Text    ${Get_Cell_Value_SupportCoverage}
    Sleep    5
    Should Be Equal    ${Get_Text_SupportCoverage}    SVC-SD-MPC4E-2CGE8XGE-R

Filter_Contracts_Serial_Number_Validation
    Click Element    //div[@id='contracts_tabview_contracts_tabbed_table']/div/section/div/div/div[1]/section/aside/nav/ul/li[3]
    Sleep    5
    Click Element    ${Click_Clear_Filters}
    Sleep    8
    Input Text    ${Contract_Id_Filter}    0060082684
    Sleep    8
    Input Text    ${Support_Coverage_Filter}    SVC-SD-MPC4E-2CGE8XGE-R
    Sleep    8
    Input Text    ${Serial_Filter}    CACV8272    #ABBH0939
    Sleep    8
    Click Element    ${Click_Column_Tab}
    Sleep    8
    Click Element    ${Click_Select_All}
    Sleep    2
    Sleep    5
    Click Element    ${Click_Serial_Column}
    Sleep    5
    ${Get_Text_Serial_Contract}    Get Text    ${Get_Cell_Value_Serial_Contract}
    Sleep    5
    Should Be Equal    ${Get_Text_Serial_Contract}    CACV8272

Filter_Contracts_Product_Name_Validation
    Click Element    //div[@id='contracts_tabview_contracts_tabbed_table']/div/section/div/div/div[1]/section/aside/nav/ul/li[3]
    Sleep    5
    Click Element    ${Click_Clear_Filters}
    Sleep    8
    Comment    Click Element    ${Cancel_Button_Add_Tab}
    Comment    Sleep    8
    Input Text    ${Contract_Id_Filter}    0060220696
    Sleep    8
    Input Text    ${Support_Coverage_Filter}    SVC-ND-MX-MPC-3D-16XG
    Sleep    8
    Input Text    ${Serial_Filter}    ABBH0939
    Sleep    8
    Press Key    ${Serial_Filter}    \\9
    Sleep    8
    Press Key    //*[@id='rc-input-softwareSupportReferenceNumber']    \\9
    Sleep    8
    Input Text    ${Product_Filter}    MPC-3D-16XGE-SFPP
    Sleep    8
    Click Element    ${Click_Column_Tab}
    Sleep    8
    Click Element    ${Click_Select_All}
    Sleep    2
    Sleep    5
    Click Element    ${Click_Product_Column}
    Sleep    5
    ${Get_Text_Product_Contract}    Get Text    ${Get_Cell_Value_Product_Contract}
    Sleep    5
    Should Be Equal    ${Get_Text_Product_Contract}    MPC-3D-16XGE-SFPP    #MPC-3D-16XGE-SFPP

Filter_Contracts_Ship_Date_Validation
    Click Element    //div[@id='contracts_tabview_contracts_tabbed_table']/div/section/div/div/div[1]/section/aside/nav/ul/li[3]
    Sleep    5
    Click Element    ${Click_Clear_Filters}
    Sleep    8
    Comment    Click Element    ${Cancel_Button_Add_Tab}
    Comment    Sleep    8
    Comment    Input Text    ${Contract_Id_Filter}    0060220696
    Comment    Sleep    8
    Input Text    ${Support_Coverage_Filter}    SVC-ND-MX-MPC-3D-16XG
    Sleep    8
    Input Text    ${Serial_Filter}    CACA7298
    Sleep    8
    Press Key    ${Serial_Filter}    \\9
    Sleep    8
    Press Key    //*[@id='rc-input-softwareSupportReferenceNumber']    \\9
    Sleep    8
    Input Text    ${Product_Filter}    MPC-3D-16XGE-SFPP
    Sleep    8
    Click Element    //div[@id='rc-custom-datepickershipDate']/div/div[2]/div/input
    Sleep    8
    Click Element    ${Click_Month_Contract_DropDown}
    Sleep    5
    Click Element    //div[@id='ui-datepicker-div']/div/div/select/option[3]
    Sleep    5
    Click Element    ${Click_Year_Contract_DropDown}
    Sleep    5
    Click Element    //div[@id='ui-datepicker-div']/div/div/select[2]/option[19]
    Sleep    5
    Click Element    //div[@id='ui-datepicker-div']/table/tbody/tr[6]/td[1]/a
    Sleep    8
    Click Element    ${Click_Column_Tab}
    Sleep    8
    Comment    Click Element    ${Click_Select_All}
    Comment    Sleep    2
    Click Element    ${Click_Start_Date_Column}
    Sleep    5
    Click Element    ${Click_End_Date_Column}
    Sleep    5
    Click Element    ${Click_Status_Column}
    Sleep    5
    Click Element    ${Click_Location_Column}
    Sleep    5
    ${Get_Text_ShipDate_Contract}    Get Text    //div[@id='jnprDataTableContent_contracts_ngcsc_subtab_all_active']/div[2]/div/div[1]/div[3]/div/div/div[1]/div[2]/div/div[6]/div/div/div/div/span
    Sleep    5
    Should Be Equal    ${Get_Text_ShipDate_Contract}    30-MAR-2014

Filter_Contracts_Warranty_Expiration_Date_Validation
    Click Element    //div[@id='contracts_tabview_contracts_tabbed_table']/div/section/div/div/div[1]/section/aside/nav/ul/li[3]
    Sleep    5
    Click Element    ${Click_Clear_Filters}
    Sleep    8
    Comment    Click Element    ${Cancel_Button_Add_Tab}
    Comment    Sleep    8
    Comment    Input Text    ${Contract_Id_Filter}    0060220696
    Comment    Sleep    8
    Input Text    ${Support_Coverage_Filter}    SVC-ND-MX-MPC-3D-16XG
    Sleep    8
    Input Text    ${Serial_Filter}    CACA7298
    Sleep    8
    Press Key    ${Serial_Filter}    \\9
    Sleep    8
    Press Key    //*[@id='rc-input-softwareSupportReferenceNumber']    \\9
    Sleep    8
    Input Text    ${Product_Filter}    MPC-3D-16XGE-SFPP
    Sleep    8
    Press Key    //div[@id='rc-custom-datepickershipDate']/div/div[2]/div/input    \\9
    Sleep    2s
    Click Element    //div[@id='rc-custom-datepickerwarrantyExpDate']/div/div[2]/div/input
    Sleep    8
    Click Element    ${Click_Month_Contract_DropDown}
    Sleep    5
    Click Element    //div[@id='ui-datepicker-div']/div/div/select/option[3]
    Sleep    5
    Click Element    ${Click_Year_Contract_DropDown}
    Sleep    5
    Click Element    //div[@id='ui-datepicker-div']/div/div/select[2]/option[20]
    Sleep    5
    Click Element    //div[@id='ui-datepicker-div']/table/tbody/tr[5]/td[1]/a
    Sleep    8
    Click Element    ${Click_Column_Tab}
    Sleep    8
    Click Element    ${Click_Start_Date_Column}
    Sleep    5
    Click Element    ${Click_End_Date_Column}
    Sleep    5
    Click Element    ${Click_Status_Column}
    Sleep    5
    Click Element    ${Click_Location_Column}
    Sleep    5
    Comment    Click Element    ${Click_Select_All}
    Comment    Sleep    2
    Comment    Sleep    5
    Comment    Click Element    ${Click_Product_Column}
    Comment    Sleep    5
    ${Get_Text_Warranty_Expiration_Contract}    Get Text    //div[@id='jnprDataTableContent_contracts_ngcsc_subtab_all_active']/div[2]/div/div[1]/div[3]/div/div/div[1]/div[2]/div/div[7]/div/div/div/div/span
    Sleep    5
    Should Be Equal    ${Get_Text_Warranty_Expiration_Contract}    29-MAR-2015

Filter_Contracts_City_Validation
    Click Element    //div[@id='contracts_tabview_contracts_tabbed_table']/div/section/div/div/div[1]/section/aside/nav/ul/li[3]
    Sleep    5
    Click Element    ${Click_Clear_Filters}
    Sleep    8
    Comment    Click Element    ${Cancel_Button_Add_Tab}
    Comment    Sleep    8
    Comment    Input Text    ${Contract_Id_Filter}    0065058037
    Comment    Sleep    8
    Comment    Press Key    ${Support_Coverage_Filter}    \\9
    Comment    Sleep    8
    Comment    Press Key    ${Serial_Filter}    \\9
    Comment    Sleep    8
    Comment    Press Key    //*[@id='rc-input-softwareSupportReferenceNumber']    \\9
    Comment    Sleep    8
    Comment    Press Key    ${Product_Filter}    \\9
    Comment    Sleep    3
    Comment    Press Key    ${ShipDate_Filter}    \\9
    Comment    Sleep    5
    Comment    Press Key    ${Click_Warranty_Date_Contracts}    \\9
    Sleep    5
    Input Text    ${City_Filter}    SUNNYVALE
    Sleep    5
    Click Element    ${Click_Column_Tab}
    Sleep    5
    Click Element    ${Click_Start_Date_Column}
    Sleep    5
    Click Element    ${Click_End_Date_Column}
    Sleep    5
    Click Element    ${Click_Status_Column}
    Sleep    5
    Click Element    ${Click_Location_Column}
    Sleep    5
    Click Element    ${Click_Support_Coverage_Column}
    Sleep    5
    Click Element    ${Click_Serial_No_Column}
    Sleep    5
    Click Element    ${Click_SSRN_Column}
    Sleep    5
    Click Element    ${Click_Product_Names_Column}
    Sleep    4
    ${Get_Text_City_Column_Contract}    Get Text    ${Get_Cell_Value_City_Contract}
    Sleep    5
    Should Be Equal    ${Get_Text_City_Column_Contract}    SUNNYVALE

Filter_Contracts_State_Validation
    Click Element    //div[@id='contracts_tabview_contracts_tabbed_table']/div/section/div/div/div[1]/section/aside/nav/ul/li[3]
    Sleep    5
    Click Element    ${Click_Clear_Filters}
    Sleep    8
    Comment    Click Element    ${Cancel_Button_Add_Tab}
    Comment    Sleep    8
    Comment    Input Text    ${Contract_Id_Filter}    0065058037
    Comment    Sleep    8
    Comment    Press Key    ${Support_Coverage_Filter}    \\9
    Comment    Sleep    8
    Comment    Press Key    ${Serial_Filter}    \\9
    Comment    Sleep    8
    Comment    Press Key    //*[@id='rc-input-softwareSupportReferenceNumber']    \\9
    Comment    Sleep    8
    Comment    Press Key    ${Product_Filter}    \\9
    Comment    Sleep    3
    Comment    Press Key    ${ShipDate_Filter}    \\9
    Comment    Sleep    5
    Comment    Press Key    ${Click_Warranty_Date_Contracts}    \\9
    Sleep    5
    Input Text    ${City_Filter}    SUNNYVALE
    Sleep    5
    Input Text    ${State_Contract_Filter}    California
    Sleep    5
    Click Element    ${Click_Column_Tab}
    Sleep    5
    Click Element    ${Click_Start_Date_Column}
    Sleep    5
    Click Element    ${Click_End_Date_Column}
    Sleep    5
    Click Element    ${Click_Status_Column}
    Sleep    5
    Click Element    ${Click_Location_Column}
    Sleep    5
    Click Element    ${Click_Support_Coverage_Column}
    Sleep    5
    Click Element    ${Click_Serial_No_Column}
    Sleep    5
    Click Element    ${Click_SSRN_Column}
    Sleep    5
    Click Element    ${Click_Product_Names_Column}
    Sleep    4
    ${Get_Text_City_Column_Contract}    Get Text    ${Get_Text_State_Column_Contract}
    Sleep    5
    Should Be Equal    ${Get_Text_City_Column_Contract}    California

Filter_Contracts_Country_Validation
    Click Element    //div[@id='contracts_tabview_contracts_tabbed_table']/div/section/div/div/div[1]/section/aside/nav/ul/li[3]
    Sleep    5
    Click Element    ${Click_Clear_Filters}
    Sleep    8
    Comment    Input Text    ${Contract_Id_Filter}    0065058037
    Comment    Sleep    8
    Comment    Press Key    ${Support_Coverage_Filter}    \\9
    Comment    Sleep    8
    Comment    Press Key    ${Serial_Filter}    \\9
    Comment    Sleep    8
    Comment    Press Key    //*[@id='rc-input-softwareSupportReferenceNumber']    \\9
    Comment    Sleep    8
    Comment    Press Key    ${Product_Filter}    \\9
    Comment    Sleep    3
    Comment    Press Key    ${ShipDate_Filter}    \\9
    Comment    Sleep    5
    Comment    Press Key    ${Click_Warranty_Date_Contracts}    \\9
    Sleep    5
    Input Text    ${City_Filter}    SUNNYVALE
    Sleep    5
    Input Text    ${State_Contract_Filter}    California
    Sleep    5
    Click Element    ${Click_Column_Tab}
    Sleep    5
    Click Element    ${Click_Start_Date_Column}
    Sleep    5
    Click Element    ${Click_End_Date_Column}
    Sleep    5
    Click Element    ${Click_Status_Column}
    Sleep    5
    Click Element    ${Click_Location_Column}
    Sleep    5
    Click Element    ${Click_Support_Coverage_Column}
    Sleep    5
    Click Element    ${Click_Serial_No_Column}
    Sleep    5
    Click Element    ${Click_SSRN_Column}
    Sleep    5
    Click Element    ${Click_Product_Names_Column}
    Sleep    4
    ${Get_Text_City_Column_Contract}    Get Text    ${Get_Text_State_Column_Contract}
    Sleep    5
    Should Be Equal    ${Get_Text_City_Column_Contract}    California
    Sleep    4
    Comment    Click Element    ${Click_Country_Column}
    Comment    Sleep    4
    ${Get_Text_Country_Column_Contract}    Get Text    ${Get_Cell_Value_Country_Column_Contract}
    Sleep    5
    Should Be Equal    ${Get_Text_Country_Column_Contract}    United States

Account_Selection_Contracts
    Comment    Sleep    5
    Comment    Click Element    ${Click_Table_Option}
    Comment    Sleep    5
    Comment    Click Element    ${Click_Clear_Filters}
    Sleep    5
    Click Element    ${Account_Selection_ID}
    Sleep    8
    Comment    Click Element    //label
    Comment    Sleep    5
    Click Element    ${Click_Select_All}
    Sleep    2
    Selenium2Library.Input Text    //div[@id='contracts_tabview_contracts_tabbed_table']/div/section/div/div/div[1]/section/aside/div[2]/div[1]/section/div[1]/div[2]/input    0100128132
    BuiltIn.Sleep    5s
    Selenium2Library.Click Element    //div[@id='contracts_tabview_contracts_tabbed_table']/div/section/div/div/div[1]/section/aside/div[2]/div[1]/section/div[2]/ul/li[1]
    BuiltIn.Sleep    5s
    ${location_text}    Selenium2Library.Get Text    //div[@id='jnprDataTableContent_contracts_ngcsc_subtab_all_active']/div[2]/div/div/div[3]/div[1]/div/div/div[2]/div/div[5]/div/div/div/div/span
    ${account Id}    String.Split String From Right    ${location_text}    -    1
    BuiltIn.Should Be Equal    ${account Id}    0100128132

Widget_Selection_Validation
    [Template]
    Sleep    5
    Click Element    ${Add_button}
    Sleep    2
    Input Text    ${Add_Custom_Tab_Window}    ABDCE
    Sleep    1
    Click Button    ${Save_Custom_tab_Window}
    Sleep    3
    Sleep    3

Widget_Contracts_Summary_Validation
    Sleep    5
    Click Element    ${Click_Widget_Selector_Cases}
    Sleep    5
    Click Element    ${Click_Add_Contract}
    Sleep    8
    Click Element    ${Contracts_Summary}
    Sleep    8

Global_Search_Contracts
    Sleep    10
    Input Text    ${Global_Search_Input}    0066025721
    Sleep    5
    Press Key    ${Global_Search_Enter_Input_button}    \\13
    Sleep    5
    ${Get_Global_Search_Contracts_Text}    Get Text    ${Get_Cell_Value_Global_Search_Contracts_Text}
    Log    ${Get_Global_Search_Contracts_Text}
    Should Be Equal    ${Get_Global_Search_Contracts_Text}    0066025721
    Sleep    3
