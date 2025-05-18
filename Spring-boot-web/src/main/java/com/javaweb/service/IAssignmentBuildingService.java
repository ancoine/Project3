package com.javaweb.service;

import com.javaweb.exception.ServiceException;
import com.javaweb.model.dto.AssignmentBuildingDTO;

public interface IAssignmentBuildingService {
    void changerAssaignmentBuilding(AssignmentBuildingDTO assignmentBuildingDTO) throws ServiceException;
}
