package com.database.annotation;

import java.lang.annotation.*;

/**
 * 用来注解Mapper的查询方法
 * 查询语句的注解，写法和效果同PreparedStatement,其中的'?'通过方法的参数依次导入
 * 例子：
 * <code>
 *     public interface UserMapper{
 *       //@Query("select * from user where id = ?")
 *         User findById(Integer id);
 *     }
 * </code>
 * @author wisecoach
 */
@Target(ElementType.METHOD)
@Documented
@Retention(RetentionPolicy.RUNTIME)
public @interface Query {
    String value() default "";
}
