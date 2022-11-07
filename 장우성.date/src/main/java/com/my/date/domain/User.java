package com.my.date.domain;

import java.time.LocalDate;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class User {
	private int userId;
	private String id;
	private String email;
	private String password;
	private String userName;
	private String phoneNumber;
	private String nickname;
	private String profileImage;
	private LocalDate birthday;
	private LocalDate createdAt;
	private LocalDate updatedAt;
}
