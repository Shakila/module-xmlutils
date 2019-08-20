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

import ballerina/io;
import ballerinax/java;

# Check whether the XML sequence is valid with the provided xsd.
#
# + xmlObject - The `xml` object to validate
# + xsd - The xsd to validate
# + return - Boolean flag indicating whether the XML sequence is valid with the provided xsd.
public function validateXML(xml xmlObject, xml xsd) returns boolean {
    return isValidXML(xmlObject.toString(), xsd.toString());
}

function isValidXML(string xmlObject, string xsd) returns boolean = @java:Method {
    name: "isValidXML",
    class: "org.wso2.ei.module.xmlutils.XMLValidations"
} external;
