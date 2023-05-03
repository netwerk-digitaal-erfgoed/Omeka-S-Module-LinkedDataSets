$(document).ready(function() {

    $('#confirm-crawl-selected, #confirm-crawl-all').on('submit', function(e) {
        var confirmForm = $(this);
        if ('confirm-crawl-all' === this.id) {
            confirmForm.append($('.batch-query').clone());
        } else {
            $('#batch-form').find('input[name="resource_ids[]"]:checked:not(:disabled)').each(function() {
                confirmForm.append($(this).clone().prop('disabled', false).attr('type', 'hidden'));
            });
        }
    });
    $('.crawl-all').on('click', function(e) {
        Omeka.closeSidebar($('#sidebar-delete-selected'));
    });
    $('.crawl-selected').on('click', function(e) {
        Omeka.closeSidebar($('#sidebar-crawl-all'));
        var inputs = $('input[name="resource_ids[]"]');
        $('#crawl-selected-count').text(inputs.filter(':checked').length);
    });
    $('#sidebar-crawl-all').on('click', 'input[name="confirm-crawl-check-all"]', function(e) {
        $('#confirm-crawl-all input[type="submit"]').prop('disabled', this.checked ? false : true);
    });

});
