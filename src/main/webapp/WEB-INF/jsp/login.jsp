<%@ page import="java.util.Date" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="description" content="博康帐号能使用博康手机，MIUI，博康云，多看阅读，米聊，博康社区等博康服务。">
    <meta name="keywords" content="博康帐号，博康账号，博康注册，注册，Mi Account，Sign in，博康，帐号，账号，博康帐户，登录，登陆，安全令牌，动态口令，博康注册，找回密码">

    <script>
        var LANG = (function () {
            var locale = ("zh_CN").toLowerCase();
            if (locale) {
                if (locale.indexOf("en") > -1) {
                    return {data: "en", cls: "en"};
                } else if (locale.indexOf("zh") > -1) {
                    if (locale.indexOf("cn") === -1) {
                        return {data: "tw", cls: "zh_TW"};
                    } else {
                        return {data: "cn", cls: "zh_CN"};
                    }
                }
            }
            return {data: "en", cls: "en"};
        })();
    </script>

    <script>
    </script>
    <meta name="viewport"
          content="width=device-width,initial-scale=1.0,minimum-scale=1.0, maximum-scale=1.0,user-scalable=no">
    <meta http-equiv="X-UA-Compatible" content="IE=Edge">
    <title>博康帐号 - 登录</title>
</head>
<body class="zh_CN">
<div class="wrapper">
    <div class="wrap">
        <div class="layout_panel">
            <div class="layout" id="layout">
                <!--表单输入登录-->
                <div class="mainbox" id="login-main">
                    <div><a class="ercode" id="qrcode-trigger" href="javascript:void(0)"></a></div>
                    <!-- header s -->
                    <div class="lgnheader">
                        <div class="header_tit t_c">
                            <img src="${pageContext.request.contextPath}/static/img/logo.jpg"
                                 style="width: 95px;height: 95px">
                            <h4 class="header_tit_txt" id="login-title">帐号登录</h4>
                            <div class="site_info"></div>
                        </div>
                    </div>
                    <div class="tabs-con tabs_con now" data-con="pwd">
                        <div>
                            <div class="login_area">
                                <div class="error">${error}</div>
                                <form action="" method="POST"
                                      id="login-main-form">
                                    <div class="loginbox c_b">
                                        <!-- 输入框 -->
                                        <div class="lgn_inputbg c_b">
                                            <!--验证用户名-->
                                            <div class="single_imgarea" id="account-info">
                                                <div class="na-img-area" id="account-avator" style="display:none">
                                                    <div class="na-img-bg-area" id="account-avator-con"></div>
                                                </div>
                                                <p class="us_name" id="account-displayname"></p>
                                                <p class="us_id"></p>
                                            </div>
                                            <label id="region-code" class="labelbox login_user c_b" for="">
                                                <div class="turn_area"><a class="btn_turn" id="manual_code"
                                                                          href="javascript:void(0);" title="关闭国家码"></a>
                                                </div>
                                                <div class="country_list">
                                                    <div class="animation countrycode_selector"
                                                         id="countrycode_selector">
                                                        <span class="country_code"><tt class="countrycode-value"
                                                                                       id="countrycode_value"></tt><i
                                                                class="icon_arrow_down"></i></span>
                                                    </div>
                                                </div>
                                                <input class="item_account" autocomplete="off" type="text"
                                                       name="username" value="<shiro:principal/>"
                                                       id="username" placeholder="邮箱/手机号码/博康帐号">
                                            </label>
                                            <div class="country-container" id="countrycode_container"
                                                 style="display: none;">
                                                <div class="country_container_con" id="countrycode_container_con"></div>
                                            </div>
                                            <label class="labelbox pwd_panel c_b">
                                                <div class="eye_panel pwd-visiable">
                                                    <i class="eye pwd-eye">
                                                        <svg width="100%" height="100%" version="1.1"
                                                             xmlns="http://www.w3.org/2000/svg">
                                                            <path class="eye_outer"
                                                                  d="M0 8 C6 0,14 0,20 8, 14 16,6 16, 0 8 z"></path>
                                                            <circle class="eye_inner" cx="10" cy="8" r="3"></circle>
                                                        </svg>
                                                    </i>
                                                </div>
                                                <input type="password" placeholder="密码" autocomplete="off"
                                                       name="password"
                                                       id="pwd">
                                                <input type="text" placeholder="密码" autocomplete="off" id="visiablePwd"
                                                       style="display:none">
                                            </label>
                                            <%--自动登录：<input class="checkbox" type="checkbox" name="rememberMe" value="true">--%>
                                        </div>
                                        <div class="security_Controller">
                                            <label class="checkbox_area">
                                                <input class="checkbox"
                                                       type="checkbox" name="rememberMe" value="true">
                                                自动登录</label>
                                            <%--<label class="checkbox_area"><input type="checkbox"--%>
                                            <%--id="trustSecurityController"--%>
                                            <%--class="checkbox">使用安全控件</label>--%>
                                        </div>
                                        <div class="lgncode c_b" id="captcha">
                                        </div>
                                        <!-- 错误信息 -->
                                        <div class="err_tip" id="error-outcon" style="display: none;">
                                            <div class="dis_box"><em class="icon_error"></em><span
                                                    class="error-con"></span></div>
                                        </div>
                                        <!-- 登录频繁 -->
                                        <div id="error-forbidden" class="err_forbidden">您的操作频率过快，请稍后再试。</div>
                                        <div class="btns_bg">
                                            <input class="btnadpt btn_orange" id="login-button" type="submit"
                                                   value="立即登录">
                                            <span id="custom_display_8"
                                                  class="sns-default-container sns_default_container"
                                                  style="display: none;"></span>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>
</div>

<div id="custom_display_4" class="n-footer">
    <div class="nf-link-area clearfix">
        <ul class="lang-select-list">
            <li><a href="javascript:void(0)" data-lang="zh_CN" class="lang-select-li current">简体</a>|</li>
            <li>
                <a href="#"
                   data-lang="zh_TW" class="lang-select-li">繁体</a>|
            </li>
            <li>
                <a href="#"
                   data-lang="en" class="lang-select-li">English</a>|
            </li>
            <li><a href="#" target="_self">常见问题</a></li>
        </ul>
    </div>
</div>


<style>
    ﻿html, body, h1, h2, h3, h4, h5, h6, blockquote, p, pre, dl, dd, ol, ul, li, a, span, caption, th, td, form, fieldset, legend, input, button, textarea, address {
        margin: 0;
        padding: 0
    }

    h1, h2, h3, h4, h5, h6 {
        font-size: 100%
    }

    .error {
        color: red;
    }

    ol, ul {
        list-style: none
    }

    li {
        list-style: none
    }

    fieldset, img {
        border: 0
    }

    address, cite, dfn, em, var {
        font-style: normal
    }

    code, kbd, pre, samp {
        font-family: courier new, courier, monospace
    }

    input, button, textarea, select {
        font-size: 100%
    }

    input, button, select, textarea {
        outline: 0
    }

    textarea {
        resize: none
    }

    table {
        border-collapse: collapse;
        border-spacing: 0;
        empty-cells: show;
        font-size: inherit
    }

    abbr[title] {
        border-bottom: 1px dotted;
        cursor: help
    }

    a, a:hover {
        text-decoration: none
    }

    a, label, :focus {
        outline: 0 none
    }

    a, img, input {
        border: 0 none
    }

    s {
        font-style: normal;
        text-decoration: none
    }

    body {
        font-size: 12px;
        font-family: arial, "Hiragino Sans GB", "Microsoft YaHei", "微軟正黑體", "儷黑 Pro", sans-serif
    }

    button, input, select, textarea {
        font-family: arial, "Hiragino Sans GB", "Microsoft YaHei", sans-serif
    }

    input::-moz-placeholder, textarea::-moz-placeholder {
        color: #3b3b3b;
        font-weight: normal
    }

    ::-webkit-input-placeholder {
        color: #3b3b3b;
        font-weight: normal
    }

    input:-ms-input-placeholder {
        color: #3b3b3b;
        font-weight: normal
    }

    ::-ms-clear {
        display: none
    }

    ::-ms-reveal {
        display: none
    }

    .clearfix:after {
        display: block;
        content: "\20";
        height: 0;
        clear: both;
        overflow: hidden;
        visibility: hidden
    }

    .clearfix {
        *zoom: 1
    }

    input::-ms-clear {
        display: none
    }

    input::-ms-reveal {
        display: none
    }

    input:-webkit-autofill {
        -webkit-box-shadow: 0 0 0 1000px white inset
    }

    @media screen and (-ms-high-contrast: active),(-ms-high-contrast: none) {
        a {
            background-color: transparent
        }
    }

    input {
        background: 0;
        border: 0 none
    }

    input[type="button"], input[type="submit"], input[type="reset"], a {
        -webkit-appearance: none;
        appearance: none
    }

    .t_c {
        text-align: center
    }

    .c_b:before, .c_b:after {
        content: "";
        display: block
    }

    .c_b:after {
        clear: both
    }

    .c_b {
        zoom: 1
    }

    input[type=text]::-ms-clear, input[type=password]::-ms-reveal {
        display: none
    }

    input {
        color: #333
    }

    input:required, input:invalid {
        -moz-box-shadow: none;
        box-shadow: none
    }

    input::-moz-focus-inner {
        border: 0
    }

    html, body {
        height: 100%
    }

    body {
        background: #f5f5f5;
        color: #757575
    }

    a {
        color: #757575
    }

    input {
        color: #333
    }

    ::-webkit-input-placeholder {
        color: #9d9d9d
    }

    input:-ms-input-placeholder {
        color: #9d9d9d
    }

    .wrapper {
        width: 100%;
        min-height: 100%;
        height: auto;
        display: -webkit-box;
        display: box;
        display: -moz-box;
        display: -o-box;
        -webkit-box-align: center;
        -moz-box-align: center;
        -o-box-align: center;
        box-align: center;
        -webkit-box-pack: center;
        -moz-box-pack: center;
        -o-box-pack: center;
        box-pack: center
    }

    .wrap {
        padding-bottom: 80px;
        padding-top: 100px \9
    }

    @media screen and (min-width: 0\0
    ) {
        .wrap {
            padding-top: 100px
        }
    }

    .layout {
        background-color: #fff;
        width: 854px;
        margin: 0 auto 20px;
        position: relative;
        min-height: 620px
    }

    .mainbox {
        padding-bottom: 30px
    }

    .ercode {
        width: 68px;
        height: 68px;
        position: absolute;
        right: 0;
        top: 0;
        opacity: .3;
        filter: alpha(opacity=30)
    }

    .ercode:hover, .ercode:focus {
        opacity: 1;
        filter: alpha(opacity=100)
    }

    .header_tit {
        padding: 50px 0 22px
    }

    .header_tit_txt {
        font-size: 30px;
        color: #424242;
        font-weight: normal;
        padding-top: 22px
    }

    .lgn_inputbg {
        position: relative
    }

    .login_area {
        width: 358px;
        margin: 0 auto;
        padding-bottom: 20px
    }

    .labelbox {
        display: block;
        margin-bottom: 14px;
        border: 1px solid #e0e0e0
    }

    .labelbox input {
        width: 326px;
        height: 40px;
        line-height: 22px;
        padding: 13px 16px 13px 14px;
        display: block
    }

    .country_list {
        cursor: pointer;
        display: none;
        float: left
    }

    .item_account {
        float: left
    }

    .country_code {
        padding-right: 12px;
        position: relative
    }

    .icon_arrow_down {
        width: 8px;
        height: 5px;
        position: absolute;
        top: 8px;
        right: 0;
        background-position: -19px -69px
    }

    .eye_panel {
        display: none
    }

    .divflex .item_account {
        width: 270px
    }

    .turn_area {
        display: none;
        height: 11px;
        padding: 18px 0 18px 10px;
        float: left
    }

    .btn_turn {
        width: 11px;
        height: 11px;
        display: block
    }

    .add_regioncode .item_account {
        width: 226px
    }

    .add_regioncode .country_list {
        height: 22px;
        line-height: 22px;
        padding: 13px 10px 13px 0;
        margin-left: 10px;
        color: #333;
        border-right: 1px solid #e0e0e0;
        display: block;
        overflow: hidden;
        position: relative
    }

    .add_regioncode .country_list span {
        display: inline-block;
        vertical-align: middle
    }

    .add_regioncode .turn_area {
        display: block
    }

    @media screen and (-webkit-min-device-pixel-ratio: 0) {
        .login_user {
            display: -webkit-box;
            display: box
        }

        .turn_area, .country_list, .item_account {
            float: none
        }

        .item_account {
            -webkit-box-flex: 1;
            box-flex: 1
        }
    }

    .lgncode {
        padding-bottom: 14px
    }

    .btns_bg {
        padding-top: 10px;
        padding-bottom: 15px
    }

    .btnadpt {
        width: 100%;
        height: 50px;
        line-height: 50px;
        display: block;
        margin-bottom: 14px;
        text-align: center;
        font-size: 14px;
        color: #fff;
        cursor: pointer
    }

    .btn_orange {
        background-color: #ef5b00
    }

    .n_links_area a {
        padding: 0 9px;
        font-size: 14px
    }

    .n_links_area a:hover {
        color: #ff6700
    }

    .site_info {
        padding-top: 10px
    }

    .country-container {
        width: 100%;
        background: #fff;
        border: 1px solid #e8e8e8;
        position: absolute;
        left: 0;
        top: 61px;
        z-index: 98;
        display: none
    }

    .n-footer {
        height: 80px;
        margin-top: -80px;
        text-align: center
    }

    .nf-link-area {
        text-align: center
    }

    .nf-link-area li {
        display: inline-block;
        *display: inline;
        *zoom: 1
    }

    .nf-link-area a {
        display: inline-block;
        *display: inline;
        *zoom: 1;
        padding: 0 10px;
        color: #757575
    }

    .nf-link-area a:hover, .nf-link-area a.current {
        color: #333
    }

    .faq_link a {
        padding: 0 10px
    }

    .na-img-area {
        width: 80px;
        height: 80px;
        border: 2px solid #e3e3e3;
        border-radius: 50%;
        padding: 4px;
        background: #fff;
        position: relative;
        z-index: 4;
        margin: 0 auto
    }

    .na-img-bg-area {
        width: 100%;
        height: 100%;
        border-radius: 50%;
        overflow: hidden
    }

    .na-img-bg-area:empty {
        background: url(https://account.xiaomi.com/static/res/7c3e9b0/passport/acc-2014/img/n-avator-bg.png) 0 0 no-repeat
    }

    .na-img-area img {
        display: block;
        width: 100%;
        height: 100%;
        border-radius: 50%
    }

    .single_imgarea {
        text-align: center;
        line-height: 20px;
        font-size: 14px;
        color: #333
    }

    .single_imgarea .us_name {
        padding-top: 10px
    }

    .err_tip {
        margin-bottom: 5px;
        line-height: 20px;
        color: #f56700;
        display: none
    }

    .icon_error {
        background-position: 0 -69px
    }

    .icon_error {
        width: 14px;
        height: 14px;
        margin: -1px 5px 0 0;
        overflow: hidden;
        display: inline-block;
        vertical-align: middle
    }

    .err_tip span {
        vertical-align: middle
    }

    .err_forbidden {
        padding: 10px;
        border: 1px solid #e0e0e0;
        line-height: 1.5;
        background: #f5f5f5;
        color: #ff6700;
        display: none
    }

    @media only screen and (max-width: 850px) {
        .layout {
            width: 100%;
            min-width: 400px;
            min-height: 480px
        }

        .mainbox {
            padding-bottom: 15px
        }

        .header_tit {
            padding: 25px 0 0
        }

        .header_tit_txt {
            font-size: 22px;
            padding-top: 15px
        }

        .btns_bg {
            padding-bottom: 10px;
            padding-top: 10px
        }
    }

    @-webkit-keyframes fade-in {
        from {
            left: -100%
        }
        to {
            left: 0
        }
    }

    @-moz-keyframes fade-in {
        from {
            left: -100%
        }
        to {
            left: 0
        }
    }

    @-o-keyframes fade-in {
        from {
            left: -100%
        }
        to {
            left: 0
        }
    }

    @keyframes fade-in {
        from {
            left: -100%
        }
        to {
            left: 0
        }
    }

    .security_Controller {
        display: block;
    }

    .checkbox_area {
        cursor: pointer
    }

    .checkbox {
        vertical-align: text-top;
        margin-right: 3px
    }

    .security_controller_panel h4 {
        color: #a1a1a1;
        padding-bottom: 30px
    }

    .security_controller_panel p {
        color: #333
    }

    .tabs_con {
        display: none
    }

    .tabs_con.now {
        display: block
    }

    .bgiframe {
        display: none
    }

    .win_banner_mistore .n-footer {
        background: #fff;
        margin-top: 100px;
        position: relative
    }

    .win_banner_mistore .wrapper {
        display: block;
        min-height: auto
    }

    .win_banner_mistore .wrap {
        padding-bottom: 0;
        position: relative;
        padding-top: 0 \9
    }

    @media screen and (min-width: 0\0
    ) {
        .win_banner_mistore .wrap {
            padding-top: 0
        }
    }

    .win_banner_mistore .layout {
        width: 400px;
        min-height: 524px;
        margin-bottom: 0;
        margin-right: 0;
        font-size: 14px
    }

    .win_banner_mistore .mainbox {
        padding-bottom: 0
    }

    .win_banner_mistore .err_tip {
        color: #f56600
    }

    .win_banner_mistore .login_area {
        width: 338px;
        padding-bottom: 0
    }

    .win_banner_mistore .labelbox input {
        width: 306px
    }

    .win_banner_mistore .btnadpt {
        font-size: 18px
    }

    .win_banner_mistore .btn_orange {
        background-color: #f56600
    }

    .win_banner_mistore .lgncode {
        padding-bottom: 0;
        margin-bottom: 14px
    }

    .win_banner_mistore .bgiframe {
        width: 100%;
        height: 100%;
        position: absolute;
        display: block
    }

    .win_banner_mistore .btns_bg {
        padding-bottom: 3px
    }

    .win_banner_mistore .n_links_area a {
        padding: 0 9px 0 6px;
        color: #999
    }

    .win_banner_mistore .n_links_area a:hover {
        color: #f56600
    }

    .win_banner_mistore .err_forbidden {
        margin-bottom: 10px
    }

    .win_banner_mistore .add_regioncode .item_account {
        width: 212px
    }

    .win_banner_mistore .nav_tabs a {
        color: #666
    }

    .win_banner_mistore .nav_tabs a:hover, .win_banner_mistore .nav_tabs a.now {
        color: #f56600
    }

    .win_banner_mistore .custom_sub_txt span {
        padding: 0 5px;
        color: #ff6700
    }
</style>
<script>
</script>
</body>
</html>