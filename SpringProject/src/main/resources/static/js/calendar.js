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

$(document).ready(function(){
    for(let i=0; i<35; i++){
        $('.date').children('.date_note:eq('+i+')').click(function(){
            $('.date').children('.note:eq('+i+')').removeClass('hide');
        });
        $('.date').children('.note:eq('+i+')').children('.notebox:eq(0)').children('.buttonbox:eq(0)').children('.button:eq(0)').click(function(){
            $('.date').children('.note:eq('+i+')').addClass('hide');
        });
    }
});

$(document).ready(function(){
    for(let i=0; i<35; i++){
        $('.date').children('.date_num:eq('+i+')').hover(function(){
            $('.date').children('.date_num:eq('+i+')').children('.material-symbols-outlined:eq(0)').removeClass('hide');
        }, function(){
            $('.date').children('.date_num:eq('+i+')').children('.material-symbols-outlined:eq(0)').addClass('hide');
        });
    }
});