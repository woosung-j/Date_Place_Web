package com.my.date.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ReviewImage {
	private int reviewImagesId;
	private int reviewId;
	private String fileName;
}
