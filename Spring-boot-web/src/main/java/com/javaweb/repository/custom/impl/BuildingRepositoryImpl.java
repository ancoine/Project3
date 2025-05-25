package com.javaweb.repository.custom.impl;

import com.javaweb.builder.BuildingSearchBuilder;
import com.javaweb.entity.BuildingEntity;
import com.javaweb.repository.custom.BuildingRepositoryCustom;
import com.javaweb.utils.NumberUtil;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import org.springframework.data.domain.Pageable;
import java.lang.reflect.Field;
import java.util.Collections;
import java.util.List;
import java.util.stream.Collectors;

@Repository
public  class BuildingRepositoryImpl implements BuildingRepositoryCustom {
    @PersistenceContext
    private EntityManager entityManager;
     String countTotalItem;
    private void sqlJoin(BuildingSearchBuilder buildingSearchBuilder, StringBuilder join) {

        if (buildingSearchBuilder.getStaffId() != null) {
            join.append(" JOIN assignmentbuilding asb ON asb.buildingid = b.id ");
        }

        if (buildingSearchBuilder.getRentAreaFrom() != null || buildingSearchBuilder.getRentAreaTo() != null) {
            join.append(" JOIN rentarea  ON rentarea.buildingid = b.id ");
        }


    }

    private void sqlWhereNomal(BuildingSearchBuilder buildingSearchBuilder, StringBuilder where) {
        try {
            Field[] fields = BuildingSearchBuilder.class.getDeclaredFields();
            for (Field it : fields) {
                it.setAccessible(true);
                String key = it.getName();
                if (!key.equals("staffId") && !key.equals("typeCode") && !key.startsWith("rentArea")
                        && !key.startsWith("rentPrice")) {
                    Object value = it.get(buildingSearchBuilder);
                    if (value != null && !value.toString().trim().isEmpty()) {
                        if (NumberUtil.checkNumber(value.toString())) {
                            where.append(" AND b." + key + " = " + value.toString());
                        } else {
                            where.append(" AND b." + key + " LIKE '%" + value.toString().trim() + "%'");
                        }
                    }
                }
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }
        private void sqlWhereSpecial (BuildingSearchBuilder buildingSearchBuilder, StringBuilder where){
            Long staffId = buildingSearchBuilder.getStaffId();
            if (buildingSearchBuilder.getStaffId() != null) {
                where.append(" AND asb.staffid = " + staffId);
            }
            Long rentAreaFrom = buildingSearchBuilder.getRentAreaFrom();
            Long rentAreaTo = buildingSearchBuilder.getRentAreaTo();

            if (rentAreaFrom != null) {
                where.append(" AND rentarea.value >= " + rentAreaFrom);
            }
            if (rentAreaTo != null) {
                where.append(" AND rentarea.value <= " + rentAreaTo);
            }

            Long rentPriceTo = buildingSearchBuilder.getRentPriceTo();
            Long rentPriceFrom = buildingSearchBuilder.getRentPriceFrom();
            if (rentPriceFrom != null) {
                where.append(" AND b.rentprice >= " + rentPriceFrom);
            }
            if (rentPriceTo != null) {
                where.append(" AND b.rentprice <= " + rentPriceTo);
            }
            List<String> TypeCode = buildingSearchBuilder.getTypeCode();
            if (TypeCode != null && !TypeCode.isEmpty()) {
                where.append(" AND (");
                where.append(TypeCode.stream()
                        .map(i -> "b.type LIKE '%" + i + "%'")
                        .collect(Collectors.joining(" OR ")));
                where.append(")");
            }


    }

    @Override
    public List<BuildingEntity> findAll(BuildingSearchBuilder buildingSearchBuilder, Pageable pageable) {
        StringBuilder sql = new StringBuilder("SELECT DISTINCT b.* FROM building b ");
        sqlJoin(buildingSearchBuilder, sql);
        StringBuilder where = new StringBuilder(" WHERE 1=1 ");

        sqlWhereNomal(buildingSearchBuilder, where);
        sqlWhereSpecial(buildingSearchBuilder, where);
        sql.append(where).append(" ORDER BY b.createdDate DESC ");
        // toog so toa nha
        countTotalItem = sql.toString();
       sql.append(" LIMIT ").append(pageable.getPageSize()).append("\n")
                .append(" OFFSET ").append(pageable.getOffset());
        System.out.println("Final query: " + sql.toString());
        Query query = entityManager.createNativeQuery(sql.toString(), BuildingEntity.class);


        return query.getResultList();
    }
    @Override
    public int countTotalItem() {
        String sql = countTotalItem;
        Query query = entityManager.createNativeQuery(sql.toString());
        return query.getResultList().size();
    }


}

