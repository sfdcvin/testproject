public class action_pooler {
    public integer  count{set;get;}
     public   action_pooler()
     {
         count=0;

     }
    public void actionpooler(){
                count++;
        system.debug(count);
    }

}