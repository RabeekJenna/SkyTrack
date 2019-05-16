package com.websystique.springmvc.controller;

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
		String recipient = "91" + search.getCustomermobile();
		String time = search.getTimeoftrip().replaceAll("\\s","");
		String from = search.getFromtrip().replaceAll("\\s","");
		String to= search.getTotrip().replaceAll("\\s","");
	    String vehilce= search.getVehicle().replaceAll("\\s","");
	    String driver = search.getDrivername().replaceAll("\\s","");
		String message = "Your+trip+Details:+Date:+"+search.getDateoftrip()+".+Time:+"+time+".+From:+"+from+"++To:+"+to+".+Vehicle+no:+"+vehilce+".+Driver:+"+driver+".+Mobile:+"+search.getDrivermobile();
		String username = "gogetterrafiq";
		String password = "65816531";
		String originator = "SKYCAB";
		String requestUrl;
		try {
			requestUrl = "https://www.txtguru.in/imobile/api.php?username=" + username + "&password=" + password
					+ "&source=" + originator + "&dmobile=" + recipient + "&message=" + message + "&username="
					+ URLEncoder.encode(username, "UTF-8") + "&password=" + URLEncoder.encode(password, "UTF-8")
					+ "&recipient=" + URLEncoder.encode(recipient, "UTF-8") + "&messagetype=SMS:TEXT" + "&messagedata="
					+ URLEncoder.encode(message, "UTF-8") + "&originator=" + URLEncoder.encode(originator, "UTF-8")
					+ "&serviceprovider=GSMModem1" + "&responseformat=html";
			URL url = new URL(requestUrl);
			HttpURLConnection uc = (HttpURLConnection) url.openConnection();
			if(uc.getResponseCode()==200)
				result.setMsg("SMS sent successfully to Customer..!");
			else
				result.setMsg("Problem in sent SMS. Please contact Admin...");
			uc.disconnect();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	@JsonView(Views.Public.class)
	@RequestMapping(value = "/sendsmstodriver")
	public AjaxResponseBody sendSMStoDrivers(@RequestBody Member search) {

		AjaxResponseBody result = new AjaxResponseBody();
		String recipient = "91" + search.getDrivermobile();
		String time = search.getTimeoftrip().replaceAll("\\s","");
		String from = search.getFromtrip().replaceAll("\\s","");
		String to= search.getTotrip().replaceAll("\\s","");
	    String customer = search.getCustomername().replaceAll("\\s","");
	    String pickup = search.getPickup().replaceAll("\\s","");
		String message = "Trip+Details:++TRIPID:+"+search.getTripsid()+".+Date:+"+search.getDateoftrip()+".+Time:+"+time+".+From:+"+from+".+To:+"+to+".+Pickup+Location:+"+pickup+".+Customer:+"+customer+".+Mobile:+"+ search.getCustomermobile();
		String username = "gogetterrafiq";
		String password = "65816531";
		String originator = "SKYCAB";
		String requestUrl;
		try {
			requestUrl = "https://www.txtguru.in/imobile/api.php?username=" + username + "&password=" + password
					+ "&source=" + originator + "&dmobile=" + recipient + "&message=" + message + "&username="
					+ URLEncoder.encode(username, "UTF-8") + "&password=" + URLEncoder.encode(password, "UTF-8")
					+ "&recipient=" + URLEncoder.encode(recipient, "UTF-8") + "&messagetype=SMS:TEXT" + "&messagedata="
					+ URLEncoder.encode(message, "UTF-8") + "&originator=" + URLEncoder.encode(originator, "UTF-8")
					+ "&serviceprovider=GSMModem1" + "&responseformat=html";
			URL url = new URL(requestUrl);
			HttpURLConnection uc = (HttpURLConnection) url.openConnection();
			if(uc.getResponseCode()==200)
				result.setMsg("SMS sent successfully to Driver..!");
			else
				result.setMsg("Problem in sent SMS. Please contact Admin...");
			uc.disconnect();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

}
