public class NewJSONGenerator2 {
    
    Public Account acc {set;get;}
    public string message {set;get;}
    public NewJSONGenerator2()
    {
        acc=new account();
    }

       public void save()
       {
          integer count=[select count() from account where name=:acc.name];
           System.JSONGenerator js=json.createGenerator(true);
           js.writeStartObject();
           if(count>0)
           {
               js.writeStringField('status', 'warning');
               js.writeStringField('message', 'Duplicate Record Exist');
           }
           else
           {
               insert acc;
               js.writeStringField('status', 'success');
               js.writeStringField('message', 'Record Submitted');
           }
           
           js.writeEndObject();
           
           message=js.getAsString();
           
       }
}