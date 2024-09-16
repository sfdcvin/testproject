global class DailyLeadProcessor implements Schedulable {
    
    global void execute(SchedulableContext ctx) {
        
        List<Lead> leads=new List<Lead>();
        
        for(lead ld:[select id,firstname,leadsource from lead where leadsource='' ])
        {
            ld.leadsource='Dreamforce';
            leads.add(ld);
        }
        update leads;
    }

}