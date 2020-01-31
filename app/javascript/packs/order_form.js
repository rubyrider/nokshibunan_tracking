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

$(document).ready(function() {
    $('#order_user_country').select2();
});