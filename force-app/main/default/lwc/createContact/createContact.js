import { LightningElement ,track,wire,api} from 'lwc';
import { NavigationMixin } from 'lightning/navigation';
import insertContact from '@salesforce/apex/CreateContactApex.insertContact';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import { publish, MessageContext } from "lightning/messageService";
import Contact_CHANNEL from "@salesforce/messageChannel/fishbonemessagechannel__c";
import getContacts from '@salesforce/apex/CreateContactApex.getContacts';
import LabelJSON from '@salesforce/resourceUrl/LabelJSON';

export default class CreateContact extends NavigationMixin (LightningElement)  {
  //2. Wiring the MessageContext to a property
  @api jsonToShow={};
  cardVisibility=false;
  newConPage=true;
  Error;

  @wire(MessageContext)
  messageContext;
@track con ={FirstName:'',LastName:'',index:''};
@track conList=[];
handleInputFieldChange(event){
    if(event.target.name == "fname")
    {
this.con.FirstName= event.target.value;
console.log(this.con.FirstName);


    }
    else if(event.target.name == "lname")
    {
        console.log(event.target.value);

        this.con.LastName= event.target.value;
    }

}



/* creatCon()
{
    console.log('Hi');

    console.log(this.con);
insertContact({c:this.con}).then(result=>{
    const event = new ShowToastEvent({
        title: 'Toast message',
        message: 'Toast Message',
        variant: 'success',
        mode: 'dismissable'
    });
    this.dispatchEvent(event);
  //  this.dispatchEvent(new CustomEvent('callmeevent'));
  
  getContacts().then(result=>{
    console.log('Inside result');
    console.log(JSON.stringify(result));
const message={ContactData:result};
  //4. Publishing the message
  publish(this.messageContext, Contact_CHANNEL, message);
})
                            .catch(error=>{
console.log(error);
                            });    

   // console.log('Dispatched');

                            })
                            .catch(error=>{
                                console.log(error);

                            });
                        }  */

                        connectedCallback()
{
    try{
       
   console.log('hi vineet');
   let request = new XMLHttpRequest();
   request.open("GET", LabelJSON, false);
   request.send(null);
   this.jsonToShow = JSON.parse(request.responseText);
   console.log(' this.jsonToShow '+ this.jsonToShow.lName );
   console.log(' this.jsonToShow ' );
    }catch(error){
console.log('error '+error);
    }
}


nextCall()
{
    this.cardVisibility=true;
    this.newConPage=false;
    if(this.con.index=== "")
    {
        this.con.index=this.conList.length;
        this.conList.push(this.con);
    }
}

addMore()
{
    this.con ={FirstName:'',LastName:'',index:''};
    this.cardVisibility=false;
    this.newConPage=true;

}


creatCon()
{
    console.log('Hi');
    console.log(this.conList);
insertContact({c:this.conList}).then(result=>{
    const event = new ShowToastEvent({
        title: 'Toast message',
        message: 'Toast Message',
        variant: 'success',
        mode: 'dismissable'
    });
    this.dispatchEvent(event);  

   // console.log('Dispatched');

                            })
                            .catch(error=>{
                                this.Error=JSON.stringify(error.body.message);

                            });
                        }

          onEditClick(event)
          {
const index=event.currentTarget.dataset.id;
console.log(this.conList[index]);
this.con=this.conList[index];
this.cardVisibility=false;
this.newConPage=true;
          }  
          
          doLogout()    
          {
          //  window.location.replace("https://fishbonetech-dev-ed.lightning.force.com/secur/logout.jsp");
          const event = new CustomEvent("myevent", { bubbles: true, composed : true });
        this.dispatchEvent(event);  
          }    
}