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
	public List<Menu> getMenus() {
		return menuDao.selectMenus();
	}
}
