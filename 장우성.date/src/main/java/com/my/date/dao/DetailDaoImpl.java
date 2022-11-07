package com.my.date.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.my.date.dao.map.DetailMap;
import com.my.date.domain.Detail;

@Repository
public class DetailDaoImpl implements DetailDao {
	@Autowired
	DetailMap detailMap;

	@Override
	public List<Detail> selectDetails() {
		return detailMap.selectDetails();
	}
}