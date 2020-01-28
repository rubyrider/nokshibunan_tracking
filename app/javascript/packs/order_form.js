$('#order_form').on('submit', function (e) {

    let fields = ["#user_login", "#order_user_password", "#order_address", "#order_user_full_name"];
    let i, l = fields.length;

    for (i = 0; i < l; i++) {
        let fieldId = fields[i];

        if ($(fieldId).val() === "" ) {
            toastr.error($(fieldId).attr("data-presence"));
            return false;

            e.preventDefault();
        }
    }
    $(".loader").show();
    return true;
});

function validatePassword () {
    var passwordVal  = $('#order_user_password').val();
    var comfirmVal = $('#order_user_password_confirmation').val();
    var num_regex=/^[0-9]+$/;

    if( passwordVal && comfirmVal){
        if (passwordVal.length === 4 && passwordVal.match(num_regex) ){
            if (passwordVal === comfirmVal) {
                $('#password-message').html("<%= t('user.form.errors.matched') %>").css('color', 'green');
                return true;
            } else
                $('#password-message').html("<%= t('user.form.errors.not_matched') %>").css('color', 'red');
            return false;
        }
        else{
            $('#password-message').html("<%= t('user.form.errors.invalid') %>").css('color', 'red');
            return false;
        }
    }
}
$('#order_user_password, #order_user_password_confirmation').on('keyup', validatePassword);

function get_user_data(){
    let country_code = $("#user_country").val();
    $.ajax({
        method: 'get',
        url: "/users/check_order_user",
        data: {value: $(this).val(), locale: "<%= I18n.locale.to_s %>", country_code: country_code}
    });
}
$(document).on('ready page:load', get_user_data );
$(document).on('turbolinks:load', get_user_data );
$("#order_user_login").on('change', get_user_data );

$(document).ready(function() {
    $('#order_user_country').select2();
});

function isNumberKey(evt) {
    var charCode = (evt.which) ? evt.which : evt.keyCode;
    if (charCode > 31 && (charCode < 48 || charCode > 57)){
        $('#password-info').html("<%= t('user.form.errors.invalid') %>").css('color', '#00529B');

        return false;
    }
    $('#password-info').html('');
    return true;
}
