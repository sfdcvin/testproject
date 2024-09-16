import { LightningElement, api, track } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import { getRecord, updateRecord } from 'lightning/uiRecordApi';
import saveAccount from '@salesforce/apex/ApplicationController.saveAccount'
import ACCOUNT_NAME_FIELD from '@salesforce/schema/Account.Name';
import ACCOUNT_ID_FIELD from '@salesforce/schema/Account.Id';

export default class UpdateAccountName extends LightningElement {
@api recordId;
@track accountName;
account={};
accountArray;

// Handle input change
handleNameChange(event) {
    this.accountName = event.target.value;
}

// Update account name
updateAccountName() {
    /////
   var modaltag=this.template.querySelector('[data-id="myModal"]');
   modaltag.style.display = "block";
    ///
    const fields = {};
    fields[ACCOUNT_ID_FIELD.fieldApiName] = this.recordId;
    fields[ACCOUNT_NAME_FIELD.fieldApiName] = this.accountName;

    const recordInput = { fields };

    updateRecord(recordInput)
        .then(() => {
            this.dispatchEvent(
                new ShowToastEvent({
                    title: 'Success',
                    message: 'Account name updated successfully',
                    variant: 'success'
                })
            );
            // Refresh the view
          //  eval("$A.get('e.force:refreshView').fire();");
        })
        .catch(error => {
            this.dispatchEvent(
                new ShowToastEvent({
                    title: 'Error updating account name',
                    message: error.body.message,
                    variant: 'error'
                })

            );
        });
}

updateAccountDetails()
{
    window.alert('hi');
//this.account['id']=this.recordId;
//this.account['Name']=this.accountName;
        this.account = {
            Name: this.accountName,
            Id: this.recordId
        };
    saveAccount({account:this.account})
    .then((success)=>{         
         this.dispatchEvent(
                new ShowToastEvent({
                    title: 'Success',
                    message: 'Account name updated successfully',
                    variant: 'success'
                })
            );  
             eval("$A.get('e.force:refreshView').fire();");
})
    .catch((error)=>{ window.alert(JSON.stringify(error)) }    );
}
}