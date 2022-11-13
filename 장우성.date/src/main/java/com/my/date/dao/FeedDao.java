package com.my.date.dao;

import java.util.List;

import com.my.date.domain.Feed;
import com.my.date.domain.FeedDto;
import com.my.date.domain.FeedTagDto;

public interface FeedDao {
	List<Feed> selectFeeds();
	FeedDto selectFeed(int feedId);
	int insertFeed(FeedTagDto feed);
	int insertHashtags(List<String> tags, int feedId);
	int selectHashtag(int feedId, String tag);
}