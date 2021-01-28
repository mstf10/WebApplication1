<%-- 
    Document   : index
    Created on : 5 Oca 2021, 17:46:39
    Author     : mergu
--%>

<%@page import="java.util.Collections"%>
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
                <form>
                    <select name="dönem">
                        <option>Dönem:</option>
                        <option value="%">Hepsi</option>
                        <option>9</option>
                        <option>10</option>
                        <option>11</option>
                        <option>12</option>
                    </select>
                    <input type="submit" name="dönemsubmit" value="ok"/>
                </form>


                <%     String dönem = request.getParameter("dönem");

                    FirmaBorçları firmaBorçları = new FirmaBorçları();
                    if (dönem != "dönem") {
                        firmaBorçları.setDönem(dönem);
                    }
                    firmaBorçları.setFirmaBorçları();


                %>
                <% firmaBorçları.ödemeListesiKontrol();%>
                <%=Collections.max(firmaBorçları.ödemelistesikontrol_arrayList) + 1%>

                <table id="myTable" class="display" style="width:100%">
                    <thead>
                        <tr>
                            <th><%= firmaBorçları.sütunbaşlık[0]%> </th>
                            <th><%= firmaBorçları.sütunbaşlık[1]%> </th>
                            <th><%= firmaBorçları.sütunbaşlık[2]%> </th>
                            <th><%= firmaBorçları.sütunbaşlık[3]%> </th>
                            <th><%= firmaBorçları.sütunbaşlık[4]%> </th>
                            <th><%= firmaBorçları.sütunbaşlık[5]%> </th>
                            <th><%= firmaBorçları.sütunbaşlık[6]%> </th>
                            <th><%= firmaBorçları.sütunbaşlık[7]%> </th>
                            <th><%= firmaBorçları.sütunbaşlık[8]%> </th>
                            <th><%= firmaBorçları.sütunbaşlık[9]%> </th>
                            <th><%= firmaBorçları.sütunbaşlık[10]%> </th>
                            <th><%= firmaBorçları.sütunbaşlık[11]%> </th>
                            <th><%= firmaBorçları.sütunbaşlık[12]%> </th>
                            <th><%= firmaBorçları.sütunbaşlık[13]%> </th>
                            <th><%= firmaBorçları.sütunbaşlık[14]%> </th>
                            <th><%= firmaBorçları.sütunbaşlık[15]%> </th>
                            <th><%= firmaBorçları.sütunbaşlık[16]%> </th>
                            <th><%= firmaBorçları.sütunbaşlık[17]%> </th>
                        </tr>
                    </thead>
                    <tbody>







                        <% for (int i = 0; i < firmaBorçları.firmaadı_arrayList.size(); i++) {%>
                        <tr>
                            <td>
                                <%= firmaBorçları.sırano_arrayList.get(i)%>  
                            </td>
                            <td name="firmaadi">
                                <%= firmaBorçları.firmaadı_arrayList.get(i)%>  
                            </td>
                            <td>
                                <%= firmaBorçları.arrayList_vergino.get(i)%>  
                            </td>
                            <td>
                                <%= firmaBorçları.arrayList_hesapkodu.get(i)%>  
                            </td>
                            <td>
                                <%= firmaBorçları.arrayList_fişno.get(i)%>  
                            </td>
                            <td>
                                <%= firmaBorçları.arrayList_fiştarihi.get(i)%>  
                            </td>
                            <td>
                                <%= firmaBorçları.arrayList_ftbs.get(i)%>  
                            </td>
                            <td>
                                <%= firmaBorçları.arrayList_mkt.get(i)%>  
                            </td>
                            <td>
                                <%= firmaBorçları.arrayList_mktbs.get(i)%>  
                            </td>
                            <td>
                                <%= firmaBorçları.arrayList_öebn.get(i)%>  
                            </td>
                            <td>
                                <%= firmaBorçları.arrayList_öebt.get(i)%>  
                            </td>
                            <td>
                                <%= firmaBorçları.arrayList_iliskino.get(i)%>  
                            </td>
                            <td id="tahakkuk">
                                <%= firmaBorçları.arrayList_tahakkuk.get(i)%>  
                            </td>
                            <td name="103k_<%=i%>">
                                <%= firmaBorçları.arrayList_103k.get(i)%>  
                            </td>
                            <td>
                                <%= firmaBorçları.arrayList_320k.get(i)%>  
                            </td>
                            <td>
                                <%= firmaBorçları.arrayList_diğerk.get(i)%>  
                            </td>
                            <td>

                                <form method="post">
                                    <input type="hidden" name="kalan<%=i%>" value="<%=firmaBorçları.arrayList_kalan.get(i)%>"/>
                                    <input type="hidden" name="sirano<%=i%>" value="<%=firmaBorçları.sırano_arrayList.get(i)%>"/>
                                    <input type="submit" name="kalansubmit" value="<%=firmaBorçları.arrayList_kalan.get(i)%>"/>
                                </form>
                            </td>
                            <td>
                                <form action="index_2.jsp">
                                    <button name="listno" value="<%= firmaBorçları.ödemelistesi_arrayList.get(i)%>"><%= firmaBorçları.ödemelistesi_arrayList.get(i)%></button>
                                </form>
                            </td>

                        </tr>
                        <%}
                        %>
                    </tbody>
                </table>





                <% int asd = 0;
                    int ödemeListNo = Collections.max(firmaBorçları.ödemelistesikontrol_arrayList) + 1;

                    for (int i = 0; i < firmaBorçları.sırano_arrayList.size(); i++) {
                        if (request.getParameter("sirano" + i) != null && request.getParameter("kalan" + i) != "") {
                            asd = Integer.parseInt(request.getParameter("sirano" + i));
                            firmaBorçları.firmaekle(asd, ödemeListNo);

                        };

                    }%>

            <script>

            </script>





            </body>
            </html>
