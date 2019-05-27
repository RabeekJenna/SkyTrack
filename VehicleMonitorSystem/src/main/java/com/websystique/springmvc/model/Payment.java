package com.websystique.springmvc.model;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.Valid;
import javax.validation.constraints.Past;

import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;
import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name = "PAYMENTS")
public class Payment implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Integer paymentsid;
	
	@Column(name = "ADVANCEAMOUNT", nullable = true)
	private String advanceAmount;
	
	@Column(name = "DRIVERBATA", nullable = true)
	private String driverBata;
	
	@Column(name = "TOLLEXPENSE", nullable = true)
	private String tollExpense;

	@Column(name = "FOOD", nullable = true)
	private String food;
	
	@Column(name = "DIESEL", nullable = true)
	private String diesel;
	
	@Column(name = "OTHER", nullable = true)
	private String other;
	
	@Column(name = "TOTALEXPENSE", nullable = true)
	private String totalExpense;
	
	@Column(name = "TOTALAMOUNT", nullable = true)
	private String totalAmount;
	
	@Column(name = "PAYMENTDATE", nullable = true)
	@Temporal(TemporalType.DATE)
	@DateTimeFormat(pattern  = "dd/MM/yyyy")
	private Date paymentDate;
	
	@Column(name = "AMOUNTTOPAY", nullable = true)
	private String amounttopay;
	
	@Column(name = "COLLECTEDBY", nullable = true)
	private String collectedby;
	
	@Column(name = "COLLECTEDON", nullable = true)
	private String collectedon;
	
	@Column(name = "COMMENTS", nullable = true)
	private String comments;
	
	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "TRIPID")
	private Trip trip;
	
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
	

	public Integer getPaymentsid() {
		return paymentsid;
	}

	public void setPaymentsid(Integer paymentsid) {
		this.paymentsid = paymentsid;
	}

	public String getAdvanceAmount() {
		return advanceAmount;
	}

	public void setAdvanceAmount(String advanceAmount) {
		this.advanceAmount = advanceAmount;
	}

	public String getDriverBata() {
		return driverBata;
	}

	public void setDriverBata(String driverBata) {
		this.driverBata = driverBata;
	}

	public String getTollExpense() {
		return tollExpense;
	}

	public void setTollExpense(String tollExpense) {
		this.tollExpense = tollExpense;
	}

	public String getFood() {
		return food;
	}

	public void setFood(String food) {
		this.food = food;
	}

	public String getDiesel() {
		return diesel;
	}

	public void setDiesel(String diesel) {
		this.diesel = diesel;
	}

	public String getOther() {
		return other;
	}

	public void setOther(String other) {
		this.other = other;
	}

	public String getTotalExpense() {
		return totalExpense;
	}

	public void setTotalExpense(String totalExpense) {
		this.totalExpense = totalExpense;
	}

	public String getTotalAmount() {
		return totalAmount;
	}

	public void setTotalAmount(String totalAmount) {
		this.totalAmount = totalAmount;
	}

	public Date getPaymentDate() {
		return paymentDate;
	}

	public void setPaymentDate(Date paymentDate) {
		this.paymentDate = paymentDate;
	}

	public String getAmounttopay() {
		return amounttopay;
	}

	public void setAmounttopay(String amounttopay) {
		this.amounttopay = amounttopay;
	}

	public String getCollectedby() {
		return collectedby;
	}

	public void setCollectedby(String collectedby) {
		this.collectedby = collectedby;
	}

	public String getCollectedon() {
		return collectedon;
	}

	public void setCollectedon(String collectedon) {
		this.collectedon = collectedon;
	}

	public String getComments() {
		return comments;
	}

	public void setComments(String comments) {
		this.comments = comments;
	}


	public Trip getTrip() {
		return trip;
	}

	public void setTrip(Trip trip) {
		this.trip = trip;
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

	@Override
	public String toString() {
		return "Payment [paymentsid=" + paymentsid + ", trip=" + trip + ", advanceAmount=" + advanceAmount
				+ ", driverBata=" + driverBata + ", tollExpense=" + tollExpense
				+ ", totalAmount=" + totalAmount + ",paymentDate="+	paymentDate
				+", createdate="+createdate+", createuser="+createuser+", updatedate="+updatedate+", updateuser="+updateuser
				+ ", amounttopay=" + amounttopay + ",collectedby="+	collectedby
				+ ", collectedon=" + collectedon
				+", comments=" +comments+"]";
	}

	

}
