package com.my.date.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.my.date.dao.FeedDao;
import com.my.date.domain.Feed;
import com.my.date.domain.FeedDto;
import com.my.date.domain.FeedTagDto;

@Service
public class FeedServiceImpl implements FeedService {
	@Autowired
	private FeedDao feedDao;

	@Override
	public List<Feed> getFeeds() {
		return feedDao.selectFeeds();
	}

	@Override
	public FeedDto getFeed(int feedId) {
		return feedDao.selectFeed(feedId);
	}
	
	@Override
	public int addFeed(FeedTagDto feed) {
		return feedDao.insertFeed(feed);
	}

	@Override
	public int addHashtags(List<String> tags, int feedId) {
		return feedDao.insertHashtags(tags, feedId);
	}
	
	@Override
	public int getHashtag(int feedId, String tag) {
		List<String> tags = new ArrayList<String>();
		tags.add(feedId, tag);
		
		for(String tag1 : tags) {
			feedDao.selectHashtag(feedId, tag1);
			System.out.println(tags);
		}
		return feedDao.selectHashtag(feedId, tag);
	}
}