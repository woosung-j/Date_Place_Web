package com.my.date.dao.map;

import java.awt.Menu;
import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface MenuMap {
	List<Menu> selectMenus();
}
