package com.my.date.domain;

import java.time.LocalDate;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class FeedDto {
	private int feedId;
	private int userId;
	private String title;
	private String content;
	private String nickname;
	private LocalDate createdAt;
	private int feedLikeId;
	private int likeCnt;
	private List<Hashtag> hashtag;
}
