(function ($) {

  $(function () {
    $('.chzn-select').chosen(); // Prettify&enhance default `select` widget
    $('.chzn-select-deselect').chosen({allow_single_deselect:true}); 

    // Picking dates using jQuery UI
    

    $('#quicksearch').live('click', function () {
      $(this).val('');
    });

    $('#fixed').live('click', function () {
      $('.eso-inner').css('width','1120px');
    });

    $('#flexible').live('click', function () {
      $('.eso-inner').css('width','96%');
    });

    $('#red').live('click', function () {
      $('#eso-body').removeClass('darktheme');
    });

    $('#black').live('click', function () {
      $('#eso-body').addClass('darktheme');
    });
  });

  $('form.form-horizontal').verified({
    theme: 'help-inline',
    fieldTheme: {
      success: 'input-success',
      failed: 'input-error'
    }
  });

})(jQuery)