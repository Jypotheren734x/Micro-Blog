/**
 * Created by nick on 6/30/17.
 */
function check(){
    var ucase = new RegExp("[A-Z]+");
    var lcase = new RegExp("[a-z]+");
    var num = new RegExp("[0-9]+");
    console.log($('#password'));

    if($("#password").val().length >= 8){
        $("#8char").removeClass("fa-remove");
        $("#8char").addClass("fa-ok");
        $("#8char").css("color","#00A41E");
    }else{
        $("#8char").removeClass("fa-ok");
        $("#8char").addClass("fa-remove");
        $("#8char").css("color","#FF0004");
    }

    if(ucase.test($("#password").val())){
        $("#ucase").removeClass("fa-remove");
        $("#ucase").addClass("fa-ok");
        $("#ucase").css("color","#00A41E");
    }else{
        $("#ucase").removeClass("fa-ok");
        $("#ucase").addClass("fa-remove");
        $("#ucase").css("color","#FF0004");
    }

    if(lcase.test($("#password").val())){
        $("#lcase").removeClass("fa-remove");
        $("#lcase").addClass("fa-ok");
        $("#lcase").css("color","#00A41E");
    }else{
        $("#lcase").removeClass("fa-ok");
        $("#lcase").addClass("fa-remove");
        $("#lcase").css("color","#FF0004");
    }

    if(num.test($("#password").val())){
        $("#num").removeClass("fa-remove");
        $("#num").addClass("fa-ok");
        $("#num").css("color","#00A41E");
    }else{
        $("#num").removeClass("fa-ok");
        $("#num").addClass("fa-remove");
        $("#num").css("color","#FF0004");
    }

    if($("#password").val() == $("#password-confirm").val()){
        $("#pwmatch").removeClass("fa-remove");
        $("#pwmatch").addClass("fa-ok");
        $("#pwmatch").css("color","#00A41E");
    }else{
        $("#pwmatch").removeClass("fa-ok");
        $("#pwmatch").addClass("fa-remove");
        $("#pwmatch").css("color","#FF0004");
    }
}