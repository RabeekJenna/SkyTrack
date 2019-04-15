package com.websystique.springmvc.model;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.hibernate.validator.constraints.NotEmpty;

@Entity
@Table(name = "TRIPS")
public class Trip implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;

	@NotEmpty
	@Column(name = "TRIPID", unique = true, nullable = false)
	private String tripid;
	
	@Column(name = "TRIPFROM")
	private String tripfrom;
	
	@Column(name="TRIPDATE", nullable=true)
	@Temporal(TemporalType.DATE)
	private Date tripdate;
	
	@Column(name = "TRIPTO")
	private String tripTo;
	
	@Column(name="BOOKINGS")
	private String bookings;
	
	@Column(name="TRIPTYPE")
	private String triptype;
	
	@Column(name="CUSTOMERNAME")
	private String  customername;
	
	@Column(name="CUSTOMERPHONE")
	private String  customerphone;
	
	@Column(name="PICKLOCATION")
	private String pickup;
	
	@Column(name="DROPLOCATION")
	private String drop;
	
	@Column(name="TRIPDRIVER")
	private String tripDriver;
	
	@Column(name="TRIPVEHICLE")
	private String tripVehicle;
	
	@Column(name="DRIVERPHONE")
	private String driverphone;
	
	@Column(name="OPENKM")
	private double openkm;
	
	@Column(name="CLOSEKM")
	private double closekm;
	
	@Column(name="AMOUNT")
	private double amount;
	
	@Column(name="COMMENTS")
	private String comments;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getTripid() {
		return tripid;
	}

	public void setTripid(String tripid) {
		this.tripid = tripid;
	}

	public String getTripTo() {
		return tripTo;
	}

	public void setTripTo(String tripTo) {
		this.tripTo = tripTo;
	}
	
	

	public String getTripfrom() {
		return tripfrom;
	}

	public void setTripfrom(String tripfrom) {
		this.tripfrom = tripfrom;
	}

	public String getBookings() {
		return bookings;
	}

	public void setBookings(String bookings) {
		this.bookings = bookings;
	}

	public String getTriptype() {
		return triptype;
	}

	public void setTriptype(String triptype) {
		this.triptype = triptype;
	}

	public String getCustomername() {
		return customername;
	}

	public void setCustomername(String customername) {
		this.customername = customername;
	}

	public String getCustomerphone() {
		return customerphone;
	}

	public Date getTripdate() {
		return tripdate;
	}

	public void setTripdate(Date tripdate) {
		this.tripdate = tripdate;
	}

	public void setCustomerphone(String customerphone) {
		this.customerphone = customerphone;
	}

	public String getPickup() {
		return pickup;
	}

	public void setPickup(String pickup) {
		this.pickup = pickup;
	}

	public String getDrop() {
		return drop;
	}

	public void setDrop(String drop) {
		this.drop = drop;
	}

	public String getTripDriver() {
		return tripDriver;
	}

	public void setTripDriver(String tripDriver) {
		this.tripDriver = tripDriver;
	}

	public String getTripVehicle() {
		return tripVehicle;
	}

	public void setTripVehicle(String tripVehicle) {
		this.tripVehicle = tripVehicle;
	}

	public String getDriverphone() {
		return driverphone;
	}

	public void setDriverphone(String driverphone) {
		this.driverphone = driverphone;
	}

	public double getOpenkm() {
		return openkm;
	}

	public void setOpenkm(double openkm) {
		this.openkm = openkm;
	}

	public double getClosekm() {
		return closekm;
	}

	public void setClosekm(double closekm) {
		this.closekm = closekm;
	}

	public double getAmount() {
		return amount;
	}

	public void setAmount(double amount) {
		this.amount = amount;
	}

	public String getComments() {
		return comments;
	}

	public void setComments(String comments) {
		this.comments = comments;
	}

	@Override
	public String toString() {
		return "Trip [id=" + id + ", tripid=" + tripid + ", tripfrom=" + tripfrom + ", tripTo=" + tripTo + 
				", bookings="+bookings+", triptype="+triptype+", customername="+customername+", pickup="+pickup+
				", drop="+drop+", tripDriver="+tripDriver+", tripVehicle="+tripVehicle+", driverphone="+driverphone+
				", openkm="+openkm+", closekm="+closekm+", amount="+amount+", comments="+comments+
				"]";
	}
}
