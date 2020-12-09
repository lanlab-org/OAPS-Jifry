package com.mapper.mapper;

import com.database.annotation.Query;
import com.database.annotation.Update;
import com.javaBean.Subject;

import java.util.List;

public interface SubjectMapper {
    @Query("select * from subject order by parentsid")
    List<Subject> selectAll();

    @Query("select * from subject where id = ?")
    Subject selectById(Integer id);

    @Update("udpate subject set name = ? where id = ?")
    void updateName(String name, Integer id);
}
