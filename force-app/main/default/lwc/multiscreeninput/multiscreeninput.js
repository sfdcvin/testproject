import { LightningElement } from 'lwc';
import creataccounts from '@salesforce/apex/CreateAccount.createAccounts';
export default class Multiscreeninput extends LightningElement {


number=0;
bool1=true;
bool2=false;
firstname;
place;
progress = 0;
processStatus = 'In Progress';
nameChange(event) {

this.firstname= event.target.value;
console.log(this.firstname);


}

placeChange(event) {

    this.place= event.target.value;
    console.log(this.place);
    
    }
previous(event)
{
  //  this.place= event.target.value;

    // this.firstname=event.target.checked
    this.number=this.number-1;
    console.log(this.number);

    if(this.number==1)
    {
        this.bool1=true;
        this.bool2=false;
    }
    else if(this.number==2)
    {
        this.bool1=false;
        this.bool2=true;
    }
}

next(event)
{
    this.progress = this.progress + 50;

    this.number=this.number+1;
    console.log(this.number);

    if(this.number==1)
    {
        this.bool1=false;
        this.bool2=true;
    }
    else if(this.number==2)
    {
        this.bool1=false;
        this.bool2=true;
    }
}

Save(){
creataccounts({accName: this.firstname, gstNo:this.place})
.then(response => {
	//this.lstAccount = response;
})
.catch(error => {
	//console.log('Error: ' +error.body.message);
});
}
}