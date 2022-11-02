package com.my.date.dao;

import com.my.date.domain.User;

public interface UserDao {
	User selectUser(User user);
	User selectUser(String id);
	int insertUser(User user);
}
