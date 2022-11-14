package com.my.date.dao;

import java.util.List;

import com.my.date.domain.Menu;

public interface MenuDao {
	List<Menu> selectMenus();
	int insertMenu(Menu menu);
	int updateMenu(Menu menu);
}
