# js作为websocket client，服务用java 点对点、一对多聊天

* 今天就分享前端的websokcet处理
websocket处理就是一个客服端和服务端之间的长连接

```js
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8" />
    <title>聊天室</title>
    <style>
        #message {
            margin-top: 20px;
            border: 1px solid gray;
            padding: 20px;
        }
    </style>

</head>

<body>

    昵称：<input type="text" id="nickname" />
    <!-- <button onclick="conectWebSocket()">连接WebSocket</button> -->
    <button onclick="initws()">连接WebSocket</button>
    <button onclick="closeWebSocket()">断开连接</button>

    <br /> 消息：
    <input id="text" type="text" /> 频道号
    <input id="toUser" type="text" />
    <button onclick="send()">发送消息</button>

    <!-- 存放接收到的消息. -->
    <div id="message">

    </div>


    <script type="text/javascript">
        //连接对象.
        var websocke = null;
        var nickname = null;
        var uid = null;

        function conectWebSocket() {
            nickname = document.getElementById("nickname").value;
            if (nickname == '') {
                alert("请输入昵称");
                return;
            }
            //判断当前的浏览器是否支持websocket.
            if ("WebSocket" in window) {
                uid = "sdaaaaaaaaaaaaaaaaaaaaaaaaa";
                websocket = new WebSocket("ws://localhost:8080/websocket/" + nickname + "/" + uid);
            } else {
                alert("Not support websocket");
                return false;
            }
            //连接成功的方法.
            websocket.onopen = function(event) {
                setMessgeHtml("Loc MSG:已连接");
            }

            //连接关闭.
            websocket.onclose = function(event) {
                // aler
                setMessgeHtml("Loc MSG:连接关闭");
            }

            //连接异常.
            websocket.onerror = function(event) {
                setMessgeHtml("Loc MSG:连接异常");
            }


            websocket.onmessage = function(event) {
                console.log("fallback :", event);
                setMessgeHtml(event.data);
            }

        } //conectWebSocket


        var single = (function() {
            return {
                getInstance: function() {
                    if (websocke != null && websocke.readyState == 1) {
                        console.log("wlx-------------------" + websocke.readyState)
                        setMessgeHtml("Loc MSG:不能重复连接！");
                        return websocke
                    } else {
                        websocket = null
                        nickname = document.getElementById("nickname").value;
                        if (nickname == '') {
                            alert("请输入昵称");
                            return;
                        }
                        //判断当前的浏览器是否支持websocket.
                        if ("WebSocket" in window) {
                            uid = "sdaaaaaaaaaaaaaaaaaaaaaaaaa";
                            websocket = new WebSocket("ws://localhost:8080/websocket/" + nickname + "/" + uid);
                        } else {
                            alert("Not support websocket");
                            return false;
                        }
                        //连接成功的方法.
                        websocket.onopen = function(event) {
                            setMessgeHtml("Loc MSG:已连接");
                        }

                        //连接关闭.
                        websocket.onclose = function(event) {
                            // aler
                            setMessgeHtml("Loc MSG:连接关闭");
                        }

                        //连接异常.
                        websocket.onerror = function(event) {
                            setMessgeHtml("Loc MSG:连接异常");
                        }


                        websocket.onmessage = function(event) {
                            console.log("fallback :", event);
                            setMessgeHtml(event.data);
                        }
                        return websocket;
                    } //conectWebSocket
                }
            }
        })();

        function initws() {
            websocke = single.getInstance()
        }



        function setMessgeHtml(msg) {
            var message = document.getElementById("message");
            message.innerHTML += msg + "<br/>";
        }

        function closeWebSocket() {
            websocke.close();
        }
        /**
        	发送消息.
        */
        function send() {
            var message = document.getElementById("text").value;
            var toUser = document.getElementById("toUser").value;
            var socketMsg = {
                msg: message,
                toUser: toUser
            };
            if (toUser == '') {
                socketMsg.type = 0; //群聊.
            } else {
                socketMsg.type = 1; //单聊.
            }
            console.log("发送的是：", socketMsg);
            console.log("连接状态：", websocke.readyState);
            //websocket.send(nickname+":"+message);
            websocke.send(JSON.stringify(socketMsg)); //将json对象转换为json字符串.
        }
    </script>
</body>

</html>
```

*websocket 要使用js单例模式，避免点击一个连接的在发送消息的时候会收到两个一样的文件*

**ps: 服务端代码有需求未完善，稍后分享**

转载请说明出处：[https://www.cnblogs.com/ontoweb-zp/p/9721084.html](https://www.cnblogs.com/ontoweb-zp/p/9721084.html)