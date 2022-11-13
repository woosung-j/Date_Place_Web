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
	private int tel;
	private int openingHours;
	private int closingHours;
	private String dayoff;
	private String contact;
	private String parking;
	private LocalDate createdAt;
	private LocalDate updatedAt;
}