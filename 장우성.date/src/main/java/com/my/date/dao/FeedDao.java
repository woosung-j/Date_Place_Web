package com.my.date.dao;

import com.my.date.domain.FeedDto;
import com.my.date.domain.FeedTagDto;

import java.util.List;

public interface FeedDao {
	List<FeedDto> selectFeeds();
	List<FeedDto> selectMyFeeds(int feedId);
	FeedDto selectFeed(int feedId);
	int insertFeed(FeedTagDto feed);
	int insertHashtags(List<String> tags, int feedId);
	int updateFeed(FeedTagDto Feed);
	int updateHashtags(List<String> tags, int feedId);
	int deleteFeed(int feedId, int userId);
	int deleteHashtags(int feedId);
	int deleteFeed(int feedId, int userId);
}