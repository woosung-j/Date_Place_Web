package com.my.date.dao.map;

import com.my.date.domain.RegionDto;

import java.util.List;

public interface RegionMap {
    List<RegionDto> selectRegions(int userId);
    int selectSiId(String siName);
    int selectGuId(String guName);
}
