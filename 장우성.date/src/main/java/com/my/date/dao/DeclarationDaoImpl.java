package com.my.date.dao;

import com.my.date.dao.map.DeclarationMap;
import com.my.date.domain.Declaration;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class DeclarationDaoImpl implements DeclarationDao {
    @Autowired private DeclarationMap declarationMap;

    @Override
    public List<Declaration> selectDeclarations() {
        return declarationMap.selectDeclarations();
    }

    @Override
    public int updateConfirm(int declareId, int confirm) {
        return declarationMap.updateConfirm(declareId, confirm);
    }
}
