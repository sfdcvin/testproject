global class RemoteMetthod_class {
    
    @RemoteAction
    global static String call(String str)
    {
        return str+'kumar';
    }

}