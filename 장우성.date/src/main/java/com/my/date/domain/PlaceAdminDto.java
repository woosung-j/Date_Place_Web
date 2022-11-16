package com.my.date.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class PlaceAdminDto {
    private int placeId;
    private String placeName;
    private String introduction;
    private int siId;
    private int guId;
    private String siName;
    private String guName;
    private int placeGroupId;
    List<PlaceImage> placeImage;
}
