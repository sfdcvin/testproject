import { LightningElement, wire } from 'lwc';
import { publish,MessageContext } from 'lightning/messageService';
import poclms from "@salesforce/messageChannel/lmspoc__c";
export default class Publisher extends LightningElement {
    name='';
    @wire(MessageContext)
    messagecontext;


    handleChange(event)
    {
        this.name=event.detail.value;
    }

    publish()
    {
        const message={name:this.name}
        publish(this.messagecontext, poclms, message);
    }
}