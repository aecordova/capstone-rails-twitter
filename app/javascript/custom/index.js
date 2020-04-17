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
    let fol = ".fol-"+this.dataset.id.toString();
    let ufol = ".ufol-"+this.dataset.id.toString();

    $.ajax(this.dataset.url.toString(), {
      method: 'post',
      success: function () {
        $(fol).toggleClass("d-none");
        $(ufol).toggleClass("d-none");
      }
    });
  });

  $(".unfollow-btn").click(function (e) {
    let fol = ".fol-"+this.dataset.id.toString();
    let ufol = ".ufol-"+this.dataset.id.toString();
    e.preventDefault();
    $.ajax(this.dataset.url.toString(), {
      method: 'delete',
      success: function () {
        $(ufol).toggleClass("d-none");
        $(fol).toggleClass("d-none");
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
  
  $('.js-upl').change(function (e){
    let filename = e.target.files[0].name;
    $('.js-upl-lbl').html("File: " + filename)
  })
  
  $('#profile_pic').hover(function(){
    $('.edit-icon').toggleClass("d-none")   
  })
  
  $('.edit-icon').click(function(){
    $('.change-pic').toggleClass("d-none")   
  })

});



