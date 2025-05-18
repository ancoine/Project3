package com.javaweb.api.admin;

import com.javaweb.exception.ServiceException;
import com.javaweb.model.dto.BuildingDTO;
import com.javaweb.model.response.ResponseDTO;
import com.javaweb.model.response.StaffResponseDTO;
import com.javaweb.service.IBuildingService;
import com.javaweb.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

@RestController()
@RequestMapping("/api/buildings")
public class BuildingAPI {
    @Autowired
    public IBuildingService buildingService;
    @Autowired
    public IUserService userService;
    @PostMapping()
    public ResponseDTO createBuilding(@RequestBody BuildingDTO dto) {
        //
        if (dto.getName() == null || dto.getName().trim().isEmpty()) {
            throw new ServiceException("Tên tòa nhà không được để trống");
        }
        // xuonsg sevrice xu ly
        buildingService.createOrUpdateBuilding(dto);
        ResponseDTO responseDTO = new ResponseDTO();
        if (dto.getId() == null) {
            responseDTO.setMessage("<ĐÃ THÊM>");
        } else {
            responseDTO.setMessage("ĐÃ CẬP NHẬT");
        }

        return responseDTO;
    }

    // xóa
    @DeleteMapping()
    public ResponseEntity<ResponseDTO> deleteBuilding(@RequestBody List<Long> ids) {
        ResponseDTO responseDTO = new ResponseDTO();

        if (ids == null || ids.isEmpty()) {
            throw new ServiceException("Danh sách ID không được để trống.");
        }

        buildingService.deleteBuilding(ids);
        responseDTO.setMessage("Xóa tòa nhà thành công.");
        return ResponseEntity.ok(responseDTO);
    }

    // load giao
    @GetMapping("/{buildingId}/staffs")
    public  ResponseEntity<ResponseDTO> getBuildingStaffs(@PathVariable Long buildingId) {
        if (buildingId == null || buildingId <= 0) {
            throw new ServiceException("ID tòa nhà không hợp lệ");
        }
        List<StaffResponseDTO> staffResponseDTOS = userService.findStaffByBuildingId(buildingId);
         ResponseDTO responseDTO = new ResponseDTO();
         responseDTO.setData(staffResponseDTOS);
         responseDTO.setMessage("Staff Load thành công");
         return ResponseEntity.ok(responseDTO);
    }
}
