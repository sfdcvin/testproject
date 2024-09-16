public class XML_2 {
    
        public String result {set;get;}
    public XML_2()
    {
        
        List<Account> acc=[select name,industry,(select LastName,FirstName from contacts) from account limit 3];
        
        DOM.Document doc= new DOM.Document();
        
        DOM.XMLNODE root=doc.createRootElement('Accounts',null,null);
        for(Account a:acc){
            DOM.XMLNODE child=root.addChildElement('Account',null,null);
               child.setAttribute('Name', a.name);
               child.setAttribute('Phone', ''+a.industry);
                    DOM.XMLNODE conroot=child.addChildElement('contacts',null,null);
                         if(a.contacts.size()>0)
                         {
                             for(Contact c:a.contacts){
                             DOM.XMLNODE conroot1=conroot.addChildElement('contact',null,null);
                             conroot1.setAttribute('FirstName',c.firstname);
                                 conroot1.setAttribute('LastName',c.lastname);
                                 }
                                       }
                      
              
             
             } 
       // DOM.XMLNODE child=root.addChildElement('CustomerName',null,null);
        //child.addTextNode('vineet');
       // DOM.XMLNODE child1=root.addChildElement('phone',null,null);
        //child1.addTextNode('7737249019');
       result=doc.toXMlString();
    }



}