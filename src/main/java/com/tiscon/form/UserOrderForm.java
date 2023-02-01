package com.tiscon.form;

import com.tiscon.dto.UserOrderDto;
import com.tiscon.validator.Numeric;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

import static java.lang.Integer.parseInt;

/**
 * 顧客が入力する見積もり情報を保持するクラス。
 *
 * @author Oikawa Yumi
 */
public record UserOrderForm(

    @NotBlank
    String customerName,

    @NotBlank
    @Numeric
    String tel,

    @Email
    @NotBlank
    String email,

    @NotBlank
    String oldPrefectureId,

    @NotBlank
    String oldAddress,

    @NotBlank
    String newPrefectureId,

    @NotBlank
    String newAddress,

    @Numeric
    @NotBlank
    String box,

    @Numeric
    @NotBlank
    String bed,

    @Numeric
    @NotBlank
    String bicycle,

    @Numeric
    @NotBlank
    String washingMachine,

    @NotNull
    boolean washingMachineInstallation) {

    public UserOrderDto toUserOrderDto() {
        return new UserOrderDto(customerName, tel, email,
            oldPrefectureId, oldAddress, newPrefectureId, newAddress,
            parseInt(box), parseInt(bed), parseInt(bicycle), parseInt(washingMachine),
            washingMachineInstallation);
    }
}
