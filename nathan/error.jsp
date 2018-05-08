<%-- Copyright © 2007 Texas Children's Hospital.  All rights reserved. --%>

<%@ page isErrorPage="true" %>
<%@ page import="java.io.*" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.DateFormat" %>
<%@ page import="java.util.Enumeration" %>
<%
  if (exception == null) {
    exception = new Exception("Unknown Exception");
  }
  response.setStatus(400, exception.getMessage());
  
  String todays_date =
    DateFormat.getDateTimeInstance
      (DateFormat.LONG, DateFormat.LONG).format(new java.util.Date());
%>
  <br>
  <div align="center">
    <table cellspacing="1">
      <tr>
        <td class="tabletitle">Application Error</td>
      </tr>
      <tr>
        <td bgcolor="#C0C0C0">
          There has been an error with the web application.  Try 
          <a href="javascript:window.location.reload()">reloading</a> this page.
          If this error occurs consistently, please contact User Services.  Click
          here to return to the <a href="main.jsp">main</a> page.
        </td>
      </tr>
      <tr>
        <td bgcolor="#EEEEEE">
          <b><u>Exception:</u></b>&nbsp;&nbsp;<%= exception %>
        </td>
      </tr>
      <tr>
        <td bgcolor="#EEEEEE">
          <b><u>Message:</u></b>&nbsp;&nbsp;<%= exception.getMessage() %>
        </td>
      </tr>
      <tr>
        <td bgcolor="#EEEEEE">
          <b><u>Localized Message:</u></b>&nbsp;&nbsp;<%= exception.getLocalizedMessage() %>
        </td>
      </tr>
      <tr>
        <td bgcolor="#EEEEEE">
          <b><u>Stack Trace:</u></b>
          <pre><% exception.printStackTrace(new PrintWriter(out)); %></pre>
        </td>
      </tr><% 
      exception = exception.getCause();
      while (exception != null) {  %>
        <tr>
          <td bgcolor="#EEEEEE">
            <b><u>Caused by:</u></b>
            <pre><% exception.printStackTrace(new PrintWriter(out)); %></pre>
          </td>
        </tr><%
        exception = exception.getCause();
      }  %>
      <tr>
        <td bgcolor="#EEEEEE">
          <b><u>Time of Error:</u></b>&nbsp;&nbsp;<%= todays_date %>
        </td>
      </tr>
    </table>
    <br>
    <%-- Print Request Attributes --%>
    <table cellspacing="1" width="85%">
      <tr>
        <td class="tabletitle" colspan="2">Request Attributes</td>
      </tr> <%
      Enumeration enum1 = request.getAttributeNames();
      String name;
      while (enum1.hasMoreElements()) {
        name = (String)enum1.nextElement(); %>
        <tr>
          <td class="dark"><%= name %></td>
          <td class="light"><%= request.getAttribute(name) %></td>
        </tr> <%
      } %>
    </table>
    <br>
    <%-- Print Request Parameters --%>
    <table cellspacing="1" width="85%">
      <tr>
        <td class="tabletitle" colspan="2">Request Parameters</td>
      </tr> <%
      enum1 = request.getParameterNames();
      String parameter;
      String valuesString;
      String[] valuesArray;
    
      while (enum1.hasMoreElements()) {
        parameter = (String)enum1.nextElement();
        valuesArray = request.getParameterValues(parameter);
        valuesString = "";
        for (int i=0; i<valuesArray.length; i++) {
          valuesString += (i==0)?"":",";
          valuesString += valuesArray[i];
        }
        if (parameter.equals("password")) {
          valuesString = "**********";
        } %>
        <tr>
          <td class="dark"><%= parameter %></td>
          <td class="light"><%= valuesString %></td>
        </tr> <%
      }  %>
    </table>
  </div>
