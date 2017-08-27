public with sharing class CaseFeedActionSendEmailExtension
{
    public Id caseId { get; private set; }
    public String caseSubject { get; private set; }
    public Id contactId { get; private set; }
    public Boolean isSaved { get; private set; }

    public CaseFeedActionSendEmailExtension(ApexPages.StandardController controller)
    {
        try
        {
            // check that a record was passed and it is a case
            if (controller == null || controller.getRecord() == null ||
                Case.getSObjectType() != controller.getRecord().getSObjectType())
            {
                System.debug(LoggingLevel.ERROR, 'Case is not available!');
                ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR, 'Case is not available!'));
                return;
            }

            // get the case
            Case c = (Case) controller.getRecord();
            System.debug('Case: ' + c);

            //// check that a case was passed
            //if (c == null)
            //{
            //    System.debug(LoggingLevel.ERROR, 'Case is not available!');
            //    ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR, 'Case is not available!'));
            //    return;
            //}

            // check that a case was passed
            if (c.Id == null)
            {
                System.debug(LoggingLevel.ERROR, 'Case Id is not available!');
                ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR, 'Case Id is not available!'));
                return;
            }

            // save the case id
            this.caseId = c.Id;

            // perform common initialization
            init();
        }
        catch (Exception e)
        {
            System.debug(LoggingLevel.ERROR, e);
            ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR, e.getMessage()));
        }
    }

    public CaseFeedActionSendEmailExtension()
    {
        try
        {
            // get the case id
            this.caseId = ApexPages.currentPage().getParameters().get('caseId');
            System.debug('Case Id: ' + this.caseId);

            // check that a case was passed
            if (this.caseId == null)
            {
                System.debug(LoggingLevel.ERROR, 'Case Id is not available!');
                ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR, 'Case Id is not available!'));
                return;
            }

            // get the 'saved' URL parameter
            this.isSaved = (ApexPages.currentPage().getParameters().get('saved') == null ? false :
                Boolean.valueOf(ApexPages.currentPage().getParameters().get('saved')));

            // perform common initialization
            init();
        }
        catch (Exception e)
        {
            System.debug(LoggingLevel.ERROR, e);
            ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR, e.getMessage()));
        }
    }

    public List<EmailMessage> getEmails()
    {
        try
        {
            if (!String.isBlank(this.caseId))
            {
                // retrieve incoming email messages for the case id
                List<EmailMessage> messages = [SELECT Id, Status, Subject, FromAddress, MessageDate, Incoming
                    FROM EmailMessage
                    WHERE ParentId = :this.caseId
                    ORDER BY MessageDate DESC];
                return messages;
            }
        }
        catch (Exception e)
        {
            System.debug(LoggingLevel.ERROR, e);
            ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR, e.getMessage()));
        }
        return null;
    }

    // this public method is used to refresh the list of email messages
    public PageReference refreshEmailList()
    {
        return null;
    }

    private void init()
    {
        try
        {
            // get the contact id for the case
            List<Case> cases = [SELECT Id, ContactId, Subject FROM Case WHERE Id = :this.caseId];

            // check if there were results
            if (!cases.isEmpty())
            {
                // assign the contact id and subject
                this.contactId = cases[0].ContactId;
                this.caseSubject = cases[0].Subject;
            }
        }
        catch (Exception e)
        {
            System.debug(LoggingLevel.ERROR, e);
            ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR, e.getMessage()));
        }
    }
}