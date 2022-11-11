package com.my.date.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.my.date.dao.FeedDao;
import com.my.date.domain.Feed;
import com.my.date.domain.FeedDto;

@Service
public class FeedServiceImpl implements FeedService {
	@Autowired
	private FeedDao feedDao;

	@Override
	public List<Feed> getFeeds(int feedId) {
		return feedDao.selectFeeds(feedId);
	}

	@Override
	public FeedDto getFeed(int feedId) {
		return feedDao.selectFeed(feedId);
	}
}