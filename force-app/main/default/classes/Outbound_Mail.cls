public class Outbound_Mail {
    public void call(){
    Messaging.SingleEmailMessage msg=new Messaging.SingleEmailMessage();
    List<Contact> acc=[select Id,email from Contact ];
    List<String> toAdd=new List<String>();
   // for(Contact ac:acc){
    //   toAdd.add(ac.email);
    //}
    //toAdd.add('goutam.abhishek1991@gmail.com');
            toAdd.add('14er.vineet@gmail.com');

    msg.setToAddresses(toAdd);
    msg.setSubject('WelcomeMail');
        String body='<h2 style="color:red"> CONGRATULATIONS Abhishek Kumar. RS. 2000 Cashback every week has been approved. Click here to know more.</h2>';
    msg.setHtmlBody(body);
    Messaging.Email[] emails=new Messaging.Email[]{msg};
    Messaging.sendEmail(emails);
}
}