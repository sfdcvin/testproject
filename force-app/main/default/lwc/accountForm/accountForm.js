import { LightningElement } from 'lwc';
export default class AccountForm extends LightningElement {
fields = ['Name'];
    objectApiName='Account';
    recordId='001GA00004vaNuwYAE';

    handleSuccess(event) {
        const updatedRecord = event.detail.id;
        alert('Record ID: ' + updatedRecord);
    }
}