package com.mapper.mapper;

import com.database.annotation.Query;
import com.javaBean.Subject;

import java.util.List;

public interface SubjectMapper {
    @Query("select * from subject order by parentsid")
    List<Subject> selectAll();
}
