package com.my.date.service;

import com.my.date.domain.User;

public interface UserService {
	User loginValidate(User loginUser);
	User idCheck(String id);
	int signUp(User user);
}
