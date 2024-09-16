import { LightningElement } from 'lwc';

export default class Weather extends LightningElement {
appid='a0947317d3d22dba8428cb3f264f5597';
units='metric';
weatherInfo;
searchCity;
error;

searchCityChange(event)
{
this.searchCity=event.target.value;
}

checkWeather(event)
{

let url='https://api.openweathermap.org/data/2.5/weather?appid='+this.appid+'&units='+this.units+'&q='+this.searchCity;
console.log('URL '+url);
fetch(url,{method:'GET',mode: 'cors'})
.then(response=>{
    if(!response.ok)
    {
        throw new Error('error '+response.status);
    }
    return response.json();

}).then(data=>{
    this.error=undefined;
    // console.log(data);
    //parsedData=JSON.parse(data);
    debugger;
    this.weatherInfo = {
        temp: data.main.temp,
        main: data.weather[0].main,
        description: data.weather[0].description
    };
    debugger;
    console.log('Hi Vineet bro');
    
})
.catch(error=>{
    this.error=error;
    console.log(this.error);
});
}
}