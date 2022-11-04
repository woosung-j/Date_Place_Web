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
    private Declaration declaration;
    private Place place;
    private Detail detail;
    private User user;
}
