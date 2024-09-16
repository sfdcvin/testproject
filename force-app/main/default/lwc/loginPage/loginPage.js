import { LightningElement,wire } from 'lwc';
import { NavigationMixin } from 'lightning/navigation';
import { CurrentPageReference } from 'lightning/navigation';
import doLogin from '@salesforce/apex/LeadController.doLogin'

export default class LoginPage extends NavigationMixin (LightningElement) {
    username='';
    password='';
    href;
    startURL;
    @wire(CurrentPageReference)
    getPageReferenceParameters(currentPageReference) {
       if (currentPageReference) {
          console.log(currentPageReference);
          this.startURL = currentPageReference.startURL;
       }
    }
    connectedCallback(){

        var meta = document.createElement("meta");
        meta.setAttribute("name", "viewport");
        meta.setAttribute("content", "width=device-width, initial-scale=1.0");
        document.getElementsByTagName('head')[0].appendChild(meta);


    }
    handleChange(event)
    {
        if(event.target.name=="uname")
    {
        this.username=event.target.value;
    }else if(event.target.name=="pass")
    {
        this.password=event.target.value;

    }
    }
    doLogin(event){
        doLogin({username:this.username,password:this.password,startURL:this.startURL})
        .then((result) => {
            event.preventDefault();

        //     this[NavigationMixin.Navigate]({
        //         type: 'standard__webPage',
        //         attributes: {
        //             url: result
        //         }
        //     },
        //      // Replaces the current page in your browser history with the URL
        //   );
        window.open(result, "_self");
        console.log('success123');

        })
        .catch((error) =>{
            console.log('error123');

            console.log(error.body.message);
        })
        }
    }