package com.my.date.service;

import java.util.List;

import com.my.date.domain.Feed;
import com.my.date.domain.FeedDto;
import com.my.date.domain.FeedTagDto;

public interface FeedService {
	List<Feed> getFeeds();
	FeedDto getFeed(int feedId);
	int addFeed(FeedTagDto feed);
	int addHashtags(List<String> tags, int feedId);
	int getHashtag(int feedId, String tag);
}