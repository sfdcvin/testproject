import { LightningElement,api,wire } from 'lwc';
import getContacts from '@salesforce/apex/ContactController.getContacts';
export default class Lifecyclehook extends LightningElement {
    @api headerTitle; // Design attribute for the header title
    @api showGreeting; // Design attribute for whether to show a greeting
@api location='Bangalore';
@api configproperty;
constructor()
{
    super();
  //  console.log(this.location);
 // this.location='ajmer';
    console.log(this.template.querySelector('[data-id="myButton"]')+' from constructor');
}
    get greetingMessage() {
        return this.showGreeting ? 'Hello, welcome to the home page!' : '';
    }
connectedCallback()
{
  console.log(this.template.querySelector('[data-id="myButton"]')+' from cc');

}
@wire(getContacts)
abc({error,data}){
if(data)
{
  console.log('hi vin from wire');
}
}
renderedCallback()
{

console.log(this.template.querySelector('[data-id="myButton"]')+' from rc');

}
}