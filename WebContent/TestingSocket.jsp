<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>WebSocket Example</title>
</head>
<body>
    <h1>WebSocket Example</h1>
    
    <div id="output"></div>
    
    <form onsubmit="sendMessage(); return false;">
        <label for="message">Enter message:</label>
        <input type="text" id="message" />
        <button type="submit">Send</button>
    </form>

    <script>
        var socket = new WebSocket("ws://" + location.host + "/StarParts/listChat");

        socket.onopen = function(event) {
            writeToScreen("WebSocket connection opened");
            console.log(event);
        };

        socket.onmessage = function(event) {
            writeToScreen("Message received: " + event.data);
            const parsedData = JSON.parse(event.data);
            const {data} = parsedData;
            console.log(data);
        };

        socket.onclose = function(event) {
            writeToScreen("WebSocket connection closed");
        };

        function sendMessage() {
            var messageInput = document.getElementById("message");
            var message = messageInput.value;
            socket.send(message);
            writeToScreen("Message sent: " + message);
            messageInput.value = "";
        }

        function writeToScreen(message) {
            var outputDiv = document.getElementById("output");
            outputDiv.innerHTML += "<p>" + message + "</p>";
        }
    </script>
</body>
</html>
