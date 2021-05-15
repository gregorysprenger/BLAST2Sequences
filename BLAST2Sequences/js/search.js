//JS drop down menu
$(document).ready( function() {
    $('#search').autocomplete({
        source: "./autocomplete.cgi"
    })


//alert if sequence 1 or 2 is empty
   //if ($("#query1").val().trim().length < 1) {
     // alert("warning");
      //return;
  // }
    $("#blast_seq").on("submit", function(e) {
        if (!$.trim($("#query1").val())) {
            e.preventDefault();
            alert('Sequence 1 is empty.');
        }
        else if (!$.trim($("#query2").val())) {
            e.preventDefault();   
            alert('Sequence 2 is empty.');
        }
        else {
            $("#blast_seq").submit();
        }
    })

    $("#search_results").on("submit", function(e) {
        if (!$.trim($("search").val())) {
            e.preventDefault();
            alert('Previous analysis is blank.');
        }
    })

});
