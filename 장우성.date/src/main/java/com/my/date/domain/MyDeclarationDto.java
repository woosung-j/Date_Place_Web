package com.my.date.domain;

import lombok.*;

import java.time.LocalDate;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class MyDeclarationDto {
    private int declareId;
    private int placeId;
    private int userId;
    private String content;
    private String confirm;
    private LocalDate createdAt;
    private String placeName;
}
