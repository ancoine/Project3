package com.javaweb.controller.admin;



import com.javaweb.enums.buildingType;
import com.javaweb.enums.districtCode;
import com.javaweb.exception.ServiceException;
import com.javaweb.model.dto.BuildingDTO;
import com.javaweb.model.request.BuildingSearchRequest;
import com.javaweb.model.response.BuildingSearchResponse;
import com.javaweb.model.response.StaffResponseDTO;
import com.javaweb.service.IBuildingService;
import com.javaweb.service.IUserService;
import javassist.NotFoundException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.List;

@Controller(value="buildingControllerOfAdmin")
public class BuildingController {
  @Autowired
  private IUserService userService;
  @Autowired
  private IBuildingService buildingService;
    @GetMapping("/admin/building-list")
    public ModelAndView getAllBuilding(@ModelAttribute BuildingSearchRequest params, Model model) {
        ModelAndView modelAndView = new ModelAndView("admin/building/list");
        modelAndView.addObject("modelSearch",params);
        modelAndView.addObject("staffs",userService.getStaff());
        modelAndView.addObject("district", districtCode.getDistrict());
        modelAndView.addObject("typeCode", buildingType.getType());
        // project 2
        List<BuildingSearchResponse> buildingSearchResponses = buildingService.findAll(params);
        modelAndView.addObject("buildings", buildingSearchResponses);
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

}
