public class FirstQueueableJob implements Queueable {
    
    public Id accountId;
    
    public FirstQueueableJob(Id accId){
        this.accountId = accId;
    }
    
    public void execute(QueueableContext context) {
        Contact c = new Contact(LastName='123456', AccountId = accountId, Email='dummy@asdf.com');  
        insert c;
    }
}