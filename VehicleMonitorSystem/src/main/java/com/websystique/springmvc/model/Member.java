package com.websystique.springmvc.model;

public class Member {
	
	private String drivername ="";
	private String drivermobile ="";
	private String customername ="";
	private String customermobile ="";
	private String dateoftrip ="";
	private String timeoftrip ="";
	private String fromtrip = "";
	private String totrip = "";
	private String tripsid = "";
	private String vehicle = "";
	private String pickup = "";
		 
	 public String getDrivername() {
		return drivername;
	}



	public void setDrivername(String drivername) {
		this.drivername = drivername;
	}



	public String getDrivermobile() {
		return drivermobile;
	}



	public void setDrivermobile(String drivermobile) {
		this.drivermobile = drivermobile;
	}



	public String getCustomername() {
		return customername;
	}



	public void setCustomername(String customername) {
		this.customername = customername;
	}



	public String getCustomermobile() {
		return customermobile;
	}



	public void setCustomermobile(String customermobile) {
		this.customermobile = customermobile;
	}



	public String getDateoftrip() {
		return dateoftrip;
	}



	public void setDateoftrip(String dateoftrip) {
		this.dateoftrip = dateoftrip;
	}



	public String getTimeoftrip() {
		return timeoftrip;
	}



	public void setTimeoftrip(String timeoftrip) {
		this.timeoftrip = timeoftrip;
	}



	public String getFromtrip() {
		return fromtrip;
	}



	public void setFromtrip(String fromtrip) {
		this.fromtrip = fromtrip;
	}



	public String getTotrip() {
		return totrip;
	}



	public void setTotrip(String totrip) {
		this.totrip = totrip;
	}



	public String getTripsid() {
		return tripsid;
	}



	public void setTripsid(String tripsid) {
		this.tripsid = tripsid;
	}



	public String getVehicle() {
		return vehicle;
	}



	public void setVehicle(String vehicle) {
		this.vehicle = vehicle;
	}



	public String getPickup() {
		return pickup;
	}



	public void setPickup(String pickup) {
		this.pickup = pickup;
	}



	@Override
		public String toString() {
			return "Memeber [drivername=" + drivername + ", drivermobile=" + drivermobile +
					", customername="+customername+", customermobile="+customermobile+", dateoftrip="+dateoftrip+
					", tripsid="+tripsid+", timeoftrip="+timeoftrip+", fromtrip="+fromtrip+", totrip="+totrip+
					", timeoftrip="+timeoftrip+", vehicle="+vehicle+", pickup="+pickup+
					"]";
		}

}
