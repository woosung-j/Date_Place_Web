package com.my.date.domain;



import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Hashtag {
	private int hashtagId;
	private int feedId;
	private String tag;
}