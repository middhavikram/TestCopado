public class SecondQueueableJob implements Queueable {
    
    public Id contactId;
    
    public SecondQueueableJob(Id conId){
        this.contactId = conId;
    }
    
    public void execute(QueueableContext context) {
        Contact c = new Contact(Id=contactId, FirstName='Hello');  
        update c;
    }
}