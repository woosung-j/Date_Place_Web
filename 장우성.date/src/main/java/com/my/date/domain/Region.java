package com.my.date.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Region {
    private int myRegionId;
    private int userId;
    private int siId;
    private int guId;
}