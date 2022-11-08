package com.my.date.domain;

import java.time.LocalDate;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class FeedDto {
	private int feedId;
	private int userId;
	private String title;
	private String content;
	private LocalDate createdAt;
	private String nickname;
	private List<Hashtag> hashtag;
}
