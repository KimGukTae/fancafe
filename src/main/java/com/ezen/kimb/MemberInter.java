package com.ezen.kimb;

import java.util.ArrayList;

public interface MemberInter {
	public void memberinsert(String id, String pw, String name, String tel, String email, String address, String day);
	public ArrayList<MemberDTO> memberout();
	public MemberDTO login(String id, String pw);
	public void boardinsert(String id,String title,String content);
	public ArrayList<BoardDTO> boardout();
	public ArrayList<BoardDTO> detail(int num);
	public void readcnt(int num);
	public ArrayList<BoardDTO> replyview(int num,String id);
	public void reply(int groups,int step,int indent,String id,String title,String content,int num);
	public void stepup(int groups,int step);
	public ArrayList<MemberDTO> boardin(String id);
	public ArrayList<BoardDTO> modifya(int num,String id);
}
