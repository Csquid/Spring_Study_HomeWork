<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="EUC-KR">
    <title>Insert title here</title>
    <script crossorigin="anonymous" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" src="https://code.jquery.com/jquery-3.4.1.js"></script>
    <style type="text/css">
        span {
            color: red;
        }
    </style>
</head>

<body>
    <div id="session">����: ${sessionScope.member}</div>
    <div>
        <button id="logout">logout</button>
    </div>

    <div>
        <input class="id" type="text">
        <input class="pw" type="password">
        <button id="submit">Login</button>
    </div>

    <div>
        �����: <span id="result"></span>�Դϴ�.
    </div>
    <script>
        $(function() {
            $("#submit").click(function() {
            	console.log("########################  login click button ########################");
                var data = JSON.stringify({
                    id: $('.id').val(),
                    pw: $('.pw').val()
                });

                $.ajax({
                    type: "POST",
                    url: "/member/login",
                    data: data,
                    dataType: "json",
                    contentType: "application/json",
                    success: function(data) {
                        console.log(data);
                        if (data.signal == "success") {
                            window.alert("�α��ο� �����߽��ϴ�.");
                            $('#result').html(data.name);
                            var sessionSuccess = data.sessionName;
                            var target = $('#session').append("<div>" + data.sessionName.id + ", " + data.sessionName.pw + ", " + data.sessionName.name);
                        } else {
                            window.alert("�α��ο� �����߽��ϴ�.");
                        }
                    }
                })

            })
            $('#logout').click(function() {
                window.location.href = "/member/logout";
            })
        })
    </script>
</body>
</head>

</html>