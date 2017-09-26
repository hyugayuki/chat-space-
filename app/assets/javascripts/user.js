$(function(){
  var search_list = $('#user-search-result');
  var add_list = $('#user-listed-result');

  function appendUser(user){
    var html = `<div class="chat-group-user clearfix">
                  <p class="chat-group-user__name">${ user.username}</p>
                  <a class="user-search-add chat-group-user__btn chat-group-user__btn--add" data-user-id="${ user.id }" data-user-name="${ user.username }">追加</a>
                </div>`
    return html;
  }
  function listedUser(user){
    var html = `<div class="chat-group-user clearfix">
                  <p class="chat-group-user__name">${ user.username}</p>
                  <input type="hidden" name="group[user_ids][]"  value="${user.id}">
                  <a class="user-search-add chat-group-user__btn chat-group-user__btn--remove" data-user-id="${ user.id }" data-user-name="${ user.username }">削除</a>
                </div>`
    return html;
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
          var html = appendUser(user);
          search_list.append(html);
        });
      }else{
        search_list.append(("<div>一致するユーザーはありません</div>");
      }
    })
    .fail(function() {
      alert('検索に失敗しました');
    })
  });
  $(document).on('click', ".chat-group-user__btn--add", function(){
    var id = $(this).attr("data-user-id");
    var username = $(this).attr("data-user-name");
    $(this).parent().remove();
    var user = {id: id, username: username};
    var html = listedUser(user);
    add_list.append(html);
  });
  $(document).on('click', ".chat-group-user__btn--remove", function(){
    $(this).parent().remove();
  });
});
