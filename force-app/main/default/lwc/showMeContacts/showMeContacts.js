import {LightningElement,wire} from 'lwc';
import getContacts from '@salesforce/apex/ExampleController.showContacts';
import getPopulationData from '@salesforce/apex/ExampleController.getPopulationData';



export default class contactcontroller extends LightningElement {
    columns=[{label:'Name',fieldName:'Name'}];
    popcolumns=[{label:'ID',fieldName:'ID'},
    {label:'Year',fieldName:'Year'},{label:'Nation',fieldName:'Nation'},{label:'Population',fieldName:'Population'},];

    populationData=[];
data;
error;

@wire(getContacts)
contactData({error,data}){
if(data)
{
    this.data=data;
    this.error=undefined;
}else if(error)
{
        this.data=undefiend;
    this.error='Contacts not found';
}

}



@wire(getPopulationData)
getPopulationData({error,data}){
if(data)
{
let paserData=JSON.parse(data);
this.populationData=paserData.data.map(item=>({
ID:item['ID Nation'],
Year:item['ID Year'],
Nation:item.Nation,
Population:item.Population


}));
    this.error=undefined;
}else if(error)
{
        this.data=undefiend;
    this.error='Contacts not found';
}

}
}