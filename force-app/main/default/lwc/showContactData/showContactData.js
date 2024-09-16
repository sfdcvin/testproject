import { LightningElement,api,wire,track } from 'lwc';
import contactData from '@salesforce/apex/ContactController.getContactData';
import { getRecord } from 'lightning/uiRecordApi';
import { subscribe} from 'lightning/empApi';
export default class ShowContactData extends LightningElement {
@api recordId;
@api name;
ObjectData= [
    { OrderNo: '1234', OrderItem: 'Mobile' },
    { OrderNo: '5678', OrderItem: 'Laptop', Price: '3426' },
    { OrderNo: '91011', OrderItem: 'Tablet' }
];

@track orders = [
    { OrderNo: '1234', OrderItem: 'Mobile' },
    { OrderNo: '5678', OrderItem: 'Laptop', Price: '3426' },
    { OrderNo: '91011', OrderItem: 'Tablet' }
];

get ordersWithKeyValuePairs() {
    return this.orders.map(order => {
        return {
            // id: order.OrderNo, // or another unique identifier
            keyValuePairs: Object.entries(order).map(([key, value]) => ({ key, value }))
        };
    });
}


@track contact={Name:'',Email:''};
    subscription = {};
@api channelName = '/event/Contact_Updated__e';

    connectedCallback() {
    this.handleSubscribe();
}
@wire(contactData,{conId:'$recordId'})
contactData({error,data}){
    if(data){
//this.contact=data;

    }else if(error)
    {
    }
}

CallMe(event)
{
    contactData({conId:this.recordId}).then(result=>{
        this.contact=result;
    })
    .catch(error=>{})
}

    async handleLoad() {
    try {
        this.contact = await contactData({conId:this.recordId});
    }catch{

    }
    }
handleSubscribe() {
    const self = this;
    const messageCallback = function (response) {
        
//self.contact.Name='Vineet'  ;
//self.contact.Email='vin@gmail.com';
    contactData({conId:self.recordId}).then(result=>{
        self.contact=result;
        window.alert('hi vinnuu');
    })
    .catch(error=>{})
                window.alert('hi vinnuu33');

};

    subscribe(this.channelName, -1, messageCallback).then(response => {
        console.log('Subscription request sent to: ', JSON.stringify(response.channel));
        this.subscription = response;
    });
}

}