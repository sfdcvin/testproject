public class SoapApiExample {
    public static void callSoapApi() {
        // Define the endpoint (Replace with the actual SOAP service URL)
        String endpoint = 'http://www.dneonline.com/calculator.asmx';

        // Construct the SOAP envelope
        String soapRequest = 
        '<?xml version="1.0" encoding="utf-8"?>' +
        '<soap:Envelope xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/">' +
        '  <soap:Body>' +
        '    <Add xmlns="http://tempuri.org/">' +
        '      <intA>5</intA>' +  // Replace with the first integer
        '      <intB>10</intB>' + // Replace with the second integer
        '    </Add>' +
        '  </soap:Body>' +
        '</soap:Envelope>';

        // Create an HTTP request
        HttpRequest req = new HttpRequest();
        req.setEndpoint(endpoint);
        req.setMethod('POST');
        req.setHeader('Content-Type', 'text/xml; charset=UTF-8');
        req.setHeader('SOAPAction', 'http://tempuri.org/Add'); // SOAPAction header is necessary
        req.setBody(soapRequest);

        // Send the request and receive the response
        Http http = new Http();
        HttpResponse res = http.send(req);

        // Log the response
        System.debug('Response: ' + res.getBody());

        // Handle the response if needed (example for parsing the result)
        if (res.getStatusCode() == 200) {
            Dom.Document doc = res.getBodyDocument();
            Dom.XMLNode responseNode = doc.getRootElement().getChildElement('Body', 'http://schemas.xmlsoap.org/soap/envelope/').getChildElement('AddResponse', 'http://tempuri.org/').getChildElement('AddResult', 'http://tempuri.org/');
            String result = responseNode.getText();
            System.debug('Addition Result: ' +result);
        } else {
            System.debug('Failed with status code: ' + res.getStatusCode());
        }
    }
}