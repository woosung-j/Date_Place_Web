package com.my.date.service;

import com.my.date.domain.Region;
import com.my.date.domain.RegionDto;

import java.util.List;

public interface RegionService {
    List<RegionDto> getMyRegions(int userId);
    int getSiId(String siName);
    int getGuId(String guName);
    Region getMyRegionByUserIdAndSiAndGu(int userId, String siName, String guName);
    int addBookmark(RegionDto regionDto);
    int delBookmark(int bookmarkId);
}
