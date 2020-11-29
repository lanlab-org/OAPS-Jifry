<%--
  Created by IntelliJ IDEA.
  User: 18453
  Date: 2020/11/20
  Time: 10:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.net.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>
<html>
  <head>
    <title>$Title$</title>
  </head>
  <body>
  $END$
  <%
    InetAddress inetAddress;
    StringBuilder sb = new StringBuilder();
    String ipAddress="",macAddress="";
    int i=0;
    try {
      inetAddress=InetAddress.getLocalHost();
      ipAddress=inetAddress.getHostAddress();
      NetworkInterface network=NetworkInterface.getByInetAddress(inetAddress);
      byte[] hw=network.getHardwareAddress();
      for(i=0; i<hw.length; i++)
        sb.append(String.format("%02X%s", hw[i], (i < hw.length - 1) ? "-" :
                ""));
      macAddress=sb.toString();
    } catch(Exception e) {
      out.print("<br/>"+e.toString());
      macAddress="-";
    }
    out.print("<br/>"+ipAddress);
    out.print("<br/>"+macAddress);
  %>
  </body>
</html>
