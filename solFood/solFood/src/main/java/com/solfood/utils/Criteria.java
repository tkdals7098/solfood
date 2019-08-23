package com.solfood.utils;

public class Criteria
{
 private int page;
 private int perPageNum;
 private int rowStart;
 private int rowEnd;

 private String column;
 
 
 public String getColumn() {
	return column;
}

public void setColumn(String column) {
	this.column = column;
}

public Criteria()
 {
  this.page = 1;
  this.perPageNum = 10;
 }

 public void setPage(int page)
 {
  if (page <= 0)
  {
   this.page = 1;
   return;
  }
  this.page = page;
 }

 public void setPerPageNum(int perPageNum)
 {
  if (perPageNum <= 0 || perPageNum > 100)
  {
   this.perPageNum = 10;
   return;
  }
  this.perPageNum = perPageNum;
 }

 public int getPage()
 {
  return page;
 }

 public int getPageStart()
 {
  return (this.page - 1) * perPageNum;
 }

 public int getPerPageNum()
 {
  return this.perPageNum;
 }

 @Override
 public String toString() {
  return "Criteria [page=" + page + ", perPageNum=" + perPageNum + ""
    + ", rowStart=" +  getRowStart() + ", rowEnd=" + getRowEnd()
    + "]";
 }

 public int getRowStart() {
  rowStart = ((page - 1) * perPageNum) + 0;
  return rowStart;
 }

 public int getRowEnd() {
  rowEnd = perPageNum;
  return rowEnd;
 }
}