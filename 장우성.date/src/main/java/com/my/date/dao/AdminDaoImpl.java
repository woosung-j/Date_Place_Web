package com.my.date.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.my.date.dao.map.AdminMap;
import com.my.date.domain.User;

@Repository
public class AdminDaoImpl implements AdminDao{
	@Autowired AdminMap adminMap;
	
	@Override
	public List<User> selectUserList() {
		return adminMap.selectUserList();
	}
	
	@Override
	public void updateAdminUser(User user) {
		adminMap.updateAdminUser(user);
	}

	@Override
	public void deleteAdminUser(int userId) {
		adminMap.deleteAdminUser(userId);
	}

	@Override
	public User selectAdminUser(String userName) {
		return adminMap.selectAdminUser(userName);
	}
}
