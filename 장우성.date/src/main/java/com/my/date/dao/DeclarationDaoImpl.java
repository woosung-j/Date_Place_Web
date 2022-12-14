package com.my.date.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.my.date.dao.map.DeclarationMap;
import com.my.date.domain.Declaration;
import com.my.date.domain.DeclarationAdminDto;
import com.my.date.domain.MyDeclarationDto;

@Repository
public class DeclarationDaoImpl implements DeclarationDao {
    @Autowired private DeclarationMap declarationMap;

    @Override
    public List<DeclarationAdminDto> selectDeclarations() {
        return declarationMap.selectDeclarations();
    }

    @Override
    public List<MyDeclarationDto> selectDeclarationsByUserId(int userId) {
        return declarationMap.selectDeclarationsByUserId(userId);
    }
    
    @Override
    public int insertDeclaration(Declaration declaration) {
    	return declarationMap.insertDeclaration(declaration);
    }
    
    @Override
    public String selectPlaceName(int placeId) {
    	return declarationMap.selectPlaceName(placeId);
    }

    @Override
    public int updateConfirm(int declareId, int confirm) {
        return declarationMap.updateConfirm(declareId, confirm);
    }

    @Override
    public int deleteDeclarationByDeclareIdAndUserId(int declareId, int userId) {
        return declarationMap.deleteDeclarationByDeclareIdAndUserId(declareId, userId);
    }
}
