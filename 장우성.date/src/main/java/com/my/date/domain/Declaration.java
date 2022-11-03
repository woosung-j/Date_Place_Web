package com.my.date.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDate;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Declaration {
    private int declareId;
    private int placeId;
    private int userId;
    private String content;
    private String confirm;
    private LocalDate createdAt;
    private User user;
    private Place place;
    private Detail detail;
}
