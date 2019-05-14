package com.websystique.springmvc.controller;

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

		result.setCode("400");
		result.setMsg("Search criteria is empty!");

		// AjaxResponseBody will be converted into json format and send back to client.
		return result;

	}

}
