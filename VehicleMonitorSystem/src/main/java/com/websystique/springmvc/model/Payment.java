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
	
	@Column(name = "INCOME", nullable = true)
	private String income;
	
	@Column(name = "COLLECTEDBY", nullable = true)
	private String collectedby;
	
	@Column(name = "COLLECTEDON", nullable = true)
	@Temporal(TemporalType.TIMESTAMP)
	@CreationTimestamp
	@DateTimeFormat(pattern  = "dd/MM/yyyy HH:mm a")
	private Date collectedon;
	
	@Column(name = "COMMENTS", nullable = true)
	private String comments;
	
	@Column(name = "TRIPID1", nullable = true)
	private String tripid1;
	
	@Column(name = "TRIPID2", nullable = true)
	private String tripid2;
	
	@Column(name = "TRIPID3", nullable = true)
	private String tripid3;
	
	@Column(name = "TRIPID4", nullable = true)
	private String tripid4;
	
	@Column(name = "TRIPID5", nullable = true)
	private String tripid5;
	
	@Column(name = "TRIPID6", nullable = true)
	private String tripid6;
	
	@Column(name = "TRIPID7", nullable = true)
	private String tripid7;
	
	@Column(name = "TRIPID8", nullable = true)
	private String tripid8;
	
	@Column(name = "TRIPID9", nullable = true)
	private String tripid9;
	
	@Column(name = "TRIPID10", nullable = true)
	private String tripid10;
	
	@Column(name = "TRIPAMOUNT1", nullable = true)
	private String tripamount1;
	
	@Column(name = "TRIPAMOUNT2", nullable = true)
	private String tripamount2;
	
	@Column(name = "TRIPAMOUNT3", nullable = true)
	private String tripamount3;
	
	@Column(name = "TRIPAMOUNT4", nullable = true)
	private String tripamount4;
	
	@Column(name = "TRIPAMOUNT5", nullable = true)
	private String tripamount5;
	
	@Column(name = "TRIPAMOUNT6", nullable = true)
	private String tripamount6;
	
	@Column(name = "TRIPAMOUNT7", nullable = true)
	private String tripamount7;
	
	@Column(name = "TRIPAMOUNT8", nullable = true)
	private String tripamount8;
	
	@Column(name = "TRIPAMOUNT9", nullable = true)
	private String tripamount9;
	
	@Column(name = "TRIPAMOUNT10", nullable = true)
	private String tripamount10;
	
		
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

	public String getCollectedby() {
		return collectedby;
	}

	public void setCollectedby(String collectedby) {
		this.collectedby = collectedby;
	}

	public Date getCollectedon() {
		return collectedon;
	}

	public void setCollectedon(Date collectedon) {
		this.collectedon = collectedon;
	}

	public String getComments() {
		return comments;
	}

	public void setComments(String comments) {
		this.comments = comments;
	}


	public String getIncome() {
		return income;
	}

	public void setIncome(String income) {
		this.income = income;
	}

	public String getTripid1() {
		return tripid1;
	}

	public void setTripid1(String tripid1) {
		this.tripid1 = tripid1;
	}

	public String getTripid2() {
		return tripid2;
	}

	public void setTripid2(String tripid2) {
		this.tripid2 = tripid2;
	}

	public String getTripid3() {
		return tripid3;
	}

	public void setTripid3(String tripid3) {
		this.tripid3 = tripid3;
	}

	public String getTripid4() {
		return tripid4;
	}

	public void setTripid4(String tripid4) {
		this.tripid4 = tripid4;
	}

	public String getTripid5() {
		return tripid5;
	}

	public void setTripid5(String tripid5) {
		this.tripid5 = tripid5;
	}

	public String getTripid6() {
		return tripid6;
	}

	public void setTripid6(String tripid6) {
		this.tripid6 = tripid6;
	}

	public String getTripid7() {
		return tripid7;
	}

	public void setTripid7(String tripid7) {
		this.tripid7 = tripid7;
	}

	public String getTripid8() {
		return tripid8;
	}

	public void setTripid8(String tripid8) {
		this.tripid8 = tripid8;
	}

	public String getTripid9() {
		return tripid9;
	}

	public void setTripid9(String tripid9) {
		this.tripid9 = tripid9;
	}

	public String getTripid10() {
		return tripid10;
	}

	public void setTripid10(String tripid10) {
		this.tripid10 = tripid10;
	}

	public String getTripamount1() {
		return tripamount1;
	}

	public void setTripamount1(String tripamount1) {
		this.tripamount1 = tripamount1;
	}

	public String getTripamount2() {
		return tripamount2;
	}

	public void setTripamount2(String tripamount2) {
		this.tripamount2 = tripamount2;
	}

	public String getTripamount3() {
		return tripamount3;
	}

	public void setTripamount3(String tripamount3) {
		this.tripamount3 = tripamount3;
	}

	public String getTripamount4() {
		return tripamount4;
	}

	public void setTripamount4(String tripamount4) {
		this.tripamount4 = tripamount4;
	}

	public String getTripamount5() {
		return tripamount5;
	}

	public void setTripamount5(String tripamount5) {
		this.tripamount5 = tripamount5;
	}

	public String getTripamount6() {
		return tripamount6;
	}

	public void setTripamount6(String tripamount6) {
		this.tripamount6 = tripamount6;
	}

	public String getTripamount7() {
		return tripamount7;
	}

	public void setTripamount7(String tripamount7) {
		this.tripamount7 = tripamount7;
	}

	public String getTripamount8() {
		return tripamount8;
	}

	public void setTripamount8(String tripamount8) {
		this.tripamount8 = tripamount8;
	}

	public String getTripamount9() {
		return tripamount9;
	}

	public void setTripamount9(String tripamount9) {
		this.tripamount9 = tripamount9;
	}

	public String getTripamount10() {
		return tripamount10;
	}

	public void setTripamount10(String tripamount10) {
		this.tripamount10 = tripamount10;
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
		return "Payment [paymentsid=" + paymentsid + ",  advanceAmount=" + advanceAmount
				+ ", income=" + income 
				+ ", tripid1=" + tripid1 + ", tripamount1=" + tripamount1
				+ ", tripid2=" + tripid2 + ", tripamount2=" + tripamount2
				+ ", tripid3=" + tripid3 + ", tripamount3=" + tripamount3
				+ ", tripid4=" + tripid4 + ", tripamount4=" + tripamount4
				+ ", tripid5=" + tripid5 + ", tripamount5=" + tripamount5
				+ ", tripid6=" + tripid6 + ", tripamount6=" + tripamount6
				+ ", tripid7=" + tripid7 + ", tripamount7=" + tripamount7
				+ ", tripid8=" + tripid8 + ", tripamount8=" + tripamount8
				+ ", tripid9=" + tripid9 + ", tripamount9=" + tripamount9
				+ ", tripid10=" + tripid10 + ", tripamount10=" + tripamount10
				+ ", driverBata=" + driverBata + ", tollExpense=" + tollExpense
				+ ", food=" + food + ", diesel=" + diesel+", other=" + other 
				+ ", totalAmount=" + totalAmount + ",paymentDate="+	paymentDate
				+", createdate="+createdate+", createuser="+createuser+", updatedate="+updatedate+", updateuser="+updateuser
				+ ",collectedby="+	collectedby
				+ ", collectedon=" + collectedon
				+", comments=" +comments+"]";
	}

	

}
