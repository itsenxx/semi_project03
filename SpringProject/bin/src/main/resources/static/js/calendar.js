console.log('Calendar Module...');


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