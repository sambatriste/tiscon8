package com.tiscon.dto;

import com.tiscon.domain.Customer;

public record UserOrderDto(

    String customerName,
    String tel,
    String email,
    String oldPrefectureId,
    String oldAddress,
    String newPrefectureId,
    String newAddress,
    int box,
    int bed,
    int bicycle,
    int washingMachine,
    boolean washingMachineInstallation) {

    public Customer toCustomer() {
        Customer c = new Customer();
        c.setCustomerName(customerName);
        c.setTel(tel);
        c.setEmail(email);
        c.setOldPrefectureId(oldPrefectureId);
        c.setOldAddress(oldAddress);
        c.setNewPrefectureId(newPrefectureId);
        c.setNewAddress(newAddress);
        return c;
    }
}
