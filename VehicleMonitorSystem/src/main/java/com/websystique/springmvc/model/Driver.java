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

import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name = "DRIVERS")
public class Driver implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Integer id;

	@NotEmpty
	@Column(name = "FULLNAME", nullable = false)
	private String fullName;

	@DateTimeFormat(pattern = "dd/mm/yyyy")
	@Past(message = "Birth Date should not be a future date.")
	@Column(name = "BIRTHDATE", nullable = true)
	@Temporal(TemporalType.DATE)
	private Date birthdate;

	@DateTimeFormat(pattern = "dd/mm/yyyy")
	@Column(name = "JOININGDATE", nullable = true)
	@Temporal(TemporalType.DATE)
	private Date joiningdate;

	@NotEmpty
	@Column(name = "GENDER", nullable = false)
	private String gender;

	
	@Column(name = "DRIVERSTATUS", nullable = false)
	private String driverstatus;

	@Column(name = "PHONE", nullable = false)
	private String phone;
	
	@Column(name = "PHONE2", nullable = false)
	private String phone2;
	
	@Column(name = "PROOF", nullable = false)
	private String proof;
	
	@Column(name = "DEACTIVATIONDATE", nullable = false)
	private String deactivationdate;

	@Valid
	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "ADDRESSID")
	private Address address;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getFullName() {
		return fullName;
	}

	public void setFullName(String fullName) {
		this.fullName = fullName;
	}

	public Date getBirthdate() {
		return birthdate;
	}

	public void setBirthdate(Date birthdate) {
		this.birthdate = birthdate;
	}

	public Date getJoiningdate() {
		return joiningdate;
	}

	public void setJoiningdate(Date joiningdate) {
		this.joiningdate = joiningdate;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getDriverstatus() {
		return driverstatus;
	}

	public void setDriverstatus(String driverstatus) {
		this.driverstatus = driverstatus;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getPhone2() {
		return phone2;
	}

	public void setPhone2(String phone2) {
		this.phone2 = phone2;
	}

	public String getProof() {
		return proof;
	}

	public void setProof(String proof) {
		this.proof = proof;
	}

	public String getDeactivationdate() {
		return deactivationdate;
	}

	public void setDeactivationdate(String deactivationdate) {
		this.deactivationdate = deactivationdate;
	}

	public Address getAddress() {
		return address;
	}

	public void setAddress(Address address) {
		this.address = address;
	}
	
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((id == null) ? 0 : id.hashCode());
		result = prime * result + ((fullName == null) ? 0 : fullName.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (!(obj instanceof Driver))
			return false;
		Driver other = (Driver) obj;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		if (fullName == null) {
			if (other.fullName != null)
				return false;
		} else if (!fullName.equals(other.fullName))
			return false;
		return true;
	}
	
	@Override
	public String toString() {
		return "Driver [id=" + id + ", fullName=" + fullName + ", birthdate=" + birthdate
				+ ", joiningdate=" + joiningdate + ", gender=" + gender
				+ ", driverstatus=" + driverstatus + ",phone="+	phone
				+ ", proof=" + proof + ",deactivationdate="+	deactivationdate
				+ ", address=" + address
				+", phone2=" +phone2+"]";
	}
	
	

}
