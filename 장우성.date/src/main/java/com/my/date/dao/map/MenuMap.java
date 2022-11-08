package com.my.date.dao.map;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.my.date.domain.Menu;

@Mapper
public interface MenuMap {
	List<Menu> selectMenus();
	int insertMenu(Menu menu);
}
