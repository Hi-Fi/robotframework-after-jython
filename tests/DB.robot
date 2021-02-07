*** Settings ***
Resource    ${resource_dir}${/}Libraries.robot
Suite Setup       Start H2 server
Suite Teardown    Stop H2 Server

*** Variables ***
${resource_dir}    ${CURDIR}

*** Test Cases ***
Create Test Table
    [Documentation]    Creates the test table used for testing throughout the demo.
    Execute SQL    CREATE TABLE DemoTable (Id INT NOT NULL, Name VARCHAR(255))
    Execute SQL    ALTER TABLE DemoTable ADD PRIMARY KEY (Id);
    Table Must Exist    DEMOTABLE
    Table Must Be Empty    DEMOTABLE
    Check Primary Key Columns For Table    DEMOTABLE    Id

*** Keywords ***
Start H2 server
    # Putting to variable, as JPype thinks that this is named argument
    ${DB connection string}  Set Variable  jdbc:h2:mem:robotTest;DB_CLOSE_DELAY=-1
    Start Process    java    -cp    ${maven.test.classpath}    org.h2.tools.Server    -tcp    -tcpAllowOthers
    Connect To Database    org.h2.Driver    ${DB connection string}    sa    ${EMPTY}

Stop H2 server
    Disconnect From Database
    Run Process    java    -cp    ${maven.test.classpath}    org.h2.tools.Server    -tcpShutdown    tcp://localhost:9092
