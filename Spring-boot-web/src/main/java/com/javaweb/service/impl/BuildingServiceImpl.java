package com.javaweb.service.impl;

import com.javaweb.builder.BuildingSearchBuilder;
import com.javaweb.converter.BuildingConverter;
import com.javaweb.converter.BuildingSearchBuilderConverter;
import com.javaweb.entity.BuildingEntity;
import com.javaweb.entity.RentAreaEntity;
import com.javaweb.exception.ServiceException;
import com.javaweb.utils.UploadFileUtils;
import com.javaweb.entity.AssignmentBuildingEntity;
import com.javaweb.entity.UserEntity;
import com.javaweb.model.dto.AssignmentBuildingDTO;
import com.javaweb.model.dto.BuildingDTO;
import com.javaweb.model.request.BuildingSearchRequest;
import com.javaweb.model.response.BuildingSearchResponse;
import com.javaweb.model.response.ResponseDTO;
import com.javaweb.repository.AssignmentBuildingRepository;
import com.javaweb.repository.BuildingRepository;
import com.javaweb.repository.RentAreaRepository;
import com.javaweb.repository.UserRepository;
import com.javaweb.service.IBuildingService;
import org.apache.catalina.User;
import org.apache.tomcat.util.codec.binary.Base64;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.io.File;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import java.util.stream.Collectors;

@Service
@Transactional
public class BuildingServiceImpl implements IBuildingService {
    @Autowired
    private BuildingRepository buildingRepository;
    @Autowired
    private BuildingConverter buildingConverter;
    @Autowired
    private BuildingSearchBuilderConverter builderConverter;
    @Autowired
    private AssignmentBuildingRepository assignmentBuildingRepository;
    @Autowired
    private RentAreaRepository rentAreaRepository;
    @Autowired
    private UploadFileUtils uploadFileUtils;


    @Override
    public List<BuildingSearchResponse> findAll(BuildingSearchRequest buildingSearchRequest, Pageable pageable) {
        BuildingSearchBuilder buildingSearchBuilder = builderConverter.toBuildingSearchBuilder(buildingSearchRequest);
        List<BuildingEntity> buildingEntities = buildingRepository.findAll(buildingSearchBuilder, pageable);

        List<BuildingSearchResponse> result = new ArrayList<>();
        for (BuildingEntity it : buildingEntities) {
            BuildingSearchResponse buildingSearchResponse = buildingConverter.toBuildingSearchResponseDTO(it);
            result.add(buildingSearchResponse);
        }
        return result;
    }


    @Override
    public BuildingDTO createOrUpdateBuilding(BuildingDTO buildingDTO) {
        BuildingEntity buildingEntity = buildingConverter.toBuildingEntity(buildingDTO);
        saveThumbnail(buildingDTO,buildingEntity);
        List<RentAreaEntity> rentAreaEntities = new ArrayList<>();
        if (buildingDTO.getRentArea() != null && !buildingDTO.getRentArea().trim().isEmpty()) {
            List<String> rentAreaValues = Arrays.stream(buildingDTO.getRentArea()
                            .trim()
                            .split("\\s*,\\s*")) // tách theo dấu phẩy, có thể có khoảng trắng 2 bên
                    .collect(Collectors.toList());
            for (String rentAreaValue : rentAreaValues) {
                RentAreaEntity rentAreaEntity = new RentAreaEntity();
                rentAreaEntity.setBuildingEntity(buildingEntity);
                rentAreaEntity.setValue(Long.parseLong(rentAreaValue));
                rentAreaEntities.add(rentAreaEntity);
            }
            buildingEntity.setRentAreas(rentAreaEntities);
            buildingRepository.save(buildingEntity);
        }
        return buildingConverter.toBuildingDTO(buildingEntity);
    }


    @Override
    public void deleteBuilding(List<Long> ids) {
       buildingRepository.deleteByIdIn(ids);
    }

    @Override
    public BuildingDTO findById(Long id) {
        BuildingEntity buildingEntity = buildingRepository.findById(id).get();
        if(buildingEntity == null){
            // lỗi
        }
        BuildingDTO buildingDTO = buildingConverter.toBuildingDTO(buildingEntity);
        buildingDTO.setRentArea(buildingEntity.getRentAreas().stream().map(i ->Long.toString(i.getValue())).collect(Collectors.joining(",")));
        return buildingDTO;
    }

    @Override
    public int countTotalItem() {
        return buildingRepository.countTotalItem();
    }

    private void saveThumbnail(BuildingDTO buildingDTO, BuildingEntity buildingEntity) {
        String path = "/building/" + buildingDTO.getImageName();
        if (null != buildingDTO.getImageBase64()) {
            if (null != buildingEntity.getImage()) {
                if (!path.equals(buildingEntity.getImage())) {
                    File file = new File("C:\\home\\office" + buildingEntity.getImage());
                    file.delete();
                }
            }
            byte[] bytes = Base64.decodeBase64(buildingDTO.getImageBase64().getBytes());
            uploadFileUtils.writeOrUpdate(path, bytes);
            buildingEntity.setImage(path);
        }
    }


}
