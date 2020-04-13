$(document).ready(function(){
  $('#unfollow-btn').hover(
    function(){
     $(this).html('Unfollow')
    },
    function(){
      $(this).html('Following')
    }
  );
  $("#follow-btn").click(function(e){
    e.preventDefault();
    $.ajax(this.href, {
      method: 'post',
      success: function(){
        $('#follow-btn').hide();
        $('#unfollow-btn').removeClass("hide");
        $('#unfollow-btn').show();
      }
    });
  });
  $("#unfollow-btn").click(function(e){
    e.preventDefault();
    $.ajax(this.href, {
      method: 'delete',
      success: function(){
        $('#unfollow-btn').hide();
        $('#follow-btn').removeClass("hide");
        $('#follow-btn').show();
      }
    });
  });
});
