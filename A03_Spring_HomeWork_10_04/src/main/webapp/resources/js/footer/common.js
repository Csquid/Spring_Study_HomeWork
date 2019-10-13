$(function() {
      var param = getParams();
      console.log(param);

      if (param.authority == "no") {
         window.alert("로그인후 이용이 가능하다니깐요 ㅎㅎ");
      }

      function getParams() {
         // 파라미터가 담길 배열
         var param = new Array();

         // 현재 페이지의 url
         var url = decodeURIComponent(location.href);
         // url이 encodeURIComponent 로 인코딩 되었을때는 다시 디코딩 해준다.
         url = decodeURIComponent(url);

         var params;
         // url에서 '?' 문자 이후의 파라미터 문자열까지 자르기
         params = url.substring(url.indexOf('?') + 1, url.length);
         // 파라미터 구분자("&") 로 분리
         params = params.split("&");

         // params 배열을 다시 "=" 구분자로 분리하여 param 배열에 key = value 로 담는다.
         var size = params.length;
         var key, value;
         for (var i = 0; i < size; i++) {
            key = params[i].split("=")[0];
            value = params[i].split("=")[1];

            param[key] = value;
         }

         return param;
      }

  })