package com.my.date.dao;

import com.my.date.domain.Declaration;

import java.util.List;

public interface DeclarationDao {
    List<Declaration> selectDeclarations();
    int updateConfirm(int declareId, int confirm);
}
