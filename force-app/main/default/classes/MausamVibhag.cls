public class MausamVibhag {
    
    
    
    public string city {set;get;}
    public string body {set;get;}
    
    public string cityname  {set;get;}
    public string wind  {set;get;}
    public string humidity  {set;get;}
    public string cloud  {set;get;}
    
    public void find()
    {
       
        http p=new http();
        HttpRequest hr=new HttpRequest();
        
        string url='https://api.apixu.com/v1/current.json?key=00fcd88c40284097bcd91133181805&q='+city;
        hr.setEndPoint(url);
        hr.setMethod('GET');
        HttpResponse hrs=p.send(hr);
        body=hrs.getBody();
           JSONParser jp=JSON.createParser(body);
        while(jp.nextToken()!=null)
        {
            if(jp.getText()=='name')
            {
                jp.nextToken();
                cityname=jp.getText();
            }
            if(jp.getText()=='wind_mph')
            {
                jp.nextToken();
                wind=jp.getText();
            }
            if(jp.getText()=='humidity')
            {
                jp.nextToken();
                humidity=jp.getText();
            }
            if(jp.getText()=='cloud')
            {
                jp.nextToken();
                cloud=jp.getText();
            }
          
            }      
        }        
    }