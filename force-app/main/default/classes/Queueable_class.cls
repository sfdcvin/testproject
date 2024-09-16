public class Queueable_class implements Queueable{
   public void execute(QueueableContext qc)
    {
    System.debug('one');
    System.debug('two');
    System.debug('three');
        show();
    System.debug('four');
    System.debug('five');
    System.debug('six');
    System.debug('jobId::'+qc.getJobId());
}
    
   public  void show()
    {
    System.debug('fone');
    System.debug('ftwo');
    System.debug('fthree');
    System.debug('ffour');
    System.debug('ffive');
    System.debug('fsix');
    System.debug('fseven');
}
    
}