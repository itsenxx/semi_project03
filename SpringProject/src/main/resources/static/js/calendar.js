console.log('Calendar Module...');

var calendarService = (function(){

    function scheduleRead(date, callback, error) {
        //스케줄 읽기

        $.ajax({
            //request 처리
            type : 'post',           // form의 method속성 값
            url : '/replies/new',    // form의 action값
            data : JSON.stringify(reply),    // json으로 string처리
            contentType : "application/json; charset=utf-8",  // content-type지정
            //response 처리
            success : function(result, status, xhr) { // call 성공시 오는 처리되는 함수
                if (callback) {
                    callback(result);
                }
            },
            error : function(xhr, status, er) { // call 실패시 오는 처리되는 함수
                if(error){
                    error(er);
                }
            }
        });
    }
}