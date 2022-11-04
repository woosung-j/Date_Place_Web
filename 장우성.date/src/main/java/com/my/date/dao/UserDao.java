package com.my.date.dao;

import java.util.List;

import com.my.date.domain.User;

public interface UserDao {
	List<User> selectUsers();
	User selectUser(User user);
	User selectUser(String id);
	int insertUser(User user);
	User findId(User user);
	//String findId(String userName, String phoneNumber);
}
