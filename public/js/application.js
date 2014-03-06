$(function(){
  $('#login-link').on('click', function(event) {
    event.preventDefault();
    var url = $(this).attr('href');
    $(this).hide();

    // Gets the Login form from the server
    $.get(url, function(serverResponse) {
      $('#append-login').append(serverResponse);

      // When the login form submit button is clicked
      $('#login-form').on('submit', function(event) {
        event.preventDefault();
        var formAction = $(this).attr('action');
        var data = $(this).serialize();

        // Sends info back to the server
        $.post(formAction, data, function() {
          window.location.href = "/all_events";
        });
      });

    });
  });

  $('#sign-up-link').on('click', function(event) {
    event.preventDefault();
    var url = $(this).attr('href');
    $(this).hide();

    // Gets the Sign Up form from the server
    $.get(url, function(serverResponse) {
      $('#append-signup').append(serverResponse)

      // When the Sign Up form submit button is clicked
      $('#signup-form').on('submit', function(event) {
        event.preventDefault();

        var formAction = $(this).attr('action');
        var data = $(this).serialize();

        // Sends the info back to the server
        $.post(formAction, data, function(serverResponse) {
          $('#ajax-message').append('<p>Your account has been created.  Please Login. </p>')
          $(".clear-field").val("");
        });
      });
    });
  });

  $('#create-event-link').on('click', function(event){
    event.preventDefault();
    var url = $(this).attr('href');
    $(this).hide();

    $.get(url, function(serverResponse) {
      $('#append-create-event').append(serverResponse);

      $('#create-event-form').on('submit', function(event) {
        event.preventDefault();
        var formAction = $(this).attr('action');
        var data = $(this).serialize();
        var eventName = $(this.name).val();
        $('#all-events-list ul').append('<li>' + eventName + '</li>');
        $(".clear-field").val("");

        $.post(formAction, data);
      });

    });
  });

});






