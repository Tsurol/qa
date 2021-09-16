$(function () {
    // 点击，查看更多，把详细的那个p标签展示出来，把自己隐藏
    $('.show-desc').click(function () {
        $(this).addClass('hidden');
        $(this).next().removeClass('hidden')
    })
    $('.show-all').click(function () {
        $(this).addClass('hidden');
        $(this).prev().removeClass('hidden')
    })
})
  