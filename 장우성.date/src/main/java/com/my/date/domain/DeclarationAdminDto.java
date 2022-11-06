package com.my.date.domain;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.time.LocalDate;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class DeclarationAdminDto {
    private int declareId;
    private int placeId;
    private int userId;
    private String content;
    private String confirm;
    private LocalDate createdAt;
    private String placeName;
    private String address;
    private String id;
}
