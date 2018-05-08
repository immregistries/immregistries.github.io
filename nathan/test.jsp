<%-- Copyright © 2007 Texas Children's Hospital.  All rights reserved. --%>

<%@ page language="java" session="true" errorPage="error.jsp"%>

<%@page import="org.tch.hl7cp.core.db.tracker.managers.DatabasePool"%>
<%@page import="java.util.Properties"%>
<%@page import="java.io.File"%>
<%@page import="java.io.FileWriter"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="snaq.db.ConnectionPoolManager"%>
<%@page import="java.sql.Connection"%><html>
  <head><title>Test</title></head>
  <body>
  <% 
  
  File file = new File("/var/www/nathanbu/tomcat/logs/test.log");
  
  %>
  <%  Properties            properties            = new Properties();
  properties.put("drivers", "com.mysql.jdbc.Driver");
  properties.put("logfile", "/var/www/nathanbu/tomcat/logs/dbpool.log");
  properties.put("test.url", "jdbc:mysql://nathanbunker.com/nathanbu_tracker");
  properties.put("test.user", "nathanbu_webapp");
  properties.put("test.password", "0xkJModa");
  properties.put("test.maxpool", "5");
  properties.put("test.maxconn", "10");
  properties.put("test.expiry", "600");
  properties.put("test.init", "0");
  properties.put("test.validator", "snaq.db.AutoCommitValidator");
  properties.put("test.cache", "true");
  properties.put("test.debug", "true");
  properties.put("test.prop.zeroDateTimeBehavior", "convertToNull");
  ConnectionPoolManager.createInstance(properties);
  ConnectionPoolManager connectionPoolManager = ConnectionPoolManager.getInstance();
  Connection conn = connectionPoolManager.getConnection("test"); %>
  
  <%
  conn.close();
    %>
  </body>
</html>
