package com.my.date.dao.map;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.my.date.domain.Declaration;
import com.my.date.domain.DeclarationAdminDto;
import com.my.date.domain.MyDeclarationDto;

public interface DeclarationMap {
    List<DeclarationAdminDto> selectDeclarations();
    List<MyDeclarationDto> selectDeclarationsByUserId(int userId);
    int insertDeclaration(Declaration declaration);
    String selectPlaceName(int placeId);
    int updateConfirm(@Param("declareId") int declareId,
                      @Param("confirm")int confirm);

    int deleteDeclarationByDeclareIdAndUserId(@Param("declareId") int declareId, @Param("userId") int userId);
}
