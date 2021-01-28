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
        <script src="./jquery-3.5.1.min.js"></script>
        <title>JSP Page</title>


    </head>
    <body>
        <% Class.forName("org.mariadb.jdbc.Driver"); %>

        <form method="get">
            <select name="donem">
                <option>Dönem:</option>
                <option value="%">Hepsi</option>
                <option>09</option>
                <option>10</option>
                <option>11</option>
                <option>12</option>
            </select>
            <input type="submit" value="ok"/>

        </form>

        <% FirmaBorçları firmaBorçları = new FirmaBorçları();
            firmaBorçları.setFirmaBorçları();
            String dönem = request.getParameter("donem");

            if (dönem != "donem") {
                firmaBorçları.setDönem(dönem);
            }


        %>



        <% firmaBorçları.setFirmaBorçları();%>
        <% firmaBorçları.ödemeListesiKontrol();%>
        <span id="listnospan"><%=Collections.max(firmaBorçları.ödemelistesikontrol_arrayList) + 1%></span>

        <table id="myTable" style="width:100%">
            <thead>
                <tr>
                    <th><%= firmaBorçları.sütunbaşlık[0]%><br><input type="text" size="5" id="siranonotext" value=""/></th>
            <th><%= firmaBorçları.sütunbaşlık[1]%></th>
            <th><%= firmaBorçları.sütunbaşlık[2]%></th>
            <th><%= firmaBorçları.sütunbaşlık[3]%></th>
            <th><%= firmaBorçları.sütunbaşlık[4]%></th>
            <th><%= firmaBorçları.sütunbaşlık[5]%></th>
            <th><%= firmaBorçları.sütunbaşlık[6]%></th>
            <th><%= firmaBorçları.sütunbaşlık[7]%></th>
            <th><%= firmaBorçları.sütunbaşlık[8]%></th>
            <th><%= firmaBorçları.sütunbaşlık[9]%></th>
            <th><%= firmaBorçları.sütunbaşlık[10]%></th>
            <th><%= firmaBorçları.sütunbaşlık[11]%></th>
            <th><%= firmaBorçları.sütunbaşlık[12]%></th>
            <th><%= firmaBorçları.sütunbaşlık[13]%></th>
            <th><%= firmaBorçları.sütunbaşlık[14]%></th>
            <th><%= firmaBorçları.sütunbaşlık[15]%></th>
            <th><%= firmaBorçları.sütunbaşlık[16]%><br><input type="text" name="kalantoplam"/><br><input type="text" id="kalantoplamtext"/><br><button id="cboxallbutton">Hepsini Seç</button></th>
            <th><%= firmaBorçları.sütunbaşlık[17]%></th>
            </tr>
            </thead>
            <tbody>

                <% for (int i = 0; i < firmaBorçları.firmaadı_arrayList.size(); i++) {%>
                <tr name="tr">
                    <td id="<%=i%>" name="sirano" value="<%= firmaBorçları.sırano_arrayList.get(i)%>"><%= firmaBorçları.sırano_arrayList.get(i)%></td>
                    <td><%= firmaBorçları.firmaadı_arrayList.get(i)%></td>
                    <td><%= firmaBorçları.arrayList_vergino.get(i)%></td>
                    <td><%= firmaBorçları.arrayList_hesapkodu.get(i)%></td>
                    <td><%= firmaBorçları.arrayList_fişno.get(i)%></td>
                    <td><%= firmaBorçları.arrayList_fiştarihi.get(i)%></td>
                    <td><%= firmaBorçları.arrayList_ftbs.get(i)%></td>
                    <td><%= firmaBorçları.arrayList_mkt.get(i)%></td>
                    <td><%= firmaBorçları.arrayList_mktbs.get(i)%></td>
                    <td><%= firmaBorçları.arrayList_öebn.get(i)%></td>
                    <td><%= firmaBorçları.arrayList_öebt.get(i)%></td>
                    <td><%= firmaBorçları.arrayList_iliskino.get(i)%></td>
                    <td><%= firmaBorçları.arrayList_tahakkuk.get(i)%></td>
                    <td><%= firmaBorçları.arrayList_103k.get(i)%></td>
                    <td><%= firmaBorçları.arrayList_320k.get(i)%></td>
                    <td><%= firmaBorçları.arrayList_diğerk.get(i)%></td>
                    <td><button id="<%=i%>" name="kalan" onclick="loadDoc(this)"><%=firmaBorçları.arrayList_kalan.get(i)%></button><input type="checkbox" name="cbox"/></td>
            <td><form action="./index_2.jsp" target="pops" onsubmit="window.open('', 'pops', 'toolbar:0')">
                    <button id="<%=i%>" name="listno"  value="<%= firmaBorçları.ödemelistesi_arrayList.get(i)%>"><%= firmaBorçları.ödemelistesi_arrayList.get(i)%></button>
                </form></td>

            </tr>
            <%}
            %>
            </tbody>
        </table> 



    <script>
        function loadDoc(element) {
            var xhttp = new XMLHttpRequest();
            var sirano = document.getElementsByName("sirano")[element.id];
            var listno = document.getElementsByName("listno")[element.id];
            var listnospan = document.getElementById("listnospan");
            xhttp.onreadystatechange = function () {
                listno.innerHTML = listnospan.innerHTML;
                listno.value = listnospan.innerHTML;
            };
            var url = "./index_3.jsp?sirano=" + sirano.innerText;
            xhttp.open("get", url, true);
            xhttp.send();
        }
    </script>

    <script>
        $(function () {
            $("button").click(function () {
                $(this).css("backgroundColor", "orange");
            });
        });
    </script>
    <p name="ppp">aaaaaaaaaaaaaaaaa</p>
    <script>
        $(function () {
            $("#siranonotext").keypress(function (e) {
                if (e.key === "Enter") {
                    var dd = [];
                    $("td[name='sirano']").each(function (i) {
                        dd[i] = $(this).text();
                    });
                    if ($.inArray($(this).val(), dd) !== -1) {
                        $("td[name='sirano']").css("color", "black");
                        $("td[name='sirano']:eq(" + $.inArray($(this).val(), dd) + ")").css("color", "red");
                        $("td[name='sirano']:not(:eq(" + $.inArray($(this).val(), dd) + "))").css("color", "green");
                        // $("tr[name='tr']:not(:eq(" + $.inArray($(this).val(), dd) + "))").addClass("noshow");
                        $("tr[name='tr']:eq(" + $.inArray($(this).val(), dd) + ")").nextAll().addClass("noshow");
                    } else {
                        $("td[name='sirano']").css("color", "black");
                        //$("tr[name='tr']:not(:eq(" + $.inArray($(this).val(), dd) + "))").removeClass("noshow");
                        $("tr[name='tr']").removeClass("noshow");
                    }


                }
                // $("p[name='ppp']").text(JSON.stringify(dd));
            }
            );
        });
    </script>


    <script>
        $(document).change(function () {

            var kalantoplam = 0.0;
            $("tr[class!='noshow'] button[name='kalan']").each(function () {
                kalantoplam += Number($(this).text());
                $("input[name='kalantoplam']").val(kalantoplam.toLocaleString());
            });
        });
    </script>

    <script>
        $(function () {
            $("#kalantoplamtext").keypress(function (e) {
                if (e.key === 'Enter') {
                    var ddd = [];
                    var dss = 0.0;
                    var asd;
                    $("tr[name='tr']").each(function (i) {
                        ddd[i] = Number($(this).find("button[name='kalan']").text());
                        dss += ddd[i];
                        if (dss < Number($("#kalantoplamtext").val())) {
                            asd = i;
                        }
                    });
                    if (asd !== null) {
                        $("tr[name='tr']").removeClass("noshow");
                        $("tr[name='tr']:eq(" + asd + ")").nextAll().addClass("noshow");
                    } else {
                        $("tr[name='tr']").removeClass("noshow");
                    }

                }
            });
        });
    </script>

    <script>
        $(function () {
            $("#cboxallbutton").click(function () {

                $("tr[class!='noshow'] input[name='cbox']").prop("checked", function (i) {
                    var dfs = [];
                    var clistno = $("#listnospan").text();
                    dfs[i] = $("td[name='sirano']:eq(" + i + ")").text();

                    $.ajax({
                        type: 'POST',
                        url: "index_3.jsp",
                        data: {"sirano": dfs[i]},
                        success: function () {
                            $("button[name='listno']").text(clistno);
                            $("button[name='listno']").val(clistno);
                        }
                    });

                    return true;

                });



            });
        });

    </script>


    <% int asd = 0;
        int ödemeListNo = Collections.max(firmaBorçları.ödemelistesikontrol_arrayList) + 1;

        if (request.getParameter("sirano") != null) {
            asd = Integer.parseInt(request.getParameter("sirano"));
            firmaBorçları.firmaekle(asd, ödemeListNo);

        }%>







</body>
</html>
