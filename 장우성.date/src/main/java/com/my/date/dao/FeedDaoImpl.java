package com.my.date.dao;

import com.my.date.dao.map.FeedMap;
import com.my.date.domain.FeedDto;
import com.my.date.domain.FeedTagDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class FeedDaoImpl implements FeedDao{
	@Autowired private FeedMap feedMap;
	
	@Override
	public List<FeedDto> selectFeeds() {
		return feedMap.selectFeeds();
	}
	
	@Override
	public List<FeedDto> selectMyFeeds(int feedId) {
		return feedMap.selectMyFeeds(feedId);
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
	public int updateFeed(FeedTagDto Feed) {
		return feedMap.updateFeed(Feed);
	}
	
	@Override
	public int updateHashtags(List<String> tags, int feedId) {
		return feedMap.updateHashtags(tags, feedId);
	}

	@Override
	public int deleteFeed(int feedId, int userId) {
		return feedMap.deleteFeed(feedId, userId);
	}

	@Override
	public int deleteHashtags(int feedId) {
		return feedMap.deleteHashtags(feedId);
	}
}