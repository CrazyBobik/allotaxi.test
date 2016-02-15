$(function () {
   $('.toggle-menu').on('click', function () {
        if($(this).hasClass('active')){
            $(this).removeClass('active');
            $('#main-menu-resp').slideUp(600);
        } else{
            $(this).addClass('active');
            $('#main-menu-resp').slideDown(600);
        }
   });
});