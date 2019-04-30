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
@Table(name = "VEHICLES")
public class Vehicle implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Integer id;

	@NotEmpty
	@Column(name = "MODEL", nullable = false)
	private String model;

	@Column(name = "VEHICLESTATUS", nullable = true)
	private String vehiclestatus;

	@Column(name = "REGNO", nullable = true)
	private String regNo;
	
	@Column(name ="ENGCHASENO", nullable = true)
	private String engChaseNo;
	
	@Column(name ="IMEINO", nullable = true)
	private String imeiNO;



	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}
	
	public String getModel() {
		return model;
	}

	public void setModel(String model) {
		this.model = model;
	}

	public String getVehiclestatus() {
		return vehiclestatus;
	}

	public void setVehiclestatus(String vehiclestatus) {
		this.vehiclestatus = vehiclestatus;
	}

	public String getRegNo() {
		return regNo;
	}

	public void setRegNo(String regNo) {
		this.regNo = regNo;
	}
	
	public String getEngChaseNo() {
		return engChaseNo;
	}

	public void setEngChaseNo(String engChaseNo) {
		this.engChaseNo = engChaseNo;
	}

	public String getImeiNO() {
		return imeiNO;
	}

	public void setImeiNO(String imeiNO) {
		this.imeiNO = imeiNO;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((id == null) ? 0 : id.hashCode());
		result = prime * result + ((model == null) ? 0 : model.hashCode());
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
		Vehicle other = (Vehicle) obj;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		if (model == null) {
			if (other.model != null)
				return false;
		} else if (!model.equals(other.model))
			return false;
		return true;
	}

	


	
	@Override
	public String toString() {
		return "Vehicle [id=" + id + ", model=" + model + ", regNo=" + regNo + ",vehiclestatus="+vehiclestatus+",regNo="+regNo+",engChaseNo="+engChaseNo+",imeiNO="+imeiNO+"]";
	}

}
