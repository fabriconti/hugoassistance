---
title: Ricerca 🔍
---

<div>
<p>Sentiti liber* di cercare ciò che vuoi.<br>
Se non trovi ciò che cerchi, facci sapere cosa vorresti trovare<br>
inviando una email a <span class="white">{{< email>}}</span> </p>
<p><input id="search" type="text" placeholder="Cerca..."></p>

<ul id="results"></ul>

<script src="/js/jquery-2.1.3.min.js"></script>
<script src="/js/lunr.js"></script>
<script>
  var lunrIndex,
      $results,
      documents;

  function initLunr() {
    // retrieve the index file
    $.getJSON("../index.json")
      .done(function(index) {
          documents = index;

          lunrIndex = lunr(function(){
            this.ref('href')
            this.field('content')

            this.field("title", {
                boost: 10
            });

            this.field("tags", {
                boost: 5
            });

            documents.forEach(function(doc) {
              try {
                // console.log(doc.href)
                this.add(doc)
              } catch (e) {}
            }, this)
          })
      })
      .fail(function(jqxhr, textStatus, error) {
          var err = textStatus + ", " + error;
          console.error("Error getting Lunr index file:", err);
      });
  }

function search(query_string) {

  return lunrIndex.query(function(q) {
    // look for an exact match and give that a massive positive boost
    q.term(query_string, { usePipeline: true, boost: 100 });
    // prefix matches should not use stemming, and lower positive boost
    q.term(query_string, { usePipeline: false, boost: 10, wildcard: lunr.Query.wildcard.TRAILING });
  }).map(function(result) {
    return documents.filter(function(page) {
      return page.href === result.ref;
    })[0];
  });
}

  function renderResults(results) {
    if (!results.length) {
      return;
    }

    results.slice(0, 30).forEach(function(result) {
      var $result = $("<li>");

      $result.append($("<a>", {
        href: result.href,
        text: result.title
      }));

      $result.append(" <small><time>" + result.date + "</time></small>");

      $results.append($result);
    });
  }

  function initUI() {
    $results = $("#results");

    $("#search").keyup(function(){
      // empty previous results
      $results.empty();

      // trigger search when at least two chars provided.
      var query = $(this).val();
      if (query.length < 2) {
        return;
      }

      var results = search(query);

      renderResults(results);
    });
  }

  initLunr();

  $(document).ready(function(){
    initUI();
  });
</script>
</div>