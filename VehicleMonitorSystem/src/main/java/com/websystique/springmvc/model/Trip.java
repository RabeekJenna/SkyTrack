package com.websystique.springmvc.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.validator.constraints.NotEmpty;

@Entity
@Table(name = "TRIPS")
public class Trip implements Serializable {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;

	@NotEmpty
	@Column(name = "TRIPID", unique = true, nullable = false)
	private String tripid;

	@NotEmpty
	@Column(name = "tripFrom", nullable = false)
	private String tripFrom;

	@NotEmpty
	@Column(name = "tripTo", nullable = false)
	private String tripTo;

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

	public String getTripFrom() {
		return tripFrom;
	}

	public void setTripFrom(String tripFrom) {
		this.tripFrom = tripFrom;
	}

	public String getTripTo() {
		return tripTo;
	}

	public void setTripTo(String tripTo) {
		this.tripTo = tripTo;
	}

	@Override
	public String toString() {
		return "Trip [id=" + id + ", tripid=" + tripid + ", tripFrom=" + tripFrom + ", tripTo=" + tripTo + "]";
	}
}
