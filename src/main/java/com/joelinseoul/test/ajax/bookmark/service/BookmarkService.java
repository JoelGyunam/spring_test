package com.joelinseoul.test.ajax.bookmark.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.joelinseoul.test.ajax.bookmark.domain.Bookmark;
import com.joelinseoul.test.ajax.bookmark.repository.BookmarkRepository;

@Service
public class BookmarkService {

	@Autowired
	private BookmarkRepository bookmarkRepository;
	
	
	public int addBookmark(String name, String url) {
		int count = bookmarkRepository.insertBookmark(name,url);
		return count;
	};
	
	public List<Bookmark> getBookmark(){
		List<Bookmark> getBookmark = bookmarkRepository.selectBookmark();
		return getBookmark;
	}
	
	public boolean urlDupCheck(String url) {
		int count = bookmarkRepository.urlDupCheck(url);
		
//		if(urlDupCheck == 0) {
//			return false;
//		} else {
//			return true;
//		}
		
		return count != 0;
		
	};
	
	public int deleteBookmarkById(int id) {
		int deleteBookmarkById = bookmarkRepository.deleteBookmarkById(id);
		return deleteBookmarkById;
	}
}
