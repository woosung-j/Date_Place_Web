package com.my.date.service;

import com.my.date.dao.DeclarationDao;
import com.my.date.domain.Declaration;
import com.my.date.domain.MyDeclarationDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DeclarationServiceImpl implements DeclarationService {
    @Autowired DeclarationDao declarationDao;

    @Override
    public List<Declaration> getDeclareList() {
        return declarationDao.selectDeclarations();
    }

    @Override
    public List<MyDeclarationDto> getDeclareListByUserId(int userId) {
        return declarationDao.selectDeclarationsByUserId(userId);
    }
    
    @Override
    public int addDeclaration(Declaration declaration) {
        return declarationDao.insertDeclaration(declaration);
    }
    
    @Override
    public String getPlaceName(int placeId) {
        return declarationDao.selectPlaceName(placeId);
    }
    
    @Override
    public int fixConfirm(int declareId, int confirm) {
        if(confirm == 1) confirm = 0;
        else confirm = 1;

        return declarationDao.updateConfirm(declareId, confirm);
    }

    @Override
    public int delDeclare(int declareId, int userId) {
        return declarationDao.deleteDeclarationByDeclareIdAndUserId(declareId, userId);
    }
}
