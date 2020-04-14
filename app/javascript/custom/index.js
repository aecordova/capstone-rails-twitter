$(document).on('turbolinks:load', function () {
  $('.unfollow-btn').hover(function () {
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
    let lp = "."+this.dataset.lp.toString();
    let ulp = ".u"+this.dataset.lp.toString();
    
    $.ajax(this.dataset.url.toString(), {
      method: 'post',
      dataType: 'script',
      success: function () {
        $(lp).toggleClass('d-none');
        $(ulp).toggleClass('d-none');
      }
    });
  });

  $(".unlike-btn").click(function (e) {
    e.preventDefault();
    let lp = "."+this.dataset.lp.toString();
    let ulp = ".u"+this.dataset.lp.toString();

    $.ajax(this.dataset.url.toString(), {
      method: 'delete',
      dataType: 'script',
      success: function () {
        $(ulp).toggleClass('d-none');
        $(lp).toggleClass('d-none');
      }
    });
  });
  
  $(".comment-btn").click(function(e){
    e.preventDefault();
    let frm = "."+this.dataset.frm.toString();
    $(frm).toggleClass('d-none d-block')
  });

  $(".show-comments").click(function(e){
    e.preventDefault();
    let comm = "."+this.dataset.comm.toString();
    $(comm).toggleClass('d-none d-block')
  });
});
