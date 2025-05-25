package com.javaweb.service.impl;

import com.javaweb.entity.AssignmentBuildingEntity;
import com.javaweb.entity.BuildingEntity;
import com.javaweb.entity.UserEntity;
import com.javaweb.exception.ServiceException;
import com.javaweb.model.dto.AssignmentBuildingDTO;
import com.javaweb.repository.AssignmentBuildingRepository;
import com.javaweb.repository.BuildingRepository;
import com.javaweb.repository.UserRepository;
import com.javaweb.service.IAssignmentBuildingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.List;
@Service
@Transactional
public class AssignmentBuildingImpl implements IAssignmentBuildingService {
    @Autowired
    private BuildingRepository buildingRepository;

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private AssignmentBuildingRepository assignmentBuildingRepository;

    @Override

    public void changerAssaignmentBuilding(AssignmentBuildingDTO assignmentBuildingDTO) {
                        BuildingEntity buildingEntity = buildingRepository.findById(assignmentBuildingDTO.getBuildingId()).get();
                if(buildingEntity == null){
                    throw new SecurityException("Khong co tòa nhà");


                }
                List<UserEntity> newStaffAssignmentBuilding = userRepository.findByIdIn(assignmentBuildingDTO.getStaffs());
//                assignmentBuildingRepository.deleteByBuildingEntity(buildingEntity);
//
//                for(UserEntity userEntity : newStaffAssignmentBuilding){
//                    AssignmentBuildingEntity assignmentBuildingEntity = new AssignmentBuildingEntity();
//                    assignmentBuildingEntity.setBuildingEntity(buildingEntity);
//                    assignmentBuildingEntity.setStaff(userEntity);
//                    assignmentBuildingRepository.save(assignmentBuildingEntity);
//                }
                  buildingEntity.setStaffs(newStaffAssignmentBuilding);
                  buildingRepository.save(buildingEntity);

    }
}
