package com.my.date.service;

import java.util.List;

import com.my.date.domain.Feed;
import com.my.date.domain.FeedDto;

public interface FeedService {
	List<Feed> getFeeds(int feedId);
	FeedDto getFeed(int feedId);
}