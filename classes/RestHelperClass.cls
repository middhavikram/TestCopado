public class RestHelperClass {
    public RestHelperClass(){
        system.debug('###hello###');
    }
    
    public static void debugTest(){
        String s = 'Test String';
        Integer i=0;
        Contact con = new Contact(LastName='TestName', Email='abc@abc.com');
        
        
        i++;
        s = s+i;
        
        
        i++;
        s = s+i;
        
        for(Integer j=0; j<5; j++){
            s = s+j;
        }
        
        
        Account acc = new Account(Name = s);
        insert acc;
        
        con.AccountId = acc.Id;
        insert con;

    }
}