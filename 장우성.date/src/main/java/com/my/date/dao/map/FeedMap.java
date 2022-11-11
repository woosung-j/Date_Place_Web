package com.my.date.dao.map;

import java.util.List;


import com.my.date.domain.Feed;
import com.my.date.domain.FeedDto;

public interface FeedMap {
	List<Feed> selectFeeds(int feedId);
	FeedDto selectFeed(int feedId);
}