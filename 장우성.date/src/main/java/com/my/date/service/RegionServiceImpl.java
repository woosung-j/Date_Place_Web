package com.my.date.service;

import com.my.date.dao.RegionDao;
import com.my.date.domain.RegionDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class RegionServiceImpl implements RegionService {
    @Autowired RegionDao regionDao;

    @Override
    public List<RegionDto> getMyRegions(int userId) {
        return regionDao.selectRegions(userId);
    }
}
