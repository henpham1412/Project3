package com.javaweb.model.request;

import com.javaweb.model.dto.AbstractDTO;
import lombok.NoArgsConstructor;
import lombok.Getter;
import lombok.Setter;
import lombok.NoArgsConstructor;
import java.util.List;

@Getter // Tự động tạo tất cả các hàm getter
@Setter // Tự động tạo tất cả các hàm setter
@NoArgsConstructor // <-- Tự động tạo constructor rỗng (public BuildingSearchRequest())
public class BuildingSearchRequest extends AbstractDTO {
    private String name;
    private Long floorArea;
    private String district;
    private String ward;
    private String street;
    private Long numberOfBasement;
    private String direction;
    private Long level;
    private Long areaFrom;
    private Long areaTo;
    private Long rentPriceFrom;
    private Long rentPriceTo;
    private String managerName;
    private String managerPhone;
    private Long staffId;
    private List<String> typeCode;
}
