package com.my.date.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.my.date.dao.UserDao;
import com.my.date.domain.User;

@Service
public class UserServiceImpl implements UserService {
	@Autowired private UserDao userDao;

	@Override
	public List<User> getUsers() {
		return userDao.selectUsers();
	}

	@Override
	public User loginValidate(User loginUser) {
		if(loginUser.getId().equals("") || loginUser.getPassword().equals(""))
			return null;

		User user = userDao.selectUser(loginUser);

		if(user != null && loginUser.getId().equals(user.getId()) && loginUser.getPassword().equals(user.getPassword())) {
			return user;
		}
		return null;
	}

	@Override
	public User adminLoginValidate(User loginUser) {
		if (loginUser.getId().equals("") || loginUser.getPassword().equals(""))
			return null;

		User user = userDao.selectAdminUser(loginUser);

		if(user != null && loginUser.getId().equals(user.getId()) && loginUser.getPassword().equals(user.getPassword())) {
			return user;
		}
		return null;
	}
	@Override
	public User idCheck(String id) {
		return userDao.selectUserById(id);
	}

	@Override
	public String checkEmail(String email) {
		return userDao.selectEmail(email);
	}

	@Override
	public int signUp(User user) {
		if(idCheck(user.getId()) != null)
			return 0;

		return userDao.insertUser(user);
	}

	@Override
	public void fixUser(User user) {
		userDao.updateUser(user);
	}

	@Override
	public User findId(User user) {
		return userDao.selectId(user);
	}

	@Override
	public void delUser(int userId) {
		userDao.deleteUser(userId);
	}
}
