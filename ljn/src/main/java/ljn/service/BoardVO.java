package ljn.service;

import lombok.Data;

@Data
public class BoardVO {
   
   private int boardNo;
   private String userId;
   private String title;
   private String content;
   private String createDate;
   private String boardType;
   
   private int viewPage = 1;
   private int startIndex = 0;
   private int endIndex = 5;
   private int pageList = 5;
   private int firstPage = 0;
   private int lastPage = 0;
   
}
