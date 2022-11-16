package com.my.date.dao;

import com.my.date.dao.map.RegionMap;
import com.my.date.domain.Region;
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

    @Override
    public int selectSiId(String siName) {
        return regionMap.selectSiId(siName);
    }

    @Override
    public int selectGuId(String guName) {
        return regionMap.selectGuId(guName);
    }

    @Override
    public Region selectMyRegionByUserIdAndSiAndGu(int userId, String siName, String guName) {
        return regionMap.selectMyRegionByUserIdAndSiAndGu(userId, siName, guName);
    }

    @Override
    public int insertBookmark(RegionDto regionDto) {
        return regionMap.insertBookmark(regionDto);
    }

    @Override
    public int deleteBookmark(int bookmarkId) {
        return regionMap.deleteBookmark(bookmarkId);
    }

    @Override
    public RegionDto selectSiNameAndGuName(int siId, int guId) {
        return regionMap.selectSiNameAndGuName(siId, guId);
    }
}
