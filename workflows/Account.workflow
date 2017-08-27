<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <fieldUpdates>
        <fullName>Update_TodaysDate_On_Account</fullName>
        <field>Today_Text__c</field>
        <formula>Today()</formula>
        <name>Update TodaysDate On Account</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <outboundMessages>
        <fullName>Tes</fullName>
        <apiVersion>37.0</apiVersion>
        <endpointUrl>https://google.com</endpointUrl>
        <fields>AccountNumber</fields>
        <fields>Id</fields>
        <includeSessionId>true</includeSessionId>
        <integrationUser>vikram.middha@9domains.com</integrationUser>
        <name>Tes</name>
        <protected>true</protected>
        <useDeadLetterQueue>false</useDeadLetterQueue>
    </outboundMessages>
    <rules>
        <fullName>Update TodaysDate On Account</fullName>
        <actions>
            <name>Update_TodaysDate_On_Account</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Account.Name</field>
            <operation>contains</operation>
            <value>Intel</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
</Workflow>
