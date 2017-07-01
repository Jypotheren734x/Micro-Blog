/**
 * Created by nick on 6/30/17.
 */
$(function () {
    $("#sign_up_form").validate({
        showErrors: function(errorMap, errorList) {
            errorList.forEach(function (p1, p2, p3) {
                $("#error"+p1.element.id).html('<i class="fa fa-remove">'+p1.message + '</i>');
            });
        },
        rules: {
            name:{
                required: true,
                minlength: 5,
                maxlength: 50
            },
            username:{
              required: true,
                minlength: 5,
                maxlength: 50
            },
            age:{
                required: true,
                digits: true
            },
            email: {
                required: true,
                email: true
            },
            password: {
                required: true,
                minlength: 8,
                maxlength: 50
            },
            password_confirm:    {
                equalTo: "#password",
                minlength: 8,
                maxlength: 50
            }
        },
        message: {
            password: {
                required:"the password is required"
            }
        }
    });
});