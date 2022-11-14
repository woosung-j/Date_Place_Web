package com.my.date.dao.map;

import com.my.date.domain.Declaration;
import com.my.date.domain.MyDeclarationDto;
import com.my.date.domain.Review;

import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface DeclarationMap {
    List<Declaration> selectDeclarations();
    List<MyDeclarationDto> selectDeclarationsByUserId(int userId);
    int insertDeclaration(Declaration declaration);
    String selectPlaceName(int placeId);
    int updateConfirm(@Param("declareId") int declareId,
                      @Param("confirm")int confirm);

    int deleteDeclarationByDeclareIdAndUserId(@Param("declareId") int declareId, @Param("userId") int userId);
}
