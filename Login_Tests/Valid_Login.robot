*** Settings ***
Test Teardown     Close Browser
Resource          ../Login.robot

*** Variables ***
${g_Telephone}    7533967
${g_Title_Description}    大腸癌檢查
${g_Consult_Content_S}    S_大腸癌檢查
${g_Consult_Content_O}    O_大腸癌檢查
${g_Consult_Content_A}    A_大腸癌檢查
${g_Consult_Content_P}    P_大腸癌檢查
${g_Staff}        Johnes    # 服務人員
${g_Customer_service_A}    ${EMPTY}
${g_Customer_Service_B}    ${EMPTY}

*** Test Cases ***
Valid Login
    Open Broser and Login automatically
    Sleep    5
    ${Login_Staff}=    Get Text    xpath=//*[@id="content"]/div[2]/div/div/div/form/a/label
    Log    ${Login_Staff}
    ${Login_Staff_List}    Split String    ${Login_Staff}    -    1
    Log Many    ${Login_Staff_List}
    ${g_Staff}=    Convert To String    ${Login_Staff_List[1]}
    ${g_Staff}=    Strip String    ${g_Staff}
    Log    ${g_Staff}
    Click Element    xpath=//*[@id="mainView"]/div/div/div[2]/fieldset/div/div/div[2]/table/tbody/tr[1]/td[4]/button/u
    Sleep    2
    Select Window    個人資料查詢
    Sleep    1
    Click Element    xpath=//*[@id="mainView"]/div/div[1]/div[2]/button[1]
    Sleep    3
    Input Text    xpath=/html/body/div[4]/div/div[2]/form/table/tbody/tr[1]/td[2]/table/tbody/tr/td[2]/input    ${g_Telephone}
    Input Text    xpath=/html/body/div[4]/div/div[2]/form/table/tbody/tr[4]/td[2]/textarea    ${g_Title_Description}
    Input Text    xpath=/html/body/div[4]/div/div[2]/form/table/tbody/tr[5]/td[2]/textarea[1]    ${g_Consult_Content_S}
    Input Text    xpath=/html/body/div[4]/div/div[2]/form/table/tbody/tr[5]/td[2]/textarea[2]    ${g_Consult_Content_O}
    Input Text    xpath=/html/body/div[4]/div/div[2]/form/table/tbody/tr[5]/td[2]/textarea[3]    ${g_Consult_Content_A}
    Input Text    xpath=/html/body/div[4]/div/div[2]/form/table/tbody/tr[5]/td[2]/textarea[4]    ${g_Consult_Content_P}
    Click Element    xpath=/html/body/div[4]/div/div[2]/form/table/tbody/tr[3]/td[2]/select[1]
    Select From List By Value    xpath=/html/body/div[4]/div/div[2]/form/table/tbody/tr[3]/td[2]/select[1]    0
    ${g_Customer_service_A}=    Get Selected List Label    xpath=/html/body/div[4]/div/div[2]/form/table/tbody/tr[3]/td[2]/select[1]
    Log    ${g_Customer_service_A}
    Click Element    xpath=/html/body/div[4]/div/div[2]/form/table/tbody/tr[3]/td[2]/select[2]
    Select From List By Value    xpath=/html/body/div[4]/div/div[2]/form/table/tbody/tr[3]/td[2]/select[2]    0
    ${g_Customer_service_B}=    Get Selected List Label    xpath=/html/body/div[4]/div/div[2]/form/table/tbody/tr[3]/td[2]/select[2]
    Log    ${g_Customer_service_B}
    Click Element    xpath=/html/body/div[4]/div/div[2]/form/table/tbody/tr[2]/td[4]/select
    Select From List By Value    xpath=/html/body/div[4]/div/div[2]/form/table/tbody/tr[2]/td[4]/select    0
    Select Radio Button    recordResultType    1
    Sleep    1
    Click Element    xpath=/html/body/div[4]/div/div[3]/div[2]/button[1]
    Sleep    3
    ${Get_Staff_From_Web}=    Get Text    xpath=//*[@id="consultRecords"]/div[2]/div/div/div/div[2]/table/tbody/tr[1]/td[5]
    Log    ${Get_Staff_From_Web}
    ${Get_Title_Description_From_Web}=    Get Text    xpath=//*[@id="consultRecords"]/div[2]/div/div/div/div[2]/table/tbody/tr[1]/td[6]
    ${Get_Title_Description_List}=    Split String    ${Get_Title_Description_From_Web}    \    2
    ${Get_Title_Description_A_From_Web}=    Convert To String    ${Get_Title_Description_List[0]}
    ${Get_Title_Description_B_From_Web}=    Convert To String    ${Get_Title_Description_List[1]}
    ${Get_Title_Description_A_From_Web}=    Strip String    ${Get_Title_Description_A_From_Web}
    ${Get_Title_Description_B_From_Web}=    Strip String    ${Get_Title_Description_B_From_Web}
    Log    ${Get_Title_Description_From_Web}
    ${Get_ServiceTitle_From_Web}=    Get Text    xpath=//*[@id="consultRecords"]/div[2]/div/div/div/div[2]/table/tbody/tr[1]/td[7]
    Log    ${Get_ServiceTitle_From_Web}
    ${Get_Telephone_From_Web}=    Get Text    xpath=//*[@id="consultRecords"]/div[2]/div/div/div/div[2]/table/tbody/tr[1]/td[4]
    Log    ${Get_Telephone_From_Web}
    ${Get_RecordContent_From_web}    Get Text    xpath=//*[@id="consultRecords"]/div[2]/div/div/div/div[2]/table/tbody/tr[1]/td[8]/p
    Log    ${Get_RecordContent_From_web}
    ${Get_RecordContent_List}=    Split String    ${Get_RecordContent_From_web}    :    7
    Log Many    ${Get_RecordContent_List}
    ${Consult_Content_S_From_Web}=    Convert To String    ${Get_RecordContent_List[1]}
    ${Consult_Content_S_From_Web}=    Strip String    ${Consult_Content_S_From_Web}    characters=O
    ${Consult_Content_S_From_Web}=    Strip String    ${Consult_Content_S_From_Web}
    ${Consult_Content_O_From_Web}=    Convert To String    ${Get_RecordContent_List[2]}
    ${Consult_Content_O_From_Web}=    Strip String    ${Consult_Content_O_From_Web}    characters=A
    ${Consult_Content_O_From_Web}=    Strip String    ${Consult_Content_O_From_Web}
    ${Consult_Content_A_From_Web}=    Convert To String    ${Get_RecordContent_List[3]}
    ${Consult_Content_A_From_Web}=    Strip String    ${Consult_Content_A_From_Web}    characters=P
    ${Consult_Content_A_From_Web}=    Strip String    ${Consult_Content_A_From_Web}
    ${Consult_Content_P_From_Web}=    Convert To String    ${Get_RecordContent_List[4]}
    ${Consult_Content_P_From_Web}=    Strip String    ${Consult_Content_P_From_Web}
    Log    ${Consult_Content_S_From_Web}
    Log    ${Consult_Content_O_From_Web}
    Log    ${Consult_Content_A_From_Web}
    Log    ${Consult_Content_P_From_Web}
    Should Be Equal    ${g_Staff}    ${Get_Staff_From_Web}
    Should Be Equal    ${g_Title_Description}    ${Get_ServiceTitle_From_Web}
    Should Be Equal    ${g_Telephone}    ${Get_Telephone_From_Web}
    Should Be Equal    ${g_Consult_Content_S}    ${Consult_Content_S_From_Web}
    Should Be Equal    ${g_Consult_Content_O}    ${Consult_Content_O_From_Web}
    Should Be Equal    ${g_Consult_Content_A}    ${Consult_Content_A_From_Web}
    Should Be Equal    ${g_Consult_Content_P}    ${Consult_Content_P_From_Web}
    Should Be Equal    ${g_Customer_service_A}    ${Get_Title_Description_A_From_Web}
    Should Be Equal    ${g_Customer_service_B}    ${Get_Title_Description_B_From_Web}
    Click Element    xpath=//*[@id="consultRecords"]/div[2]/div/div/div/div[2]/table/tbody/tr[1]/td[3]
    Sleep    2
    Click Element    xpath=/html/body/div[4]/div/div[3]/div[2]/button[3]
    Sleep    2
    Click Element    xpath=/html/body/div[5]/div/div[2]/table/tbody/tr[2]/td[2]/select
    Select From List By Value    xpath=/html/body/div[5]/div/div[2]/table/tbody/tr[2]/td[2]/select    0
    Sleep    2
    Click Element    xpath=/html/body/div[5]/div/div[2]/table/tbody/tr[3]/td/button[1]
    Sleep    2

Test Login
    Open Broser and Login automatically
