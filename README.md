# OAPS-Jifry

》chenzhenhuang 分支

### 核心功能

仅通过接口和方法，依靠动态代理自动生成操作数据库的对象，使用起来比较类似Mybatis，但是很明显的不同是，对事务管理在内部进行处理了，作为插件使用可能很拉跨，还是当一个小工具类用吧。

### 重要组件

1. MapperInvocationHandler
   1. 拥有localConnectionHolder, mapperInterceptor
   2. 实现了InvocationHandler, 用于生成动态代理对象
   3. 使用localConnectionHolder进行事务管理
2. LocalConnectionHolder
   1. 拥有database，可以产生连接
   2. 通过ThreadLocal<Connection> 实现了线程隔离地保存数据库连接，使Mapper可以单例处理所有请求
   3. 可以通过localConnection来实现事务管理，供MapperInvocationHandler来调用
3. MapperInterceptor
   1. 用于读取被代理方法的信息和参数，来执行对应的数据库操作
   2. 根据返回值的类型，反射生成对应的实例以及属性注入
4. Annotation
   1. @Query，该注解用于为Mapper接口方法添加查询用的sql语句
   2. @Update, 该注解用于为Mapper接口方法添加用于修改的sql语句
   3. @Column，该注解用于为Bean的字段添加别名，用于匹配数据库列名
5. Mapper接口
   1. 被动态代理的接口，用于定义Dao层方法，注入Sql语句和对应参数
6. MyDataSource
   1. 直接使用了DriverManager实现的DataSource
   2. 读取db.properties参数，统一配置数据库参数，而不是内置到java程序，只需要修改配置文件，而不是重新编译程序
7. DBUtil
   1. 提供了getMapper方法，这里调用了动态代理，首先实例化LocalConnectionHolder和InvocationHandler，再生成代理实例

### 使用样例

```java
public interface SubjectMapper{
    
    @Query("select * from subject order by parentsid")
    List<Subject> selectAll();
    
    //Query中的sql语句写法同PrepareStatement,参数也请按序
    @Query("select * from subject where id = ?")
    Subject selectById(Integer id);
    
    //Update中的sql语句写法同PrepareStatement,参数也请按序
    @Update("udpate subject set name = ? where id = ?")
    void updateName(String name, Integer id);
}

public class AuthorController extends HttpServlet{
    ...
    //实例化Mapper
    private SubjectMapper mapper = DBUtil.getMapper(SubjectMapper.class);
    ...
        
    public void doGet...{
        ...
        if (page == null){
            //使用Mapper取得数据
            List<Subject> subjects = mapper.selectAll();
            request.getSession().setAttribute("result", subjects);
        }
        ...
    }
}

//AuthorHome.jsp
<%--<sql:setDataSource user="wzf" password="wzf" url="jdbc:mysql://47.115.56.157:3306/oo?serverTimezone=GMT%2B8" driver="com.mysql.jdbc.Driver" var="db"/>--%>

<%--<sql:query var="result" dataSource="${ db}">--%>
<%--    select * from article a , subject s where a.sid=s.sid--%>
<%--</sql:query>--%>
...
<c:forEach items="${result}" var="row">
<tr>
<td><c:out value="${ row.subject}"></c:out></td>
<td><c:out value="${ row.title}"></c:out></td>
<td><c:out value="${ row.highlight}"></c:out></td>
    <td><c:out value="${ row.hide}"></c:out></td>
<td><a href="AuthorController?page=edit&title=${ row.title}">edit</a> ||
    <a href="AuthorController?page=delete&title=${ row.title}">delete</a>||
    <a href="AuthorController?page=show&title=${ row.title}">show</a>||
    <a href="AuthorController?page=hide&title=${ row.title}">hide</a>
</td>
</tr>
...
```

### 实现方式

​	请看源码，有给注释



