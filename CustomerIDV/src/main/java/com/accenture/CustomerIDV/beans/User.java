package com.accenture.CustomerIDV.beans;

import java.io.Serializable;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.MapsId;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "CUSTOMER")
public class User implements Serializable {

	private static final long serialVersionUID = 1L;
	@Id
	@Column(name = "CUSTOMERID", unique = true, nullable = false)
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Integer customerid;

	@Column(name = "NAME", nullable = false)
	private String name;

	@Column(name = "ADDRESS", nullable = false)
	private String address;

	@Column(name = "ACCOUNTTYPE")
	private String accounttype;

	@OneToOne(fetch = FetchType.LAZY, mappedBy = "user", cascade = CascadeType.ALL)
	/*
	 * @MapsId
	 * 
	 * @JoinColumn(name = "CUSTOMERID")
	 */
	private UserDetails userDetails;

	public Integer getCustomerid() {
		return customerid;
	}

	public void setCustomerid(Integer customerid) {
		this.customerid = customerid;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public UserDetails getUserDetails() {
		return userDetails;
	}

	public void setUserDetails(UserDetails userDetails) {
		this.userDetails = userDetails;
	}

	public String getAccounttype() {
		return accounttype;
	}

	public void setAccounttype(String accounttype) {
		this.accounttype = accounttype;
	}

	@Override
	public String toString() {
		return "User [customerid=" + customerid + ", name=" + name
				+ ", address=" + address + ", accounttype=" + accounttype
				+ ", userDetails=" + userDetails + "]";
	}
	
	

}
