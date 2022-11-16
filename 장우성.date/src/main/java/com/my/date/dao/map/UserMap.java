package com.my.date.dao.map;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.my.date.domain.User;

public interface UserMap {
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
	String selectProfileImageByUserId(int userId);
	void updateAdminUser(User user);
	void deleteAdminUser(int userId);
	int updateProfileImage(@Param("profileImage") String profileImage, @Param("userId") int userId);
}
