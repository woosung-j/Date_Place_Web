package com.my.date.dao.map;

import com.my.date.domain.Declaration;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface DeclarationMap {
    List<Declaration> selectDeclarations();
    int updateConfirm(@Param("declareId") int declareId,
                      @Param("confirm")int confirm);
}
