import { LightningElement, api, track, wire } from 'lwc';
import { refreshApex } from '@salesforce/apex';
import LightningConfirm from 'lightning/confirm';
import { subscribe } from 'lightning/empApi';

import getLeads from '@salesforce/apex/LeadController.getLeadRecords';
import getABC from '@salesforce/apex/LeadController.getABC';

export default class LeadDataPage extends LightningElement {
    createNew = false;
    error;
    columns = [{ label: 'First Name', fieldName: 'FirstName' }, { label: 'Last Name', fieldName: 'LastName' }, { label: 'Email', fieldName: 'Email' }];
    data = [];
    // spinner=false;
   /* @track leadRecords;
    @wire(getLeads, {})
    leads({error,data}){
        if(data)
        {
this.leadRecords=data;
        }
    }  */

        @wire(getLeads, {})
    leadRecords

    @wire(getABC, {})
    getABC({ error, data }) {
        if (data) { console.log('from wire'); }
        else if (error) {
            console.log('from wire' + error);
            this.error = error;
        }
    }
    subscription = {};
    @api channelName = '/event/Contact_Updated__e';
    connectedCallback() {
        console.log('from callback');
        this.handleSubscribe();
    }


    // leadRecords;
    constructor() {
        super();
        console.log('From Constructor');
    }
    handleClickNew(event) {
        const result = this.handleConfirmClick();
        // window.alert(result);
    }

    afterSave(event) {
        this.createNew = event.detail;
        refreshApex(this.leadRecords);
    }

    async handleConfirmClick() {
        const result = await LightningConfirm.open({
            message: 'This is the confirmation message.',
            variant: 'headerless',
            label: 'This is the aria-label value',
            // label value isn't visible in the headerless variant
        });
        // confirm modal has been closed
        if (result) {
            this.createNew = true;
        }

    }

    handleSubscribe() {
        const self = this;
        const messageCallback = function (response) {

            //self.contact.Name='Vineet'  ;
            //self.contact.Email='vin@gmail.com';
            refreshApex(self.leadRecords);
                window.alert('hi vinnuu 1111111111 :'+JSON.stringify(self.leadRecords));

           /* getLeads()
            .then(result => {
                self.leadRecords = result;
                                window.alert('hi vinnuu 1234');
               window.alert('result :'+JSON.stringify(result));
               window.alert(JSON.stringify(self.leadRecords));
                window.alert('hi vinnuu 1111111111 :'+JSON.stringify(result));
            })
            .catch(error => {
                    window.alert('hi vinnuu33 :' + error);
             }) */


        };

        subscribe(this.channelName, -1, messageCallback).then(response => {
            console.log('Subscription request sent to: ', JSON.stringify(response.channel));
            this.subscription = response;
        });

    }
}