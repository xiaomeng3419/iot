var playVideo = $('video');
var playPause = $('.playPause'); //播放和暂停
var currentTime = $('.timebar .currentTime'); //当前时间
var duration = $('.timebar .duration'); //总时间
var progress = $('.timebar .progress-bar'); //进度条
var volumebar = $('.volumeBar .volumewrap').find('.progress-bar');

$(document).click(function() {
    $('.volumeBar').hide();
});

function initControl() {
    var playVideo = $('video');
    playVideo.volume = 0.4; //初始化音量
    var duration = $('.timebar .duration'); //总时间
    duration.text(formatSeconds(playVideo[0].duration));
    $(window).keyup(function(event) {
        event = event || window.event;
        //if(event.keyCode == 32) playControl();
        if (event.keyCode == 27) { //退出满屏
            $('.fullScreen').removeClass('cancleScreen');
            $('#willesPlay .playControll').css({
                'bottom': -48
            }).removeClass('fullControll');
        };
        event.preventDefault();
    });
}

function timeUpdate(testTime) {
    var playVideo = $('video');
    var playPause = $('.playPause'); //播放和暂停
    var currentTime = $('.timebar .currentTime'); //当前时间
    var progress = $('.timebar .progress-bar'); //进度条
    var time = 1;

    currentTime.text(formatSeconds(playVideo[0].currentTime));
    progress.css('width', 100 * playVideo[0].currentTime / playVideo[0].duration + '%');
    var a = formatSeconds(playVideo[0].currentTime);
    var b = playVideo[0].currentTime;
    console.log(a + "----" + b);

    if (a == testTime && time == 1 && !playVideo[0].paused) {
        playVideo[0].pause();
        playPause.toggleClass('playIcon');
        $('.playTip').removeClass('iconPause').addClass('iconPlay').fadeIn();
        $('.playStart').removeClass('iconPause').addClass('iconPlay').fadeIn();
        time--;
        alert("第一个节点");
    }

}

function volume(e) {
    //音量
    $('.volumeBar').toggle();
    e.stopPropagation();
}
//音量控制
function volumeControl(e) {
    // e = e || window.event;
    var eventype = e.type;
    var playVideo = $('video');
    var volumebar = $('.volumeBar .volumewrap').find('.progress-bar');

    var positions = 0; //
    var percentage = 0; //
    if (eventype == "click") {
        positions = volumebar.offset().top - e.pageY;
        percentage = 100 * (positions + volumebar.height()) / $('.volumeBar .volumewrap').height();
    }
    if (percentage < 0) {
        percentage = 0;
        $('.otherControl .volume').attr('class', 'volume glyphicon glyphicon-volume-off');
    }
    if (percentage > 50) {
        $('.otherControl .volume').attr('class', 'volume glyphicon glyphicon-volume-up');
    }
    if (percentage > 0 && percentage <= 50) {
        $('.otherControl .volume').attr('class', 'volume glyphicon glyphicon-volume-down');
    }
    if (percentage >= 100) {
        percentage = 100;
    }
    $('.volumewrap .progress-bar').css('height', percentage + '%');
    playVideo[0].volume = percentage / 100;
    e.stopPropagation();
    e.preventDefault();
}
//全屏
function fullScreen() {
    var playVideo = $('video');
    if ($(".fullScreen").hasClass('cancleScreen')) {
        if (document.exitFullscreen) {
            document.exitFullscreen();
        } else if (document.mozExitFullScreen) {
            document.mozExitFullScreen();
        } else if (document.webkitExitFullscreen) {
            document.webkitExitFullscreen();
        }
        $(".fullScreen").removeClass('cancleScreen');
        $('#willesPlay .playControll').css({
            'bottom': -48
        }).removeClass('fullControll');
    } else {
        if (playVideo[0].requestFullscreen) {
            playVideo[0].requestFullscreen();
        } else if (playVideo[0].mozRequestFullScreen) {
            playVideo[0].mozRequestFullScreen();
        } else if (playVideo[0].webkitRequestFullscreen) {
            playVideo[0].webkitRequestFullscreen();
        } else if (playVideo[0].msRequestFullscreen) {
            playVideo[0].msRequestFullscreen();
        }
        $(".fullScreen").addClass('cancleScreen');
        $('#willesPlay .playControll').css({
            'left': 0,
            'bottom': 0
        }).addClass('fullControll');
    }
    return false;
}

function playControl() {
    var playVideo = $('video');
    var playPause = $('.playPause'); //播放和暂停
    playPause.toggleClass('playIcon');
    // var duration = $('.timebar .duration'); //总时间
    // duration.text(formatSeconds(playVideo[0].duration));
    if (playVideo[0].paused) {
        playVideo[0].play();
        $('.playTip').removeClass('iconPlay').addClass('iconPause').fadeOut();
        $('.playStart').removeClass('iconPlay').addClass('iconPause').fadeOut();
    } else {
        playVideo[0].pause();
        $('.playTip').removeClass('iconPause').addClass('iconPlay').fadeIn();
        $('.playStart').removeClass('iconPause').addClass('iconPlay').fadeIn();
    }
}
var willPlay = {
    volume: volume,
    volumeControl: volumeControl,
    fullScreen: fullScreen,
    playControl: playControl,
    initControl: initControl,
    formatSeconds: formatSeconds

};
//很关键
export { willPlay };

//秒转时间
function formatSeconds(value) {
    value = parseInt(value);
    var time;
    if (value > -1) {
        var hour = Math.floor(value / 3600);
        var min = Math.floor(value / 60) % 60;
        var sec = value % 60;
        var day = parseInt(hour / 24);
        if (day > 0) {
            hour = hour - 24 * day;
            time = day + "day " + hour + ":";
        } else time = hour + ":";
        if (min < 10) {
            time += "0";
        }
        time += min + ":";
        if (sec < 10) {
            time += "0";
        }
        time += sec;
    }
    return time;
}