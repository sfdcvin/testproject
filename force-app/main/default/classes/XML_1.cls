public class XML_1 {
      public String result {set;get;}
    public XML_1()
    {
        DOM.Document doc= new DOM.Document();
        DOM.XMLNODE root=doc.createRootElement('name',null,null);
        DOM.XMLNODE child=root.addChildElement('CustomerName',null,null);
        child.addTextNode('vineet');
        DOM.XMLNODE child1=root.addChildElement('phone',null,null);
        child1.addTextNode('7737249019');
       result=doc.toXMlString();
    }

}