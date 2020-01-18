$(document).on('turbolinks:load', function() {
    $('#change-locale').change(function() {
        this.form.submit();
    });
});