<!DOCTYPE html>
<html lang="ja" xmlns:th="http://www.thymeleaf.org">

<head>
  <title>ご入力内容の確認</title>
  <#include "common/css.ftl">
</head>

<body>
<#include "header.html">
<div class="container">
  <form action="/result" class="form-horizontal" method="post">
    <div class="progress-icon">
      <img src="/img/progress_confirm.svg" />
    </div>
    <div class="page-title">ご入力内容の確認</div>
    <div class="text-center">
      <div class="warning">
        まだお見積りは完了していません。
      </div>
      入力内容をご確認ください。<br/>
      この内容でお見積りする場合は、「概算お見積もりをする」ボタンを押してください。
    </div>
    <#if errors?has_content >
      <ul>
        <#list errors as err >
          <li>${err.defaultMessage}</li>
        </#list>
      </ul>
    </#if>
    <div class="col-sm-12">
      <div class="sub-title">お客様情報</div>
      <table class="table table-bordered">
        <col span="1" style="background-color: #FFFFFF;">
        <col span="2" style="background-color: #FFFFFF;">
        <tbody>
        <tr>
          <th style="width: 40%">氏名</th>
          <td>
            <span>${userOrderForm.customerName}</span>
          </td>
          <input type="hidden" name="customerName" value="${userOrderForm.customerName}"/>
        </tr>
        <tr>
          <th>連絡先TEL</th>
          <td><span>${userOrderForm.tel}</span></td>
          <input type="hidden" name="tel" value="${userOrderForm.tel}"/>
        </tr>
        <tr>
          <th>連絡先メールアドレス</th>
          <td><span>${userOrderForm.email}</span></td>
          <input type="hidden" name="email" value="${userOrderForm.email}"/>
        </tr>
      </tbody>
      </table>
    </div>
    <div class="col-sm-12">
      <div class="sub-title">集荷元・お届け先</div>
      <table class="table table-bordered">
        <col span="1" style="background-color: #FFFFFF;">
        <col span="2" style="background-color: #FFFFFF;">
        <tbody>
        <tr>
          <th style="width: 40%">集荷元住所（都道府県）</th>
          <td>
            <span>${oldPrefectureName}</span>
          </td>
          <input type="hidden" name="oldPrefectureId" value="${userOrderForm.oldPrefectureId}"/>
        </tr>
        <tr>
          <th>集荷元住所（市区町村以下）</th>
          <td><span>${userOrderForm.oldAddress}</span></td>
          <input type="hidden" name="oldAddress" value="${userOrderForm.oldAddress}"/>
        </tr>
        <tr>
          <th>お届け先住所（都道府県）</th>
          <td>
            <span>${newPrefectureName}</span>
          </td>
          <input type="hidden" name="newPrefectureId" value="${userOrderForm.newPrefectureId}"/>
        </tr>
        <tr>
          <th>お届け先住所（市区町村以下）</th>
          <td><span>${userOrderForm.newAddress}</span></td>
          <input type="hidden" name="newAddress" value="${userOrderForm.newAddress}"/>
        </tr>
        </tbody>
      </table>
    </div>

    <div class="col-sm-12">
      <div class="sub-title">お荷物情報</div>
        <table class="table table-bordered">
          <col span="1" style="background-color: #FFFFFF;">
          <col span="2" style="background-color: #FFFFFF;">
          <tbody>
          <tr>
            <th style="width: 40%">段ボールの個数</th>
            <td><span>${userOrderForm.box}</span></td>
            <input type="hidden" name="box" value="${userOrderForm.box}"/>
          </tr>
          <tr>
            <th>ベッドの個数</th>
            <td><span>${userOrderForm.bed}</span></td>
            <input type="hidden" name="bed" value="${userOrderForm.bed}"/>
          </tr>
          <tr>
            <th>自転車の個数</th>
            <td><span>${userOrderForm.bicycle}</span></td>
            <input type="hidden" name="bicycle" value="${userOrderForm.bicycle}"/>
          </tr>
          <tr>
            <th>洗濯機の個数</th>
            <td><span>${userOrderForm.washingMachine}</span></td>
            <input type="hidden" name="washingMachine" value="${userOrderForm.washingMachine}"/>
          </tr>
          <tr>
            <th>洗濯機の設置工事申し込み</th>
            <td><span>${userOrderForm.washingMachineInstallation?then('あり','なし')}</span></td>
            <input type="hidden" name="washingMachineInstallation" value="${userOrderForm.washingMachineInstallation?then('true','false')}"/>
          </tr>
          </tbody>
        </table>
        <div class="form-group">
          <div class="text-center">
            <button type="submit" name="backToInput" class="btn-back">入力画面へ戻る</button>
            <button type="submit" name="calculation" class="btn btn-primary">概算お見積もりをする</button>
          </div>
        </div>
      </div>
    </div>

  </form>
</div>
<#include "common/scripts.ftl">

</body>

</html>
