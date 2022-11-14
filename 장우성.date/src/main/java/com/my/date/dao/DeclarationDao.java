package com.my.date.dao;

import com.my.date.domain.Declaration;
import com.my.date.domain.MyDeclarationDto;

import java.util.List;

public interface DeclarationDao {
    List<Declaration> selectDeclarations();
    List<MyDeclarationDto> selectDeclarationsByUserId(int userId);
    int insertDeclaration(Declaration declaration);
    String selectPlaceName(int placeId);
    int updateConfirm(int declareId, int confirm);
    int deleteDeclarationByDeclareIdAndUserId(int declareId, int userId);
}
