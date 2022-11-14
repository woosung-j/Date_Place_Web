package com.my.date.dao;

import java.util.List;


import com.my.date.domain.Feed;
import com.my.date.domain.FeedDto;
import com.my.date.domain.FeedTagDto;

public interface FeedDao {
	List<Feed> selectFeeds();
	List<FeedDto> selectMyFeeds(int feedId);
	FeedDto selectFeed(int feedId);
	int insertFeed(FeedTagDto feed);
	int insertHashtags(List<String> tags, int feedId);
	int updateFeed(FeedTagDto Feed);
	int updateHashtags(List<String> tags, int feedId);
	int deleteHashtags(int feedId);
}