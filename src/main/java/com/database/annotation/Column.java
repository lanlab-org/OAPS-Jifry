package com.database.annotation;

import java.lang.annotation.*;

/**
 * 默认情况下通过数据库表的列名匹配bean字段名，
 * 该注解可以注解bean的字段，使数据库表的列名匹配value，而不再是字段名
 * @author wisecoach
 */
@Target(ElementType.FIELD)
@Documented
@Retention(RetentionPolicy.RUNTIME)
public @interface Column {
    String value() default "";
}
