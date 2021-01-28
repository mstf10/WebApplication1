<%-- 
    Document   : index
    Created on : 5 Oca 2021, 17:46:39
    Author     : mergu
--%>

<%@page import="java.text.DecimalFormat"%>
<%@page import="JavaPackage.FirmaBorçları"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
    <link rel=stylesheet href=newcss.css></link>
    <script src="./jquery-3.5.1.min.js"></script>
    <title>JSP Page</title>

</head>
<body>
    <% Class.forName("org.mariadb.jdbc.Driver"); %>
    <% DecimalFormat decimalFormat = new DecimalFormat("###,###.##");%>
    <% int listno = Integer.parseInt(request.getParameter("listno"));

        FirmaBorçları firmaBorçları = new FirmaBorçları();

        firmaBorçları.ödemeListYazdır(listno);


    %>
    <%=listno%>

    <table id="myTable2" class="display" style="width:100%">
        <thead>
            <tr>
                <th><%= firmaBorçları.sütunbaşlık[0]%></th>
                <th><%= firmaBorçları.sütunbaşlık[1]%></th>
                <th><%= firmaBorçları.sütunbaşlık[2]%></th>
                <th><%= firmaBorçları.sütunbaşlık[4]%></th>
                <th><%= firmaBorçları.sütunbaşlık[5]%></th>
                <th><%= firmaBorçları.sütunbaşlık[9]%></th>
                <th><%= firmaBorçları.sütunbaşlık[10]%></th>
                <th id="tahakkuk_th"><%= firmaBorçları.sütunbaşlık[12]%></th>
                <th id="kalan_th"><%= firmaBorçları.sütunbaşlık[16]%></th>

            </tr>
        </thead>
        <tbody>
            <% for (int i = 0; i < firmaBorçları.firmaadı_arrayList.size(); i++) {%>
            <tr>
                <td><%= firmaBorçları.sırano_arrayList.get(i)%></td>
                <td name="firmaadi"><%= firmaBorçları.firmaadı_arrayList.get(i)%></td>
                <td><%= firmaBorçları.arrayList_vergino.get(i)%></td>
                <td><%= firmaBorçları.arrayList_fişno.get(i)%></td>
                <td><%= firmaBorçları.arrayList_fiştarihi.get(i)%></td>
                <td><%= firmaBorçları.arrayList_öebn.get(i)%></td>
                <td><%= firmaBorçları.arrayList_öebt.get(i)%></td>
                <td id="tahakkuk"><%=decimalFormat.format(firmaBorçları.arrayList_tahakkuk.get(i))%></td>
                <td id="kalan"><%=decimalFormat.format(firmaBorçları.arrayList_kalan.get(i))%></td>
            </tr>

            <%}
            %>

        </tbody>
        <tfoot>
            <tr>
                <td colspan="7"></td>
                <td id="tahakkuk">
                    <%  Double toplamtahakkuk = 0.0;
                        for (int i = 0; i < firmaBorçları.arrayList_tahakkuk.size(); i++) {
                            toplamtahakkuk += firmaBorçları.arrayList_tahakkuk.get(i);

                        }%>
                    <p id="toplamtahakkuk"><%=decimalFormat.format(toplamtahakkuk)%></p>

                </td>
                <td id="kalan">
                    <%  Double toplamkalan = 0.0;
                        for (int i = 0; i < firmaBorçları.arrayList_kalan.size(); i++) {
                            toplamkalan += firmaBorçları.arrayList_kalan.get(i);

                        }%>
                    <p id="toplamkalan"><%=decimalFormat.format(toplamkalan)%></p>

                </td>
            </tr>
        </tfoot>
    </table>





    <form action="./index_2.jsp?listno=<%=listno%>" target="pops" onsubmit="window.open('', 'pops', 'toolbar:0')" >
        <input type="hidden" name="yep" value="ok"></input>
        <button class="noprint" name="listno" value="<%= listno%>">Ödemeyi Tamamla</button>

        <%      if (request.getParameter("listno") != null && request.getParameter("yep") != null) {
                firmaBorçları.ödemeTamamla(String.valueOf(listno));

            }%>
    </form>



<script>
    $(function () {
        if ($("#toplamkalan").text() !== "0") {
            $("#tahakkuk*").addClass("noshow");
            $("#tahakkuk_th*").addClass("noshow");

        } else {
            $("button").addClass("noshow");
            $("#kalan*").addClass("noshow");
            $("#kalan_th*").addClass("noshow");
        }

    });
</script>



</body>
</html>
