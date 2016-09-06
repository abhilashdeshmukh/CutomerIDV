package com.accenture.CustomerIDV.dao;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.accenture.CustomerIDV.beans.Admin;
import com.accenture.CustomerIDV.beans.CustomerVerify;
import com.accenture.CustomerIDV.beans.Question;
import com.accenture.CustomerIDV.beans.User;
import com.accenture.CustomerIDV.beans.UserDetails;

@Repository("userdao")
@Transactional(propagation = Propagation.REQUIRED)
public class UserDAO {
	
	private static final String SELECT_QUERY = "select q from Question q";
	private static final String SELECT_QUERY1 = "select a from CustomerVerify a where a.qid =:arg1 and a.customerid =:arg2";
	private static final String SELECT_QUERY2 = "select u from User u where u.name =:arg3";
	private static final String SELECT_QUERY3 = "select a from Admin a where a.username =:arg1 and a.password=:arg2";
	private static final String SELECT_QUERY4 = "select q from Question q where q.qid =:arg";
	@PersistenceContext
	private EntityManager entityManager;

	public EntityManager getEntityManager() {
		return entityManager;
	}

	public void setEntityManager(EntityManager entityManager) {
		this.entityManager = entityManager;
	}

	public User searchuser(int customerid) {
		/*Query query = entityManager.createQuery(SELECT_QUERY);
		query.setParameter("arg1", customerid);
		List<User> user = (List<User>) query.getResultList();
		User user1 = user.get(0);
		return user1;*/

		User user = entityManager.find(User.class, customerid);
		return user;
	}

	public User newuser(User user) {
		entityManager.persist(user);
		/*UserDAO userdao = new UserDAO();
		user = (User) userdao.searchuserbyname(user.getName());
		userDetails.setCustomerid(user.getCustomerid());
		userDetails.setBalance("500");*/
		/*entityManager.persist(userDetails);*/
		entityManager.flush();
		return user;
	}

	public List<CustomerVerify> searchAnswer(CustomerVerify cv) {

		Query query = entityManager.createQuery(SELECT_QUERY1);
		query.setParameter("arg1", cv.getQid());
		query.setParameter("arg2", cv.getCustomerid());
		List<CustomerVerify> answer = (List<CustomerVerify>) query.getResultList();
		return answer;
	}

	public String addAnswer(CustomerVerify cv) {
		entityManager.persist(cv);
		return "success";
	}

	public List<User> searchuserbyname(String name) {
		Query query = entityManager.createQuery(SELECT_QUERY2);
		query.setParameter("arg3", name);
		List<User> user = (List<User>) query.getResultList();
		return user;
	}

	public String deteleCustomer(User user) {
		User user2 = entityManager.find(User.class, user.getCustomerid());
		entityManager.remove(user2);
		return "success";
	}

	public String performlogin(Admin admin) {

		Query query = entityManager.createQuery(SELECT_QUERY3);
		query.setParameter("arg1", admin.getUsername());
		query.setParameter("arg2", admin.getPassword());
		List<Admin> admins = (List<Admin>) query.getResultList();
		/*Admin admin2 = admins.get(0);
		
		if(admin2.getLastlogin()== null)
		{
			admin2.setLastlogin("null");
		}
		*/
		if(admins.isEmpty()){
			return "failure";
		}
		else {
			return "Success";
		}
		
	}

	public void addlastlogin(String date, Admin admin) {
		Admin admin2 = new Admin();
		admin2.setUsername(admin.getUsername());
		admin2.setPassword(admin.getPassword());
		admin2.setSessionID(admin.getSessionID());
		
		admin2.setLastlogin(date);
		entityManager.merge(admin2);
	}

	public List<Admin> searchadmin(Admin admin) {
		Query query = entityManager.createQuery(SELECT_QUERY3);
		query.setParameter("arg1", admin.getUsername());
		query.setParameter("arg2", admin.getPassword());
		List<Admin> admins = (List<Admin>) query.getResultList();
		return admins;
	}

	public List<UserDetails> searchuser(User user) {
		UserDetails userDetails = entityManager.find(UserDetails.class, user.getCustomerid());
		return null;
	}

	public ArrayList<Question> getQuestions() {
		Query query = entityManager.createQuery(SELECT_QUERY);
		ArrayList<Question> questions = (ArrayList<Question>) query.getResultList();
		return questions;
	}

	public ArrayList<Question> getQuestions(Integer customerid) {
		CustomerVerify customerVerify = entityManager.find(CustomerVerify.class, customerid);
		Query query = entityManager.createQuery(SELECT_QUERY4);
		query.setParameter("arg", customerVerify.getQid());
		ArrayList<Question> questions = (ArrayList<Question>) query.getResultList();
		return questions;
	}

	public ArrayList<User> getAllCustomers() {
		Query query = entityManager.createQuery("select u from User u");
		ArrayList<User> Users = (ArrayList<User>) query.getResultList();
		return Users;
	}

	public String updateUserDetails(User user) {
		entityManager.merge(user);
		entityManager.flush();
		return "success";
	}



}
