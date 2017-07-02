
$.validator.setDefaults( {
    submitHandler: function () {
        $('#sign_up_form').submit();
        alert( "submitted!" );
    }
} );

$( document ).ready( function () {
    $( "#sign_up_form" ).validate( {
        rules: {
            name: {required: true},
            username: {
                required: true,
                minlength: 2,
                maxlength: 50
            },
            password: {
                required: true,
                minlength: 5
            },
            password_confirm: {
                required: true,
                minlength: 5,
                equalTo: "#password"
            },
            email: {
                required: true,
                email: true
            }
        },
        messages: {
            name: "Please enter your name",
            username: {
                required: "Please enter a username",
                minlength: "Your username must consist of at least 2 characters",
                maxlength: "Your username must consist of less then 50 characters"
            },
            password: {
                required: "Please provide a password",
                minlength: "Your password must be at least 5 characters long"
            },
            confirm_password: {
                required: "Please provide a password",
                minlength: "Your password must be at least 5 characters long",
                equalTo: "Please enter the same password as above"
            },
            email: "Please enter a valid email address"
        },
        errorElement: "em",
        errorPlacement: function ( error, element ) {
            // Add the `help-block` class to the error element
            error.addClass( "help-block" );

            // Add `has-feedback` class to the parent div.form-group
            // in order to add icons to inputs
            element.parents( ".form-group" ).addClass( "has-feedback" );

            if ( element.prop( "type" ) === "checkbox" ) {
                error.insertAfter( element.parent( "label" ) );
            } else {
                error.insertAfter( element );
            }

            element.addClass("form-control-danger");
        },
        success: function ( label, element ) {

            // Add the span element, if doesn't exists, and apply the icon classes to it.
            if ( !$( element ).next( "span" )[ 0 ] ) {
                $( "<span class='form-control-feedback'></span>" ).insertAfter( $( element ) );
            }
        },
        highlight: function ( element, errorClass, validClass ) {
            $( element ).parents( ".input-group" ).addClass( "has-danger" ).removeClass( "has-success" );
            $( element ).next( "span" ).addClass( "fa-remove" ).removeClass( "fa-ok" );
        },
        unhighlight: function ( element, errorClass, validClass ) {
            $( element ).parents( ".input-group" ).addClass( "has-success" ).removeClass( "has-danger" );
            $( element ).next( "span" ).addClass( "fa-ok" ).removeClass( "fa-remove" );
        }
    } );
} );
	