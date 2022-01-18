import { LightningElement, wire ,api } from 'lwc';
import { refreshApex } from '@salesforce/apex';
import postNumber from '@salesforce/apex/postWelcome.postNumber';






export default class Buttoncall extends LightningElement {
    @api phone = '';

    @wire (postNumber,{phone: '$phone'}) llamada;
    
    
    Sending(e) {
        
        postNumber({
            phone: this.phone})
        .then(() => {
            refreshApex(this.opptiesOverAmount)
        })
        .catch((error) => {
            this.message = 'Error received: code' + error.errorCode + ', ' + 'message ' + error.body.message;
        });
    }
}