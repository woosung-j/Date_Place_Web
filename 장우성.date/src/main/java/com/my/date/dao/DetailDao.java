package com.my.date.dao;

import java.util.List;

import com.my.date.domain.Detail;

public interface DetailDao {
	List<Detail> selectDetails();
}