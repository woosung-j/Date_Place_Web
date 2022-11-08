package com.my.date.dao.map;

import java.util.List;

import com.my.date.domain.Feed;
import com.my.date.domain.Hashtag;

public interface FeedMap {
	List<Feed> selectFeeds();
}