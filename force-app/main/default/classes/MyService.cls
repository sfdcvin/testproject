@RestResource(urlMapping='/myservice')
global class MyService {
    @HttpGet
    global static String doGet() {
      //  String name = RestContext.request.params.get('name');
  String    name='Vineet';
        return 'Hello '+name;
    }
}