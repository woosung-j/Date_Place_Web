package com.my.date.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDate;
import java.util.List;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class PlaceDto {
    private int placeId;
    private String placeName;
    private String introduction;
    private int siId;
    private int guId;
    private int views;
    private int likeCount;
    private int isLike;
    private int placeGroupId;
    private LocalDate createdAt;
    private LocalDate updatedAt;
    List<PlaceImage> placeImage;
}
