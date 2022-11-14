package com.my.date.dao.map;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.my.date.domain.Feed;
import com.my.date.domain.FeedDto;
import com.my.date.domain.FeedTagDto;

public interface FeedMap {
	List<Feed> selectFeeds();
	List<FeedDto> selectMyFeeds(int feedId);
	FeedDto selectFeed(int feedId);
	int insertFeed(FeedTagDto feed);
	int insertHashtags(@Param("tags") List<String> tags, @Param("feedId") int feedId);
	int selectHashtag(@Param("feedId") int feedId, @Param("tag") String tag);
}