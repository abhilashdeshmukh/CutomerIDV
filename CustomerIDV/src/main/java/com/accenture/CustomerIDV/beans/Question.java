package com.accenture.CustomerIDV.beans;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "QUESTION")
public class Question implements Serializable {

	private static final long serialVersionUID = 1L;
	
	@Id
	@Column(name = "QID")
	private Integer qid;
	
	@Column(name = "QUESTION")
	private String question;

	public Integer getQid() {
		return qid;
	}

	public void setQid(Integer qid) {
		this.qid = qid;
	}

	public String getQuestion() {
		return question;
	}

	public void setQuestion(String question) {
		this.question = question;
	}
	

}
