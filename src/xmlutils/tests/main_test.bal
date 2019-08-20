// Copyright (c) 2019 WSO2 Inc. (http://www.wso2.org) All Rights Reserved.
//
// WSO2 Inc. licenses this file to you under the Apache License,
// Version 2.0 (the "License"); you may not use this file except
// in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing,
// software distributed under the License is distributed on an
// "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
// KIND, either express or implied.  See the License for the
// specific language governing permissions and limitations
// under the License.

import ballerina/test;
import ballerina/io;

xml xsd = xml `<schema xmlns="http://www.w3.org/2001/XMLSchema" targetNamespace="https://www.journaldev.com/Employee"
               xmlns:empns="https://www.journaldev.com/Employee" elementFormDefault="qualified">
                   <element name="empRequest" type="empns:empRequest"></element>
                   <complexType name="empRequest">
                       <sequence>
                               <element name="id" type="int"></element>
                       </sequence>
                   </complexType>
               </schema>`;

# Test function

@test:Config{}
function testXMLValidation () {
    io:println("-----------------Test case for validateXML method------------------");

    xml input = xml `<empns:empRequest xmlns:empns="https://www.journaldev.com/Employee"
                     xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                     xsi:schemaLocation="https://www.journaldev.com/Employee Employee.xsd">
                         <empns:id>5</empns:id>
                     </empns:empRequest>`;

    boolean validationRes = validateXML(input, xsd);
    test:assertTrue(validationRes, msg = "Not a valid XML!");
}

@test:Config{}
function testXmlValidationNegative () {
    io:println("-----------------Negative test case for validateXML method------------------");

    xml input = xml `<Employee>
                         <name>Pankaj</name>
                         <age>29</age>
                         <role>Java Developer</role>
                         <gender>Male</gender>
                     </Employee>`;

    boolean validationRes = validateXML(input, xsd);
    test:assertFalse(validationRes);
}
