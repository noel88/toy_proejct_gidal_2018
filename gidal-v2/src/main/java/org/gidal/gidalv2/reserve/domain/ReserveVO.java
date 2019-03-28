package org.gidal.gidalv2.reserve.domain;

import lombok.Getter;
import lombok.Setter;

@Getter @Setter
public class ReserveVO {

    private int reserve_code;
    private int enterprise_code;
    private int reserve_personnel;
    private String reserve_date;
    private String reserve_time;
    private String user_name;
    private String user_phoneNum;
    private String reserve_yn;
    private String reserve_comfirmation;
    private String enterprise_businessName;


}
