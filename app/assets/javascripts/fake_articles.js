document.addEventListener("turbolinks:load", function() {
  var generatingFakeArticleStrings = [
    "Starting with a dash of the truth...",
    "Applying spin...",
    "Conveniently omitting some facts...",
    "Blatantly making some stuff up...",
    "Done!"
  ];

  var fakeArticleIndex = 0;

  function updateFakeArticleString() {
    if (fakeArticleIndex < generatingFakeArticleStrings.length) {
      $(".new-fake-article-modal .modal-body p").html(generatingFakeArticleStrings[fakeArticleIndex]);
      $(".new-fake-article-modal .progress-bar").css("width", fakeArticleIndex / (generatingFakeArticleStrings.length - 1) * 100 + "%");
      fakeArticleIndex++;
    } else {
      clearInterval(fakeArticleInterval);
      $(".new-fake-article-modal").modal('hide');
      $("#fake_article_content").show();
    }
  };

  var fakeArticleInterval = null;

  $(".new-fake-article-modal")
    .on('show.bs.modal', function(event) {
      $("#fake_article_content").hide();
      $(".new-fake-article-modal .modal-body p").html(generatingFakeArticleStrings[fakeArticleIndex]);
      fakeArticleIndex++;
      fakeArticleInterval = setInterval(updateFakeArticleString, 3000);
    })
    .modal({backdrop: 'static', keyboard: false})
});
