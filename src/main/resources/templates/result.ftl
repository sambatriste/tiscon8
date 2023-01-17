<!DOCTYPE html>
<html lang="ja" xmlns:th="http://www.thymeleaf.org">

<head>
  <title>概算お見積もり結果</title>
  <#include "common/css.ftl">
</head>

<body>
<#include "header.html">
<div class="container">
  <form action="/order" class="form-horizontal" method="post">
    <div class="progress-icon">
      <img src="/img/progress_result.svg" />
    </div>
    <div class="page-title">概算お見積り結果</div>
    <div class="col-sm-12">
      <div class="text-center">
        <div class="primary-text"><span>${price}</span>円</div>
        <button type="submit" name="complete" class="btn btn-primary">詳細見積もり依頼へ</button>
      </div>
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
          <button type="submit" name="backToConfirm" class="btn-back">TOPへ戻る</button>
        </div>
      </div>
    </div>
  </form>
</div>
<#include "common/scripts.ftl">

</body>

</html>
