public class OppController {
    
    public Opportunity opp {get;set;}
    public String oppName {get;set;}

    public OppController(){
        //opp = (Opportunity)std.getRecord();
        opp = [select Id, name from opportunity where Id='00628000009W5JS'];
        oppName = opp.Name;
    }

}