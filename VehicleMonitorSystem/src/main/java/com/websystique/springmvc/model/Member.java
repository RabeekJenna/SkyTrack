package com.websystique.springmvc.model;

public class Member {
	
	private String drivername ="";
	private String drivermobile="";
	
	
	 
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



	@Override
		public String toString() {
			return "Memeber [drivername=" + drivername + ", drivermobile=" + drivermobile + "]";
		}

}
