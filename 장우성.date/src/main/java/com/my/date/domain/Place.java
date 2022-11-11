package com.my.date.domain;

import java.time.LocalDate;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Place {
	private int placeId;
	private String placeName;
	private String introduction;
	private int siId;
	private int guId;
	private int views;
	private int placeGroupId;
	private LocalDate createdAt;
	private LocalDate updatedAt;
}
