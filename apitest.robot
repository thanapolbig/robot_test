///ตัวอย่าง get แบบไม่มี ID
*** Settings ***
Library    RequestsLibrary
*** Variables ***
${URL_GET}    http://localhost:3000
*** Keywords ***
Get Doc Number SO
    create session    url    ${URL_GET}
    ${response} =  Get Request   url    /asd
    Log   ${response.status_code}
    Should Be Equal As Strings  ${response.status_code}  200 
*** Test Cases ***
Test Get Doc Number SO
    Get Doc Number SO


    # Get Doc Number SO
    # [Arguments]    ${docNumer}
    # create session    url    ${URL}
    # ${headers}  create dictionary     Authorization=${jwt_token2}
    # ${response} =  Get Request  url   /GetId/SO/${docNumer}   headers=${headers} 
    # ${json} =  Set Variable  ${response.json()}
    # Log   ${json}
    # # Log To Console   ${json}
    # Should Be Equal As Strings  ${response.status_code}  200
    # [return]    ${json}