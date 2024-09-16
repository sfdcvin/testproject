import { LightningElement, api } from 'lwc';

export default class ChildComponentB extends LightningElement {
  
  @api  _isParentVisible = false;

constructor(){
    super();
 this._isParentVisible = true;
}

    // Example function to toggle the visibility
    toggleVisibility() {
       // this.isParentVisible = !this.isParentVisible;
    }
}