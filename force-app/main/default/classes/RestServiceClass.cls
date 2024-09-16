@RestResource(urlMapping='/myservice1/*')

global class RestServiceClass {

@HttpGet

global static String doGet() {

String name = RestContext.request.params.get('name');

return 'Hello '+name;

}
    
    @HttpPost

global static String doGet1() {

String name = RestContext.request.params.get('name');

return 'Hello '+name;

}
}