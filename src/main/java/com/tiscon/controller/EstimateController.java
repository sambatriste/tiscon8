package com.tiscon.controller;

import com.tiscon.dao.EstimateDao;
import com.tiscon.domain.Prefectures;
import com.tiscon.dto.UserOrderDto;
import com.tiscon.form.UserOrderForm;
import com.tiscon.service.EstimateService;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

/**
 * 引越し見積もりのコントローラークラス。
 *
 * @author Oikawa Yumi
 */
@Controller
public class EstimateController {


    private final EstimateService estimateService;

    /**
     * コンストラクタ
     *
     * @param estimateDAO EstimateDaoクラス
     * @param estimateService EstimateServiceクラス
     */
    public EstimateController(EstimateDao estimateDAO, EstimateService estimateService) {
        this.estimateService = estimateService;
    }

    @GetMapping("")
    String index(Model model) {
        return "top";
    }

    /**
     * 入力画面に遷移する。
     *
     * @param model 遷移先に連携するデータ
     * @return 遷移先
     */
    @GetMapping("input")
    String input(Model model) {

        model.addAttribute("userOrderForm", emptyForm());
        model.addAttribute("prefectures", estimateService.getPrefectures());
        return "input";
    }

    /**
     * 確認画面に遷移する。
     *
     * @param userOrderForm 顧客が入力した見積もり依頼情報
     * @param model         遷移先に連携するデータ
     * @return 遷移先
     */
    @PostMapping(value = "submit", params = "confirm")
    String confirm(@ModelAttribute UserOrderForm userOrderForm, Model model) {
        Prefectures prefectures = estimateService.getPrefectures();
        model.addAttribute("prefectures", estimateService.getPrefectures());
        model.addAttribute("userOrderForm", userOrderForm);
        model.addAttribute("oldPrefectureName", prefectures.findPrefectureName(userOrderForm.oldPrefectureId()));
        model.addAttribute("newPrefectureName", prefectures.findPrefectureName(userOrderForm.newPrefectureId()));

        return "confirm";
    }

    /**
     * 入力画面に戻る。
     *
     * @param userOrderForm 顧客が入力した見積もり依頼情報
     * @param model         遷移先に連携するデータ
     * @return 遷移先
     */
    @PostMapping(value = "result", params = "backToInput")
    String backToInput(UserOrderForm userOrderForm, Model model) {
        model.addAttribute("prefectures", estimateService.getPrefectures());
        model.addAttribute("userOrderForm", userOrderForm);
        return "input";
    }

    /**
     * 確認画面に戻る。
     *
     * @param userOrderForm 顧客が入力した見積もり依頼情報
     * @param model         遷移先に連携するデータ
     * @return 遷移先
     */
    @PostMapping(value = "order", params = "backToConfirm")
    String backToConfirm(UserOrderForm userOrderForm, Model model) {
        model.addAttribute("prefectures", estimateService.getPrefectures());
        model.addAttribute("userOrderForm", userOrderForm);
        return "confirm";
    }

    /**
     * 概算見積もり画面に遷移する。
     *
     * @param userOrderForm 顧客が入力した見積もり依頼情報
     * @param result        精査結果
     * @param model         遷移先に連携するデータ
     * @return 遷移先
     */
    @PostMapping(value = "result", params = "calculation")
    String calculation(@Validated UserOrderForm userOrderForm, BindingResult result, Model model) {

        Prefectures prefectures = estimateService.getPrefectures();
        model.addAttribute("prefectures", prefectures);
        model.addAttribute("userOrderForm", userOrderForm);
        model.addAttribute("oldPrefectureName", prefectures.findPrefectureName(userOrderForm.oldPrefectureId()));
        model.addAttribute("newPrefectureName", prefectures.findPrefectureName(userOrderForm.newPrefectureId()));

        if (result.hasErrors()) {
            model.addAttribute("errors", result.getAllErrors());
            return "confirm";
        }

        // 料金の計算を行う。
        UserOrderDto dto = userOrderForm.toUserOrderDto();

        Integer price = estimateService.getPrice(dto);

        model.addAttribute("price", price);
        return "result";
    }

    /**
     * 申し込み完了画面に遷移する。
     *
     * @param userOrderForm 顧客が入力した見積もり依頼情報
     * @param result        精査結果
     * @param model         遷移先に連携するデータ
     * @return 遷移先
     */
    @PostMapping(value = "order", params = "complete")
    String complete(@Validated UserOrderForm userOrderForm, BindingResult result, Model model) {
        if (result.hasErrors()) {
            model.addAttribute("prefectures", estimateService.getPrefectures());
            model.addAttribute("userOrderForm", userOrderForm);
            return "confirm";
        }

        UserOrderDto dto = userOrderForm.toUserOrderDto();
        estimateService.registerOrder(dto);

        return "complete";
    }


    private static UserOrderForm emptyForm() {
        return new UserOrderForm("","", "", "", "", "", "", "", "", "","", false);
    }
}
