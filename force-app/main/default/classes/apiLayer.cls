public class apiLayer {

    
    
    
    
    public  Integer amt {set;get;}
    public string body {set;get;}
                
    
    
    
    public void find()
    {
        
        
        http p=new http();
        HttpRequest hr=new HttpRequest();
      

   
        string url='http://apilayer.net/api/live?access_key = 97f42c9be52ce54abf6854e937d4b699 & currencies = INR & source=USD & format = 1';
        hr.setEndPoint(url);
        hr.setMethod('GET');
        HttpResponse hrs=p.send(hr);
        body=hrs.getBody();
   /*      JSONParser jp=JSON.createParser(body);
 while(jp.nextToken()!=null)
        {
            if(jp.getText()=='humidity')
            {
                jp.nextToken();
                humidity=jp.getText();
            }
          
            }   
     */
        }        
    }