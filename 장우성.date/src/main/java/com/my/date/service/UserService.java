package com.my.date.service;

import java.util.List;

import com.my.date.domain.User;

public interface UserService {
	List<User> getUsers();
	User loginValidate(User loginUser);
	User idCheck(String id);
	int signUp(User user);
	User findId(User user);
	//String findId(String userName, String phoneNumber);
}
