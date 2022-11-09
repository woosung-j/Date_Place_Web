package com.my.date.dao;

import com.my.date.domain.RegionDto;

import java.util.List;

public interface RegionDao {
    List<RegionDto> selectRegions(int userId);
}
