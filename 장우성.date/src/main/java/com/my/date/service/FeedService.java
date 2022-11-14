package com.my.date.service;

import java.util.List;

import com.my.date.domain.Feed;
import com.my.date.domain.FeedDto;
import com.my.date.domain.FeedTagDto;

public interface FeedService {
	List<Feed> getFeeds();
	List<FeedDto> getMyFeeds(int feedId);
	FeedDto getFeed(int feedId);
	int addFeed(FeedTagDto feed);
	int addHashtags(List<String> tags, int feedId);
	int fixFeed(FeedTagDto Feed);
	int fixHashtags(List<String> tags, int feedId);
	int delHashtags(int feedId);
	int delFeed(int feedId, int userId);
}