@RestResource(urlMapping='/Test/*')
global with sharing class TestRest {
    
    global static List<String> langList = new List<String>();
	
    public static List<String> labels = new List<String>();
    
    @HttpDelete
    global static void doDelete() {
        
    }
  
    @HttpGet
    global static String doGet() {
        RestRequest req = RestContext.request;
        RestResponse res = RestContext.response;
        String lang = RestContext.request.params.get('lang');
        Pagereference TestPDF = Page.LangVFPage;
        //List<String> labels = new List<String>();
        langList.add('First');
        langList.add('Second');
        String s = '';
        for(Integer i=0; i<=20;i++){
            s += 'Second1' + ',';
        }
        
        s = s.substring(0, s.lastIndexOf(','));
        TestPDF.getParameters().put('labels', s);
        //RestHelperClass.labels = labels;
        
        String retVal = TestPDF.getContent().toString();
        //Account result = [SELECT Id, Name, Phone, Website FROM Account WHERE Id = :accountId];
        return retVal;
    }
  
  @HttpPost
    global static String doPost(String name,
        String phone, String website) {
        Account account = new Account();
        account.Name = name;
        account.phone = phone;
        account.website = website;
        insert account;
        return account.Id;
    }
}