package com.baizhi.entity;

public class User {
	private int id;
	private String name;
	private String password;
	private String cardNum;
	private String tel;
	private String address;
	private String postNum;
	private int status;
	private String question;
	private String answer;
	@Override
	public String toString() {
		return "User [id=" + id + ", name=" + name + ", password=" + password
				+ ", cardNum=" + cardNum + ", tel=" + tel + ", address="
				+ address + ", postNum=" + postNum + ", status=" + status
				+ ", question=" + question + ", answer=" + answer + "]";
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getCardNum() {
		return cardNum;
	}
	public void setCardNum(String cardNum) {
		this.cardNum = cardNum;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getPostNum() {
		return postNum;
	}
	public void setPostNum(String postNum) {
		this.postNum = postNum;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public String getQuestion() {
		return question;
	}
	public void setQuestion(String question) {
		this.question = question;
	}
	public String getAnswer() {
		return answer;
	}
	public void setAnswer(String answer) {
		this.answer = answer;
	}
	public User(int id, String name, String password, String cardNum,
			String tel, String address, String postNum, int status,
			String question, String answer) {
		super();
		this.id = id;
		this.name = name;
		this.password = password;
		this.cardNum = cardNum;
		this.tel = tel;
		this.address = address;
		this.postNum = postNum;
		this.status = status;
		this.question = question;
		this.answer = answer;
	}
	public User() {
		super();
		// TODO Auto-generated constructor stub
	}
	public User(String name, String password) {
		super();
		this.name = name;
		this.password = password;
	}
	
}
