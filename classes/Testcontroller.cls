public class Testcontroller{

public Account acc {get;set;}

    public Testcontroller(){
       acc = [SELECT Id, Phone from Account where Id='0012800000YZfvM'];
        
    }

}