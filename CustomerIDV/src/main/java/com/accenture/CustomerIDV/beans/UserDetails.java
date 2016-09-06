package com.accenture.CustomerIDV.beans;

import java.io.Serializable;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;
import org.hibernate.annotations.Parameter;

@Entity
@Table(name = "USERDETAILS")
public class UserDetails implements Serializable {

	private static final long serialVersionUID = 1L;

	@Column(name = "BIRTHDAY")
	private String birthday;

	@GenericGenerator(name = "generator", strategy = "foreign", parameters = @Parameter(name = "property", value = "user"))
	@Id
	@GeneratedValue(generator = "generator")
	@Column(name = "CUSTOMERID", unique = true,nullable = false)
	private Integer customerid;

	@Column(name = "PHONENO")
	private String phoneno;

	@Column(name = "EMAILID")
	private String emailID;

	@Column(name = "GENDER")
	private String gender;

	@Column(name = "BALANCE")
	private String balance;

	@OneToOne(fetch = FetchType.LAZY , cascade = CascadeType.ALL)
	@PrimaryKeyJoinColumn
	private User user;

	public String getBirthday() {
		return birthday;
	}

	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}

	public String getPhoneno() {
		return phoneno;
	}

	public void setPhoneno(String phoneno) {
		this.phoneno = phoneno;
	}

	public String getEmailID() {
		return emailID;
	}

	public void setEmailID(String emailID) {
		this.emailID = emailID;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String Gender) {
		gender = Gender;
	}

	public String getBalance() {
		return balance;
	}

	public void setBalance(String balance) {
		this.balance = balance;
	}
	
	

	
	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	

	@Override
	public String toString() {
		return "UserDetails [birthday=" + birthday + ", phoneno=" + phoneno
				+ ", emailID=" + emailID + ", Gender=" + gender + ", balance="
				+ balance + "]";
	}

	public Integer getCustomerid() {
		return customerid;
	}

	public void setCustomerid(Integer customerid) {
		this.customerid = customerid;
	}

}
