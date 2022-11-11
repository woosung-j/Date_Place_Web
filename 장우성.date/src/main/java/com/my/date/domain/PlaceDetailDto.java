package com.my.date.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDate;
import java.util.List;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class PlaceDetailDto {
    private int placeId;
    private String placeName;
    private String introduction;
    private int views;
    private LocalDate createdAt;
    private LocalDate updatedAt;
    private int placeLikeCount;
    private int isLike;
    Detail detail;
    ReviewDto review;
    List<Menu> menus;
    List<PlaceImage> placeImages;
}
