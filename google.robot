*** Settings ***
Library Selenium2Library
*** Variables ***
${BROWSER}    chrome
${GOOGLE URL}    http://www.google.com
*** Keywords ***
เข้าไป google
    Open Browser     ${GOOGLE URL}     ${BROWSER}
ค้นหาคำว่าThat's How We Do
    Input Text    lst-ib    That's How We Do
    Click Button    _fZl
รอจนกว่าจะเจอคำว่าTeen Beach 2
    Wait Until Page Contains    Teen Beach 2
*** Testcases ***
Search
   เข้าไป google
   ค้นหาคำว่าThat's How We Do
   รอจนกว่าจะเจอคำว่าTeen Beach 2
Test Teardown Close Browser