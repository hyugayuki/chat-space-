$(function(){
  var search_list = $('#user-search-result');

  function appendUser(user){
    var html = `<div class="chat-group-user clearfix">
                  <p class="chat-group-user__name">${ user.username}</p>
                  <a class="user-search-add chat-group-user__btn chat-group-user__btn--add" data-user-id="${ user.id }" data-user-name="${ user.username }">追加</a>
                </div>`
    search_list.append(html);
  }
  function appendNouser(comment){
    var html = `<div>${ comment }</div>`
    search_list.append(html);
  }

  $("#user-search-field").on("keyup", function(){
    console.log(1);
    var input = $("#user-search-field").val();
    $.ajax({
      type: 'GET',
      url: '/users',
      data: { keyword: input },
      dataType: 'json'
    })

    .done(function(users) {
      $('#user-search-result').empty();
      if (users.length !== 0) {
        users.forEach(function(user){
          appendUser(user);
        });
      }else{
        appendNouser("一致するユーザーはありません");
      }
    })
    .fail(function() {
      alert('検索に失敗しました');
    })
  });
});
