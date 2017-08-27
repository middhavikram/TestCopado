/*------------------------------------------------------------
Author:        Vikram Middha
Company:       Salesforce
Description:   Controller class for CustomSearch VisualForce Page
                
Test Class:    CustomSearch_Test

History
<Date>      <Authors Name>     <Brief Description of Change>
16/05/2016  Vikram Middha        Created
------------------------------------------------------------*/

public class CustomSearchController {
    
    public CustomSearchController(){
        
    }
    
    public class SearchResult{
        public String rType {get;set;}
        public String chineseName {get;set;}
        public String englishName {get;set;}
        public String nationalId {get;set;}
        public String mobile {get;set;}
        public String phone {get;set;}
        public String email {get;set;}
        public String delegatedRM {get;set;}
        public Boolean showChatterButton {get;set;}
        public Boolean showCreateOpportunityButton {get;set;}
        public Boolean showCreateLeadButton {get;set;}
    }
    
    public List<SearchResult> getSearchResults(){
        
        List<SearchResult> retList = new List<SearchResult>();
        
        String searchType = Apexpages.currentPage().getParameters().get('searchType');
        String searchString = Apexpages.currentPage().getParameters().get('searchString');
        
        //searchString = '33xx33';
        
        if(String.isBlank(searchType) || String.isBlank(searchString)){
            return retList;
        }
        
        String query = 'FIND \'{' + searchString + '}\' IN ALL FIELDS RETURNING ACCOUNT(Id,Name,';
        query += 'Owner.Name)';
        
        List<List <sObject>> results = search.query(query);

        List<Account> accList = results.get(0);
        
        if(accList.size() > 0){
            for(Account acc : accList){
                SearchResult res = new SearchResult();
                res.rType = 'Customer';
                res.englishName = acc.Name;
                res.delegatedRM = acc.Owner.Name;
                retList.add(res);
            }
        }
        
        system.debug('##retList' + retList);
        
        return retList;
        
    }

}