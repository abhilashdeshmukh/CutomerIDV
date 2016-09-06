package com.accenture.CustomerIDV.beans;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "VERIFY")
public class CustomerVerify implements Serializable {

	private static final long serialVersionUID = 1L;
	
	@Column(name = "QID")
	private Integer qid;

	@Column(name = "ANSWER")
	private String answer;

	@Id
	@Column(name = "CUSTOMERID")
	private int customerid;

	public Integer getQid() {
		return qid;
	}

	public void setQid(Integer qid) {
		this.qid = qid;
	}

	public String getAnswer() {
		return answer;
	}

	public void setAnswer(String answer) {
		this.answer = answer;
	}

	public int getCustomerid() {
		return customerid;
	}

	public void setCustomerid(int customerid) {
		this.customerid = customerid;
	}

	@Override
	public String toString() {
		return "CustomerVerify [qid=" + qid + ", answer=" + answer
				+ ", customerid=" + customerid + "]";
	}

}
