package com.my.date.dao;

import java.util.List;

import com.my.date.domain.Menu;

public interface MenuDao {
	List<Menu> selectMenus(int placeId);
	int insertMenu(Menu menu);
	int updateMenu(Menu menu);
	void deleteMenu(int menuId);
}
