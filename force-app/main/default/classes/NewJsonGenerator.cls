public class NewJsonGenerator {
    
    public string data {set;get;}
    
    public NewJsonGenerator()
    {
        JSONGenerator js=JSON.createGenerator(true);
        js.writeStartObject();
        js.writeStringField('name', 'vineet');
        js.writeStringField('designation', 'developer');
        
        js.writeEndObject();
        data=js.getAsString();
    }

}