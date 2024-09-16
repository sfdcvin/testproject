public class ContactExtention {
    public apexpages.StandardSetController setCon{set;get;}
    public  ContactExtention(apexpages.StandardSetController controller)
    {
        setCon=controller;
        setcon.setPageSize(10);
    }

}