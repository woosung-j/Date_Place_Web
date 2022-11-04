package com.my.date.service;

import com.my.date.dao.DeclarationDao;
import com.my.date.domain.Declaration;
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
    public int fixConfirm(int declareId, int confirm) {
        if(confirm == 1) confirm = 0;
        else confirm = 1;

        return declarationDao.updateConfirm(declareId, confirm);
    }
}
