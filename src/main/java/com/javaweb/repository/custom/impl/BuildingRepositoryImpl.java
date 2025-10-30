package com.javaweb.repository.custom.impl;

import com.javaweb.entity.BuildingEntity;
import com.javaweb.model.request.BuildingSearchRequest;
import com.javaweb.repository.custom.BuildingRepositoryCustom;
import com.javaweb.utils.StringUtils;
import org.springframework.stereotype.Repository;

import org.hibernate.query.Query;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import java.util.Collections;
import java.util.List;
import java.util.stream.Collectors;

@Repository
public class BuildingRepositoryImpl implements BuildingRepositoryCustom {

    @PersistenceContext
    private EntityManager entityManager;

    private void appendLikeCondition(String src, String column, StringBuilder where) {
        if (StringUtils.check(src)) {
            where.append(" AND " + column + " LIKE '%" + src + "%' ");
        }
    }
    private void appendEqualCondition(Long src, String column, StringBuilder where) {
        if (src != null) {
            where.append(" AND " + column + " = "  + src + " ");
        }
    }
    private void appendGreaterOrEqualCondition(Long src, String column, StringBuilder where) {
        if (src != null) {
            where.append(" AND " + column + " >= " + src + " ");
        }
    }
    private void appendLessOrEqualCondition(Long src, String column, StringBuilder where) {
        if (src != null) {
            where.append(" AND " + column + " <= " + src + " ");
        }
    }
    private void appendEqualStringCondition(String src, String column, StringBuilder where) {
        if (StringUtils.check(src)) {
            where.append(" AND " + column + " = '" + src + "' ");
        }
    }
    private void inCondition(List<String> values, String column, StringBuilder where) {
        String inClause = values.stream().map(value -> "b.type" + " LIKE '%" + value + "%' ").collect(Collectors.joining(" OR "));
        where.append(" AND (" + inClause + ") ");
    }

    @Override
    public List<BuildingEntity> getBuildingEntities(BuildingSearchRequest buildingSearchRequest) {
        StringBuilder queryBuilder = new StringBuilder("SELECT b.* FROM building b ");
        StringBuilder whereClause = new StringBuilder(" WHERE 1 = 1 ");

        appendLikeCondition(buildingSearchRequest.getName(), "b.name", whereClause);
        appendLikeCondition(buildingSearchRequest.getStreet(), "b.street", whereClause);
        appendLikeCondition(buildingSearchRequest.getWard(), "b.ward", whereClause);
        appendLikeCondition(buildingSearchRequest.getDirection(), "b.direction", whereClause);
        appendEqualCondition(buildingSearchRequest.getLevel(), "b.level", whereClause);
        appendLikeCondition(buildingSearchRequest.getManagerName(), "b.managername", whereClause);
        appendEqualStringCondition(buildingSearchRequest.getManagerPhone(), "b.managerphone", whereClause);
        // compare by districtCode
        appendEqualStringCondition(buildingSearchRequest.getDistrict(), "b.district", whereClause);
        appendEqualCondition(buildingSearchRequest.getFloorArea(), "b.floorarea", whereClause);
        appendEqualCondition(buildingSearchRequest.getNumberOfBasement(), "b.numberofbasement", whereClause);
        appendGreaterOrEqualCondition(buildingSearchRequest.getRentPriceFrom(), "b.rentprice", whereClause);
        appendLessOrEqualCondition(buildingSearchRequest.getRentPriceTo(), "b.rentprice", whereClause);
        if (buildingSearchRequest.getStaffId() != null) {
            queryBuilder.append(" INNER JOIN assignmentbuilding ab on b.id = ab.buildingid ");
            appendEqualCondition(buildingSearchRequest.getStaffId(), "ab.staffid", whereClause);
        }
        if (buildingSearchRequest.getAreaTo() != null ||  buildingSearchRequest.getAreaFrom() != null) {
            queryBuilder.append(" INNER JOIN rentarea r on b.id = r.buildingid ");
            if (buildingSearchRequest.getAreaFrom() != null) {
                appendGreaterOrEqualCondition(buildingSearchRequest.getAreaFrom(), "r.value", whereClause);
            }
            if (buildingSearchRequest.getAreaTo() != null) {
                appendLessOrEqualCondition(buildingSearchRequest.getAreaTo(), "r.value", whereClause);
            }
        }
        if (buildingSearchRequest.getTypeCode() != null &&  !buildingSearchRequest.getTypeCode().isEmpty()) {
            inCondition(buildingSearchRequest.getTypeCode(), "b.type", whereClause);
        }
        whereClause.append(" group by b.id ");
        queryBuilder.append(whereClause.toString());

        Query query = (Query) entityManager.createNativeQuery(queryBuilder.toString(), BuildingEntity.class);
        List<BuildingEntity> result = query.getResultList();
        return result;
    }
}
