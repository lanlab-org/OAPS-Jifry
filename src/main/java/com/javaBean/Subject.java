package com.javaBean;

import java.sql.Timestamp;

public class Subject {
     public int sid;
     public String subject;
     public Timestamp sdate;
     public String oldsubject;
     public int parentsid;

    public int getParentsid() {
        return parentsid;
    }

    public void setParentsid(int parentsid) {
        this.parentsid = parentsid;
    }

    public String getOldsubject() {
        return oldsubject;
    }

    public void setOldsubject(String oldsubject) {
        this.oldsubject = oldsubject;
    }

    public int getSid() {
        return sid;
    }

    public void setSid(int sid) {
        this.sid = sid;
    }

    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }

    public Timestamp getSdate() {
        return sdate;
    }

    public void setSdate(Timestamp sdate) {
        this.sdate = sdate;
    }
}
