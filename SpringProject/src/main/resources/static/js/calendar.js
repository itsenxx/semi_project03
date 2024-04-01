console.log('Calendar Module...');


    function scheduleAdd(Schedule, callback, error) {

        $.ajax({
            // request처리
            type : 'post',                                      // form의 method속성 값
            url : '/board/newSchedule',                               // form의 action값
            data : JSON.stringify(Schedule),                       // json으로 string처리하면서 파라미터 전달
            contentType : "application/json; charset=utf-8",    // content-type지정
            // response처리
            success : function(result, status, xhr) {           // call 성공시 오는 처리되는 함수
                if (callback) {
                    callback(result);
                }
            },
            error : function(xhr, status, er) {                 // call 실패시 오는 처리되는 함수
                if (error) {
                    error(er);
                }
            }
        });
    }
    
    function productRead(part, callback, error) {
        //스케줄 읽기

        $.ajax({
            //request 처리
            type : 'get',           // form의 method속성 값
            url : 'read/product/'+ part,    // form의 action값
            success : function(data, status, xhr) { // call 성공시 오는 처리되는 함수
                if (callback) {
                    callback(data);
                }
            },
            error : function(xhr, status, er) { // call 실패시 오는 처리되는 함수
                if(error){
                    error(er);
                }
            }
        });
    }
    
    function schModify(schModify, callback, error) {
        //스케줄 읽기

        $.ajax({
            // request처리
            type : 'post',                                      // form의 method속성 값
            url : '/board/scheduleModify',                               // form의 action값
            data : JSON.stringify(schModify),                       // json으로 string처리하면서 파라미터 전달
            contentType : "application/json; charset=utf-8",    // content-type지정
            // response처리
            success : function(result, status, xhr) {           // call 성공시 오는 처리되는 함수
                if (callback) {
                    callback(result);
                }
            },
            error : function(xhr, status, er) {                 // call 실패시 오는 처리되는 함수
                if (error) {
                    error(er);
                }
            }
        });
    }