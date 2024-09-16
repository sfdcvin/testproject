public class NewJsonGenerator1 {
    
    public string search {set;get;}
    
    public List<Account> acc;
    public string accounts {set;get;}
    public void searchFunction()
    {
        string query='select name,industry from account where name like \''+search+'%\'';
        acc=database.query(query);
        
        system.JSONGenerator js=json.createGenerator(true);
        
        if(acc.size()>0)
        {
        js.writeStartObject();
              js.writeStringField('status', 'success');
              js.writeNumberField('count', acc.size());
                js.writeFieldName('Accounts');
                js.writeStartArray();
                    for(account a:acc)
                    {
                    js.writeStartObject();
                        js.writeStringField('Name',a.name);
                        
                     //   js.writeStringField('Industry',a.industry);
                       if(a.industry == null) {
        				js.writeNullField('Industry');
    						} else {
        						js.writeStringField('industry', a.industry);
    								}
                    js.writeEndObject();
                    }
                js.writeEndArray();
                
        js.writeEndObject();
           accounts= js.getAsString();
            }
        else{
             js.writeStringField('Status','Error');
             js.writeStringField('Message','No Records found');
        }
    }

}