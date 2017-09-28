$(function(){
  function buildHTML(message){
    var image_box = ""
    if (message.image != null){
      image_box = `<img src="${message.image}">`
    }
    var html = `<div class="message" data-message-id="${id}">
                  <div class="message__info">
                    <h4 class="message__info__name">
                      ${ message.username }
                    </h4>
                    <p class="message__info__date">
                      ${ message.created_at }
                    </p>
                  </div>
                  <div class="message__text">
                    <h3 class="index">
                      ${ message.content }
                      ${ image_box }
                    </h3>
                  </div>
                </div>`
    return html;
  }
  $("#new_message").on('submit', function(e){
    e.preventDefault();
    var formData = new FormData(this);
    var url = $(this).attr('action');
    var scroll_target = $('.scroll_target').offset().top;
    $.ajax({
      type: 'POST',
      url: url,
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
    })
    .done(function(data){
      var html = buildHTML(data);
      $('.content__right-content__main-content__main-wrapper').append(html);
      $('#message_content').val('');
      $('#message_image').val('');
    })
    .fail(function() {
      alert('error');
    })
    $('.content__right-content__main-content__main-wrapper').animate({
            scrollTop: scroll_target
        }, 500);
        return false;
  });
    if (window.location.href.match(/\/groups\/\d+\/messages/)) {
    }else {
      clearInterval(interval);
});
