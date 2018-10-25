package org.gidal.reserve.service;

import javax.inject.Inject;

import org.gidal.enterprise.domain.EnterpriseVO;
import org.gidal.reserve.dao.ReserveDAO;
import org.gidal.reserve.domain.ReserveVO;
import org.gidal.user.domain.UserVO;
import org.gidal.util.MailHandler;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class ReserveServiceImpl implements ReserveService {

	@Inject private ReserveDAO dao;
	@Inject private JavaMailSender mailSender;

	/**
	 * 예약하기 메소드
	 *
	 * @see org.gidal.reserve.service.ReserveService#reserve_insert(org.gidal.reserve.domain.ReserveVO)
	 * @param ReserveVO
	 * @return int
	 * @throws
	 */

	@Transactional
	@Override
	public int reserve_insert(ReserveVO vo) throws Exception{
		vo.setReserve_yn("N");
		vo.setReserve_comfirmation("N");

		EnterpriseVO ent;
		ent = dao.selectOne(vo.getEnterprise_code());
		MailHandler sendMail = new MailHandler(mailSender);
		sendMail.setSubject("[" + ent.getEnterprise_businessName()+", 예약확정 대기 1팀이 추가되었습니다.]");
		sendMail.setText(
				new StringBuffer().append("<h2>" + vo.getUser_name() + "님 \n" + vo.getReserve_date() + vo.getReserve_time() + "\n"
						+ "인원수 : " + vo.getReserve_personnel() + "명" + "\n" + "기업페이지에서 예약확정해주세요." +
							"</h2>").toString());
		sendMail.setFrom("amdintest@gmail.com", "관리자");
		sendMail.setTo(ent.getEnterprise_email());
		sendMail.send();
		return dao.reserve_insert(vo);
	}

	/**
	 * 예약 페이지 보여주는 메소드
	 *
	 * @see org.gidal.reserve.service.ReserveService#selectOne(Integer)
	 * @param Integer
	 * @return EnterpriseVO
	 * @throws
	 */


	@Override
	public EnterpriseVO selectOne(Integer code) {
		return dao.selectOne(code);
	}

	/**
	 * 웨이팅 페이지에 로그인한 정보 세션에 저장해서 보여주는 메소드
	 *
	 * @see org.gidal.reserve.service.ReserveService#selectOne(String)
	 * @param String
	 * @return UserVO
	 * @throws
	 */


	@Override
	public UserVO selectOne(String str) {
		return dao.selectUser(str);
	}


}
