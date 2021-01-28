<%-- 
    Document   : index
    Created on : 5 Oca 2021, 17:46:39
    Author     : mergu
--%>

<%@page import="JavaPackage.FirmaBorçları"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel=stylesheet href=newcss.css>
        <link rel=stylesheet href=newcss_1.css>
            <script src="./jquery-3.5.1.min.js"></script>
            <title>JSP Page</title>
            </head>
            <body>
                <% Class.forName("org.mariadb.jdbc.Driver"); %>

                <%-- <button onclick="window.open('./index_1.jsp', '_blank', 'toolbar=yes')">firma</button> --%>


                <button onclick="window.open('./index_3.jsp')">firmal</button>

                <% FirmaBorçları firmaBorçları = new FirmaBorçları();
                    firmaBorçları.ödemeListesiKontrol();
                %>

                <table>

                    <% for (int i = 0; i < firmaBorçları.ödemelistesikontrol_arrayList.size(); i++) {%>
                    <tr>
                        <td>
                            <form action="./index_2.jsp" target="pops"
                                  onsubmit="window.open('', 'pops', 'toolbar=0')">  
                                <input type="hidden" name="listno" value="<%= firmaBorçları.ödemelistesikontrol_arrayList.get(i)%>"/>
                                <button >
                                    Ödeme Listesi No:<%= firmaBorçları.ödemelistesikontrol_arrayList.get(i)%>
                                </button>
                            </form>
                        </td>
                    </tr>
                    <%}%>

                </table>



            </body>
            </html>
