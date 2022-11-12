package com.my.date.domain;

import java.time.LocalDate;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Detail {
	private int detailId;
	private int placeId;
	private String address;
	private String tel;
	private String openingHours;
	private String closingHours;
	private String dayOff;
	private String contact;
	private int parking;
	private LocalDate createdAt;
	private LocalDate updatedAt;
}