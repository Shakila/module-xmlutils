# Module Overview

The `wso2/xmlutils` module provides an API to do XML validation.

## Compatibility

|                             |       Version               |
|:---------------------------:|:---------------------------:|
| Ballerina Language          | 0.992.0                     |

## Sample

Following is a simple Ballerina program for validating the *XML* object.

```ballerina
import ballerina/log;
import wso2/xmlutils;

public function main () {
    xml xsd = xml `<schema xmlns="http://www.w3.org/2001/XMLSchema" targetNamespace="https://www.journaldev.com/Employee"
               xmlns:empns="https://www.journaldev.com/Employee" elementFormDefault="qualified">
                   <element name="empRequest" type="empns:empRequest"></element>
                   <complexType name="empRequest">
                       <sequence>
                               <element name="id" type="int"></element>
                       </sequence>
                   </complexType>
               </schema>`;

    xml input = xml `<empns:empRequest xmlns:empns="https://www.journaldev.com/Employee"
                     xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                     xsi:schemaLocation="https://www.journaldev.com/Employee Employee.xsd">
                         <empns:id>5</empns:id>
                     </empns:empRequest>`;

    boolean validationRes = xmlutils:validateXML(input, xsd);
    log:printInfo("Result of the XML validation is: " + validationRes);
}
```
