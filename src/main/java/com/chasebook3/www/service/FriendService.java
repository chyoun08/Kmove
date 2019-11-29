package com.chasebook3.www.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.chasebook3.www.dao.FriendDAO;
import com.chasebook3.www.model.Friend;
import com.chasebook3.www.model.User;

@Service
public class FriendService {

	@Autowired
	FriendDAO friendDao;
	
	public boolean friendInsert(Friend friend) {
		return (friendDao.friendInsert(friend)>=1);
	}
	
	public boolean friendApply(int userID, int fuserID) {
		System.out.println("apply1 userID : "+userID+" fuserID :"+fuserID);
		System.out.println(friendDao.friendApply(userID, fuserID));
		if(friendDao.friendApply(userID, fuserID)) {
			System.out.println("apply2");
			boolean apply = (friendDao.frienApplyFriend(userID, fuserID)==1);
			return apply;
		}else {
			return false;
		}
	}
	
	public boolean friendReject(int userID, int fuserID) {
		return friendDao.friendReject(userID, fuserID);
	}
	
	public List<User> rejectFriendList(int limit, int offset, int userSeq){
		return friendDao.rejectFriendList( limit, offset, userSeq);
	}
	
	public List<User> myFriendList(int limit, int offset, int userSeq){
		return friendDao.myFriendList(limit, offset, userSeq);
	}
	
	public List<User> requestFriendList(int limit, int offset, int userSeq){
		return friendDao.requestFriendList(limit, offset, userSeq);
	}
	
	public List<User> searchMyFriendList(int limit, int offset, int userSeq, String searchWord){
		if(searchWord.trim().length() == 0) {
			return friendDao.myFriendList(limit, offset, userSeq);
		}else {
			return friendDao.searchMyFriendList(limit, offset, userSeq, searchWord);
		}
	}
	
	public List<User> friendListFind(int limit, int offset,String search){
		if(search.trim().length()==0) {
			return friendDao.friendListALL(limit, offset);
		}else {
			return friendDao.friendListFind(limit, offset,search);
		}
	}
	
	public int friendTotalCnt(String search) {
		if(search.trim().length()==0) {
			return friendDao.friendListTotalCnt();
		}else {
			return friendDao.friendListSearchWordTotalCnt(search);
		}
	}
}
