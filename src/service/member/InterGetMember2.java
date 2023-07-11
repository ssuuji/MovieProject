package service.member;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import com.my.main.Inter;

import DAO.MemberDAO;
import VO.MemberVO;

//전체 조회
public class InterGetMember2 implements Inter{

   @Override
   public void inter(HttpServletRequest request, HttpServletResponse response)throws Exception {
      request.setCharacterEncoding("UTF-8");
      response.setCharacterEncoding("UTF-8");
      MemberDAO mbdao = new MemberDAO();
      ArrayList<MemberVO> memberlist1 = mbdao.memberSearch();
      request.setAttribute("memberlist1", memberlist1);
   }
}