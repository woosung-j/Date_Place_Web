package com.my.date.dao;

import java.util.List;

import com.my.date.domain.Feed;
import com.my.date.domain.FeedDto;

public interface FeedDao {
	List<Feed> selectFeeds(int feedId);
	FeedDto selectFeed(int feedId);
}