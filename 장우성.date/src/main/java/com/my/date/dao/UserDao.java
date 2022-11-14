package com.my.date.dao;

import java.util.List;

import com.my.date.domain.User;

public interface UserDao {
	List<User> selectUsers();
	User selectUser(User user);
	User selectAdminUser(User user);
	User selectUserById(String id);
	String selectEmail(String email);
	int insertUser(User user);
	void updateUser(User user);
	void deleteUser(int userId);
	User selectId(User user);
	int updatePassword(String email, String password);
	List<User> selectAdminUserList();
	User selectUserByUserName(String userName);
	void updateAdminUser(User user);
	void deleteAdminUser(int userId);
}
