function getPosts() {
  if (window.XMLHttpRequest) {
    xmlhttp = new XMLHttpRequest();
  } else {
    xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
  }
  var result;
  xmlhttp.open("GET", "php/load_posts_home.php", false);
  xmlhttp.onreadystatechange = function() {
  if (this.readyState == 4 && this.status == 200) {
          result = this.responseText;
      }
  };
  xmlhttp.send(null);
  return result;
}
var jsonPosts = JSON.parse(getPosts());

for (var i = 0; i < jsonPosts.length; ++i) {
  var postId = "post" + i;
  $("#posts").append("<div id='" + postId + "'></div>");
  var post = $("#"+postId);
  $("#postTemplate").children().clone().appendTo(post);
  $(post).find(".postTitle").text(jsonPosts[i].title);
  var content = jsonPosts[i].description;
  var partial = content.substring(0,250) + "...";
  $(post).find(".postContent").text(partial);
  $(post).data("id", jsonPosts[i].id_event);
  $(post).find(".postContent").data("shortText", partial);
  $(post).find(".postContent").data("fullText", content);
  $(post).find(".postImage").attr("src",jsonPosts[i].photo);
  var date_time = jsonPosts[i].date_time;
  var time = date_time.substring(11,16);
  var date = date_time.substring(8,10) + "/" + date_time.substring(5,7) + "/" + date_time.substring(0,4);
  $(post).find(".location").text("Where? " + jsonPosts[i].location);
  $(post).find(".date").text("When? " + date + " at " + time);
  $(post).find(".id").attr("value",jsonPosts[i].id_event);
  $(post).find(".image-link").attr('href', jsonPosts[i].photo);
  $(post).find(".image-link").attr('data-lightbox', postId);
  $(post).find(".image-link").attr('data-title', jsonPosts[i].title);
}

$(".btnRead").click(function(){
  var button = $(this);
  var postContent = $(button).parent().siblings().children(".postContent");
  var container = $(button).parent().siblings(".row").children(".container");
  $(container).toggle(); 
  if($(container).css('display')=='none'){
    $(postContent).text($(postContent).data("shortText"));
    $(button).html("Read more");
  }else{
    $(postContent).text($(postContent).data("fullText"));
    $(button).html("Hide");
  }
});