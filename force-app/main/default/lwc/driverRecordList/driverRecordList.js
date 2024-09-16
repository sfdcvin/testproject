import { LightningElement,wire,track } from 'lwc';
import getDriverRecord from "@salesforce/apex/DriversRecordHandler.getDriverRecord";
export default class DriverRecordList extends LightningElement {

     columns = [
        { label: 'Name', fieldName: 'Name' },
        { label: 'Voilance Type', fieldName: 'AVI_Driver_Rec_Type__c' }

    ];

   @track data=[];
    error;
   @track errorMessage;

connectedCallback()
{
    getDriverRecord({})
    .then((result) => {
        this.errorMessage=JSON.stringify(result);
        console.log('result :'+result);
        this.data=result;
    })
        .catch((error) => {
            this.errorMessage=JSON.stringify(error);
            console.log(error);
          });
}

    retrieveData(event)
    {
        getDriverRecord({})
        .then((result) => {
            this.errorMessage=JSON.stringify(result);
            console.log('result :'+result);
            this.data=result;
        })
            .catch((error) => {
                this.errorMessage=JSON.stringify(error);
                console.log(error);
              });
    
}
}