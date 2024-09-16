import { LightningElement } from 'lwc';
import { NavigationMixin } from "lightning/navigation";
export default class TestHomesetup extends NavigationMixin (LightningElement) {
    personalInfo='slds-card cardCSS';
    educationInfo='slds-card cardCSS';




    navigateToPersonalInfo()
    {
        this[NavigationMixin.Navigate]({
            type: "standard__webPage",
            attributes: {
              url: "/personalinfo"
            }
            });
    }



    navigateToEducationInfo()
    {
        this[NavigationMixin.Navigate]({
            type: "standard__webPage",
            attributes: {
              url: "/educationinfo"
            }
            });       
    }
}