package com.my.date.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.my.date.dao.MenuDao;
import com.my.date.domain.Menu;

@Service
public class MenuServiceImpl implements MenuService {
	@Autowired private MenuDao menuDao;
	
	@Override
	public List<Menu> getMenus(int placeId) {
		return menuDao.selectMenus(placeId);
	}
	
	@Override
	public int addMenu(List<Menu> menu) {
		int addCount = 0;
		
		for(int i = 0; i < menu.size(); i++) {
			addCount += menuDao.insertMenu(menu.get(i));
		}
		return addCount;
	}
	
	@Override
	public int fixMenu(List<Menu> menu) {
		int fixCount = 0;
		
		for(int i = 0; i < menu.size(); i ++) {
			fixCount += menuDao.updateMenu(menu.get(i));
		}
		return fixCount;
	}
	
	@Override
	public void delMenu(int menuId) { 
		menuDao.deleteMenu(menuId);
	}
}
