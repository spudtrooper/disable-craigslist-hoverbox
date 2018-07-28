function toggle(enabled) {
  chrome.storage.sync.set({
    enabled: enabled
  }, function() {
    chrome.tabs.query({active: true, currentWindow: true}, function(tabs) {
      chrome.browserAction.setIcon({
	path: enabled ? 'icon-blocked48.png' : 'icon-not-blocked48.png'
      });
      chrome.browserAction.setTitle({
	title :enabled ? 'Blocked' : 'Not blocked'
      });
      chrome.tabs.update(tabs[0].id, {url: tabs[0].url});
    });
  });
}

function popupMain() {
  var el = document.getElementById('message');
  el.innerHTML = 'Toggling...';
  chrome.storage.sync.get({
    enabled: true
  }, function(items) {
    var enabled = !items.enabled;
    el.innerHTML = enabled ? 'Blocking...' : 'Unblocking...';
    toggle(enabled);
  });
}
