package com.my.date.service;

import java.util.List;

import com.my.date.domain.Feed;
import com.my.date.domain.Hashtag;

public interface FeedService {
	List<Feed> getFeeds();
	List<Hashtag> getTags();
}