import { LightningElement } from 'lwc';
import createLeadRecord from '@salesforce/apex/LeadController.createLeadRecord'
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
export default class LeadDataPageCreate extends LightningElement {

    newLead={};
    error=""
    spinner=false;
    docIds=[];
    handleChange(event)
    {
        if(event.target.name=="fname")
        {
            this.newLead.FirstName=event.target.value;
        }else if(event.target.name=="lname")
        {
            this.newLead.LastName=event.target.value;

        }else if(event.target.name=="email")
        {
            this.newLead.Email=event.target.value;

        }else if(event.target.name=="company")
        {
            this.newLead.Company=event.target.value;

        }
    }

    handleSave()
        {
            this.spinner=true;
            createLeadRecord({lead:this.newLead})
            .then((result)=>{
                console.log("Pass");
                this.spinner=false;
                const event = new ShowToastEvent({
                    title: 'New Lead',
                    message:
                        'Lead is successfully created',
                });
                this.dispatchEvent(event);
                this.dispatchEvent(new CustomEvent("offsave",{createNew:false}));
            })
            .catch((error)=>{
                console.log("Pass");
this.error="fail;"

            })
        }

        handleUploadFinished(event)
        {
            const uploadedFiles = event.detail.files;  
            for(let x=0;x<uploadedFiles.length;x++)
            {
                this.docIds.push(uploadedFiles[x].documentId);
                
            }
            this.newLead.docIds=this.docIds;
        }
    
}