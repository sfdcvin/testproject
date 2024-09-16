public class FindPinCode {
    
    public string city {set;get;}
    
    public string pincode {set;get;}
    public string body{set;get;}
    public void getPinCode()
    {
        Http p=new Http();
        HttpRequest request=new HttpRequest();
        
       //string url='https://gpc.p.mashape.com/api-pincode?'+city;
        // url=url+'&X-Mashape-Key: 92ItJIUlaRmsh2fI79vUjBy4WNbbp1VIwRsjsnVfaq2tkcpnUR';
//        url=url+'&Accept: application/json';
          //string url='https://api.apixu.com/v1/current.json?key=00fcd88c40284097bcd91133181805&q='+city; 
   //string url='https://https://gpc.p.mashape.com/api-pincode?key=92ItJIUlaRmsh2fI79vUjBy4WNbbp1VIwRsjsnVfaq2tkcpnUR&q='+city;
        //request.setEndpoint(url);        
        request.setEndpoint('http://www.getpincode.info/api/pincode?q='+city);
        request.setMethod('GET');
        
        HttpResponse response=p.send(request);
        body=response.getBody();
        JSONParser jp=JSON.createParser(body);
     /*   while(jp.nextToken()!=null)
        {
            if(jp.getText()=='pincode')
            {
                jp.nextToken();
                pincode=jp.getText();
            }
          
            }   */
        
        }
}
//curl --get --include 'https://gpc.p.mashape.com/api-pincode?q=hauz+khas+delhi' \
//  -H 'X-Mashape-Key: BvDJyVy8IRmshU3qh8M5PLjVWGDZp1tSxU9jsncqgl1yMuixuH' \
  //-H 'Accept: application/json'