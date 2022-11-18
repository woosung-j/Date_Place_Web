package com.my.date.service;

import java.util.List;

import com.my.date.domain.Declaration;
import com.my.date.domain.DeclarationAdminDto;
import com.my.date.domain.MyDeclarationDto;

public interface DeclarationService {
    List<DeclarationAdminDto> getDeclareList();
    List<MyDeclarationDto> getDeclareListByUserId(int userId);
    int addDeclaration(Declaration declaration);
    String getPlaceName(int placeId);
    int fixConfirm(int declareId, int confirm);
    int delDeclare(int declareId, int userId);
}
