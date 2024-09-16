import { LightningElement,api } from 'lwc';
import updateAccount from '@salesforce/apex/CreateContactApex.updateAccount';
export default class UpdateAccount extends LightningElement {
 @api recordId;
 @api accountrec;
    handleClick()
    {
        window.alert('hi');
      let  name1=this.template.querySelector('lightning-input[data-id="fullname"]').value;
      window.alert(name1);
            window.alert(this.recordId);

      this.accountrec={Id:this.recordId,Name:name1};

        updateAccount({acc:this.accountrec}).then(result=>{
             eval("$A.get('e.force:refreshView').fire();");

        })
        .catch(error=>{window.alert(JSON.stringify(error))})
    }

}