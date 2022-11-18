package com.my.date.dao;

import java.util.List;

import com.my.date.domain.Declaration;
import com.my.date.domain.DeclarationAdminDto;
import com.my.date.domain.MyDeclarationDto;

public interface DeclarationDao {
    List<DeclarationAdminDto> selectDeclarations();
    List<MyDeclarationDto> selectDeclarationsByUserId(int userId);
    int insertDeclaration(Declaration declaration);
    String selectPlaceName(int placeId);
    int updateConfirm(int declareId, int confirm);
    int deleteDeclarationByDeclareIdAndUserId(int declareId, int userId);
}
