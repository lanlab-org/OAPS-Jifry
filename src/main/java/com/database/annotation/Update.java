package com.database.annotation;

import java.lang.annotation.*;

/**
 * 用来注解Mapper的修改方法
 * 修改语句的注解，写法和效果同PreparedStatement,其中的'?'通过方法的参数依次导入
 * 例子：
 * <code>
 *     public interface UserMapper{
 *       //@Update("update user set name=? where id=?")
 *         void updateNameById(String name, Integer id);
 *
 *       //@Update("insert into user(id,name) values (?,?)")
 *         void addUser(Integer id, String name);
 *
 *       //@Update("delete from user where id=?")
 *         void deleteById(Integer id);
 *     }
 * </code>
 * @author wisecoach
 */
@Target(ElementType.METHOD)
@Documented
@Retention(RetentionPolicy.RUNTIME)
public @interface Update {
    String value() default "";
}
