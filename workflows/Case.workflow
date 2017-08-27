<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>Send_Email_Alert_to_user</fullName>
        <description>Send Email Alert to user</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <recipients>
            <field>LastModifiedById</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/SalesNewCustomerEmail</template>
    </alerts>
    <fieldUpdates>
        <fullName>Update_unique_field</fullName>
        <field>Unique_Field__c</field>
        <formula>Contact.Email</formula>
        <name>Update unique field</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>Prevent Duplicate</fullName>
        <actions>
            <name>Update_unique_field</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Case.ContactEmail</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>SendCaseEmail</fullName>
        <actions>
            <name>Send_Email_Alert_to_user</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <formula>ISCHANGED(Timestamp__c)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
</Workflow>
