// an example to create a new mapping `ctrl-y`
api.mapkey('<ctrl-y>', 'Show me the money', function() {
  Front.showPopup('a well-known phrase uttered by characters in the 1996 film Jerry Maguire (Escape to close).');
});

// an example to replace `T` with `gt`, click `Default mappings` to see how `T` works.
api.map('gt', 'T');

// an example to remove mapkey `Ctrl-i`
api.unmap('<ctrl-i>');

// set theme
settings.theme = `
.sk_theme {
    font-family: Input Sans Condensed, Charcoal, sans-serif;
    font-size: 10pt;
    background: #24272e;
    color: #abb2bf;
}
.sk_theme tbody {
    color: #fff;
}
.sk_theme input {
    color: #d0d0d0;
}
.sk_theme .url {
    color: #61afef;
}
.sk_theme .annotation {
    color: #56b6c2;
}
.sk_theme .omnibar_highlight {
    color: #528bff;
}
.sk_theme .omnibar_timestamp {
    color: #e5c07b;
}
.sk_theme .omnibar_visitcount {
    color: #98c379;
}
.sk_theme #sk_omnibarSearchResult ul li:nth-child(odd) {
    background: #303030;
}
.sk_theme #sk_omnibarSearchResult ul li.focused {
    background: #3e4452;
}
#sk_status, #sk_find {
    font-size: 20pt;
}`;
// click `Save` button to make above settings to take effect.</ctrl-i></ctrl-y>
//
//

//
// https://foosoft.net/projects/anki-connect/
function invokeAnkiConnect(action, version, params={}) {
    return new Promise((resolve, reject) => {
        const xhr = new XMLHttpRequest();
        xhr.addEventListener('error', () => reject('failed to issue request'));
        xhr.addEventListener('load', () => {
            try {
                const response = JSON.parse(xhr.responseText);
                if (Object.getOwnPropertyNames(response).length != 2) {
                    throw 'response has an unexpected number of fields';
                }
                if (!response.hasOwnProperty('error')) {
                    throw 'response is missing required error field';
                }
                if (!response.hasOwnProperty('result')) {
                    throw 'response is missing required result field';
                }
                if (response.error) {
                    throw response.error;
                }
                resolve(response.result);
            } catch (e) {
                reject(e);
            }
        });

        xhr.open('POST', 'http://127.0.0.1:8765');
        xhr.send(JSON.stringify({action, version, params}));
    });
}


api.Front.registerInlineQuery({
  url: function(q) {
    return `http://dict.youdao.com/w/eng/${q}/#keyfrom=dict2.index`;
  },
  parseResult: function(res) {
    var parser = new DOMParser();
    var doc = parser.parseFromString(res.text, "text/html");
    var collinsResult = doc.querySelector("#collinsResult");
    var authTransToggle = doc.querySelector("#authTransToggle");
    var examplesToggle = doc.querySelector("#examplesToggle");

    if (collinsResult) {
      collinsResult.querySelectorAll("div>span.collinsOrder").forEach(function(span) {
        span.nextElementSibling.prepend(span);
      });
      collinsResult.querySelectorAll("div.examples").forEach(function(div) {
        div.innerHTML = div.innerHTML.replace(/<p/gi, "<span").replace(/<\/p>/gi, "</span>");
      });
      var exp = collinsResult.innerHTML;
      title = collinsResult.querySelector('.title');
      word = title.innerText;

      //
      // parse each explanations
      // not needed now
      //
      // meanings = Array.from(collinsResult.querySelectorAll('.collinsMajorTrans'))
      //   .map(
      //     rawMeaning => {
      //       meaning = rawMeaning.textContent.split('\n')
      //         .map(line => line.trim())
      //         .filter(line => line !== '')
      //         .join('\n');
      //       return meaning;
      //     }
      //   );

      invokeAnkiConnect('addNote', 5,
        {
          "note": {
            "deckName": "Default",
            "modelName": "Basic",
            "fields": {
              "Front": word,
              "Back": collinsResult.querySelector('.ol').outerHTML,
            },
            "tags": [
              "surfingkeys"
            ]
          }
        }
      ).catch(error=>void console.error({error}));

      return exp;
    } else if (authTransToggle) {
      authTransToggle.querySelector("div.via.ar").remove();
      console.log(`authTransToggle.innerHTML=${authTransToggle.innerHTML}`);
      return authTransToggle.innerHTML;
    } else if (examplesToggle) {
      console.log(`exmaples.innerHTML=${examplesToggle.innerHTML}`);
      return examplesToggle.innerHTML;
    }
  }
});
