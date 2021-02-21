*** Settings ***
Library    Remote   ${SERVER}:${PORT}/
Library    Process
Library    DateFormatterLibrary
Library    DateTime

*** Variables ***
${SERVER}  http://127.0.0.1
${PORT}    8270
