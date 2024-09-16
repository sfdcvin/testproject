import { LightningElement,track } from 'lwc';
import { NavigationMixin } from "lightning/navigation";

import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import saveEducation from "@salesforce/apex/ApplicationController.saveEducation";
export default class EducationInfo extends NavigationMixin (LightningElement) {

@track education={Degree_Type__c:'',Start_Date__c:'',End_Date__c:'',Id:'',docNames:[]};
@track insertEducation={};
enableDefault=false;
save=true;
spinner=false;
input=true;
card=false;
@track eduList=[];
myRecordId='';
saveCSS ='slds-page-header stickyFooterDisabled';
@track docs=[];


EducationInfo()
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

saveEducation()
{
    this.spinner=true;
    console.log(JSON.stringify(this.education));
    if(this.education.Id!='')
    {
        this.insertEducation={};
        this.insertEducation.Degree_Type__c=this.education.Degree_Type__c;
        this.insertEducation.Start_Date__c=this.education.Start_Date__c;
        this.insertEducation.End_Date__c=this.education.End_Date__c;
        this.insertEducation.Id=this.education.Id;
    }
    else{
        this.insertEducation={};
        this.insertEducation.Degree_Type__c=this.education.Degree_Type__c;
        this.insertEducation.Start_Date__c=this.education.Start_Date__c;
        this.insertEducation.End_Date__c=this.education.End_Date__c;
        console.log('this.insertEducation:'+this.insertEducation);
    }
    saveEducation({education:this.insertEducation})
    .then(result=>{
    this.input=false;
    this.card=true;
    console.log(result);
    this.education.Id=result;
    console.log(JSON.stringify(this.education));
    if (this.eduList.filter(e => e.Id === this.education.Id).length > 0) {
      //  this.education[]
      }
      else{
        this.eduList.push(this.education);
      }

    this.spinner=false;
    this.save=false;
            const evt = new ShowToastEvent({
        title: 'Success',
        message: 'Education Info Submitted',
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
if(event.target.name=="Degree_Type__c")
this.education.Degree_Type__c=event.target.value;
else if(event.target.name=="Start_Date__c")
this.education.Start_Date__c=event.target.value;
else if(event.target.name=="End_Date__c")
this.education.End_Date__c=event.target.value;

if(this.education.Degree_Type__c!='' && this.education.Start_Date__c!='' && this.education.End_Date__c!='' )
{
    // save=true;
this.saveCSS ='slds-page-header stickyFooter  ';
}
else{
this.saveCSS ='slds-page-header stickyFooterDisabled';
}
}

addMore()
{
    this.education={Degree_Type__c:'',Start_Date__c:'',End_Date__c:'',Id:''}
this.input=true;
this.card=false; 
this.save=true;
this.saveCSS ='slds-page-header stickyFooterDisabled';
}

cardClick(event)
{
    console.log(event.target.dataset.index);
    let index = event.target.dataset.index;
    console.log(this.eduList[index]);
    this.education=this.eduList[index];
    console.log(this.education);
    this.input=true;
this.card=false; 
this.save=true;
this.saveCSS ='slds-page-header stickyFooter  '; 

}



handleUploadFinished(event) {
    // Get the list of uploaded files
    let uploadedFiles = event.detail.files;
    alert('No. of files uploaded : ' + uploadedFiles.length);
    alert('No. of files uploaded : ' + JSON.stringify(uploadedFiles));


        this.education.docNames.push(uploadedFiles[0]);
}
}