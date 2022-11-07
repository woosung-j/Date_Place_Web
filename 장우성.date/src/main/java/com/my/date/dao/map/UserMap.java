package com.my.date.dao.map;

import java.util.List;

import com.my.date.domain.User;

public interface UserMap {
	List<User> selectUsers();
	User selectUser(User user);
	User selectUser(String id);
	int insertUser(User user);
	void updateUser(User user);
	User selectEmail_nickname(User user);
	User selectId(User user);
}
