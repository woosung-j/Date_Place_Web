package com.my.date.domain;

import java.time.LocalDate;

import lombok.Data;

@Data
public class Place {
	private int placeId;
	private String placeName;
	private String placeInfo;
	private int si;
	private int gu;
	private int views;
	private int placeGroupId;
	private LocalDate createdAt;
	private LocalDate updatedAt;
}
