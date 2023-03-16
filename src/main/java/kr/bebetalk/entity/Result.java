package kr.bebetalk.entity;

import lombok.Data;

@Data
public class Result {
   
   private String prediction;
   private float probability;
   private String resultString;
   
   public void setResultString(String resultString) {
      this.resultString = resultString;
   }

}