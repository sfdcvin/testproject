public class New_schedule_Class implements Schedulable {
    
    public void execute(SchedulableContext sc)
    {
        New_Batch_Class nbc=new New_Batch_Class();
        Database.executeBatch(nbc,2);
    }

}