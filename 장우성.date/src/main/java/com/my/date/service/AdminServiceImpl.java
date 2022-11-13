package com.my.date.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.my.date.dao.AdminDao;
import com.my.date.domain.User;

@Service
public class AdminServiceImpl implements AdminService{
	@Autowired AdminDao adminDao;
	
	@Override
	public List<User> getUserList() {
		return adminDao.selectUserList();
	}
	
	public void fixAdminUser(User user) {
		adminDao.updateAdminUser(user);
	}

	@Override
	public void delAdminUser(int userId) {
		adminDao.deleteAdminUser(userId);
	}

	@Override
	public User getAdminUser(String userName) {
		return adminDao.selectAdminUser(userName);
	}
}
