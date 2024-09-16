public class XML_3 {
  public  Map<string,string> myMap {set;get;}
    
  public   XML_3()
  {
      
      myMap=new Map<string,string>();
      string xmlString='<contact><name>vineet</name><phone>7737249019</phone></contact>';
          
          DOM.Document doc=new DOM.Document();
      
          doc.load(xmlString);
      DOM.XmlNode root=doc.getRootElement();
       myMap.put(root.getName(),''+root.getText());
      List<Dom.XMLNode> childs =root.getChildElements();
        for(Dom.XMLNode c:childs){
            myMap.put(c.getName(),c.getText());
        }
  }

}