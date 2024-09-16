import { LightningElement,api } from 'lwc';
export default class BubbleUpChild2 extends LightningElement {
@api greeting;
    changeHandler(event) {
        this.greeting = event.target.value;
        this.dispatchEvent(new CustomEvent("myevent",{ bubbles:true, composed:true,detail : this.greeting }));
    }


}