package com.my.date.dao.map;

import java.util.List;

import com.my.date.domain.User;

public interface AdminMap {
	List<User> selectUserList();
	User selectAdminUser(String userName);
	void updateAdminUser(User user);
	void deleteAdminUser(int userId);	
}
