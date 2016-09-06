package com.accenture.CustomerIDV.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.servlet.mvc.condition.RequestConditionHolder;
import org.springframework.webflow.execution.RequestContext;

import com.accenture.CustomerIDV.beans.Admin;
import com.accenture.CustomerIDV.beans.CustomerVerify;
import com.accenture.CustomerIDV.beans.Question;
import com.accenture.CustomerIDV.beans.User;
import com.accenture.CustomerIDV.beans.UserDetails;
import com.accenture.CustomerIDV.dao.UserDAO;

@Controller
public class SearchController {

	@Autowired
	private UserDAO userdao;

	public User performRegistration(User user, UserDetails userDetails) {

		userDetails.setBalance("500");
		User user2 = new User();
		user2.setName(user.getName());
		user2.setAddress(user.getAddress());
		user2.setAccounttype(user.getAccounttype());
		user2.setUserDetails(userDetails);
		userDetails.setUser(user2);

		User user3 = userdao.newuser(user2);
		return user3;
	}

	public String performSearch(User user) {

		User use = userdao.searchuser(user.getCustomerid());
		if (use == null) {
			return "failure";
		} else {
			/*user = (User) use.get(0);*/
			return "success";
		}
	}

	public User getUser(User user) {
		user = userdao.searchuser(user.getCustomerid());
		/*user = (User) use.get(0);*/
		return user;
	}
	
	/*public UserDetails getUser(UserDetails user) {

		List<UserDetails> use = userdao.searchuser(user.getUser());
		user = (UserDetails) use.get(0);
		return user;
	}*/

	public User getUserByName(User user) {

		List<User> use = userdao.searchuserbyname(user.getName());
		user = (User) use.get(0);
		return user;
	}

	public String verify(CustomerVerify cv) {

		List<CustomerVerify> answer = userdao.searchAnswer(cv);
		CustomerVerify customerVerify = new CustomerVerify();

		customerVerify = (CustomerVerify) answer.get(0);

		if (customerVerify.getAnswer().equals(cv.getAnswer())) {
			return "success";
		} else {
			return "failure";
		}

	}

	public String addQuestion(CustomerVerify cv, User user) {
		cv.setCustomerid(user.getCustomerid());
		String status = userdao.addAnswer(cv);

		return status;

	}

	public void rolloff(User user) {
		userdao.deteleCustomer(user);
	}

	public String performlogin(Admin admin) {
		String status = userdao.performlogin(admin);
		return status;
	}

	public void addlastlogin(Admin admin) {
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy.MM.dd G 'at' HH:mm:ss z" );
		Date date = new Date();
		String Date = dateFormat.format(date);
		userdao.addlastlogin(Date,admin);

	}
	
	public Admin getAdmin(Admin admin) {
		List<Admin> use = userdao.searchadmin(admin);
		admin = (Admin) use.get(0);
		return admin;
	}
	
	public User adduser(User user) {
		return user;
	}

	public ArrayList<Question> getQuestions() {
		ArrayList<Question> questions = userdao.getQuestions();
		return questions;
		
	}
	
	public ArrayList<Question> getQuestions(User user) {
		ArrayList<Question> questions = userdao.getQuestions(user.getCustomerid());
		return questions;
		
	}
	public ArrayList<User> getAllCustomers(){
		ArrayList<User> Users = userdao.getAllCustomers();
		return Users;
	}
	
	public User getUser(RequestContext context){
		
		String index = context.getRequestParameters().get("userSelect");
		Integer customerId = Integer.parseInt(index);
		User user = userdao.searchuser(customerId);

		return user;
		
	}
	
	public String updateUserDetails(RequestContext context){
		 
		User user = new User();
		
		user.setAccounttype(context.getRequestParameters().get("accounttype"));
		user.setAddress(context.getRequestParameters().get("address"));
		user.setCustomerid(Integer.parseInt(context.getRequestParameters().get(
				"customerid")));
		user.setName(context.getRequestParameters().get("name"));

		UserDetails userDetails = new UserDetails();
		userDetails.setBalance(context.getRequestParameters().get("balance"));
		userDetails.setBirthday(context.getRequestParameters().get("birthday"));
		userDetails.setEmailID(context.getRequestParameters().get("emailID"));
		userDetails.setGender(context.getRequestParameters().get("gender"));
		userDetails.setPhoneno(context.getRequestParameters().get("phoneno"));
		userDetails.setCustomerid(Integer.parseInt(context.getRequestParameters().get(
				"customerid")));

		user.setUserDetails(userDetails);
		
		userDetails.setUser(user);

		String status = userdao.updateUserDetails(user);
		return status;
		
	}
	
	public String deleteUser(User user) {
		
		String status = userdao.deteleCustomer(user);
		
		return status;
	}
	
}
