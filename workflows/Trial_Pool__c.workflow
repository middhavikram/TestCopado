<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <fieldUpdates>
        <fullName>Update_Case_Owner</fullName>
        <field>Timestamp__c</field>
        <formula>Text(Now())</formula>
        <name>Update Case Owner</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <targetObject>Trial__c</targetObject>
    </fieldUpdates>
    <rules>
        <fullName>UpdateCaseOwner</fullName>
        <actions>
            <name>Update_Case_Owner</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>TRUE</formula>
        <triggerType>onCreateOnly</triggerType>
    </rules>
</Workflow>
