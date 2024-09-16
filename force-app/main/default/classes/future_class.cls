public class future_class {
   public  static void show()
    {
    System.debug('one');
    System.debug('two');
    System.debug('three');
        showfuture();
    System.debug('four');
    System.debug('five');
    System.debug('six');
    System.debug('seven');
}
    @future
   public static void showfuture()
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