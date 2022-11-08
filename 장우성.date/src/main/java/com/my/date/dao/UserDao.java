package com.my.date.dao;

import java.util.List;

import com.my.date.domain.User;

public interface UserDao {
	List<User> selectUsers();
	User selectUser(User user);
	User selectUser(String id);
	int insertUser(User user);
	void updateUser(User user);
	void deleteUser(int userId);
	User selectId(User user);
}
