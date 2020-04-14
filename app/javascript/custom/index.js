$(document).on('turbolinks:load', function () {
  $('.unfollow-btn').hover(
    function () {
      $(this).html('Unfollow')
    },
    function () {
      $(this).html('Following')
    }
  );

  $(".follow-btn").click(function (e) {
    e.preventDefault();
    $.ajax(this.dataset.url.toString(), {
      method: 'post',
      success: function () {
        $('.follow-btn').hide();
        $('.unfollow-btn').removeClass("hide");
        $('.unfollow-btn').show();
      }
    });
  });

  $(".unfollow-btn").click(function (e) {
    e.preventDefault();
    $.ajax(this.dataset.url.toString(), {
      method: 'delete',
      success: function () {
        $('.unfollow-btn').hide();
        $('.follow-btn').removeClass("hide");
        $('.follow-btn').show();
      }
    });
  });

  $(".like-btn").click(function (e) {
    e.preventDefault();
    $.ajax(this.dataset.url.toString(), {
      method: 'post',
      dataType: 'script',
      success: function (data) {
        $('.like-btn').hide();
        $('.unlike-btn').removeClass("hide");
        $('.unlike-btn').show();
        console.log(data)
      }
    })
    // .done(function(data){
    //   console.log(data)
    // });
  });
  
  $(".unlike-btn").click(function (e) {
    e.preventDefault();
    //console.log(this.dataset.url)
    $.ajax(this.dataset.url.toString(), {
      method: 'delete',
      dataType: 'script',
      success: function(){
        $('.unlike-btn').hide();
        $('.like-btn').removeClass("hide");
        $('.like-btn').show();
      }
    });
  });
});
