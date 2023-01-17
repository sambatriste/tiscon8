<!DOCTYPE html>
<html lang="ja">

<head>
  <title>お見積り情報入力</title>
  <#include "common/css.ftl">
</head>

<body>
<#include "header.html">
<div class="container">
  <form action="/submit" class="form-horizontal" method="post">
    <div class="progress-icon">
      <img src="/img/progress_input.svg" />
    </div>
    <div class="page-title">
      お見積り情報入力
    </div>

    <div class="col-sm-12">
      <fieldset>
        <div class="sub-title">お客様情報</div>
        <div class="form-group">
          <label>氏名
            <input type="text" name="customerName" value="${userOrderForm.customerName}" />
          </label>
        </div>
        <div class="form-group">
          <label>連絡先TEL
            <input type="tel" name="tel" value="${userOrderForm.tel}" />
          </label>
        </div>
        <div class="form-group">
          <label>連絡先メールアドレス
            <input type="text" name="email" value="${userOrderForm.email}"/>
          </label>
        </div>
        <div class="sub-title">集荷元・お届け先</div>
        <div class="form-group">
          <label>集荷元住所（都道府県）
          <select name="oldPrefectureId">
            <#list prefectures as prefecture>
            <option value="${prefecture.prefectureId}">${prefecture.prefectureName}</option>
            </#list>
          </select>
          </label>
        </div>
        <div class="form-group">
          <label >集荷元住所（市区町村以下）
            <input type="text" name="oldAddress" value="${userOrderForm.oldAddress}"/>
          </label>
        </div>
        <div class="form-group">
          <label>お届け先住所（都道府県）
          <select id="newPrefectureId" name="newPrefectureId">
            <#list prefectures as prefecture>
            <option value="${prefecture.prefectureId}">${prefecture.prefectureName}</option>
            </#list>
          </select>
          </label>
        </div>
        <div class="form-group">
          <label>お届け先住所（市区町村以下）
            <input type="text" name="newAddress" value="${userOrderForm.newAddress}"/>
          </label>
        </div>
      </fieldset>
      <fieldset>
      <div class="sub-title">お荷物情報</div>
        <div class="form-group">
          <label>段ボールの個数
            <input type="text" name="box" value="${userOrderForm.box}"/>
          </label>
        </div>
        <div class="form-group">
          <label>ベッドの個数
            <input type="text" name="bed" value="${userOrderForm.bed}"/>
          </label>
        </div>
        <div class="form-group">
          <label>自転車の個数
            <input type="text" name="bicycle" value="${userOrderForm.bicycle}"/>
          </label>
        </div>
        <div class="form-group">
          <label>洗濯機の個数
          <input type="text" name="washingMachine" value="${userOrderForm.washingMachine}"/>
          </label>
        </div>
        <div class="form-group">
          <label>洗濯機の設置工事申し込み
          <select name="washingMachineInstallation">
            <option value="false" selected=${userOrderForm.washingMachineInstallation?then('false','true')}>なし</option>
            <option value="true" selected=${userOrderForm.washingMachineInstallation?then('true','false')}>あり</option>
          </select>
          </label>
        </div>
      </fieldset>
      <div class="form-group">
        <div class="text-center">
          <a class="btn-back" href="/" role="button">TOPへ戻る</a>
          <button type="submit" name="confirm" class="btn btn-primary">ご入力内容の確認へ</button>
        </div>
      </div>
    </div>
  </form>
</div>
<#include "common/scripts.ftl">
</body>

</html>
