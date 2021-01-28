function myFunction() {
// Declare variables
    var input, filter, table, tr, td, i;
    var txtValue;
    input = document.getElementById("myInput");
    filter = input.value.toUpperCase();
    table = document.getElementById("myTable");
    tr = table.getElementsByTagName("tr");
    // Loop through all table rows, and hide those who don't match the search query
    for (i = 0; i < tr.length; i++) {
        td = tr[i].getElementsByTagName("td")[0];
        if (td) {

            txtValue = td.textContent || td.innerText;
            if (txtValue.toUpperCase().indexOf(filter) > -1) {
                tr[i].style.display = "";
            } else {
                tr[i].style.display = "none";
            }
        }
    }
}


function dneme2(element) {
    document.getElementsByTagName("td").namedItem(element.id).innerHTML = element.innerHTML;
}



function dneme3(element) {

    element.onmousedown = function (event) {
        if (element.innerHTML != "0.0" && event.which == 1) {
            document.getElementsByTagName("td").namedItem(element.id).innerHTML = element.innerHTML;
            element.innerHTML = "0.0";
        }

    };

}

function dneme4(element) {
    var d4var = document.getElementsByTagName("button").namedItem(element.id).innerHTML;
    element.onmousedown = function (event) {
        if (element.innerHTML !== "0.0" && event.which === 1) {
            document.getElementsByTagName("button").namedItem(element.id).innerHTML = element.innerHTML;
            element.innerHTML = "0.0";
        }
    };
}
