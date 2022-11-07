package com.my.date.dao;

import java.util.List;

import com.my.date.domain.Feed;
import com.my.date.domain.Hashtag;

public interface FeedDao {
	List<Feed> selectFeeds();
	List<Hashtag> selectTags();
}