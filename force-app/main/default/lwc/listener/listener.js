import { LightningElement,wire } from 'lwc';
import { subscribe,unsubscribe,MessageContext } from 'lightning/messageService';
import poclms from "@salesforce/messageChannel/lmspoc__c";
export default class Listener extends LightningElement {
    subscription=null;
    name='';
    @wire(MessageContext)
    messagecontext;

subscribechannel()
{
    if(!this.subscription)
    {
        this.subscription= subscribe(this.messagecontext,poclms,(message)=>this.handleMassage(message));
    }
}
    connectedCallback()
    {
        this.subscribechannel();
    }
    handleMassage(message)
    {
        this.name=message.name;
    }


}