package com.javaweb.service;

import com.javaweb.exception.ServiceException;
import com.javaweb.model.dto.AssignmentBuildingDTO;
import com.javaweb.model.dto.BuildingDTO;
import com.javaweb.model.request.BuildingSearchRequest;
import com.javaweb.model.response.BuildingSearchResponse;
import org.springframework.data.domain.Pageable;


import java.util.List;

public interface IBuildingService {
    List<BuildingSearchResponse> findAll(BuildingSearchRequest buildingSearchRequest, Pageable pageable) throws ServiceException;
    BuildingDTO createOrUpdateBuilding(BuildingDTO buildingDTO);
    void deleteBuilding(List<Long> ids);
     BuildingDTO findById(Long id);
    int countTotalItem(BuildingSearchRequest buildingSearchRequest);
}
