package com.my.date.service;

import java.awt.Menu;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.my.date.dao.MenuDao;

@Service
public class MenuServiceImpl implements MenuService {
	@Autowired private MenuDao menuDao;
	
	@Override
	public List<Menu> getMenus() {
		return menuDao.selectMenus();
	}
}
