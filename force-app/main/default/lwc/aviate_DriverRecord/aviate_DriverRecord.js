import { LightningElement,track,api,wire } from 'lwc';
import { NavigationMixin } from 'lightning/navigation';
import VoilationRadio from '@salesforce/label/c.aviate_VoilationRadio';
import DrivingWhileImpairedRadio from '@salesforce/label/c.aviate_DrivingWhileImpairedRadio';
import { getObjectInfo } from 'lightning/uiObjectInfoApi';
import { getPicklistValues } from 'lightning/uiObjectInfoApi';
import Driver_Record__c_OBJECT from '@salesforce/schema/Driver_Record__c';
import AVI_Driver_Rec_State__c from '@salesforce/schema/Driver_Record__c.AVI_Driver_Rec_State__c';
import insertDriversRecord from "@salesforce/apex/AviateDriversRecordHandler.insertDriversRecord";
import getUSStates from "@salesforce/apex/aviateContactController.getUSStates";
import getDriverVoilationData from "@salesforce/apex/AviateDriversRecordHandler.getDriverVoilationData";
import getDriverImpairedData from "@salesforce/apex/AviateDriversRecordHandler.getDriverImpairedData";
import getContactData from "@salesforce/apex/AviateDriversRecordHandler.getContactData";
import deleteDriverRecord from "@salesforce/apex/AviateDriversRecordHandler.deleteDriverRecord";


export default class Aviate_DriverRecord extends NavigationMixin(LightningElement) {


label = {
VoilationRadio,DrivingWhileImpairedRadio
};

@track stateOptions="";
@api  VoilationCheckValue = ''; 
@api  ImpairedCheckValue = ''; 

/*@api  criminalType = '';
@api Description='';    */

@track voilationEntry={voilationDate:'',county:'',city:'',state:'',disposition:'',index:'',recordId:"",statelabel:"",EntryPageFlag:""};  
@track   voilationEntries = [];

@track impairedEntry={impairedDate:'',impairedDescription:'',index:'',recordId:"",EntryPageFlag:""}; 
@track impairedEntries=[];


isVoilationCheck=false;
@track isVoilationEntry=false;
@track isVoilationCard=false;
@track isImpairedCheck=false;
@track isImpairedCard=false;
@track isImpairedEntry=false;
//@track isVoilationCard=false;
@track isConfirmationPage=false;
@track notConfirmationPage=true;
/*@track TypeOptions;
@track l_All_Types; */
@api nextButtonClassShow = "slds-page-header slds-docked-form-footer";
@api nextButtonClassHide = "slds-page-header slds-hide slds-docked-form-footer"; 
@api progress = 0;
@wire(getObjectInfo, { objectApiName: Driver_Record__c_OBJECT })
DriversRecordInfo;

get options() {
return [
{ label: 'Yes', value: 'Yes' },
{ label: 'No', value: 'No' }
];
}

changeDateFormat(inputDate) {
  // expects Y-m-d
  var splitDate = inputDate.split("-");
  if (splitDate.count == 0) {
  return null;
  }
  
  var year = splitDate[0];
  var month = splitDate[1];
  var day = splitDate[2];
  
  return month + "/" + day + "/" + year;
  }


connectedCallback() {

getDriverVoilationData({})
  .then((result) => {
    console.log(result);
    // this.voilationEntries = result;
    for(let i=0;i<result.length;i++)
    {
console.log(result[i].voilationDate);
console.log(result[i].city);
console.log(result[i].hjh);
let vEntry={voilationDate:'',county:'',city:'',state:'',disposition:'',index:'',recordId:"",statelabel:"",EntryPageFlag:""};
let vdate;
if(result[i].voilationDate!=undefined && result[i].voilationDate!="")
{
vEntry.voilationDate=this.changeDateFormat( result[i].voilationDate);
}

if(result[i].county!=undefined && result[i].county!="")
{
vEntry.county=result[i].county;
}
if(result[i].city!=undefined && result[i].city!="")
{
vEntry.city= result[i].city;
}
if(result[i].state!=undefined && result[i].state!="")
{
vEntry.state=result[i].state;
}
if(result[i].disposition!=undefined && result[i].disposition!="")
{
vEntry.disposition=result[i].disposition;
}
if(result[i].statelabel!=undefined && result[i].statelabel!="")
{
vEntry.statelabel=result[i].statelabel;
}
if(result[i].recordId!=undefined && result[i].recordId!="")
{
vEntry.recordId=result[i].recordId;
}
vEntry.EntryPageFlag=result[i].EntryPageFlag;
vEntry.index=i;

      this.voilationEntries.push(vEntry)
    }
    console.log('voilationEntries ',result);
  })
  .catch((error) => {
    console.log(error);
  });

  getDriverImpairedData({})
  .then((result) => {
    for(let i=0;i<result.length;i++)
    {
let iEntry={impairedDate:'',impairedDescription:'',index:'',recordId:"",EntryPageFlag:""}; 
if(result[i].impairedDate!=undefined && result[i].impairedDate!="")
{
iEntry.impairedDate=this.changeDateFormat(result[i].impairedDate);
}
if(result[i].impairedDescription!=undefined && result[i].impairedDescription!="")
{
iEntry.impairedDescription=result[i].impairedDescription;
}
if(result[i].recordId!=undefined && result[i].recordId!="")
{
iEntry.recordId=result[i].recordId;
}
iEntry.EntryPageFlag=result[i].EntryPageFlag;
iEntry.index=i;

      this.impairedEntries.push(iEntry)
    }

    console.log('impairedEntries ',result);
  })
  .catch((error) => {
    console.log(error);
    this.error = error;
  });

  getContactData({})
  .then((result) => {
    console.log('result.AVI_Driver_Record_Progress__c : '+result.AVI_Driver_Record_Progress__c);
    console.log(typeof result.AVI_Driver_Record_Progress__c);
    console.log('result.AVI_Traffic_Infraction_Ind__c: '+result.AVI_Traffic_Infraction_Ind__c);
    console.log('this.VoilationCheckValue : '+this.VoilationCheckValue);


    if(result.AVI_Driver_Record_Progress__c>=0 && result.AVI_Driver_Record_Progress__c!=="" && result.AVI_Driver_Record_Progress__c!==undefined )
    {
      if(result.AVI_Traffic_Infraction_Ind__c===true)
      {
        console.log('1');
        this.VoilationCheckValue="Yes";
      }
      else{
        console.log('2');

        this.VoilationCheckValue="No";

      }
      if(result.AVI_Traffic_Driving_Impaired__c===true)
      {
        console.log('3');
        this.ImpairedCheckValue="Yes";
      }
      else{
        console.log('4');
        this.ImpairedCheckValue="No";
      }
      
      if(result.AVI_Driver_Record_Progress__c==100)
      {
        console.log('5');
      this.isConfirmationPage=true;
      this.nextButtonClassShow = "slds-page-header slds-hide slds-docked-form-footer";
      this.nextButtonClassHide = "slds-page-header slds-docked-form-footer";
      this.progress=100;
      }
      else if(result.AVI_Driver_Record_Progress__c===0)
      {
        console.log('result.AVI_Driver_Record_Progress__c else if 1');
        this.isVoilationCheck=true;
        this.nextButtonClassShow = "slds-page-header slds-hide slds-docked-form-footer";
        this.nextButtonClassHide = "slds-page-header slds-docked-form-footer";
        this.progress=result.AVI_Driver_Record_Progress__c;
      }
      else if(result.AVI_Driver_Record_Progress__c===10 ||  result.AVI_Driver_Record_Progress__c===30) 
      {
        console.log(this.voilationEntries.find(item => item.EntryPageFlag === true));
        console.log('hi');
        if(this.voilationEntries.find(item => item.EntryPageFlag === true)!=undefined)
        {
          console.log('result.AVI_Driver_Record_Progress__c else if 2');
          this.isVoilationEntry=true;
          console.log(this.voilationEntries);
          this.voilationEntry= this.voilationEntries.find(item => item.EntryPageFlag === true);
          console.log(this.voilationEntry);
          this.voilationEntry.voilationDate=this.originalDateFormat(this.voilationEntry.voilationDate);
          this.handleInputfieldSecondPageChange();
          this.progress=result.AVI_Driver_Record_Progress__c;
        }
        else{
          console.log('result.AVI_Driver_Record_Progress__c else if');
          this.isVoilationCard=true;
          console.log(this.voilationEntries[0].voilationDate);
          this.progress=result.AVI_Driver_Record_Progress__c;
          this.nextButtonClassShow = "slds-page-header slds-hide slds-docked-form-footer";
          this.nextButtonClassHide = "slds-page-header slds-docked-form-footer";
        }

      }
      else if(result.AVI_Driver_Record_Progress__c===50)
      {
        console.log('result.AVI_Driver_Record_Progress__c else if');
        this.isImpairedCheck=true;
        this.progress=result.AVI_Driver_Record_Progress__c;
      }
      else if(result.AVI_Driver_Record_Progress__c===60  || result.AVI_Driver_Record_Progress__c===90)
      {
        console.log(this.impairedEntries.find(item => item.EntryPageFlag === true));
        console.log('hi');
        if(this.impairedEntries.find(item => item.EntryPageFlag === true)!=undefined)
        {
        console.log('result.AVI_Driver_Record_Progress__c else if 2');
        this.isImpairedEntry=true;
        console.log(this.impairedEntries);
        this.impairedEntry= this.impairedEntries.find(item => item.EntryPageFlag === true);
        console.log(this.impairedEntry);
        this.impairedEntry.impairedDate=this.originalDateFormat(this.impairedEntry.impairedDate);
        this.handleInputfieldFourthPageChange();
        
        this.progress=result.AVI_Driver_Record_Progress__c;
        }
        else{
          console.log('result.AVI_Driver_Record_Progress__c else if');
          this.isImpairedCard=true;
          this.progress=result.AVI_Driver_Record_Progress__c;
          this.nextButtonClassShow = "slds-page-header slds-hide slds-docked-form-footer";
          this.nextButtonClassHide = "slds-page-header slds-docked-form-footer";
                  }
        
      }
      else if(result.AVI_Driver_Record_Progress__c===100)
      {
        console.log('result.AVI_Driver_Record_Progress__c else if');
        this.isConfirmationPage=true;
        this.progress=result.AVI_Driver_Record_Progress__c;
      }
    }else{
      // return;
      console.log('else');
      this.isVoilationCheck=true;
      this.nextButtonClassShow = "slds-page-header slds-docked-form-footer";
      this.nextButtonClassHide = "slds-page-header  slds-hide slds-docked-form-footer"; 

    }
  })
  .catch((error) => {
    console.log(error);
    this.error = error;
  });

}  





@wire(getUSStates, { })
slaFieldInfo({ data, error }) {
if (data) {
console.log("result ==> " + "" + data);
for (let i = 0; i < data.length; i++) {
  this.stateOptions = [
    ...this.stateOptions,
    { value: data[i].Id, label: data[i].Name }
  ];
}
}
}

get options() {
return [
{ label: 'Yes', value: 'Yes' },
{ label: 'No', value: 'No' }
];
}
handleInputChange(event){
if(this.isVoilationCheck){
if(event.target.dataset.id === 'voilationCheck'){
this.VoilationCheckValue =event.target.value;
this.handleInputfieldFirstPageChange();
}
}else if(this.isVoilationEntry){
if(event.target.dataset.id === 'voilationDate'){
this.voilationEntry.voilationDate=event.target.value;
}else if(event.target.dataset.id === 'county'){
this.voilationEntry.county=event.target.value;
}else if(event.target.dataset.id === 'city'){
this.voilationEntry.city=event.target.value;
}else if(event.target.dataset.id === 'state'){

this.voilationEntry.state=event.target.value;
const stateObject = this.stateOptions.find(item => item.value ===  event.target.value);
console.log('stateObject :'+stateObject);
// Here you can access object which you want
console.log(stateObject['label']);
this.voilationEntry.statelabel = stateObject['label'];
}else if(event.target.dataset.id === 'disposition'){
this.voilationEntry.disposition=event.target.value;
}
this.handleInputfieldSecondPageChange();
}else if(this.isImpairedCheck){
if(event.target.dataset.id === 'impairedCheck'){
this.ImpairedCheckValue =event.target.value;
this.handleInputfieldThirdPageChange();
}
}else if(this.isImpairedEntry){
if(event.target.dataset.id === 'impairedDate'){
this.impairedEntry.impairedDate =event.target.value;
this.handleInputfieldFourthPageChange();
}else if(event.target.dataset.id === 'impairedDescription'){
this.impairedEntry.impairedDescription =event.target.value;
this.handleInputfieldFourthPageChange();
}
}
}  
handleInputfieldFirstPageChange(){

if (this.voilationCheckValue != "") {
this.nextButtonClassShow = "slds-page-header slds-hide slds-docked-form-footer";
this.nextButtonClassHide = "slds-page-header slds-docked-form-footer";
}
else{
this.nextButtonClassShow = "slds-page-header slds-docked-form-footer";
this.nextButtonClassHide = "slds-page-header  slds-hide slds-docked-form-footer";  
}

}
handleInputfieldSecondPageChange(event) {
if (
this.voilationEntry.voilationDate != "" &&
this.voilationEntry.county != "" &&
this.voilationEntry.state != "" &&
this.voilationEntry.disposition != "" &&
this.voilationEntry.city != "" 
) {
this.nextButtonClassShow = "slds-page-header slds-hide slds-docked-form-footer";
this.nextButtonClassHide = "slds-page-header slds-docked-form-footer";
} else {
this.nextButtonClassShow = "slds-page-header slds-docked-form-footer";
this.nextButtonClassHide = "slds-page-header  slds-hide slds-docked-form-footer";
}
}


handleInputfieldThirdPageChange(){
if (this.ImpairedCheckValue != "") {
console.log('inside handleInputfieldThirdPageChange if condition' );
this.nextButtonClassShow = "slds-page-header slds-hide slds-docked-form-footer";
this.nextButtonClassHide = "slds-page-header slds-docked-form-footer";
}
else {
this.nextButtonClassShow = "slds-page-header slds-docked-form-footer";
this.nextButtonClassHide = "slds-page-header  slds-hide slds-docked-form-footer";
}

}

handleInputfieldFourthPageChange(){
if (this.impairedEntry.impairedDate != "" && this.impairedEntry.impairedDescription!="") {
this.nextButtonClassShow = "slds-page-header slds-hide slds-docked-form-footer";
this.nextButtonClassHide = "slds-page-header slds-docked-form-footer";
}
else {
this.nextButtonClassShow = "slds-page-header slds-docked-form-footer";
this.nextButtonClassHide = "slds-page-header  slds-hide slds-docked-form-footer";
}

}

onclickNext(event) {
if(this.isVoilationCheck){
if(this.VoilationCheckValue=="Yes")
{
console.log('inside onclickfirstpageif');
this.isVoilationEntry=true;
this.progress = 10;
this.handleInputfieldSecondPageChange();
}
else
{
console.log('inside onclickfirstpageelse');
this.isImpairedCheck=true;
this.progress = 50;
this.handleInputfieldThirdPageChange();
}
this.isVoilationCheck=false;
this.isVoilationCard=false;
}else if(this.isVoilationEntry){
this.isVoilationEntry=false;
this.isVoilationCheck=false;
this.isVoilationCard=true;
this.progress = 30;
this.nextButtonClassShow = "slds-page-header slds-hide slds-docked-form-footer";
this.nextButtonClassHide = "slds-page-header slds-docked-form-footer";
this.updateCard();
}else if(this.isVoilationCard){
this.isVoilationEntry=false;
this.isVoilationCheck=false;
this.isVoilationCard=false;
this.isImpairedCheck=true;
this.handleInputfieldThirdPageChange();
this.progress = 50;
}else if(this.isImpairedCheck){
if(this.ImpairedCheckValue=="Yes"){
this.isImpairedEntry=true;
this.progress = 60;
this.handleInputfieldFourthPageChange();
}
else
{
this.isConfirmationPage=true;
this.progress = 100;
this.nextButtonClassShow = "slds-page-header slds-hide slds-docked-form-footer";
this.nextButtonClassHide = "slds-page-header slds-docked-form-footer";
}
this.isVoilationEntry=false;
this.isVoilationCheck=false;
this.isVoilationCard=false;
this.isImpairedCheck=false;
}else if(this.isImpairedEntry){
this.isVoilationEntry=false;
this.isVoilationCheck=false;
this.isVoilationCard=false;
this.isImpairedCheck=false;
this.isImpairedEntry=false;
this.isImpairedCard=true;
this.nextButtonClassShow = "slds-page-header slds-hide slds-docked-form-footer";
this.nextButtonClassHide = "slds-page-header slds-docked-form-footer";
this.updateImpairedCard();
this.progress = 90;
}else if(this.isImpairedCard){
this.isVoilationEntry=false;
this.isVoilationCheck=false;
this.isVoilationCard=false;
this.isImpairedCheck=false;
this.isImpairedEntry=false;
this.isImpairedCard=false;
this.isConfirmationPage=true;
this.nextButtonClassShow = "slds-page-header slds-hide slds-docked-form-footer";
this.nextButtonClassHide = "slds-page-header slds-docked-form-footer";
this.progress = 100;
}

}

updateCard(event){
this.voilationEntry.EntryPageFlag=false;
this.voilationEntry.voilationDate = this.changeDateFormat(
this.voilationEntry.voilationDate
);
if (this.voilationEntry.index !== ""  ) {
this.voilationEntries[this.voilationEntry.index] = this.voilationEntry;
}
else{

this.voilationEntry.index=this.voilationEntries.length;
this.voilationEntries.push(this.voilationEntry);

}
this.voilationEntry={voilationDate:'',county:'',city:'',state:'',disposition:'',index:'',recordId:"",statelabel:"",EntryPageFlag:""};  
}

updateImpairedCard(event){
this.voilationEntry.EntryPageFlag=false;
this.impairedEntry.impairedDate = this.changeDateFormat(
this.impairedEntry.impairedDate
);
if (this.impairedEntry.index !== ""  ) {
this.impairedEntries[this.impairedEntry.index] = this.impairedEntry;
}
else{

this.impairedEntry.index=this.impairedEntries.length;
this.impairedEntries.push(this.impairedEntry);
console.log('  console.log(this.impairedEntries); :'+this.impairedEntries);


}
this.impairedEntry={impairedDate:'',impairedDescription:'',index:'',recordId:"",EntryPageFlag:""};  
}



onClickCard(event) {
const index = event.currentTarget.dataset.id;
this.voilationEntry = this.voilationEntries[index];
//this.voilationEntry.index = index;
this.voilationEntry.voilationDate = this.originalDateFormat(
this.voilationEntry.voilationDate
);
this.isVoilationEntry=true;
this.isVoilationCheck=false;
this.isVoilationCard=false;
this.isImpairedCheck=false;
//this.progress=10;
this.handleInputfieldSecondPageChange();
}

onClickImpairedCard(event)
{
const index = event.currentTarget.dataset.id;
this.impairedEntry = this.impairedEntries[index];
this.impairedEntry.impairedDate = this.originalDateFormat(
this.impairedEntry.impairedDate
);  this.isVoilationEntry=false;
this.isVoilationCheck=false;
this.isVoilationCard=false;
this.isImpairedCheck=false;
this.isImpairedCard=false;
this.isImpairedEntry=true;
//this.progress=60;
this.handleInputfieldFourthPageChange();
}



addMoreVoilation()
{
this.isVoilationCheck=false;
this.isVoilationEntry=true;
this.isVoilationCard=false;
//this.progress=10;
this.voilationEntry={voilationDate:'',county:'',city:'',state:'',disposition:'',index:'',recordId:"",statelabel:"",EntryPageFlag:""};  
this.handleInputfieldSecondPageChange();
}
addMoreImpaired()
{
console.log('  console.log(this.impairedEntries); :'+this.impairedEntries);
this.isVoilationCheck=false;
this.isVoilationEntry=false;
this.isVoilationCard=false;
//this.isCriminalConfirm = false;
this.isImpairedCheck=false;
this.isImpairedCard=false;
this.isImpairedEntry=true;
this.impairedEntry={impairedDate:'',impairedDescription:'',index:'',recordId:"",EntryPageFlag:""}; 
this.handleInputfieldFourthPageChange();

}

removeRow(event) {
console.log('this.voilationEntries[event.target.value].recordId inside:'+this.voilationEntries[event.target.value].recordId);

if(this.voilationEntries[event.target.value].recordId!="" || this.voilationEntries[event.target.value].recordId!=undefined)
{
console.log('this.voilationEntries[event.target.value].recordId :'+this.voilationEntries[event.target.value].recordId);
deleteDriverRecord({recordId:this.voilationEntries[event.target.value].recordId})
.then((result) => {
  this.voilationEntries.splice(event.target.value, 1);
  console.log('Record Deleted'+result);
})
.catch((error) => {
  console.log(error);
  // this.error = error;
});
}
else{
this.voilationEntries.splice(event.target.value, 1); 
}
}

removeImpairedRow(event) {
console.log('this.voilationEntries[event.target.value].recordId outside:'+this.voilationEntries[event.target.value].recordId);

if(this.impairedEntries[event.target.value].recordId!="" || this.voilationEntries[event.target.value].recordId!=undefined)
{
console.log('this.voilationEntries[event.target.value].recordId :'+this.voilationEntries[event.target.value].recordId);
deleteDriverRecord({recordId:this.impairedEntries[event.target.value].recordId})
.then((result) => {
  this.impairedEntries.splice(event.target.value, 1);

  console.log('Record Deleted');
})
.catch((error) => {
  console.log(error);
  // this.error = error;
});
}
else{
this.impairedEntries.splice(event.target.value, 1);

}

}

onClickSubmit() {
if((this.progress==10 ||  this.progress==30) && this.isVoilationEntry===true)
{
  this.voilationEntry.EntryPageFlag=true;
  if(this.voilationEntry.voilationDate!=undefined && this.voilationEntry.voilationDate!="")
{
this.voilationEntry.voilationDate=this.changeDateFormat(this.voilationEntry.voilationDate);
}

    if (this.voilationEntry.index !== ""  ) {
      this.voilationEntries[this.voilationEntry.index] = this.voilationEntry;
      }
      else{
      
      this.voilationEntry.index=this.voilationEntries.length;
      this.voilationEntries.push(this.voilationEntry);
      
      }
    /*  this.voilationEntries.forEach((item, index) => {
          item.voilationDate=this.changeDateFormat(item.voilationDate);
          console.log('item.voilationDate :'+item.voilationDate);
      });  */
   //   this.voilationEntry={voilationDate:'',county:'',city:'',state:'',disposition:'',index:'',recordId:"",statelabel:"",EntryPageFlag:""}; 
  console.log('this.voilationEntries :'+JSON.stringify(this.voilationEntries));
}
else if ((this.progress==60 ||  this.progress==90) && this.isImpairedEntry===true){
  this.impairedEntry.EntryPageFlag=true;
  if(this.impairedEntry.impairedDate!=undefined && this.impairedEntry.impairedDate!="")
{
this.impairedEntry.impairedDate = this.changeDateFormat(
  this.impairedEntry.impairedDate);
}

    if (this.impairedEntry.index !== ""  ) {
    this.impairedEntries[this.impairedEntry.index] = this.impairedEntry;
    }
    else{
    
    this.impairedEntry.index=this.impairedEntries.length;
    this.impairedEntries.push(this.impairedEntry);
    console.log('  console.log(this.impairedEntries); :'+this.impairedEntries);
    
    
    }
  //  this.impairedEntry={impairedDate:'',impairedDescription:'',index:'',recordId:"",EntryPageFlag:""};  

}
insertDriversRecord({progress:this.progress,voilationCheck:this.VoilationCheckValue,impairedCheck:this.ImpairedCheckValue, voilationList: this.voilationEntries,impairedList:this.impairedEntries})
.then((result) => {
console.log(this.voilationEntries);
console.log(this.impairedEntries);
  console.log(result);
  this[NavigationMixin.Navigate]({
    type: "standard__namedPage",
    attributes: {
      pageName: "home"
    }
  });
})
.catch((error) => {
console.log('error :'+JSON.stringify(error));
});  

}



originalDateFormat(inputDate) {
var splitDate = inputDate.split("/");
if (splitDate.count == 0) {
return null;
}

var month = splitDate[0];
var day = splitDate[1];
var year = splitDate[2];
console.log(year + "-" + month + "-" + day);
return year + "-" + month + "-" + day;
}

onclickBack(event) {
console.log("Inside back button");
if(this.isVoilationCheck==true){
  console.log("Inside back button first if");
  this[NavigationMixin.Navigate]({
    type: "standard__namedPage",
    attributes: {
      pageName: "home"
    }
  });
}else if(this.isVoilationEntry==true){
  console.log("Inside back button isVoilationEntry");

  this.isVoilationEntry=false;
  this.isVoilationCheck=true;
  this.voilationEntry.EntryPageFlag=false;
  console.log(this.voilationEntry);
  if (this.voilationEntry.index !== "" && this.voilationEntry.index !==undefined ) {
    this.voilationEntries[this.voilationEntry.index] = this.voilationEntry;
    }
    console.log(this.voilationEntries);

  this.progress=0;
}else if(this.isVoilationCard==true){
  this.onBackClickUpdateVoilationEntry();
  this.isVoilationCard=false;
  this.isVoilationEntry=true;
  this.progress=10;
  this.handleInputfieldSecondPageChange();
}else if(this.isImpairedCheck==true){
  if(this.VoilationCheckValue=="No")
  {
    this.isImpairedCheck=false;
    this.isVoilationCheck=true;
    this.progress=0;
  }else{
    this.isImpairedCheck=false;
    this.isVoilationCard=true;
    this.progress=30;
  }

}else if(this.isImpairedCard==true){
  this.isImpairedCard=false;
  this.isImpairedEntry=true;
  this.progress=60;
this.onBackClickUpdateImpairedEntry();
}else if(this.isImpairedEntry==true){
  this.isImpairedCheck=true;
  this.isImpairedEntry=false;
  this.impairedEntry.EntryPageFlag=false;
  if (this.impairedEntry.index !== "" && this.impairedEntry.index !==undefined ) {
    this.impairedEntries[this.impairedEntry.index] = this.impairedEntry;
    }
  this.progress=50;
}else if(this.isConfirmationPage==true){
  if(this.ImpairedCheckValue=="No"){
    this.isConfirmationPage=false;
    this.isImpairedCheck=true;
    this.progress=50;
  }
  else{
    this.isConfirmationPage=false;
    this.isImpairedCard=true;
    this.progress=90;
  }
}
}

onBackClickUpdateVoilationEntry(){
if(this.voilationEntries.length>0)
{
  this.voilationEntry=this.voilationEntries[this.voilationEntries.length-1];  // to get the last element and show on click on back button
  this.voilationEntry.index=this.voilationEntries.length-1;  // put the index of last element
  this.voilationEntry.voilationDate = this.originalDateFormat(
    this.voilationEntry.voilationDate
  );
  console.log(this.voilationEntries);

}else
{
this.voilationEntry={voilationDate:'',county:'',city:'',state:'',disposition:'',index:'',recordId:"",statelabel:""};  
}
}

onBackClickUpdateImpairedEntry(){
if(this.impairedEntries.length>0)
{
    this.impairedEntry=this.impairedEntries[this.impairedEntries.length-1];  // to get the last element and show on click on back button
    this.impairedEntry.index=this.impairedEntries.length-1;  // put the index of last element
    this.impairedEntry.impairedDate = this.originalDateFormat(
      this.impairedEntry.impairedDate
    );
    console.log(this.impairedEntries);

  }else
  {
  this.impairedEntry={impairedDate:'',impairedDescription:'',index:'',recordId:""}; 
  }
}



}