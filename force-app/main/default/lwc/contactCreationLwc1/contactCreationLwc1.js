import { LightningElement, track } from 'lwc';

export default class ContactCreationLwc1 extends LightningElement {
   @track contactId;
   handleSuccess(event) {
       this.contactId = event.detail.id;
   }
}