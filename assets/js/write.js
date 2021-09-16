$(function () {
    // 文件选择后，在浏览器中预览
    $('input[type=file]').change(function () {
        var file = this.files[0];
        var reader = new FileReader();
        reader.onload = function () {
            $('.upload-file').css('background-image', 'url(' + reader.result + ')')
        }
        reader.readAsDataURL(file);
    })
})