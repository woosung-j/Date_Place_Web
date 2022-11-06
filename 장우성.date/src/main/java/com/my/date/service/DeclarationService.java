package com.my.date.service;

import com.my.date.domain.Declaration;
import com.my.date.domain.MyDeclarationDto;

import java.util.List;

public interface DeclarationService {
    List<Declaration> getDeclareList();
    List<MyDeclarationDto> getDeclareListByUserId(int userId);
    int fixConfirm(int declareId, int confirm);

    int delDeclare(int declareId, int userId);
}
