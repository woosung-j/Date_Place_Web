package com.my.date.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.my.date.dao.map.FeedMap;
import com.my.date.domain.Feed;
import com.my.date.domain.FeedDto;

@Repository
public class FeedDaoImpl implements FeedDao{
	@Autowired private FeedMap feedMap;
	
	@Override
	public List<Feed> selectFeeds(int feedId) {
		return feedMap.selectFeeds(feedId);
	}
	
	@Override
	public FeedDto selectFeed(int feedId) {
		return feedMap.selectFeed(feedId);
	}
}