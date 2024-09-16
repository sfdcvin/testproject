public class Json_Search_Account {
    public string search {set;get;}
    public string result {set;get;}
   
    public void search(){
        string query='select name,industry from Account where name like \''+search+'%\'';
        List<Account> acc=Database.query(query);
        System.JSONGenerator js=JSON.createGenerator(true);
         // if there are any recods with the given search Text then give the status as succes 
        // {"status":"Success","count":10,"Accounts":[{"name":"Wipro","Industry":"Banking"}]}
        js.writeStartObject();
        if(acc.size()>0 )
        {
            js.writeStringField('status','Success');
            js.writeNumberField('count',acc.Size());
            js.writeFieldName('Accounts');
            js.writeStartArray();
            for(Account a:acc)
            {
                js.writeStartObject();
                js.writeStringField('name', a.name);
                
                js.writeEndObject();
            }
            js.writeEndArray();
        }
            
            else{
                
                js.writeStringField('Status','Error');
                js.writeStringField('Message','No Records found');
            }
            js.writeEndObject();
            result=js.getAsString();
        }
    }