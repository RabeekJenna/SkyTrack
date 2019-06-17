package com.websystique.springmvc.controller;

import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.annotation.JsonView;
import com.websystique.springmvc.model.AjaxResponseBody;
import com.websystique.springmvc.model.Member;
import com.websystique.springmvc.model.Views;
import com.websystique.springmvc.service.TripService;


@RestController
public class SendSMSController {
	

	@Autowired
	TripService tripService;

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
	
	
	@JsonView(Views.Public.class)
	@RequestMapping(value = "/gettripamount1")
	public AjaxResponseBody getTripAmount1(@RequestBody Member search) {

		AjaxResponseBody result = new AjaxResponseBody();
		String tripid1 = search.getTripid1().replaceAll("\\s","");
		String tripamt = tripService.findTripAmount(tripid1);
		try {
			result.setMsg(tripamt);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	@JsonView(Views.Public.class)
	@RequestMapping(value = "/gettripamount2")
	public AjaxResponseBody getTripAmount2(@RequestBody Member search) {

		AjaxResponseBody result = new AjaxResponseBody();
		String tripid2 = search.getTripid2().replaceAll("\\s","");
		String tripamt2 = tripService.findTripAmount(tripid2);
		try {
			result.setMsg(tripamt2);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	@JsonView(Views.Public.class)
	@RequestMapping(value = "/gettripamount3")
	public AjaxResponseBody getTripAmount3(@RequestBody Member search) {

		AjaxResponseBody result = new AjaxResponseBody();
		String tripid3 = search.getTripid3().replaceAll("\\s","");
		String tripamt3 = tripService.findTripAmount(tripid3);
		try {
			result.setMsg(tripamt3);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	@JsonView(Views.Public.class)
	@RequestMapping(value = "/gettripamount4")
	public AjaxResponseBody getTripAmount4(@RequestBody Member search) {

		AjaxResponseBody result = new AjaxResponseBody();
		String tripid4 = search.getTripid4().replaceAll("\\s","");
		String tripamt4 = tripService.findTripAmount(tripid4);
		try {
			result.setMsg(tripamt4);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	@JsonView(Views.Public.class)
	@RequestMapping(value = "/gettripamount5")
	public AjaxResponseBody getTripAmount5(@RequestBody Member search) {

		AjaxResponseBody result = new AjaxResponseBody();
		String tripid5 = search.getTripid5().replaceAll("\\s","");
		String tripamt5 = tripService.findTripAmount(tripid5);
		try {
			result.setMsg(tripamt5);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	@JsonView(Views.Public.class)
	@RequestMapping(value = "/gettripamount6")
	public AjaxResponseBody getTripAmount6(@RequestBody Member search) {

		AjaxResponseBody result = new AjaxResponseBody();
		String tripid6 = search.getTripid6().replaceAll("\\s","");
		String tripamt6 = tripService.findTripAmount(tripid6);
		try {
			result.setMsg(tripamt6);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	@JsonView(Views.Public.class)
	@RequestMapping(value = "/gettripamount7")
	public AjaxResponseBody getTripAmount7(@RequestBody Member search) {

		AjaxResponseBody result = new AjaxResponseBody();
		String tripid7 = search.getTripid7().replaceAll("\\s","");
		String tripamt7 = tripService.findTripAmount(tripid7);
		try {
			result.setMsg(tripamt7);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	@JsonView(Views.Public.class)
	@RequestMapping(value = "/gettripamount8")
	public AjaxResponseBody getTripAmount8(@RequestBody Member search) {

		AjaxResponseBody result = new AjaxResponseBody();
		String tripid8 = search.getTripid8().replaceAll("\\s","");
		String tripamt8 = tripService.findTripAmount(tripid8);
		try {
			result.setMsg(tripamt8);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	@JsonView(Views.Public.class)
	@RequestMapping(value = "/gettripamount9")
	public AjaxResponseBody getTripAmount9(@RequestBody Member search) {

		AjaxResponseBody result = new AjaxResponseBody();
		String tripid9 = search.getTripid9().replaceAll("\\s","");
		String tripamt9 = tripService.findTripAmount(tripid9);
		try {
			result.setMsg(tripamt9);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	@JsonView(Views.Public.class)
	@RequestMapping(value = "/gettripamount10")
	public AjaxResponseBody getTripAmount10(@RequestBody Member search) {

		AjaxResponseBody result = new AjaxResponseBody();
		String tripid10 = search.getTripid10().replaceAll("\\s","");
		String tripamt10 = tripService.findTripAmount(tripid10);
		try {
			result.setMsg(tripamt10);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	

}
