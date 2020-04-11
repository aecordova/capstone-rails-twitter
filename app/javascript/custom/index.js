
$(document).ready(function(){
  $('.js-following').hover(
    function(){
     $(this).html('Unfollow')
    },
    function(){
      $(this).html('Following')
    }
  );
  
  $('.js-follow').click(function(event){
    event.preventDefault();
    r = $.ajax(this.href,{
      method: 'POST',
    });
    r.done(function(){
      $('.js-follow').html("Following")
                     .addClass("btn-outline-secondary js-following")
                     .attr('data-method', 'delete')
                     .removeClass('btn-outline-primary')
                     .removeClass('js-follow');
    });
  });

  $('.js-following').click(function(event){
    event.preventDefault();
    r = $.ajax({
      url: '/follow'
      data: {id: $(this).data)}
      method: 'POST',
    });
    r.done(function(){
      $('.js-follow').html("Follow")
                     .addClass("btn-outline-primary js-follow")
                     .attr('data-method', 'post')
                     .removeClass('btn-outline-secondary')
                     .removeClass('js-following');
    });
  });
});
