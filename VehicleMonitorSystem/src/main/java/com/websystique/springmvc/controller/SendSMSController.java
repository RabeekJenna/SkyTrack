package com.websystique.springmvc.controller;

import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.annotation.JsonView;
import com.websystique.springmvc.model.AjaxResponseBody;
import com.websystique.springmvc.model.Member;
import com.websystique.springmvc.model.Views;

@RestController
public class SendSMSController {

	// @ResponseBody, not necessary, since class is annotated with @RestController
	// @RequestBody - Convert the json data into object (SearchCriteria) mapped by
	// field name.
	// @JsonView(Views.Public.class) - Optional, limited the json data display to
	// client.
	@JsonView(Views.Public.class)
	@RequestMapping(value = "/sendsmstocustomer")
	public AjaxResponseBody getSearchResultViaAjax(@RequestBody Member search) {

		AjaxResponseBody result = new AjaxResponseBody();
		
		      String recipient = "91"+search.getDrivermobile();
		      String message = "Your trip is arriving on the way. Driver: "+search.getDrivername()+" Mobile:"+search.getDrivermobile();
		      String username = "gogetterrafiq";
		      String password = "65816531";
		      String originator = "UPDATE";

		      String requestUrl;
			try {
				requestUrl = "https://www.txtguru.in/imobile/api.php?username=gogetterrafiq&password=65816531&source=UPDATE&dmobile=917358659978&message=TEST+SMS+FROM+TextGuru+SMS+GATEWAY" +
				        "username=" + URLEncoder.encode(username, "UTF-8") +
				        "&password=" + URLEncoder.encode(password, "UTF-8") +
				        "&recipient=" + URLEncoder.encode(recipient, "UTF-8") +
				        "&messagetype=SMS:TEXT" +
				        "&messagedata=" + URLEncoder.encode(message, "UTF-8") +
				        "&originator=" + URLEncoder.encode(originator, "UTF-8") +
				        "&serviceprovider=GSMModem1" +
				        "&responseformat=html";
			


		      URL url = new URL(requestUrl);
		      HttpURLConnection uc = (HttpURLConnection)url.openConnection();
		      System.out.println(uc.getResponseCode());
		      System.out.println(uc.getResponseMessage());

		      uc.disconnect();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		   


		result.setCode("400");
		result.setMsg("Search criteria is empty!");

		// AjaxResponseBody will be converted into json format and send back to client.
		return result;

	}

}
