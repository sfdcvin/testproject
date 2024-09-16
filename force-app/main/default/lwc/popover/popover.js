import { LightningElement } from 'lwc';
export default class Popover extends LightningElement {
ClickHandler(event) {
    var buttonName = event.target.dataset.name;
   // buttonName.style.display = "block";
   var modaltag=this.template.querySelector('[data-id="myModal"]');
   modaltag.style.display = "block";
}
}