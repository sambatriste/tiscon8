<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org">
<head>
  <meta charset="UTF-8">
  <title>Top画面</title>
  <#include "common/css.ftl">
</head>
<body>
  <#include "header.html">
    <div class="jumbotron">
      <div class="company-name">tiscon moving company</div>
      <div class="bland-message">未来の景色に鮮やかな彩りを</div>
    </div>
    <div>
      <div class="page-title">3ステップで簡単料金シミュレーション</div>
      <div class="text-center">
        <div class="box-text">お見積り情報<br/>入力</div>
        <div class="box-text">ご入力内容の<br/>確認</div>
        <div class="box-text">お見積もり<br/>概算料金を算出</div>
      </div>
    </div>
    <div class="text-center">
      <a class="btn btn-primary" href="/input" role="button">簡単無料見積もりをする</a>
    </div>
  <#include "common/scripts.ftl">
</body>
</html>