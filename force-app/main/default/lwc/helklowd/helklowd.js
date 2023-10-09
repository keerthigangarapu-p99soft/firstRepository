import { LightningElement } from 'lwc';

export default class Helloworld extends LightningElement {
firstnumber=0;
secoundnumber=0;
thirdnumber=0;
prevval=[];

fhandlechange(event){
    this.firstnumber=event.target.value;

}
shandlechange(event)
{
    this.secoundnumber=event.target.value;
}
add(event){
    const firsN=parseInt(this.firstnumber);
    const secN=parseInt(this.secoundnumber);
    this.prevval.push(`result of ${firsN} + ${secN} is ${firsN+secN}`);
    this.thirdnumber=parseInt(this.firstnumber)+parseInt(this.secoundnumber);
   
}
sub(event){
    const firsN=parseInt(this.firstnumber);
    const secN=parseInt(this.secoundnumber);
    this.prevval.push(`result of ${firsN}-${secN} is ${firsN-secN}`);
    this.thirdnumber=parseInt(this.firstnumber)-parseInt(this.secoundnumber);
}
mult(event){
    const firsN=parseInt(this.firstnumber);
    const secN=parseInt(this.secoundnumber);
    this.prevval.push(`result of ${firsN}*${secN} is ${firsN*secN}`);
    this.thirdnumber=parseInt(this.firstnumber)*parseInt(this.secoundnumber);
}
div(event){
    const firsN=parseInt(this.firstnumber);
    const secN=parseInt(this.secoundnumber);
    this.prevval.push(`result of ${firsN}/${secN} is ${firsN/secN}`);
    this.thirdnumber=parseInt(this.firstnumber)/parseInt(this.secoundnumber);
}
}