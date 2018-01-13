function getPosts() {
  if (window.XMLHttpRequest) {
    xmlhttp = new XMLHttpRequest();
  } else {
    xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
  }
  var result;
  xmlhttp.open("GET", "php/load_posts_past_events.php", false);
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
  var date_time = jsonPosts[i].date_time;
  var time = date_time.substring(11,16);
  var date = date_time.substring(8,10) + "/" + date_time.substring(5,7) + "/" + date_time.substring(0,4);
  var postId = "post" + i;
  $("#posts").append("<div id='" + postId + "'></div>");
  var post = $("#"+postId);
  $("#postTemplate").children().clone().appendTo(post);
  $(post).find(".postTitle").text(jsonPosts[i].title);
  var content = jsonPosts[i].description;
  var partial = content.substring(0,250) + "...";
  $(post).find(".postContent").text(partial);
  $(post).find(".postDate").text("Posted on " + date + " at " + time + ".");
  $(post).find(".postContent").data("shortText", partial);
  $(post).find(".postContent").data("fullText", content);
  for (var j = 0; j < jsonPosts[i].photo.length; ++j) {
    var photoId = "photo" + j;
    $("#locImages").append("<div id='" + photoId + "'></div>");
    var photo = $("#"+photoId);
    $("#postTemplate1").children().clone().appendTo(photo);
    $(photo).find(".image").attr('src', jsonPosts[i].photo[j]);
  }
}

$(".btnRead").click(function(){
  var button = $(this);
  var postContent = $(button).parent().parent().siblings(".row").children(".postCont").children(".postContent");
  if($(button).html()=='Hide'){
    $(postContent).text($(postContent).data("shortText"));
    $(button).html("Read more");
  }else{
    $(postContent).text($(postContent).data("fullText"));
    $(button).html("Hide");
  }
});