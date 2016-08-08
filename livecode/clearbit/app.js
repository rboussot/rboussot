function fetchPeople() {
  $.ajax({
    event.preventDefault();
    var email = $("emailInput").val();
    url: 'https://person.clearbit.com/v2/people/find?email=' + email,
    beforeSend: function (xhr) {
      xhr.setRequestHeader('Authorization', 'Bearer sk_9fb3dc413df460c526252128aceae7d1')
    },
    success: function(data) {
      var avatar = data.avatar;
      var name = data.name.fullName;
      var github = data.github.handle;
      var linkedin = data.linkedin.handle;
      $('#infos').empty().append("<li>" + name + "</li>");
      console.log("test;")
    },
    error: function(jqXHR) {
      $('#infos').empty().append("<li>" + jqXHR.responseText + "</li>");
    }
  });
}

$(document).ready(function() {
  $('#find').click(function() {
    fetchPeople();
  });
});
