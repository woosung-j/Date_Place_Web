package com.my.date.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class FeedLike {
	private int feedId;
	private int userId;
	private int feedLikeId;
	private int likeCnt;
}