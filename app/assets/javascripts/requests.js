var dispatcher = new WebSocketRails('localhost:3000/websocket');
channel = dispatcher.subscribe(window.location.pathname.match(/\/([^?/]+)/)[1]);
channel.bind('new', function (html) {
    $('tbody').append(html);
});
