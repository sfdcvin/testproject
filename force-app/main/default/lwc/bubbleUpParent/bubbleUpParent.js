import { LightningElement } from 'lwc';
export default class BubbleUpParent extends LightningElement {
youClicked;
callParentFun(event)
{
    this.youClicked=event.detail;
}
}