package org.gidal.enterprise.dao;

import java.util.List;

import org.gidal.enterprise.domain.EnterpriseVO;
import org.gidal.reserve.domain.ReserveVO;
import org.gidal.waiting.domain.WaitingVO;

public interface EnterpriseDAO {

	public int enterprise_join(EnterpriseVO vo);
	public int enterprise_check(EnterpriseVO vo);
	public int find_enterprise_code(String str);
	public int enterpriseBoard_update(EnterpriseVO vo);
	public int waiting_update(Integer no);
	public int reserve_update(Integer code);
	public int update_reserveConfirmation_yn(Integer code);
	public List<ReserveVO> reserve_listCheck(Integer code);
	public List<ReserveVO> reserve_list(Integer code);
	public List<ReserveVO> reserve_now_list(Integer code);
	public List<ReserveVO> last_reserve_list(Integer code);
	public List<EnterpriseVO> enterpriseBoard_list();
	public List<WaitingVO> waiting_list(Integer code);
	public List<WaitingVO> last_waiting_list(Integer code);
	public EnterpriseVO enterpriseBoard_view(Integer code);
	public int delete(EnterpriseVO vo);
	public void enterprise_img(EnterpriseVO vo);
	public List<EnterpriseVO> ent_best();
	public List<EnterpriseVO> ent_popular();
	public int reserve_count(Integer code);
	public int waiting_count(Integer code);
	public int ent_detail_update(EnterpriseVO vo);
	public int reserve_listCheck_cnt(Integer code);
	public int review_scope(Integer code);



}
