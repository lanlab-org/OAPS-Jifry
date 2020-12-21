package com.mapper.mapper;

import com.database.annotation.Query;
import com.javaBean.Article;

import java.util.List;

public interface ArticleMapper {
    @Query("select * from article a, subject s where a.sid = s.sid")
    List<Article> findWithSubject();
}
