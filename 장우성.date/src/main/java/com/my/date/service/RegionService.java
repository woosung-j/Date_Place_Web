package com.my.date.service;

import com.my.date.domain.RegionDto;

import java.util.List;

public interface RegionService {
    List<RegionDto> getMyRegions(int userId);
    int getSiId(String siName);
    int getGuId(String guName);
}
