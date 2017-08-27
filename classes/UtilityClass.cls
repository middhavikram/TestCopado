public class UtilityClass {
    
    public virtual interface parentInterface{
       //public Boolean isSuccessful = false;
    }
    
    public virtual class SuccessClass1 implements parentInterface{
        public String first {get;set;}
        public String second {get;set;}
        public Boolean isSuccess {get;set;}
    }
    
    public virtual class SuccessClass2 implements parentInterface{
        public String first {get;set;}
        public String second {get;set;}
        public Boolean isSuccess {get;set;}
    }
    
    public virtual class ErrorClass implements parentInterface{
        public String errorCode {get;set;}
        public String errormessage {get;set;}
        public Boolean isSuccess {get;set;}
    }

}