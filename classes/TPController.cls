public class TPController{

    public TPController(ApexPages.StandardController controller) {

    }

    
    
    public TPController(){
    
    }
    
    public PageReference save(){
        return new PageReference('/apex/TestCSRFPage');
    }
    
}