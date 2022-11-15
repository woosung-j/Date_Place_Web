package com.my.date.service;

import com.my.date.domain.FeedDto;
import com.my.date.domain.FeedTagDto;

import java.util.List;

public interface FeedService {
	List<FeedDto> getFeeds();
	List<FeedDto> getMyFeeds(int feedId);
	FeedDto getFeed(int feedId);
	int addFeed(FeedTagDto feed);
	int addHashtags(List<String> tags, int feedId);
	int fixFeed(FeedTagDto Feed);
	int fixHashtags(List<String> tags, int feedId);
	int delFeed(int feedId, int userId);
	int delHashtags(int feedId);
	int delFeed(int feedId, int userId);
}