package com.my.date.dao.map;

import org.apache.ibatis.annotations.Param;

import com.my.date.domain.Detail;

public interface DetailMap {
	Detail selectDetail(@Param("placeId") int placeId);
	int updateDetail(Detail detail);
}