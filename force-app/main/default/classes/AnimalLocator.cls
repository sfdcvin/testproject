public class AnimalLocator {
   
   public static  String getAnimalNameById(Integer id)
     {
         string animal;
         Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals/'+id);
        request.setMethod('GET');
        HttpResponse response = http.send(request);
         if (response.getStatusCode() == 200) {
    // Deserialize the JSON string into collections of primitive data types.
    Map<String, Object> results = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
    // Cast the values in the 'animals' key as a list
    
           Map<string,object> animals = (map<string,object>) results.get('animal');
     animal  = string.valueof(animals.get('name'));
             

    
    
         
         
     }
     return animal;  
}
}