package com.my.date.service;

import com.my.date.domain.Declaration;

import java.util.List;

public interface DeclarationService {
    List<Declaration> getDeclareList();
    int fixConfirm(int declareId, int confirm);
}
