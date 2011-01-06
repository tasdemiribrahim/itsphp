/*! * jQuery Twitter Search Plugin * Copyright (c) 2010 M. Alsup * Dual licensed under the MIT and GPL licenses */ /*! * jQuery Twitter Search Plugin * Copyright (c) 2010 M. Alsup * Dual licensed under the MIT and GPL licenses */; (function($) {    $.fn.twitterSearch = function(options) {        if (typeof options == 'string') options = {            term: options        };        return this.each(function() {            var $frame = $(this);            var opts = $.extend(true, {},            $.fn.twitterSearch.defaults, options || {},            $.metadata ? $frame.metadata() : {});            opts.formatter = opts.formatter || $.fn.twitterSearch.formatter;            opts.filter = opts.filter || $.fn.twitterSearch.filter;            var url = opts.url + opts.term;            if (!opts.applyStyles) {                for (var css in opts.css) opts.css[css] = {};            }            if (opts.title === null) opts.title = opts.term;            opts.title = opts.title || '';            var t = opts.titleLink ? ('<a href="' + opts.titleLink + '">' + opts.title + '</a>') : ('<span>' + opts.title + '</span>');            var $t = $(t);            if (opts.titleLink) $t.css(opts.css['titleLink']);            var $title = $('<div class="twitterSearchTitle"></div>').append($t).appendTo($frame).css(opts.css['title']);            if (opts.bird) {                var $b = $('<img class="twitterSearchBird" src="' + opts.birdSrc + '" />').appendTo($title).css(opts.css['bird']);                if (opts.birdLink) $b.wrap('<a href="' + opts.birdLink + '"></a>');            }            var $cont = $('<div class="twitterSearchContainter"></div>').appendTo($frame).css(opts.css['container']);            var $close = $('<div class="twitterSearchClose"></div>').appendTo($frame);            var cont = $cont[0];            if (opts.colorExterior) $title.css('background-color', opts.colorExterior);            if (opts.colorInterior) $cont.css('background-color', opts.colorInterior);            $frame.css(opts.css['frame']);            if (opts.colorExterior) $frame.css('border-color', opts.colorExterior);            var h = $frame.innerHeight() - $title.outerHeight();            if (opts.pause) $cont.hover(function() {                cont.twitterSearchPause = true;            },            function() {                cont.twitterSearchPause = false;            });            $('<div class="twitterSearchLoading">Loading tweets..</div>').css(opts.css['loading']).appendTo($cont);            $.getJSONP({                url: url,                timeout: 30000,                error: function(xhr, status, e) {                    failWhale(e);                },                success: function(json) {                    if (json.error) {                        failWhale(json.error);                        return;                    }                    $cont.empty();                    $.each(json.results,                    function(i) {                        if (!opts.filter.call(opts, this)) return;                        var tweet = opts.formatter(this, opts),                        $tweet = $(tweet);                        $tweet.css(opts.css['tweet']);                        var $img = $tweet.find('.twitterSearchProfileImg').css(opts.css['img']);                        $tweet.find('.twitterSearchUser').css(opts.css['user']);                        $tweet.find('.twitterSearchTime').css(opts.css['time']);                        $tweet.find('a').css(opts.css['a']);                        $tweet.appendTo($cont);                        var $text = $tweet.find('.twitterSearchText').css(opts.css['text']);                        if (opts.avatar) {                            var w = $img.outerWidth() + parseInt($tweet.css('paddingLeft'));                            $text.css('paddingLeft', w);                        }                    });                    if (json.results.length < 2) return;                    setTimeout(go, opts.timeout);                }            });            function failWhale(msg) {                var $fail = $('<div class="twitterSearchFail">' + msg + '</div>').css(opts.css['fail']);                $cont.empty().append($fail);            };            function go() {                if (cont.twitterSearchPause) {                    setTimeout(go, 500);                    return;                }                var $el = $cont.children(':first'),                el = $el[0];                $el.animate(opts.animOut, opts.animOutSpeed,                function() {                    var h = $el.outerHeight();                    $el.animate({                        marginTop: -h                    },                    opts.animInSpeed,                    function() {                        $el.css({                            marginTop: 0,                            opacity: 1                        });                        $el.css(opts.css['tweet']).show().appendTo($cont);                    });                    setTimeout(go, opts.timeout);                });            }        });    };    $.fn.twitterSearch.filter = function(tweet) {        return true;    };    $.fn.twitterSearch.formatter = function(json, opts) {        var t = json.text;        if (opts.anchors) {            t = json.text.replace(/(http:\/\/\S+)/g, '<a target="_blank" href="$1">$1</a>');            t = t.replace(/\@(\w+)/g, '<a target="_blank" href="http://twitter.com/$1">@$1</a>');        }        var s = '<div class="twitterSearchTweet">';        if (opts.avatar) s += '<img class="twitterSearchProfileImg" src="' + json.profile_image_url + '" />';        s += '<div><span class="twitterSearchUser"><a target="_blank" href="http://www.twitter.com/' + json.from_user + '/status/' + json.id + '">' + json.from_user + '</a></span>';        var d = prettyDate(json.created_at);        if (opts.time && d) s += ' <span class="twitterSearchTime">(' + d + ')</span>' ;		s += '<div class="twitterSearchText">' + t + '</div></div></div>';        return s;    };    $.fn.twitterSearch.defaults = {        url: 'http://search.twitter.com/search.json?callback=?&q=',        anchors: true,        animOutSpeed: 500,        animInSpeed: 500,        animOut: {            opacity: 0        },        applyStyles: true,        avatar: true,        bird: true,        birdLink: false,        birdSrc: 'http://cloud.github.com/downloads/malsup/twitter/tweet.gif',        colorExterior: null,        colorInterior: null,        filter: null,        formatter: null,        pause: false,        term: '',        time: true,        timeout: 4000,        title: null,        titleLink: null,        css: {            a: {                textDecoration: 'none',                color: '#1485A5'            },            bird: {                width: '50px',                height: '20px',                position: 'absolute',                left: '-30px',                top: '-20px',                border: 'none'            },            container: {                overflow: 'hidden',                backgroundColor: '#eee',                height: '253px',                border: '1px solid #ccc'            },            fail: {                background: '#6cc5c3 url(http://cloud.github.com/downloads/malsup/twitter/failwhale.png) no-repeat 50% 50%',                height: '100%',                padding: '10px'            },            frame: {                height: '280px',                border: '10px solid #C2CFF1',                borderRadius: '10px',                '-moz-border-radius': '10px',                '-webkit-border-radius': '10px',                '-moz-box-shadow': '1px 1px 5px #000',                '-webkit-box-shadow': '1px 1px 5px #000'            },            tweet: {                padding: '5px 10px',                clear: 'left'            },            img: {                'float': 'left',                margin: '5px 10px 5px 0px',                width: '48px',                height: '48px',                '-moz-box-shadow': '1px 1px 5px #000',                '-webkit-box-shadow': '1px 1px 5px #000'            },            loading: {                padding: '20px',                textAlign: 'center',                color: '#888',                fontSize: '10px'            },            text: {                fontSize: '11px',                borderBottom: '1px solid #ddd',                paddingBottom: '6px'            },            time: {                fontSize: '10px',                color: '#888'            },            title: {                cursor: 'move',                backgroundColor: '#C2CFF1',                margin: 0,                padding: '0 0 5px 0',                textAlign: 'center',                fontWeight: 'bold',                fontSize: '16px',                textShadow: '1px 1px 1px #fff',                position: 'relative'            },            titleLink: {                textDecoration: 'none',                color: '#1485A5'            },            user: {                fontWeight: 'bold',                fontSize: '11px',                textTransform: 'uppercase',                textShadow: '1px 1px 1px #fff'            }        }    };    $.getJSONP = function(s) {        s.dataType = 'jsonp';        $.ajax(s);        var $script = $(document.getElementsByTagName('head')[0].firstChild);        var url = $script.attr('src') || '';        var cb = (url.match(/callback=(\w+)/) || [])[1];        if (!cb) return;        var t = 0,        cbFn = window[cb];        $script[0].onerror = function(e) {            $script.remove();            handleError(s, {},            "error", e);            clearTimeout(t);        };        if (!s.timeout) return;        window[cb] = function(json) {            clearTimeout(t);            cbFn(json);            cbFn = null;        };        t = setTimeout(function() {            $script.remove();            handleError(s, {},            "timeout");            if (cbFn) window[cb] = function() {};        },        s.timeout);        function handleError(s, o, msg, e) { ($.ajax.handleError || $.handleError)(s, o, msg, e);        }    };    function prettyDate(time) {        var date = new Date((time || "").replace(/-/g, "/").replace(/TZ/g, " ")),        diff = (((new Date()).getTime() - date.getTime()) / 1000),        day_diff = Math.floor(diff / 86400);        if (isNaN(day_diff) || day_diff < 0 || day_diff >= 31) return;        var v = day_diff == 0 && (diff < 60 && "just now" || diff < 120 && "1 minute ago" || diff < 3600 && Math.floor(diff / 60) + " minutes ago" || diff < 7200 && "1 hour ago" || diff < 86400 && Math.floor(diff / 3600) + " hours ago") || day_diff == 1 && "Yesterday" || day_diff < 7 && day_diff + " days ago" || day_diff < 31 && Math.ceil(day_diff / 7) + " weeks ago";        if (!v) window.console && console.log(time);        return v ? v: '';    }})(jQuery);