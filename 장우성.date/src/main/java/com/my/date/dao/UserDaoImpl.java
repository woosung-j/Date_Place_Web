package com.my.date.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.my.date.dao.map.UserMap;
import com.my.date.domain.User;

@Repository
public class UserDaoImpl implements UserDao {
	@Autowired private UserMap userMap;

	@Override
	public List<User> selectUsers(){
		return userMap.selectUsers();
	}
	
	@Override
	public User selectUser(User user) {
		return userMap.selectUser(user);
	}

	@Override
	public User selectAdminUser(User user) {
		return userMap.selectAdminUser(user);
	}

	@Override
	public User selectUserById(String id) {
		return userMap.selectUserById(id);
	}

	@Override
	public String selectEmail(String email) {
		return userMap.selectEmail(email);
	}

	@Override
	public int insertUser(User user) {
		return userMap.insertUser(user);
	}

	@Override
	public void updateUser(User user) {
		userMap.updateUser(user);
	}

	@Override
	public User selectId(User user) {
		return userMap.selectId(user);
	}

	@Override
	public void deleteUser(int userId) {
		userMap.deleteUser(userId);
	}
	
	@Override
	public int updatePassword(String email, String password) {
		return userMap.updatePassword(email, password);
	}
}
