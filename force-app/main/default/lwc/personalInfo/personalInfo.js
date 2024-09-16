import { LightningElement,track } from 'lwc';
import { NavigationMixin } from "lightning/navigation";
	
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
	import saveLead from "@salesforce/apex/ApplicationController.saveLead";
export default class PersonalInfo extends NavigationMixin (LightningElement) {

    @track lead={FirstName:'',LastName:'',Email:'',Company:'',Mobile:''}
    enableDefault=false;
    save=true;
    spinner=false;
saveCSS ='slds-page-header stickyFooterDisabled';

    PersonalInfo()
    {
      this.super();
    }
    back()
    {
        this[NavigationMixin.Navigate]({
            type: "standard__webPage",
            attributes: {
              url: "/"
            }
          });
    }

    saveLead()
    {
      this.spinner=true;
      console.log(JSON.stringify(this.lead));
      saveLead({lead:this.lead})
      .then(result=>{
        this.spinner=false;
                const evt = new ShowToastEvent({
          title: 'Success',
          message: 'Personal Info Submitted',
          variant: 'success',
          mode: 'dismissable'
      });
      this.dispatchEvent(evt);
      })
       .catch(error=>{
        console.log('errror:'+JSON.stringify(error));
       })
    }

    valueAssignment(event)
    {
    if(event.target.name=="FirstName")
    this.lead.FirstName=event.target.value;
    else if(event.target.name=="LastName")
    this.lead.LastName=event.target.value;
    else if(event.target.name=="Email")
    this.lead.Email=event.target.value;
    else if(event.target.name=="Company")
    this.lead.Company=event.target.value;
    else if(event.target.name=="Mobile")
    {
    this.lead.Mobile=event.target.value;
    if(event.target.value.length!==10)
    {
      this.template.querySelector('.mobile').setCustomValidity('10 digits required');
      
    }
    else{
      this.template.querySelector('.mobile').setCustomValidity('');

    }
    this.template.querySelector('.mobile').reportValidity();
    }

    if(this.lead.FirstName!='' && this.lead.LastName!='' && this.lead.Email!='' && this.lead.Company!='' && this.lead.Mobile!='')
    {
     // save=true;
this.saveCSS ='slds-page-header stickyFooter  ';
   }
   else{
    this.saveCSS ='slds-page-header stickyFooterDisabled';
   }
    }
}