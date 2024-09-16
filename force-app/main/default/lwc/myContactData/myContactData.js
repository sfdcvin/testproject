import { LightningElement, wire } from 'lwc';
import {NavigationMixin}  from 'lightning/navigation';
import getMeContacts from '@salesforce/apex/ContactController.getContacts';

export default class ContactDataTable extends NavigationMixin (LightningElement) {
count=0;
connectedCallback()
{
    for(let i=0;i<5000;i++)
    {
        debugger;
        this.count +=1;
    }
}

concolumns=[{label:"Name",fieldName:"Name",type:"text"},
{label:"Last Name",fieldName:"LastName",type:"text"},
{label:"Email",fieldName:"Email",type:"text"}];
conRecs=[];
search='';
@wire(getMeContacts,{search:'$search'})
contactdata({error,data}){
    if(data)
    {
        debugger;
this.conRecs=data;
console.log(JSON.stringify(data));
    }else if (error)
    {

    }
}

callMe(event)
{
    this.search=event.detail.value;
}

navigateLWC()
{
    console.log('Button clicked');
   /* this[NavigationMixin.Navigate]({
        type: 'standard__navItemPage',
        attributes: {
            apiName: "contactdata"
        }
    });  */
    this.count=0;
    for(let i=0;i<5;i++)
    {
        console.log('Inside loop '+i); // Check if this log appears

        debugger;
        this.count +=5000;
    }
}



}