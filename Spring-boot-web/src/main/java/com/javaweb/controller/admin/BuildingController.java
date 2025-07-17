package com.javaweb.controller.admin;



import com.javaweb.constant.SystemConstant;
import com.javaweb.enums.buildingType;
import com.javaweb.enums.districtCode;
import com.javaweb.exception.ServiceException;
import com.javaweb.model.dto.BuildingDTO;
import com.javaweb.model.request.BuildingSearchRequest;
import com.javaweb.model.response.BuildingSearchResponse;
import com.javaweb.model.response.StaffResponseDTO;
import com.javaweb.service.IBuildingService;
import com.javaweb.service.IUserService;
import com.javaweb.utils.DisplayTagUtils;
import com.javaweb.utils.MessageUtils;
import javassist.NotFoundException;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.javaweb.utils.MessageUtils;
@Controller(value="buildingControllerOfAdmin")
public class BuildingController {
  @Autowired
  private IUserService userService;
  @Autowired
  private IBuildingService buildingService;
    @Autowired
    private MessageUtils messageUtil;
    @GetMapping("/admin/building-list")
    public ModelAndView getAllBuilding(@ModelAttribute BuildingSearchRequest buildingSearchRequest , HttpServletRequest request) {
        ModelAndView modelAndView = new ModelAndView("admin/building/list");
        modelAndView.addObject("modelSearch",buildingSearchRequest);
        modelAndView.addObject("staffs",userService.getStaff());
        modelAndView.addObject("district", districtCode.getDistrict());
        modelAndView.addObject("typeCode", buildingType.getType());
        DisplayTagUtils.of(request,buildingSearchRequest);
        // project 2
        List<BuildingSearchResponse> buildingSearchResponses = buildingService.findAll(buildingSearchRequest,
                PageRequest.of(buildingSearchRequest.getPage() - 1, buildingSearchRequest.getMaxPageItems()));
        buildingSearchRequest.setListResult(buildingSearchResponses);
        buildingSearchRequest.setTotalItem(buildingService.countTotalItem(buildingSearchRequest));
        modelAndView.addObject(SystemConstant.MODEL,buildingSearchRequest);
        initMessageResponse(modelAndView, request);
        return modelAndView;
    }
    @GetMapping("/admin/building-edit")
    public ModelAndView createBuilding(@ModelAttribute BuildingDTO buildingDTO) throws ServiceException {
        ModelAndView modelAndView = new ModelAndView("admin/building/edit");
        modelAndView.addObject("buildingEdit",buildingDTO);
        modelAndView.addObject("district", districtCode.getDistrict());
        modelAndView.addObject("typeCode", buildingType.getType());
        return modelAndView;
    }

    @GetMapping("/admin/building-edit-{id}")
    public ModelAndView updateBuilding(@PathVariable Long id) throws NotFoundException {
        ModelAndView modelAndView = new ModelAndView("admin/building/edit");
        // find by id dưới serice và conver dto
        //set
        BuildingDTO buildingDTO = new BuildingDTO();
            buildingDTO = buildingService.findById(id);

        modelAndView.addObject("buildingEdit",buildingDTO);
        modelAndView.addObject("district", districtCode.getDistrict());
        modelAndView.addObject("typeCode", buildingType.getType());
        return modelAndView;
    }
    private void initMessageResponse(ModelAndView mav, HttpServletRequest request) {
        String message = request.getParameter("message");
        if (message != null && StringUtils.isNotEmpty(message)) {
            Map<String, String> messageMap = messageUtil.getMessage(message);
            mav.addObject(SystemConstant.ALERT, messageMap.get(SystemConstant.ALERT));
            mav.addObject(SystemConstant.MESSAGE_RESPONSE, messageMap.get(SystemConstant.MESSAGE_RESPONSE));
        }
    }

}
