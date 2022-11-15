package com.my.date.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDate;
import java.util.List;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class FeedDto {
	private int feedId;
	private int userId;
	private String title;
	private String content;
	private String profileImage;
	private String nickname;
	private LocalDate createdAt;
	private int feedLikeId;
	private int likeCnt;
	private int commentId;
	private int commentCnt;
	private List<Hashtag> hashtag;
}
