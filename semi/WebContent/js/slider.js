 
!function(t, e) {
    "object" == typeof exports && "object" == typeof module ? module.exports = e() : "function" == typeof define && define.amd ? define([], e) : "object" == typeof exports ? exports.Deslider = e() : t.Deslider = e()
}(this, function() {
    return function(t) {
        function e(n) {
            if (i[n])
                return i[n].exports;
            var s = i[n] = {
                exports: {},
                id: n,
                loaded: !1
            };
            return t[n].call(s.exports, s, s.exports, e),
            s.loaded = !0,
            s.exports
        }
        var i = {};
        return e.m = t,
        e.c = i,
        e.p = "",
        e(0)
    }([function(t, e, i) {
        "use strict";
        function n(t) {
            return t && t.__esModule ? t : {
                "default": t
            }
        }
        var s = i(1)
          , r = n(s);
        t.exports = r["default"]
    }
    , function(t, e, i) {
        "use strict";
        function n(t) {
            return t && t.__esModule ? t : {
                "default": t
            }
        }
        function s(t, e) {
            if (!(t instanceof e))
                throw new TypeError("Cannot call a class as a function")
        }
        Object.defineProperty(e, "__esModule", {
            value: !0
        });
        var r = function() {
            function t(t, e) {
                for (var i = 0; i < e.length; i++) {
                    var n = e[i];
                    n.enumerable = n.enumerable || !1,
                    n.configurable = !0,
                    "value"in n && (n.writable = !0),
                    Object.defineProperty(t, n.key, n)
                }
            }
            return function(e, i, n) {
                return i && t(e.prototype, i),
                n && t(e, n),
                e
            }
        }()
          , o = i(2)
          , a = n(o)
          , u = function() {
            function t(e, i, n) {
                var r = this;
                s(this, t),
                this.sliderPanelSelector = ".deslider-panel",
                this.sliderPaginationSelector = ".deslider-pagination",
                this.activeSlide = 0,
                this.timeoutHandle = void 0,
                this.intervals = [],
                this.containerName = i,
                this.container = document.querySelector(i),
                this.container.style.overflow = "hidden",
                this.container.style.position = "relative",
                this.container.style.width = "100%",
                this.mouseOverEventListener = void 0,
                this.mouseOutEventListener = void 0,
                this.fullScreenEventListener = void 0,
                this.nextEventListener = void 0,
                this.prevEventListener = void 0,
                n = n || {},
                n.auto = n.auto || !0,
                this.options = {
                    auto: "undefined" != typeof n.auto && n.auto,
                    speed: "undefined" == typeof n.auto.speed ? 3e3 : n.auto.speed,
                    pauseOnHover: "undefined" == typeof n.auto.pauseOnHover || n.auto.pauseOnHover,
                    fullScreen: "undefined" == typeof n.fullScreen || n.fullScreen,
                    swipe: "undefined" == typeof n.swipe || n.swipe,
                    pagination: "undefined" == typeof n.pagination || n.pagination,
                    repeat: "undefined" == typeof n.repeat || n.repeat
                },
                this.sliderEl = document.createElement("div"),
                this.sliderEl.className = "deslider",
                this.container.appendChild(this.sliderEl),
                e = e || [],
                e.map(function(t) {
                    var e = document.createElement("figure");
                    e.className = "deslider-panel",
                    e.innerHTML = '<img src="' + t.link + '" />',
                    e.innerHTML = e.innerHTML + "<figcaption>" + t.caption + "</figcaption>",
                    r.sliderEl.appendChild(e)
                }),
                this.slideCount = e.length || 0,
                this.sliderEl.style.width = 100 * this.slideCount + "%",
                this.allFigures = this.sliderEl.parentElement.querySelectorAll("figure");
                for (var o = 0; o < this.slideCount; ++o)
                    this.allFigures[o].style.maxWidth = 100 / this.slideCount + "%";
                this.options.pagination != false && this.createPagination(),
                this.options.fullScreen != false && this.addFullScreen(this.container),
                this.options.auto != false && this.autoCycle(this.options.auto.speed, this.options.auto.pauseOnHover),
                this.injectControls(this.container),
                this.createEventListeners(this.container),
                this.options.swipe != false && this.addSwipe()
            }
            return r(t, [{
                key: "createEventListeners",
                value: function() {
                    var t = this;
                    this.nextEventListener = this.container.querySelector(".deslider-next").addEventListener("click", function() {
                        t.goToSlide(t.activeSlide + 1)
                    }, !1),
                    this.prevEventListener = this.container.querySelector(".deslider-prev").addEventListener("click", function() {
                        t.goToSlide(t.activeSlide - 1)
                    }, !1),
                    this.container.onkeydown = function(e) {
                        e = e || window.event,
                        37 === e.keyCode ? t.goToSlide(t.activeSlide - 1) : 39 === e.keyCode && t.goToSlide(t.activeSlide + 1)
                    }
                }
            }, {
                key: "injectControls",
                value: function() {
                    var t = document.createElement("span")
                      , e = document.createElement("span")
                      , i = document.createDocumentFragment();
                    t.classList.add("deslider-prev"),
                    e.classList.add("deslider-next"),
                    t.innerHTML = "&laquo;",
                    e.innerHTML = "&raquo;",
                    i.appendChild(t),
                    i.appendChild(e),
                    this.container.appendChild(i)
                }
            }, {
                key: "goToSlide",
                value: function(t) {
                    var e = this;
                    this.options.repeat === !0 ? t < 0 ? this.activeSlide = this.slideCount - 1 : t > this.slideCount - 1 ? this.activeSlide = 0 : this.activeSlide = t : t < 0 ? this.activeSlide = 0 : t > this.slideCount - 1 ? this.activeSlide = this.slideCount - 1 : this.activeSlide = t,
                    this.sliderEl.classList.add("is-animating");
                    var i = -(100 / this.slideCount) * this.activeSlide;
                    this.sliderEl.style.transform = "translateX(" + i + "%)",
                    clearTimeout(this.timeoutHandle),
                    this.timeoutHandle = setTimeout(function() {
                        e.sliderEl.classList.remove("is-animating")
                    }, 400),
                    this.options.pagination === !0 && this.updatePagination()
                }
            }, {
                key: "addSwipe",
                value: function() {
                    var t = this;
                    this.sliderManager = new a["default"].Manager(this.sliderEl),
                    this.sensitivity = 25,
                    this.sliderManager.add(new a["default"].Pan({
                        threshold: 0,
                        pointers: 0
                    })),
                    this.sliderManager.on("pan", function(e) {
                        var i = e.deltaX / (t.slideCount * window.innerWidth) * 100
                          , n = i - t.activeSlide / t.slideCount * 100;
                        t.sliderEl.style.transform = "translateX(" + n + "%)",
                        e.isFinal && (e.velocityX > 1 ? t.goToSlide(t.activeSlide - 1) : e.velocityX < -1 ? t.goToSlide(t.activeSlide + 1) : i <= -(t.sensitivity / t.slideCount) ? t.goToSlide(t.activeSlide + 1) : i >= t.sensitivity / t.slideCount ? t.goToSlide(t.activeSlide - 1) : t.goToSlide(t.activeSlide))
                    })
                }
            }, {
                key: "createPagination",
                value: function() {
                    this.sliderPagination = document.createElement("div"),
                    this.sliderPagination.className = "deslider-pagination",
                    this.container.appendChild(this.sliderPagination);
                    for (var t = 0; t < this.slideCount; ++t) {
                        var e = t === this.activeSlide ? ' class="is-active"' : 'class="fuck"'
                          , i = "<div " + e + "></div>";
                        this.sliderEl.parentElement.querySelector(this.sliderPaginationSelector).innerHTML += i
                    }
                }
            }, {
                key: "updatePagination",
                value: function() {
                    for (var t = this.sliderEl.parentElement.querySelectorAll(this.sliderPaginationSelector + " > *"), e = 0; e < t.length; ++e) {
                        var i = e === this.activeSlide ? "is-active" : "fuck";
                        t[e].className = i
                    }
                }
            }, {
                key: "addFullScreen",
                value: function(t) {
                    var e = this
                      , i = document.createElement("span");
                    i.classList.add("deslider-fullscreen"),
                    t.appendChild(i),
                    this.fullScreenEventListener = t.querySelector(".deslider-fullscreen").addEventListener("click", function() {
                        e.toggleFullScreen(t)
                    }, !1)
                }
            }, {
                key: "toggleFullScreen",
                value: function(t) {
                    document.fullscreenElement || document.mozFullScreenElement || document.webkitFullscreenElement || document.msFullscreenElement ? document.exitFullscreen ? document.exitFullscreen() : document.msExitFullscreen ? document.msExitFullscreen() : document.mozCancelFullScreen ? document.mozCancelFullScreen() : document.webkitExitFullscreen && document.webkitExitFullscreen() : document.documentElement.requestFullscreen ? t.requestFullscreen() : document.documentElement.msRequestFullscreen ? t.msRequestFullscreen() : document.documentElement.mozRequestFullScreen ? t.mozRequestFullScreen() : document.documentElement.webkitRequestFullscreen && t.webkitRequestFullscreen(t.ALLOW_KEYBOARD_INPUT)
                }
            }, {
                key: "autoCycle",
                value: function(t, e) {
                    var i = this;
                    this.mouseOverHandler = function() {
                        i.intervals.map(function(t) {
                            clearInterval(t)
                        })
                    }
                    ,
                    this.mouseOutHandler = function() {
                        i.intervals.map(function(t) {
                            clearInterval(t)
                        }),
                        i.intervals.push(setInterval(function() {
                            i.goToSlide(i.activeSlide + 1)
                        }, t))
                    }
                    ,
                    this.intervals.map(function(t) {
                        clearInterval(t)
                    }),
                    this.intervals.push(setInterval(function() {
                        i.goToSlide(i.activeSlide + 1)
                    }, t)),
                    e && (this.mouseOverEventListener = this.container.addEventListener("mouseover", this.mouseOverHandler, !1),
                    this.mouseOutEventListener = this.container.addEventListener("mouseout", this.mouseOutHandler, !1))
                }
            }, {
                key: "stop",
                value: function() {
                    if (this.intervals.map(function(t) {
                        clearInterval(t)
                    }),
                    this.container.removeEventListener(this.mouseOverHandler, !1),
                    this.container.removeEventListener(this.mouseOutHandler, !1),
                    "#" === this.containerName.charAt(0)) {
                        var t = document.getElementById(this.containerName.substring(1))
                          , e = t.cloneNode(!0);
                        t.parentNode.replaceChild(e, t)
                    } else {
                        var i = this.container.cloneNode(!0);
                        this.container.parentNode.replaceChild(i, this.container)
                    }
                    for (this.container = document.querySelector(this.containerName); this.container.firstChild; )
                        this.container.removeChild(this.container.firstChild)
                }
            }]),
            t
        }();
        e["default"] = u,
        t.exports = u,
        t.exports = e["default"]
    }
    , function(t, e, i) {
        var n;
        /*! Hammer.JS - v2.0.7 - 2016-04-22
	 * http://hammerjs.github.io/
	 *
	 * Copyright (c) 2016 Jorik Tangelder;
	 * Licensed under the MIT license */
        !function(s, r, o, a) {
            "use strict";
            function u(t, e, i) {
                return setTimeout(p(t, i), e)
            }
            function l(t, e, i) {
                return !!Array.isArray(t) && (c(t, i[e], i),
                !0)
            }
            function c(t, e, i) {
                var n;
                if (t)
                    if (t.forEach)
                        t.forEach(e, i);
                    else if (t.length !== a)
                        for (n = 0; n < t.length; )
                            e.call(i, t[n], n, t),
                            n++;
                    else
                        for (n in t)
                            t.hasOwnProperty(n) && e.call(i, t[n], n, t)
            }
            function h(t, e, i) {
                var n = "DEPRECATED METHOD: " + e + "\n" + i + " AT \n";
                return function() {
                    var e = new Error("get-stack-trace")
                      , i = e && e.stack ? e.stack.replace(/^[^\(]+?[\n$]/gm, "").replace(/^\s+at\s+/gm, "").replace(/^Object.<anonymous>\s*\(/gm, "{anonymous}()@") : "Unknown Stack Trace"
                      , r = s.console && (s.console.warn || s.console.log);
                    return r && r.call(s.console, n, i),
                    t.apply(this, arguments)
                }
            }
            function d(t, e, i) {
                var n, s = e.prototype;
                n = t.prototype = Object.create(s),
                n.constructor = t,
                n._super = s,
                i && vt(n, i)
            }
            function p(t, e) {
                return function() {
                    return t.apply(e, arguments)
                }
            }
            function f(t, e) {
                return typeof t == yt ? t.apply(e ? e[0] || a : a, e) : t
            }
            function v(t, e) {
                return t === a ? e : t
            }
            function m(t, e, i) {
                c(E(e), function(e) {
                    t.addEventListener(e, i, !1)
                })
            }
            function g(t, e, i) {
                c(E(e), function(e) {
                    t.removeEventListener(e, i, !1)
                })
            }
            function y(t, e) {
                for (; t; ) {
                    if (t == e)
                        return !0;
                    t = t.parentNode
                }
                return !1
            }
            function T(t, e) {
                return t.indexOf(e) > -1
            }
            function E(t) {
                return t.trim().split(/\s+/g)
            }
            function S(t, e, i) {
                if (t.indexOf && !i)
                    return t.indexOf(e);
                for (var n = 0; n < t.length; ) {
                    if (i && t[n][i] == e || !i && t[n] === e)
                        return n;
                    n++
                }
                return -1
            }
            function C(t) {
                return Array.prototype.slice.call(t, 0)
            }
            function w(t, e, i) {
                for (var n = [], s = [], r = 0; r < t.length; ) {
                    var o = e ? t[r][e] : t[r];
                    S(s, o) < 0 && n.push(t[r]),
                    s[r] = o,
                    r++
                }
                return i && (n = e ? n.sort(function(t, i) {
                    return t[e] > i[e]
                }) : n.sort()),
                n
            }
            function x(t, e) {
                for (var i, n, s = e[0].toUpperCase() + e.slice(1), r = 0; r < mt.length; ) {
                    if (i = mt[r],
                    n = i ? i + s : e,
                    n in t)
                        return n;
                    r++
                }
                return a
            }
            function I() {
                return xt++
            }
            function b(t) {
                var e = t.ownerDocument || t;
                return e.defaultView || e.parentWindow || s
            }
            function P(t, e) {
                var i = this;
                this.manager = t,
                this.callback = e,
                this.element = t.element,
                this.target = t.options.inputTarget,
                this.domHandler = function(e) {
                    f(t.options.enable, [t]) && i.handler(e)
                }
                ,
                this.init()
            }
            function A(t) {
                var e, i = t.options.inputClass;
                return new (e = i ? i : Pt ? Y : At ? U : bt ? B : X)(t,_)
            }
            function _(t, e, i) {
                var n = i.pointers.length
                  , s = i.changedPointers.length
                  , r = e & Mt && n - s === 0
                  , o = e & (Nt | Rt) && n - s === 0;
                i.isFirst = !!r,
                i.isFinal = !!o,
                r && (t.session = {}),
                i.eventType = e,
                F(t, i),
                t.emit("hammer.input", i),
                t.recognize(i),
                t.session.prevInput = i
            }
            function F(t, e) {
                var i = t.session
                  , n = e.pointers
                  , s = n.length;
                i.firstInput || (i.firstInput = D(e)),
                s > 1 && !i.firstMultiple ? i.firstMultiple = D(e) : 1 === s && (i.firstMultiple = !1);
                var r = i.firstInput
                  , o = i.firstMultiple
                  , a = o ? o.center : r.center
                  , u = e.center = M(n);
                e.timeStamp = St(),
                e.deltaTime = e.timeStamp - r.timeStamp,
                e.angle = q(a, u),
                e.distance = R(a, u),
                O(i, e),
                e.offsetDirection = N(e.deltaX, e.deltaY);
                var l = k(e.deltaTime, e.deltaX, e.deltaY);
                e.overallVelocityX = l.x,
                e.overallVelocityY = l.y,
                e.overallVelocity = Et(l.x) > Et(l.y) ? l.x : l.y,
                e.scale = o ? z(o.pointers, n) : 1,
                e.rotation = o ? H(o.pointers, n) : 0,
                e.maxPointers = i.prevInput ? e.pointers.length > i.prevInput.maxPointers ? e.pointers.length : i.prevInput.maxPointers : e.pointers.length,
                L(i, e);
                var c = t.element;
                y(e.srcEvent.target, c) && (c = e.srcEvent.target),
                e.target = c
            }
            function O(t, e) {
                var i = e.center
                  , n = t.offsetDelta || {}
                  , s = t.prevDelta || {}
                  , r = t.prevInput || {};
                e.eventType !== Mt && r.eventType !== Nt || (s = t.prevDelta = {
                    x: r.deltaX || 0,
                    y: r.deltaY || 0
                },
                n = t.offsetDelta = {
                    x: i.x,
                    y: i.y
                }),
                e.deltaX = s.x + (i.x - n.x),
                e.deltaY = s.y + (i.y - n.y)
            }
            function L(t, e) {
                var i, n, s, r, o = t.lastInterval || e, u = e.timeStamp - o.timeStamp;
                if (e.eventType != Rt && (u > Dt || o.velocity === a)) {
                    var l = e.deltaX - o.deltaX
                      , c = e.deltaY - o.deltaY
                      , h = k(u, l, c);
                    n = h.x,
                    s = h.y,
                    i = Et(h.x) > Et(h.y) ? h.x : h.y,
                    r = N(l, c),
                    t.lastInterval = e
                } else
                    i = o.velocity,
                    n = o.velocityX,
                    s = o.velocityY,
                    r = o.direction;
                e.velocity = i,
                e.velocityX = n,
                e.velocityY = s,
                e.direction = r
            }
            function D(t) {
                for (var e = [], i = 0; i < t.pointers.length; )
                    e[i] = {
                        clientX: Tt(t.pointers[i].clientX),
                        clientY: Tt(t.pointers[i].clientY)
                    },
                    i++;
                return {
                    timeStamp: St(),
                    pointers: e,
                    center: M(e),
                    deltaX: t.deltaX,
                    deltaY: t.deltaY
                }
            }
            function M(t) {
                var e = t.length;
                if (1 === e)
                    return {
                        x: Tt(t[0].clientX),
                        y: Tt(t[0].clientY)
                    };
                for (var i = 0, n = 0, s = 0; e > s; )
                    i += t[s].clientX,
                    n += t[s].clientY,
                    s++;
                return {
                    x: Tt(i / e),
                    y: Tt(n / e)
                }
            }
            function k(t, e, i) {
                return {
                    x: e / t || 0,
                    y: i / t || 0
                }
            }
            function N(t, e) {
                return t === e ? qt : Et(t) >= Et(e) ? 0 > t ? Ht : zt : 0 > e ? Xt : Yt
            }
            function R(t, e, i) {
                i || (i = Vt);
                var n = e[i[0]] - t[i[0]]
                  , s = e[i[1]] - t[i[1]];
                return Math.sqrt(n * n + s * s)
            }
            function q(t, e, i) {
                i || (i = Vt);
                var n = e[i[0]] - t[i[0]]
                  , s = e[i[1]] - t[i[1]];
                return 180 * Math.atan2(s, n) / Math.PI
            }
            function H(t, e) {
                return q(e[1], e[0], Bt) + q(t[1], t[0], Bt)
            }
            function z(t, e) {
                return R(e[0], e[1], Bt) / R(t[0], t[1], Bt)
            }
            function X() {
                this.evEl = Zt,
                this.evWin = Kt,
                this.pressed = !1,
                P.apply(this, arguments)
            }
            function Y() {
                this.evEl = Qt,
                this.evWin = te,
                P.apply(this, arguments),
                this.store = this.manager.session.pointerEvents = []
            }
            function W() {
                this.evTarget = ie,
                this.evWin = ne,
                this.started = !1,
                P.apply(this, arguments)
            }
            function j(t, e) {
                var i = C(t.touches)
                  , n = C(t.changedTouches);
                return e & (Nt | Rt) && (i = w(i.concat(n), "identifier", !0)),
                [i, n]
            }
            function U() {
                this.evTarget = re,
                this.targetIds = {},
                P.apply(this, arguments)
            }
            function V(t, e) {
                var i = C(t.touches)
                  , n = this.targetIds;
                if (e & (Mt | kt) && 1 === i.length)
                    return n[i[0].identifier] = !0,
                    [i, i];
                var s, r, o = C(t.changedTouches), a = [], u = this.target;
                if (r = i.filter(function(t) {
                    return y(t.target, u)
                }),
                e === Mt)
                    for (s = 0; s < r.length; )
                        n[r[s].identifier] = !0,
                        s++;
                for (s = 0; s < o.length; )
                    n[o[s].identifier] && a.push(o[s]),
                    e & (Nt | Rt) && delete n[o[s].identifier],
                    s++;
                return a.length ? [w(r.concat(a), "identifier", !0), a] : void 0
            }
            function B() {
                P.apply(this, arguments);
                var t = p(this.handler, this);
                this.touch = new U(this.manager,t),
                this.mouse = new X(this.manager,t),
                this.primaryTouch = null,
                this.lastTouches = []
            }
            function G(t, e) {
                t & Mt ? (this.primaryTouch = e.changedPointers[0].identifier,
                Z.call(this, e)) : t & (Nt | Rt) && Z.call(this, e)
            }
            function Z(t) {
                var e = t.changedPointers[0];
                if (e.identifier === this.primaryTouch) {
                    var i = {
                        x: e.clientX,
                        y: e.clientY
                    };
                    this.lastTouches.push(i);
                    var n = this.lastTouches
                      , s = function() {
                        var t = n.indexOf(i);
                        t > -1 && n.splice(t, 1)
                    };
                    setTimeout(s, oe)
                }
            }
            function K(t) {
                for (var e = t.srcEvent.clientX, i = t.srcEvent.clientY, n = 0; n < this.lastTouches.length; n++) {
                    var s = this.lastTouches[n]
                      , r = Math.abs(e - s.x)
                      , o = Math.abs(i - s.y);
                    if (ae >= r && ae >= o)
                        return !0
                }
                return !1
            }
            function $(t, e) {
                this.manager = t,
                this.set(e)
            }
            function J(t) {
                if (T(t, pe))
                    return pe;
                var e = T(t, fe)
                  , i = T(t, ve);
                return e && i ? pe : e || i ? e ? fe : ve : T(t, de) ? de : he
            }
            function Q() {
                if (!le)
                    return !1;
                var t = {}
                  , e = s.CSS && s.CSS.supports;
                return ["auto", "manipulation", "pan-y", "pan-x", "pan-x pan-y", "none"].forEach(function(i) {
                    t[i] = !e || s.CSS.supports("touch-action", i)
                }),
                t
            }
            function tt(t) {
                this.options = vt({}, this.defaults, t || {}),
                this.id = I(),
                this.manager = null,
                this.options.enable = v(this.options.enable, !0),
                this.state = ge,
                this.simultaneous = {},
                this.requireFail = []
            }
            function et(t) {
                return t & Ce ? "cancel" : t & Ee ? "end" : t & Te ? "move" : t & ye ? "start" : ""
            }
            function it(t) {
                return t == Yt ? "down" : t == Xt ? "up" : t == Ht ? "left" : t == zt ? "right" : ""
            }
            function nt(t, e) {
                var i = e.manager;
                return i ? i.get(t) : t
            }
            function st() {
                tt.apply(this, arguments)
            }
            function rt() {
                st.apply(this, arguments),
                this.pX = null,
                this.pY = null
            }
            function ot() {
                st.apply(this, arguments)
            }
            function at() {
                tt.apply(this, arguments),
                this._timer = null,
                this._input = null
            }
            function ut() {
                st.apply(this, arguments)
            }
            function lt() {
                st.apply(this, arguments)
            }
            function ct() {
                tt.apply(this, arguments),
                this.pTime = !1,
                this.pCenter = !1,
                this._timer = null,
                this._input = null,
                this.count = 0
            }
            function ht(t, e) {
                return e = e || {},
                e.recognizers = v(e.recognizers, ht.defaults.preset),
                new dt(t,e)
            }
            function dt(t, e) {
                this.options = vt({}, ht.defaults, e || {}),
                this.options.inputTarget = this.options.inputTarget || t,
                this.handlers = {},
                this.session = {},
                this.recognizers = [],
                this.oldCssProps = {},
                this.element = t,
                this.input = A(this),
                this.touchAction = new $(this,this.options.touchAction),
                pt(this, !0),
                c(this.options.recognizers, function(t) {
                    var e = this.add(new t[0](t[1]));
                    t[2] && e.recognizeWith(t[2]),
                    t[3] && e.requireFailure(t[3])
                }, this)
            }
            function pt(t, e) {
                var i = t.element;
                if (i.style) {
                    var n;
                    c(t.options.cssProps, function(s, r) {
                        n = x(i.style, r),
                        e ? (t.oldCssProps[n] = i.style[n],
                        i.style[n] = s) : i.style[n] = t.oldCssProps[n] || ""
                    }),
                    e || (t.oldCssProps = {})
                }
            }
            function ft(t, e) {
                var i = r.createEvent("Event");
                i.initEvent(t, !0, !0),
                i.gesture = e,
                e.target.dispatchEvent(i)
            }
            var vt, mt = ["", "webkit", "Moz", "MS", "ms", "o"], gt = r.createElement("div"), yt = "function", Tt = Math.round, Et = Math.abs, St = Date.now;
            vt = "function" != typeof Object.assign ? function(t) {
                if (t === a || null === t)
                    throw new TypeError("Cannot convert undefined or null to object");
                for (var e = Object(t), i = 1; i < arguments.length; i++) {
                    var n = arguments[i];
                    if (n !== a && null !== n)
                        for (var s in n)
                            n.hasOwnProperty(s) && (e[s] = n[s])
                }
                return e
            }
            : Object.assign;
            var Ct = h(function(t, e, i) {
                for (var n = Object.keys(e), s = 0; s < n.length; )
                    (!i || i && t[n[s]] === a) && (t[n[s]] = e[n[s]]),
                    s++;
                return t
            }, "extend", "Use `assign`.")
              , wt = h(function(t, e) {
                return Ct(t, e, !0)
            }, "merge", "Use `assign`.")
              , xt = 1
              , It = /mobile|tablet|ip(ad|hone|od)|android/i
              , bt = "ontouchstart"in s
              , Pt = x(s, "PointerEvent") !== a
              , At = bt && It.test(navigator.userAgent)
              , _t = "touch"
              , Ft = "pen"
              , Ot = "mouse"
              , Lt = "kinect"
              , Dt = 25
              , Mt = 1
              , kt = 2
              , Nt = 4
              , Rt = 8
              , qt = 1
              , Ht = 2
              , zt = 4
              , Xt = 8
              , Yt = 16
              , Wt = Ht | zt
              , jt = Xt | Yt
              , Ut = Wt | jt
              , Vt = ["x", "y"]
              , Bt = ["clientX", "clientY"];
            P.prototype = {
                handler: function() {},
                init: function() {
                    this.evEl && m(this.element, this.evEl, this.domHandler),
                    this.evTarget && m(this.target, this.evTarget, this.domHandler),
                    this.evWin && m(b(this.element), this.evWin, this.domHandler)
                },
                destroy: function() {
                    this.evEl && g(this.element, this.evEl, this.domHandler),
                    this.evTarget && g(this.target, this.evTarget, this.domHandler),
                    this.evWin && g(b(this.element), this.evWin, this.domHandler)
                }
            };
            var Gt = {
                mousedown: Mt,
                mousemove: kt,
                mouseup: Nt
            }
              , Zt = "mousedown"
              , Kt = "mousemove mouseup";
            d(X, P, {
                handler: function(t) {
                    var e = Gt[t.type];
                    e & Mt && 0 === t.button && (this.pressed = !0),
                    e & kt && 1 !== t.which && (e = Nt),
                    this.pressed && (e & Nt && (this.pressed = !1),
                    this.callback(this.manager, e, {
                        pointers: [t],
                        changedPointers: [t],
                        pointerType: Ot,
                        srcEvent: t
                    }))
                }
            });
            var $t = {
                pointerdown: Mt,
                pointermove: kt,
                pointerup: Nt,
                pointercancel: Rt,
                pointerout: Rt
            }
              , Jt = {
                2: _t,
                3: Ft,
                4: Ot,
                5: Lt
            }
              , Qt = "pointerdown"
              , te = "pointermove pointerup pointercancel";
            s.MSPointerEvent && !s.PointerEvent && (Qt = "MSPointerDown",
            te = "MSPointerMove MSPointerUp MSPointerCancel"),
            d(Y, P, {
                handler: function(t) {
                    var e = this.store
                      , i = !1
                      , n = t.type.toLowerCase().replace("ms", "")
                      , s = $t[n]
                      , r = Jt[t.pointerType] || t.pointerType
                      , o = r == _t
                      , a = S(e, t.pointerId, "pointerId");
                    s & Mt && (0 === t.button || o) ? 0 > a && (e.push(t),
                    a = e.length - 1) : s & (Nt | Rt) && (i = !0),
                    0 > a || (e[a] = t,
                    this.callback(this.manager, s, {
                        pointers: e,
                        changedPointers: [t],
                        pointerType: r,
                        srcEvent: t
                    }),
                    i && e.splice(a, 1))
                }
            });
            var ee = {
                touchstart: Mt,
                touchmove: kt,
                touchend: Nt,
                touchcancel: Rt
            }
              , ie = "touchstart"
              , ne = "touchstart touchmove touchend touchcancel";
            d(W, P, {
                handler: function(t) {
                    var e = ee[t.type];
                    if (e === Mt && (this.started = !0),
                    this.started) {
                        var i = j.call(this, t, e);
                        e & (Nt | Rt) && i[0].length - i[1].length === 0 && (this.started = !1),
                        this.callback(this.manager, e, {
                            pointers: i[0],
                            changedPointers: i[1],
                            pointerType: _t,
                            srcEvent: t
                        })
                    }
                }
            });
            var se = {
                touchstart: Mt,
                touchmove: kt,
                touchend: Nt,
                touchcancel: Rt
            }
              , re = "touchstart touchmove touchend touchcancel";
            d(U, P, {
                handler: function(t) {
                    var e = se[t.type]
                      , i = V.call(this, t, e);
                    i && this.callback(this.manager, e, {
                        pointers: i[0],
                        changedPointers: i[1],
                        pointerType: _t,
                        srcEvent: t
                    })
                }
            });
            var oe = 2500
              , ae = 25;
            d(B, P, {
                handler: function(t, e, i) {
                    var n = i.pointerType == _t
                      , s = i.pointerType == Ot;
                    if (!(s && i.sourceCapabilities && i.sourceCapabilities.firesTouchEvents)) {
                        if (n)
                            G.call(this, e, i);
                        else if (s && K.call(this, i))
                            return;
                        this.callback(t, e, i)
                    }
                },
                destroy: function() {
                    this.touch.destroy(),
                    this.mouse.destroy()
                }
            });
            var ue = x(gt.style, "touchAction")
              , le = ue !== a
              , ce = "compute"
              , he = "auto"
              , de = "manipulation"
              , pe = "none"
              , fe = "pan-x"
              , ve = "pan-y"
              , me = Q();
            $.prototype = {
                set: function(t) {
                    t == ce && (t = this.compute()),
                    le && this.manager.element.style && me[t] && (this.manager.element.style[ue] = t),
                    this.actions = t.toLowerCase().trim()
                },
                update: function() {
                    this.set(this.manager.options.touchAction)
                },
                compute: function() {
                    var t = [];
                    return c(this.manager.recognizers, function(e) {
                        f(e.options.enable, [e]) && (t = t.concat(e.getTouchAction()))
                    }),
                    J(t.join(" "))
                },
                preventDefaults: function(t) {
                    var e = t.srcEvent
                      , i = t.offsetDirection;
                    if (this.manager.session.prevented)
                        return void e.preventDefault();
                    var n = this.actions
                      , s = T(n, pe) && !me[pe]
                      , r = T(n, ve) && !me[ve]
                      , o = T(n, fe) && !me[fe];
                    if (s) {
                        var a = 1 === t.pointers.length
                          , u = t.distance < 2
                          , l = t.deltaTime < 250;
                        if (a && u && l)
                            return
                    }
                    return o && r ? void 0 : s || r && i & Wt || o && i & jt ? this.preventSrc(e) : void 0
                },
                preventSrc: function(t) {
                    this.manager.session.prevented = !0,
                    t.preventDefault()
                }
            };
            var ge = 1
              , ye = 2
              , Te = 4
              , Ee = 8
              , Se = Ee
              , Ce = 16
              , we = 32;
            tt.prototype = {
                defaults: {},
                set: function(t) {
                    return vt(this.options, t),
                    this.manager && this.manager.touchAction.update(),
                    this
                },
                recognizeWith: function(t) {
                    if (l(t, "recognizeWith", this))
                        return this;
                    var e = this.simultaneous;
                    return t = nt(t, this),
                    e[t.id] || (e[t.id] = t,
                    t.recognizeWith(this)),
                    this
                },
                dropRecognizeWith: function(t) {
                    return l(t, "dropRecognizeWith", this) ? this : (t = nt(t, this),
                    delete this.simultaneous[t.id],
                    this)
                },
                requireFailure: function(t) {
                    if (l(t, "requireFailure", this))
                        return this;
                    var e = this.requireFail;
                    return t = nt(t, this),
                    -1 === S(e, t) && (e.push(t),
                    t.requireFailure(this)),
                    this
                },
                dropRequireFailure: function(t) {
                    if (l(t, "dropRequireFailure", this))
                        return this;
                    t = nt(t, this);
                    var e = S(this.requireFail, t);
                    return e > -1 && this.requireFail.splice(e, 1),
                    this
                },
                hasRequireFailures: function() {
                    return this.requireFail.length > 0
                },
                canRecognizeWith: function(t) {
                    return !!this.simultaneous[t.id]
                },
                emit: function(t) {
                    function e(e) {
                        i.manager.emit(e, t)
                    }
                    var i = this
                      , n = this.state;
                    Ee > n && e(i.options.event + et(n)),
                    e(i.options.event),
                    t.additionalEvent && e(t.additionalEvent),
                    n >= Ee && e(i.options.event + et(n))
                },
                tryEmit: function(t) {
                    return this.canEmit() ? this.emit(t) : void (this.state = we)
                },
                canEmit: function() {
                    for (var t = 0; t < this.requireFail.length; ) {
                        if (!(this.requireFail[t].state & (we | ge)))
                            return !1;
                        t++
                    }
                    return !0
                },
                recognize: function(t) {
                    var e = vt({}, t);
                    return f(this.options.enable, [this, e]) ? (this.state & (Se | Ce | we) && (this.state = ge),
                    this.state = this.process(e),
                    void (this.state & (ye | Te | Ee | Ce) && this.tryEmit(e))) : (this.reset(),
                    void (this.state = we))
                },
                process: function(t) {},
                getTouchAction: function() {},
                reset: function() {}
            },
            d(st, tt, {
                defaults: {
                    pointers: 1
                },
                attrTest: function(t) {
                    var e = this.options.pointers;
                    return 0 === e || t.pointers.length === e
                },
                process: function(t) {
                    var e = this.state
                      , i = t.eventType
                      , n = e & (ye | Te)
                      , s = this.attrTest(t);
                    return n && (i & Rt || !s) ? e | Ce : n || s ? i & Nt ? e | Ee : e & ye ? e | Te : ye : we
                }
            }),
            d(rt, st, {
                defaults: {
                    event: "pan",
                    threshold: 10,
                    pointers: 1,
                    direction: Ut
                },
                getTouchAction: function() {
                    var t = this.options.direction
                      , e = [];
                    return t & Wt && e.push(ve),
                    t & jt && e.push(fe),
                    e
                },
                directionTest: function(t) {
                    var e = this.options
                      , i = !0
                      , n = t.distance
                      , s = t.direction
                      , r = t.deltaX
                      , o = t.deltaY;
                    return s & e.direction || (e.direction & Wt ? (s = 0 === r ? qt : 0 > r ? Ht : zt,
                    i = r != this.pX,
                    n = Math.abs(t.deltaX)) : (s = 0 === o ? qt : 0 > o ? Xt : Yt,
                    i = o != this.pY,
                    n = Math.abs(t.deltaY))),
                    t.direction = s,
                    i && n > e.threshold && s & e.direction
                },
                attrTest: function(t) {
                    return st.prototype.attrTest.call(this, t) && (this.state & ye || !(this.state & ye) && this.directionTest(t))
                },
                emit: function(t) {
                    this.pX = t.deltaX,
                    this.pY = t.deltaY;
                    var e = it(t.direction);
                    e && (t.additionalEvent = this.options.event + e),
                    this._super.emit.call(this, t)
                }
            }),
            d(ot, st, {
                defaults: {
                    event: "pinch",
                    threshold: 0,
                    pointers: 2
                },
                getTouchAction: function() {
                    return [pe]
                },
                attrTest: function(t) {
                    return this._super.attrTest.call(this, t) && (Math.abs(t.scale - 1) > this.options.threshold || this.state & ye)
                },
                emit: function(t) {
                    if (1 !== t.scale) {
                        var e = t.scale < 1 ? "in" : "out";
                        t.additionalEvent = this.options.event + e
                    }
                    this._super.emit.call(this, t)
                }
            }),
            d(at, tt, {
                defaults: {
                    event: "press",
                    pointers: 1,
                    time: 251,
                    threshold: 9
                },
                getTouchAction: function() {
                    return [he]
                },
                process: function(t) {
                    var e = this.options
                      , i = t.pointers.length === e.pointers
                      , n = t.distance < e.threshold
                      , s = t.deltaTime > e.time;
                    if (this._input = t,
                    !n || !i || t.eventType & (Nt | Rt) && !s)
                        this.reset();
                    else if (t.eventType & Mt)
                        this.reset(),
                        this._timer = u(function() {
                            this.state = Se,
                            this.tryEmit()
                        }, e.time, this);
                    else if (t.eventType & Nt)
                        return Se;
                    return we
                },
                reset: function() {
                    clearTimeout(this._timer)
                },
                emit: function(t) {
                    this.state === Se && (t && t.eventType & Nt ? this.manager.emit(this.options.event + "up", t) : (this._input.timeStamp = St(),
                    this.manager.emit(this.options.event, this._input)))
                }
            }),
            d(ut, st, {
                defaults: {
                    event: "rotate",
                    threshold: 0,
                    pointers: 2
                },
                getTouchAction: function() {
                    return [pe]
                },
                attrTest: function(t) {
                    return this._super.attrTest.call(this, t) && (Math.abs(t.rotation) > this.options.threshold || this.state & ye)
                }
            }),
            d(lt, st, {
                defaults: {
                    event: "swipe",
                    threshold: 10,
                    velocity: .3,
                    direction: Wt | jt,
                    pointers: 1
                },
                getTouchAction: function() {
                    return rt.prototype.getTouchAction.call(this)
                },
                attrTest: function(t) {
                    var e, i = this.options.direction;
                    return i & (Wt | jt) ? e = t.overallVelocity : i & Wt ? e = t.overallVelocityX : i & jt && (e = t.overallVelocityY),
                    this._super.attrTest.call(this, t) && i & t.offsetDirection && t.distance > this.options.threshold && t.maxPointers == this.options.pointers && Et(e) > this.options.velocity && t.eventType & Nt
                },
                emit: function(t) {
                    var e = it(t.offsetDirection);
                    e && this.manager.emit(this.options.event + e, t),
                    this.manager.emit(this.options.event, t)
                }
            }),
            d(ct, tt, {
                defaults: {
                    event: "tap",
                    pointers: 1,
                    taps: 1,
                    interval: 300,
                    time: 250,
                    threshold: 9,
                    posThreshold: 10
                },
                getTouchAction: function() {
                    return [de]
                },
                process: function(t) {
                    var e = this.options
                      , i = t.pointers.length === e.pointers
                      , n = t.distance < e.threshold
                      , s = t.deltaTime < e.time;
                    if (this.reset(),
                    t.eventType & Mt && 0 === this.count)
                        return this.failTimeout();
                    if (n && s && i) {
                        if (t.eventType != Nt)
                            return this.failTimeout();
                        var r = !this.pTime || t.timeStamp - this.pTime < e.interval
                          , o = !this.pCenter || R(this.pCenter, t.center) < e.posThreshold;
                        this.pTime = t.timeStamp,
                        this.pCenter = t.center,
                        o && r ? this.count += 1 : this.count = 1,
                        this._input = t;
                        var a = this.count % e.taps;
                        if (0 === a)
                            return this.hasRequireFailures() ? (this._timer = u(function() {
                                this.state = Se,
                                this.tryEmit()
                            }, e.interval, this),
                            ye) : Se
                    }
                    return we
                },
                failTimeout: function() {
                    return this._timer = u(function() {
                        this.state = we
                    }, this.options.interval, this),
                    we
                },
                reset: function() {
                    clearTimeout(this._timer)
                },
                emit: function() {
                    this.state == Se && (this._input.tapCount = this.count,
                    this.manager.emit(this.options.event, this._input))
                }
            }),
            ht.VERSION = "2.0.7",
            ht.defaults = {
                domEvents: !1,
                touchAction: ce,
                enable: !0,
                inputTarget: null,
                inputClass: null,
                preset: [[ut, {
                    enable: !1
                }], [ot, {
                    enable: !1
                }, ["rotate"]], [lt, {
                    direction: Wt
                }], [rt, {
                    direction: Wt
                }, ["swipe"]], [ct], [ct, {
                    event: "doubletap",
                    taps: 2
                }, ["tap"]], [at]],
                cssProps: {
                    userSelect: "none",
                    touchSelect: "none",
                    touchCallout: "none",
                    contentZooming: "none",
                    userDrag: "none",
                    tapHighlightColor: "rgba(0,0,0,0)"
                }
            };
            var xe = 1
              , Ie = 2;
            dt.prototype = {
                set: function(t) {
                    return vt(this.options, t),
                    t.touchAction && this.touchAction.update(),
                    t.inputTarget && (this.input.destroy(),
                    this.input.target = t.inputTarget,
                    this.input.init()),
                    this
                },
                stop: function(t) {
                    this.session.stopped = t ? Ie : xe
                },
                recognize: function(t) {
                    var e = this.session;
                    if (!e.stopped) {
                        this.touchAction.preventDefaults(t);
                        var i, n = this.recognizers, s = e.curRecognizer;
                        (!s || s && s.state & Se) && (s = e.curRecognizer = null);
                        for (var r = 0; r < n.length; )
                            i = n[r],
                            e.stopped === Ie || s && i != s && !i.canRecognizeWith(s) ? i.reset() : i.recognize(t),
                            !s && i.state & (ye | Te | Ee) && (s = e.curRecognizer = i),
                            r++
                    }
                },
                get: function(t) {
                    if (t instanceof tt)
                        return t;
                    for (var e = this.recognizers, i = 0; i < e.length; i++)
                        if (e[i].options.event == t)
                            return e[i];
                    return null
                },
                add: function(t) {
                    if (l(t, "add", this))
                        return this;
                    var e = this.get(t.options.event);
                    return e && this.remove(e),
                    this.recognizers.push(t),
                    t.manager = this,
                    this.touchAction.update(),
                    t
                },
                remove: function(t) {
                    if (l(t, "remove", this))
                        return this;
                    if (t = this.get(t)) {
                        var e = this.recognizers
                          , i = S(e, t);
                        -1 !== i && (e.splice(i, 1),
                        this.touchAction.update())
                    }
                    return this
                },
                on: function(t, e) {
                    if (t !== a && e !== a) {
                        var i = this.handlers;
                        return c(E(t), function(t) {
                            i[t] = i[t] || [],
                            i[t].push(e)
                        }),
                        this
                    }
                },
                off: function(t, e) {
                    if (t !== a) {
                        var i = this.handlers;
                        return c(E(t), function(t) {
                            e ? i[t] && i[t].splice(S(i[t], e), 1) : delete i[t]
                        }),
                        this
                    }
                },
                emit: function(t, e) {
                    this.options.domEvents && ft(t, e);
                    var i = this.handlers[t] && this.handlers[t].slice();
                    if (i && i.length) {
                        e.type = t,
                        e.preventDefault = function() {
                            e.srcEvent.preventDefault()
                        }
                        ;
                        for (var n = 0; n < i.length; )
                            i[n](e),
                            n++
                    }
                },
                destroy: function() {
                    this.element && pt(this, !1),
                    this.handlers = {},
                    this.session = {},
                    this.input.destroy(),
                    this.element = null
                }
            },
            vt(ht, {
                INPUT_START: Mt,
                INPUT_MOVE: kt,
                INPUT_END: Nt,
                INPUT_CANCEL: Rt,
                STATE_POSSIBLE: ge,
                STATE_BEGAN: ye,
                STATE_CHANGED: Te,
                STATE_ENDED: Ee,
                STATE_RECOGNIZED: Se,
                STATE_CANCELLED: Ce,
                STATE_FAILED: we,
                DIRECTION_NONE: qt,
                DIRECTION_LEFT: Ht,
                DIRECTION_RIGHT: zt,
                DIRECTION_UP: Xt,
                DIRECTION_DOWN: Yt,
                DIRECTION_HORIZONTAL: Wt,
                DIRECTION_VERTICAL: jt,
                DIRECTION_ALL: Ut,
                Manager: dt,
                Input: P,
                TouchAction: $,
                TouchInput: U,
                MouseInput: X,
                PointerEventInput: Y,
                TouchMouseInput: B,
                SingleTouchInput: W,
                Recognizer: tt,
                AttrRecognizer: st,
                Tap: ct,
                Pan: rt,
                Swipe: lt,
                Pinch: ot,
                Rotate: ut,
                Press: at,
                on: m,
                off: g,
                each: c,
                merge: wt,
                extend: Ct,
                assign: vt,
                inherit: d,
                bindFn: p,
                prefixed: x
            });
            var be = "undefined" != typeof s ? s : "undefined" != typeof self ? self : {};
            be.Hammer = ht,
            n = function() {
                return ht
            }
            .call(e, i, e, t),
            !(void 0 !== n && (t.exports = n))
        }(window, document, "Hammer")
    }
    ])
});

