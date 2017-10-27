$( document ).ready(function() {
  ajaxSubmitSearchForm();
  $('#phrase').on('keyup', ajaxSubmitSearchForm);
  $('#sub-filter').on('change',ajaxSubmitSearchForm);
  $('#search-form').on('submit', function(e) {
    e.preventDefault();
    ajaxSubmitSearchForm();
  })    
  function ajaxSubmitSearchForm(){
    console.log($('#search-form').serialize())
    $.ajax({
      url: $('#search-form').attr('action'),
      type: 'POST',
      dataType: "json",
      data: $('#search-form').serialize(),
      success: function (data) {

        $('#display').html(data.content);
      },
      complete: function (data) {
        console.log(data)
      }
    });
  }
})