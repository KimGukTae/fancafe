package com.ezen.kimb;

public class BoardDTO {
int num;
String id,title,content,writeday;
int readcnt,groups,step,indent;
int log;
String picture;
public BoardDTO() {
	super();
	// TODO Auto-generated constructor stub
}
public BoardDTO(int num, String id, String title, String content, String writeday, int readcnt, int groups, int step,
		int indent, int log, String picture) {
	super();
	this.num = num;
	this.id = id;
	this.title = title;
	this.content = content;
	this.writeday = writeday;
	this.readcnt = readcnt;
	this.groups = groups;
	this.step = step;
	this.indent = indent;
	this.log = log;
	this.picture = picture;
}
public int getNum() {
	return num;
}
public void setNum(int num) {
	this.num = num;
}
public String getId() {
	return id;
}
public void setId(String id) {
	this.id = id;
}
public String getTitle() {
	return title;
}
public void setTitle(String title) {
	this.title = title;
}
public String getContent() {
	return content;
}
public void setContent(String content) {
	this.content = content;
}
public String getWriteday() {
	return writeday;
}
public void setWriteday(String writeday) {
	this.writeday = writeday;
}
public int getReadcnt() {
	return readcnt;
}
public void setReadcnt(int readcnt) {
	this.readcnt = readcnt;
}
public int getGroups() {
	return groups;
}
public void setGroups(int groups) {
	this.groups = groups;
}
public int getStep() {
	return step;
}
public void setStep(int step) {
	this.step = step;
}
public int getIndent() {
	return indent;
}
public void setIndent(int indent) {
	this.indent = indent;
}
public int getLog() {
	return log;
}
public void setLog(int log) {
	this.log = log;
}
public String getPicture() {
	return picture;
}
public void setPicture(String picture) {
	this.picture = picture;
}



}