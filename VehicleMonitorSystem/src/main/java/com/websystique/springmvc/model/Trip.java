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

import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;
import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name = "TRIPS")
public class Trip implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Integer id;

	@NotEmpty
	@Column(name = "TRIPID", unique = true, nullable = false)
	private String tripid;
	
	@Column(name = "TRIPTIME")
	private String triptime;
	
	@Column(name = "FOLLOWUP")
	private String followup;
	
	@Column(name = "TRIPFROM")
	private String tripfrom;
	
	@Column(name="TRIPDATE", nullable=true)
	@Temporal(TemporalType.DATE)
	@DateTimeFormat(pattern  = "dd/MM/yyyy")
	private Date tripdate;
	
	@Column(name = "TRIPTO")
	private String tripto;
	
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
	private String tripdriver;
	
	@Column(name="TRIPVEHICLE")
	private String tripvehicle;
	
	@Column(name="DRIVERPHONE")
	private String driverphone;
	
	@Column(name="OPENKM")
	private String openkm;
	
	@Column(name="CLOSEKM")
	private String closekm;
	
	@Column(name="AMOUNT")
	private String tripamount;
	
	@Column(name="LIMITKM")
	private String limitkm;
	
	@Column(name="EXTRAKM")
	private String extrakm;
	
	@Column(name="NIGHTCHARGE")
	private String nightcharge;
	
	@Column(name="STARTINGOTP")
	private String startingotp;
	
	@Column(name="COMMENTS")
	private String comments;
	
	@Column(name="CREATEDATE")
	@Temporal(TemporalType.TIMESTAMP)
	@CreationTimestamp
	private Date createdate;
	
	@Column(name="CREATEUSER")
	private String createuser;
	
	@Column(name="UPDATEDATE")
	@Temporal(TemporalType.TIMESTAMP)
	@UpdateTimestamp
	private Date updatedate;
	
	@Column(name="UPDATEUSER")
	private String updateuser;
	
	@Column(name="TEMPTRIPID")
	private String temptripid;
	
	
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

	public String getTripto() {
		return tripto;
	}

	public void setTripto(String tripto) {
		this.tripto = tripto;
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

	public String getFollowup() {
		return followup;
	}

	public void setFollowup(String followup) {
		this.followup = followup;
	}

	public String getTriptime() {
		return triptime;
	}

	public void setTriptime(String triptime) {
		this.triptime = triptime;
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

	public String getStartingotp() {
		return startingotp;
	}

	public void setStartingotp(String startingotp) {
		this.startingotp = startingotp;
	}

	public String getDrop() {
		return drop;
	}

	public void setDrop(String drop) {
		this.drop = drop;
	}

	public String getTripdriver() {
		return tripdriver;
	}

	public String getTemptripid() {
		return temptripid;
	}

	public void setTemptripid(String temptripid) {
		this.temptripid = temptripid;
	}

	public void setTripdriver(String tripdriver) {
		this.tripdriver = tripdriver;
	}

	public String getTripvehicle() {
		return tripvehicle;
	}

	public void setTripvehicle(String tripvehicle) {
		this.tripvehicle = tripvehicle;
	}

	public String getDriverphone() {
		return driverphone;
	}

	public void setDriverphone(String driverphone) {
		this.driverphone = driverphone;
	}

	public String getOpenkm() {
		return openkm;
	}

	public void setOpenkm(String openkm) {
		this.openkm = openkm;
	}

	public String getClosekm() {
		return closekm;
	}

	public void setClosekm(String closekm) {
		this.closekm = closekm;
	}

	public String getTripamount() {
		return tripamount;
	}

	public void setTripamount(String tripamount) {
		this.tripamount = tripamount;
	}

	public String getComments() {
		return comments;
	}

	public void setComments(String comments) {
		this.comments = comments;
	}

	public Date getCreatedate() {
		return createdate;
	}

	public void setCreatedate(Date createdate) {
		this.createdate = createdate;
	}

	public String getCreateuser() {
		return createuser;
	}

	public void setCreateuser(String createuser) {
		this.createuser = createuser;
	}

	public Date getUpdatedate() {
		return updatedate;
	}

	public void setUpdatedate(Date updatedate) {
		this.updatedate = updatedate;
	}

	public String getUpdateuser() {
		return updateuser;
	}

	public void setUpdateuser(String updateuser) {
		this.updateuser = updateuser;
	}
	
	public String getLimitkm() {
		return limitkm;
	}

	public void setLimitkm(String limitkm) {
		this.limitkm = limitkm;
	}

	public String getExtrakm() {
		return extrakm;
	}

	public void setExtrakm(String extrakm) {
		this.extrakm = extrakm;
	}

	public String getNightcharge() {
		return nightcharge;
	}

	public void setNightcharge(String nightcharge) {
		this.nightcharge = nightcharge;
	}

	@Override
	public String toString() {
		return "Trip [id=" + id + ", tripid=" + tripid + ", tripfrom=" + tripfrom + ", tripto=" + tripto + 
				", bookings="+bookings+", triptype="+triptype+", customername="+customername+", pickup="+pickup+
				", drop="+drop+", tripdriver="+tripdriver+", tripvehicle="+tripvehicle+", driverphone="+driverphone+
				", openkm="+openkm+", closekm="+closekm+", tripamount="+tripamount+", comments="+comments+
				", createdate="+createdate+", createuser="+createuser+", updatedate="+updatedate+", updateuser="+updateuser+
				"]";
	}
}
