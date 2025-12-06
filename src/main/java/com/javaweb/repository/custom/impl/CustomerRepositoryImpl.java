package com.javaweb.repository.custom.impl;


import com.javaweb.entity.CustomerEntity;
import com.javaweb.model.request.CustomerSearchRequest;
import com.javaweb.repository.custom.CustomerRepositoryCustom;
import com.javaweb.utils.StringUtils;
import org.hibernate.query.Query;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import java.util.List;

@Repository
public class CustomerRepositoryImpl implements CustomerRepositoryCustom {
    @PersistenceContext
    private EntityManager entityManager;

    private void appendLikeCondition(String src, String column, StringBuilder where) {
        if (StringUtils.check(src)) {
            where.append(" AND " + column + " LIKE '%" + src + "%' ");
        }
    }

    private void appendStringEqualCondition(String src, String column, StringBuilder where) {
        if (StringUtils.check(src)) {
            where.append(" AND " + column + " = '" + src + "' ");
        }
    }

    private void appendEqualCondition(Long src,  String column, StringBuilder where) {
        if (src !=  null) {
            where.append(" AND " + column + " = " + src + " ");
        }
    }

    @Override
    public Page<CustomerEntity> getCustomerEntities(CustomerSearchRequest customerSearchRequest, Pageable pageable) {
        StringBuilder queryBuilder = new StringBuilder(" SELECT c.* from customer c ");
        StringBuilder whereClause = new StringBuilder(" WHERE 1 = 1 ");
        appendLikeCondition(customerSearchRequest.getName(), "c.fullname", whereClause);
        appendStringEqualCondition(customerSearchRequest.getPhoneNumber(), "c.phone", whereClause);
        appendStringEqualCondition(customerSearchRequest.getEmail(), "c.email", whereClause);

        if (customerSearchRequest.getStaffId() != null) {
            queryBuilder.append(" INNER JOIN assignmentcustomer ac on ac.customerid = c.id ");
            appendEqualCondition(customerSearchRequest.getStaffId(), "ac.staffid", whereClause);
        }

        String joins = queryBuilder.toString().replace(" SELECT c.* from customer c ", "");
        String countSql = " SELECT COUNT(DISTINCT c.id) FROM customer c " + joins + whereClause.toString();

        Query countQuery = (Query)entityManager.createNativeQuery(countSql);

        long total = ((Number) countQuery.getSingleResult()).longValue();

        whereClause.append(" GROUP BY c.id");

        whereClause.append(" LIMIT " + pageable.getPageSize() + " OFFSET " + pageable.getOffset());

        queryBuilder.append(whereClause.toString());

        Query query = (Query) entityManager.createNativeQuery(queryBuilder.toString(),  CustomerEntity.class);
        List<CustomerEntity> result = query.getResultList();
        return new PageImpl<>(result, pageable, total);
    }
}
