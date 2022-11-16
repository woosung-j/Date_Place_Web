package com.my.date.dao.map;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.my.date.domain.Menu;

@Mapper
public interface MenuMap {
	List<Menu> selectMenus(int placeId);
	int insertMenu(Menu menu);
	int updateMenu(Menu menu);
	void deleteMenu(int menuId);
}
