public with sharing class CreateContactFromCan {
        
    //Declare a method that does not return anything and takes one input parameter of a Candidate list object called candsFromTrigger
    public void createContact (List<Candidate__c> candsFromTrigger){
        
        //Instantiate a Contact list object from the List class 
        List<Contact> conList = new List<Contact>();
        
        for(Candidate__c currentCandidate:candsFromTrigger){
            
             //Select the Recruiting record from the database and assign to an object called candAcct from the sObject Account class
        Account candAcct = [SELECT a.Id FROM Account a WHERE a.Name = 'Recruiting'];
            
            
              //Instantiate an object called con from the sObject class contact
            Contact con = new Contact();
            
            //Set the attribute AccountID of the con object to the value of the Id attribute of the candAcct object
            con.AccountId = candAcct.Id;
            
            //Set the attribute FirstName of the con object to the values of the First_Name__c attribute of the currentCandidate object
            con.FirstName = currentCandidate.First_Name__c;
            
            //Set the attribute Lastname of the con object to the values of the Last_Name__c attribute of the currentCandidate object
            con.LastName = currentCandidate.Last_Name__c;
            
            //Set the attribute Email of the con object to the values of the Email__c attribute of the currentCandidate object
            con.Email = currentCandidate.Email__c;
            
            //Add the con object to the conList 
            conList.add(con);
                
        }
        Database.insert(conList);
    }
}