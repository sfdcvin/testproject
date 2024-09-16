public class getTheJsonData {

    
               public static void getData()
               {
                   Http httpProtocol = new Http();
                   httpRequest r=new httpRequest();
                   r.setEndpoint('https://th-superbadge-apex.herokuapp.com/equipment'); 
                   r.setMethod('GET');
                   httpresponse res=httpProtocol.send(r);
                   


                   string str=res.getbody();
                   System.debug(str);
               }
}