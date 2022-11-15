package com.my.date.dao.map;

import com.my.date.domain.FeedDto;
import com.my.date.domain.FeedTagDto;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface FeedMap {
	List<FeedDto> selectFeeds();
	List<FeedDto> selectMyFeeds(int feedId);
	FeedDto selectFeed(int feedId);
	int insertFeed(FeedTagDto feed);
	int insertHashtags(@Param("tags") List<String> tags, @Param("feedId") int feedId);
	int updateFeed(FeedTagDto Feed);
	int updateHashtags(@Param("tags") List<String> tags, @Param("feedId") int feedId);
	int deleteFeed(int feedId, int userId);
	int deleteHashtags(int feedId);
	int deleteFeed(int feedId, int userId);
}