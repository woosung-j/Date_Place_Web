package com.my.date.dao.map;

import com.my.date.domain.User;

public interface UserMap {
	User selectUser(User user);
	User selectUser(String id);
	int insertUser(User user);
}
