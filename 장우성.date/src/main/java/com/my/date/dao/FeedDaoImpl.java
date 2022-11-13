package com.my.date.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.my.date.dao.map.FeedMap;
import com.my.date.domain.Feed;
import com.my.date.domain.FeedDto;
import com.my.date.domain.FeedTagDto;

@Repository
public class FeedDaoImpl implements FeedDao{
	@Autowired private FeedMap feedMap;
	
	@Override
	public List<Feed> selectFeeds() {
		return feedMap.selectFeeds();
	}
	
	@Override
	public int insertHashtags(List<String> tags, int feedId) {
		return feedMap.insertHashtags(tags, feedId);
	}

	@Override
	public FeedDto selectFeed(int feedId) {
		return feedMap.selectFeed(feedId);
	}
	
	@Override
	public int insertFeed(FeedTagDto feed) {
		return feedMap.insertFeed(feed);
	}
	
	@Override
	public int selectHashtag(int feedId, String tag) {
		return feedMap.selectHashtag(feedId, tag);
	}
}