package com.my.date.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.my.date.dao.map.UserMap;
import com.my.date.domain.User;

@Repository
public class UserDaoImpl implements UserDao {
	@Autowired private UserMap userMap;
	
	@Override
	public User selectUser(User user) {
		return userMap.selectUser(user);
	}

	@Override
	public User selectUser(String id) {
		return userMap.selectUser(id);
	}

	@Override
	public int insertUser(User user) {
		return userMap.insertUser(user);
	}


}
