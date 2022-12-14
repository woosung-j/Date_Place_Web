package com.my.date.dao;

import com.my.date.domain.Menu;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.my.date.dao.map.MenuMap;

@Repository
public class MenuDaoImpl implements MenuDao {
	@Autowired MenuMap menuMap;
	
	@Override
	public List<Menu> selectMenus(int placeId) {
		return menuMap.selectMenus(placeId);
	}
	
	@Override
	public int insertMenu(Menu menu) {
		return menuMap.insertMenu(menu);
	}
	
	@Override
	public int updateMenu(Menu menu) {
		return menuMap.updateMenu(menu);
	}
	
	@Override
	public void deleteMenu(int menuId) {
		menuMap.deleteMenu(menuId);
	}
}
