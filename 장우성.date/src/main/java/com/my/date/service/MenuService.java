package com.my.date.service;

import com.my.date.domain.Menu;
import java.util.List;

public interface MenuService {
	List<Menu> getMenus(int placeId);
	int addMenu(List<Menu> menu);
	int fixMenu(List<Menu> menu);
	void delMenu(int menuId);
}