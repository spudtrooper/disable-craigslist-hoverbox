function removeHoverBox() {
  var hoverBox = document.getElementsByClassName('hoverBox')[0];
  hoverBox.parentNode.removeChild(hoverBox);
}

function main() {
  chrome.storage.sync.get({
    enabled: true
  }, function(items) {
    console.log('items=' + JSON.stringify(items));
    if (items.enabled) {
      removeHoverBox();
    }
  });
}

main();
