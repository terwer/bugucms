package com.terwergreen.front.account.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.terwergreen.framework.core.bg.controller.BGBaseController;
import com.terwergreen.front.common.dto.RestResponseDTO;
import com.terwergreen.front.common.util.RestResponseStates;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
//import org.springframework.web.portlet.ModelAndView;
import org.springframework.web.servlet.ModelAndView;

/**
 * Created by terwergreen on 2017-11-30.
 */
@Controller
public class AccountController extends BGBaseController {

    @RequestMapping(value = "/account/accountInfo", method = RequestMethod.GET)
    public ModelAndView accountInfo(HttpServletRequest request) {
        // Map<String, String> resultMap = new HashMap<String, String>();
        // resultMap.put("flag", RestResponseStates.SUCCESS.getValue());
        // resultMap.put("msg", RestResponseStates.SUCCESS.getMsg());
        // return super.processResultAll(resultMap);
        return new ModelAndView("accountInfo");
    }

    @RequestMapping(value = "/account/activate", method = RequestMethod.GET)
    @ResponseBody
    public RestResponseDTO activate(HttpServletRequest request) {
        RestResponseDTO restResponseDTO = new RestResponseDTO();

        Map<String, String> resultMap = new HashMap<String, String>();
        resultMap.put("accountId", "F10001");
        resultMap.put("mobile", "18888888888");
        restResponseDTO.setData(resultMap);

        restResponseDTO.setFlag(RestResponseStates.SUCCESS.getValue());
        restResponseDTO.setMsg(RestResponseStates.SUCCESS.getMsg());
        return restResponseDTO;
    }
}