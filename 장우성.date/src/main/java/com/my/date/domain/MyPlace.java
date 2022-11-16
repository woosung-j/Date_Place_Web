package com.my.date.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class MyPlace {
    private int myPlaceId;
    private int placeId;
    private int userId;
}
