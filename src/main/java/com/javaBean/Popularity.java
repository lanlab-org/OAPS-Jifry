package com.javaBean;

public class Popularity implements Comparable<Popularity>{
    Integer aid;
    Integer commentNum;
    Integer likesNum;
    Integer dislikeNum;
    Integer visitNum;
    Double dayDis;
    Double popularity;
    String title;

    public Popularity(Integer aid, Integer commentNum, Integer likesNum, Integer dislikeNum, Integer visitNum, Double dayDis, Double popularity, String title) {
        this.aid = aid;
        this.commentNum = commentNum;
        this.likesNum = likesNum;
        this.dislikeNum = dislikeNum;
        this.visitNum = visitNum;
        this.dayDis = dayDis;
        this.popularity = popularity;
        this.title = title;
    }

    public Popularity() {
    }

    public Integer getAid() {
        return aid;
    }

    public void setAid(Integer aid) {
        this.aid = aid;
    }

    public Integer getCommentNum() {
        return commentNum;
    }

    public void setCommentNum(Integer commentNum) {
        this.commentNum = commentNum;
    }

    public Integer getLikesNum() {
        return likesNum;
    }

    public void setLikesNum(Integer likesNum) {
        this.likesNum = likesNum;
    }

    public Integer getDislikeNum() {
        return dislikeNum;
    }

    public void setDislikeNum(Integer dislikeNum) {
        this.dislikeNum = dislikeNum;
    }

    public Integer getVisitNum() {
        return visitNum;
    }

    public void setVisitNum(Integer visitNum) {
        this.visitNum = visitNum;
    }

    public Double getDayDis() {
        return dayDis;
    }

    public void setDayDis(Double dayDis) {
        this.dayDis = dayDis;
    }

    public Double getPopularity() {
        return popularity;
    }

    public void setPopularity(Double popularity) {
        this.popularity = popularity;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    @Override
    public String toString() {
        return "Popularity{" +
                "aid=" + aid +
                ", commentNum=" + commentNum +
                ", likesNum=" + likesNum +
                ", dislikeNum=" + dislikeNum +
                ", visitNum=" + visitNum +
                ", dayDis=" + dayDis +
                ", popularity=" + popularity +
                ", title='" + title + '\'' +
                '}';
    }

    @Override
    public int compareTo(Popularity o) {
        if(o.popularity!=this.popularity){
            return Double.valueOf(o.popularity).compareTo(Double.valueOf(this.popularity));
        }
        else{
            return Integer.valueOf(this.aid).compareTo(Integer.valueOf(o.aid));
        }
    }
}
