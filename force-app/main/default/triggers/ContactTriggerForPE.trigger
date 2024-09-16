trigger ContactTriggerForPE on Contact (after update) {
List<Contact_Updated__e> events = new List<Contact_Updated__e>();
        Contact_Updated__e event = new Contact_Updated__e();
events.add(event);
     EventBus.publish(events);
}