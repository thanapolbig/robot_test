# ROBOT TEST

robot test เป็น Framework บน python base เป็น automated test framework หนึ่งที่ออกแบบมาเพื่อสำหรับใช้ทำ Acceptance Test Driven Development (ATDD) โดยใช้ลักษณะการเขียน test case เป็นแบบ Keyword Driven approach คือเขียนเป็นภาษามนุษย์มากขึ้น จะใช้ทดสอบระบบทุกอย่างตั่งแต่ api ยังถึงส่วนของ DB ถ้ามี
## Installation
เนื่องจากเป็น Framework บน python base จึงต้องลง python บนเครื่งซะก่อน 

Install Python

```bash
sudo apt install python2.7
```
Install python [pip](https://pip.pypa.io/en/stable/) 
```bash
sudo apt install python-pip
```

Robot Framework + Selenium2Library
```bash
sudo pip install robotframework-selenium2library
```
[how to install robotframework](https://pypi.org/project/robotframework/)
## Usage

robot test จะแบ่งส่วนการทำงานเป็น 4 ส่วน ได้แก่ 

*** Settings ***  จะเป็นส่วนของ Library ที่จะใช้
```python
*** Settings ***
Library    RequestsLibrary
Library    Collections
```


*** Variables *** เก็บค่าที่ต้องการนำมาใช้งาน
```python
*** Variables ***
${URL_GET}    http://localhost:7777
${jwt_token2}    558344f429d66e42b53ff6449710cea0f79211c2163d3d92b4180eaee3b6afd1
```

*** Test Cases *** คือส่วนของการเขียน Test Cases ซึ่งที่นี่แหละที่เราจะมีการเรียกใช้ Keywords ที่ได้เขียนเป็นชุดคำสั่งไว้มาใช้งาน
```python
*** Test Cases ***
Test POST Doc BookBank_positive
    POST Doc registerUser
    POST Doc createAccount1
    POST Doc createAccount2
    POST Doc getBookBank
    POST Doc bankTransfer
    POST Doc getTransfer
```

*** Keywords *** ในส่วนนี้จะใช้ตอนที่เราต้องการที่จะสร้าง Keyword ของเราขึ้นมาใช้งานเอง โดยใน Keyword เราอาจจะสร้างชุดคำสั่งย่อย ๆ ขึ้นมาได้
```python
*** Keywords ***
POST Doc registerUser
    create session    url    ${URL_GET}
    ${headers}  create dictionary     Content-Type=application/json         apikey=${jwt_token2}
    ${data}   SetVariable    {"bc_user":${bc_user},"OrgDepartment":"org1.department1"}
    ${response} =  postRequest   url    /registerUser   headers=${headers}     data=${data} 
    ${json} =  SetVariable  ${response.json()}
    Log   ${json}
    Log   ${response}
    Log   ${data}
    Should Be Equal As Strings  ${response.status_code}  201
```

โดยทั้ง 4 ส่วนจะจะอยู่ในไฟล์เดียวกันที่ชื่อ <ชื่อไฟล์>.robot หลังจากเราเขียนไฟล์ test ก็ลองทดสอบโดยคำสั่ง
```bash
robot <ชื่อไฟล์>.robot
```

## License
[medium](https://medium.com/@popphoenix/robot-framework-test-api-1-5938a271daf)
