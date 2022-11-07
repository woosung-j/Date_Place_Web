package com.my.date.domain;

import java.time.LocalDate;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Feed {
	private int feedId;
	private int userId;
	private String title;
	private String content;
	private LocalDate createdAt;
}