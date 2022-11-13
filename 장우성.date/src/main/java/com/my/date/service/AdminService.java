package com.my.date.service;

import java.util.List;

import com.my.date.domain.User;

public interface AdminService {
	List<User> getUserList();
	User getAdminUser(String userName);
	void fixAdminUser(User user);
	void delAdminUser(int userId);
}
