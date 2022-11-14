package com.my.date.dao.map;

import com.my.date.domain.Region;
import com.my.date.domain.RegionDto;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface RegionMap {
    List<RegionDto> selectRegions(int userId);
    int selectSiId(String siName);
    int selectGuId(String guName);
    Region selectMyRegionByUserIdAndSiAndGu(@Param("userId") int userId, @Param("siName") String siName, @Param("guName") String guName);
    int insertBookmark(RegionDto regionDto);
    int deleteBookmark(int bookmarkId);
}
