package com.my.date.dao;

import java.util.List;

import com.my.date.domain.User;

public interface AdminDao {
	List<User> selectUserList();
	User selectAdminUser(String userName);
	void updateAdminUser(User user);
	void deleteAdminUser(int userId);
}
