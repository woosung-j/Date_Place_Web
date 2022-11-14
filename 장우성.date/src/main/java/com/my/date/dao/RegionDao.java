package com.my.date.dao;

import com.my.date.domain.Region;
import com.my.date.domain.RegionDto;

import java.util.List;

public interface RegionDao {
    List<RegionDto> selectRegions(int userId);
    int selectSiId(String siName);
    int selectGuId(String guName);
    Region selectMyRegionByUserIdAndSiAndGu(int userId, String siName, String guName);
    int insertBookmark(RegionDto regionDto);
    int deleteBookmark(int bookmarkId);
}
