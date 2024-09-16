public class FindPostOffice {
    
    public string pin {set;get;}
    public string body {set;get;}
    public string jsonString {set;get;}
    public list<object>  lst {set;get;}
    
    
    public void find()
    {
        
        lst=new list<object>();
        http p=new http();
        HttpRequest hr=new HttpRequest();
        string url='http://postalpincode.in/api/pincode/'+pin;
        hr.setEndPoint(url);
        hr.setMethod('GET');
        HttpResponse hrs=p.send(hr);
        body=hrs.getBody();
        JSONParser jp=JSON.createParser(body);
        while(jp.nextToken()!=null)
        if(jp.getText()=='name')
        {
            jp.nextToken();
            jsonString=jp.getText();
            lst.add(jsonString);
           
        }
    }
    
    

}