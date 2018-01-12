function getPhotos() {
  if (window.XMLHttpRequest) {
    xmlhttp = new XMLHttpRequest();
  } else {
    xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
  }
  var result;
  xmlhttp.open("GET", "php/load_photos_gallery.php", false);
  xmlhttp.onreadystatechange = function() {
  if (this.readyState == 4 && this.status == 200) {
          result = this.responseText;
      }
  };
  xmlhttp.send(null);
  return result;
}
var jsonPhotos = JSON.parse(getPhotos());

for (var i = 0; i < jsonPhotos.length; ++i) {
  var postId = "post" + i;
  $("#posts").append("<div id='" + postId + "'></div>");
  var post = $("#"+postId);
  $("#postTemplate").children().clone().appendTo(post);
  $(post).find(".caption").text(jsonPhotos[i].title);
  $(post).find(".image-link").attr('href', jsonPhotos[i].photo);
  $(post).find(".image-link").attr('data-title', jsonPhotos[i].title);
  $(post).find(".image").attr('src', jsonPhotos[i].photo);
}