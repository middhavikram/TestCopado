public with sharing class TC{

    public Account acc {get;set;}
    public String accNumber {get;set;}
    public String options {get;set;}

    public TC(){
        
    }
    
    public List<SelectOption> getCoverTypeOptions(){
List<SelectOption> coverOptions = new List<SelectOption>();
       //coverOptions.add(new SelectOption('',''));
coverOptions.add(new SelectOption('Vital','Vital'));
coverOptions.add(new SelectOption('Superior','Superior'));
coverOptions.add(new SelectOption('Premiere','Premiere'));
return coverOptions;
}

}