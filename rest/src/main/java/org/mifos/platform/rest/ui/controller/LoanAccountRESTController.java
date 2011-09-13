/*
 * Copyright (c) 2005-2011 Grameen Foundation USA
 * All rights reserved.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or
 * implied. See the License for the specific language governing
 * permissions and limitations under the License.
 *
 * See also http://www.apache.org/licenses/LICENSE-2.0.html for an
 * explanation of the license and how it is applied.
 */
package org.mifos.platform.rest.ui.controller;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.joda.time.LocalDate;
import org.mifos.accounts.api.AccountService;
import org.mifos.accounts.loan.persistance.LoanDao;
import org.mifos.dto.domain.AccountPaymentParametersDto;
import org.mifos.dto.domain.AccountReferenceDto;
import org.mifos.dto.domain.PaymentTypeDto;
import org.mifos.dto.domain.UserReferenceDto;
import org.mifos.security.MifosUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class LoanAccountRESTController {

    @Autowired
    private AccountService accountService;

    @Autowired
    private LoanDao loanDao;

    @RequestMapping(value = "/account/loan/repay/num-{globalAccountNum}", method = RequestMethod.POST)
    public final @ResponseBody
    Map<String, String> repay(@PathVariable String globalAccountNum, HttpServletRequest request) throws Exception {

        String amountString = request.getParameter("amount");
        BigDecimal amount = new BigDecimal(amountString);

        MifosUser user = (MifosUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        UserReferenceDto userDto = new UserReferenceDto((short) user.getUserId());
        Integer accountId = loanDao.findByGlobalAccountNum(globalAccountNum).getAccountId();
        AccountReferenceDto accountDto = new AccountReferenceDto(accountId);

        PaymentTypeDto paymentType = accountService.getLoanPaymentTypes().get(0);

        LocalDate now = new LocalDate();
        AccountPaymentParametersDto payment = new AccountPaymentParametersDto(userDto, accountDto, amount, now,
                paymentType, globalAccountNum);

        accountService.makePayment(payment);

        Map<String, String> map = new HashMap<String, String>();
        map.put("status", "success");

        return map;
    }
}
