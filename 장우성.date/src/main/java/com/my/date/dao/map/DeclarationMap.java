package com.my.date.dao.map;

import com.my.date.domain.Declaration;
import com.my.date.domain.MyDeclarationDto;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface DeclarationMap {
    List<Declaration> selectDeclarations();
    List<MyDeclarationDto> selectDeclarationsByUserId(int userId);
    int updateConfirm(@Param("declareId") int declareId,
                      @Param("confirm")int confirm);

    int deleteDeclarationByDeclareIdAndUserId(@Param("declareId") int declareId, @Param("userId") int userId);
}
