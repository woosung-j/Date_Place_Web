package com.my.date.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.my.date.dao.DetailDao;
import com.my.date.domain.Detail;

@Service
public class DetailServiceImpl implements DetailService{
	@Autowired private DetailDao detailDao;
	
	@Override
	public List<Detail> getDetails() {
		return detailDao.selectDetails();
	}
}