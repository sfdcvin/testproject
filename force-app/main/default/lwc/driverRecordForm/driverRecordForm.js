import { LightningElement,track,api,wire } from 'lwc';
import saveDriverRecord from "@salesforce/apex/DriversRecordHandler.saveDriverRecord";
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
export default class DriverRecordForm extends LightningElement {


driverRecord={};
docId;
showSpinner=false;
handleChange(event)
{
if(event.target.dataset.id === 'name')
{
this.driverRecord.Name=event.target.value;
}
else if(event.target.dataset.id === 'voilationtype')
{
this.driverRecord.AVI_Driver_Rec_Type__c	=event.target.value;
}
}


save()
{
    this.showSpinner=true;
    saveDriverRecord({driverRecord:[this.driverRecord],docId:this.docId})
    .then((result) => {
        console.log('Hi');
        console.log(result);
        const evt = new ShowToastEvent({
            title: 'Success',
            message: 'Created Successfully',
            variant: 'Success',
        });
        this.dispatchEvent(evt);
        this.showSpinner=false;
       // this.dispatchEvent(new CustomEvent("updatelist"));
    })
    .catch((error) => {
    console.log('error :'+JSON.stringify(error));
    });  
    
    }
    
    handleUploadFinished(event)
    {
        const files=event.detail.files;
        console.log(files[0].documentId);
        this.docId=files[0].documentId;
    }
}