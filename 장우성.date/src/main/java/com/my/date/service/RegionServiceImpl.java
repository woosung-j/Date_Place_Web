package com.my.date.service;

import com.my.date.dao.RegionDao;
import com.my.date.domain.Region;
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

    @Override
    public int getSiId(String siName) {
        return regionDao.selectSiId(siName);
    }

    @Override
    public int getGuId(String guName) {
        return regionDao.selectGuId(guName);
    }

    @Override
    public Region getMyRegionByUserIdAndSiAndGu(int userId, String siName, String guName) {
        return regionDao.selectMyRegionByUserIdAndSiAndGu(userId, siName, guName);
    }

    @Override
    public int addBookmark(RegionDto regionDto) {
        return regionDao.insertBookmark(regionDto);
    }

    @Override
    public int delBookmark(int bookmarkId) {
        return regionDao.deleteBookmark(bookmarkId);
    }

    @Override
    public RegionDto getSiNameAndGuName(int siId, int guId) {
        return regionDao.selectSiNameAndGuName(siId, guId);
    }
}
