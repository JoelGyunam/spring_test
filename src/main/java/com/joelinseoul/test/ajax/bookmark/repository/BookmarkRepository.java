package com.joelinseoul.test.ajax.bookmark.repository;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.joelinseoul.test.ajax.bookmark.domain.Bookmark;

@Repository
public interface BookmarkRepository {

	public int insertBookmark(
			@Param("name") String name
			, @Param("url") String url);
	
	public List<Bookmark> selectBookmark();
	
	public int urlDupCheck(@Param("url") String url);
	
	public int deleteBookmarkById(@Param("id") int id);
}
