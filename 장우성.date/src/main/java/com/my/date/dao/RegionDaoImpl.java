package com.my.date.dao;

import com.my.date.dao.map.RegionMap;
import com.my.date.domain.RegionDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class RegionDaoImpl implements RegionDao {
    @Autowired RegionMap regionMap;

    @Override
    public List<RegionDto> selectRegions(int userId) {
        return regionMap.selectRegions(userId);
    }
}
