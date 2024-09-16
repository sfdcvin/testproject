import { LightningElement, track } from 'lwc';

export default class ParentComponentA extends LightningElement {
    @track isChildVisible = false;

    renderedCallback() {
        const childComponent = this.template.querySelector('c-child-component-b');
        if (childComponent) {
            this.isChildVisible = childComponent.isParentVisible;
        }
    }
}