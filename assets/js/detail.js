$(function () {
    $('.btn-show-less').click(function () {
        $(this).parent().addClass('hidden');
        $(this).parent().prev().removeClass('hidden')
    })
    $('.btn-show-more').click(function () {
        $(this).parent().addClass('hidden');
        $(this).parent().next().removeClass('hidden')
    })

})