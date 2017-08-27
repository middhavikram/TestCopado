public class RestClass {

    public Static UtilityClass.parentInterface getMeRealData(){
        if(true==true){
            UtilityClass.SuccessClass1 success = new UtilityClass.SuccessClass1();
            success.first = 'Response';
            
            return success;
        }else{
            return new UtilityClass.ErrorClass();            
        }
    }
}