package com.my.main;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import service.adminboard.adminDelete;
import service.adminboard.adminInsert;
import service.adminboard.adminSearchone;
import service.adminboard.adminUpdate;
import service.adminboard.adminboardgetAllInfo;
import service.book.BookAdminSearchone;
import service.book.BookDelete;
import service.book.BookGetAllInfo;
import service.book.BookInsert;
import service.book.BookUpdate;
import service.book.Cancel;
import service.member.IdCheck;
import service.member.InterGetMember2;
import service.member.Login;
import service.member.Logout;
import service.member.Register;
import service.member.memberDelete;
import service.member.memberSearchone;
import service.member.memberSearchone2;
import service.member.memberUpdate;
import service.member.memberUpdate2;
import service.member.mypage;
import service.movie.MovieDelete;
import service.movie.MovieInsert;
import service.movie.MoviegetAllInfo;
import service.movie.UpdateMovie;
import service.movie.XMLParser4;
import service.movie.XMLParser44;
import service.movie.XMLParser5;
import service.movie.getMovieInfoOne;
import service.review.InsertRev;
import service.review.RevDelete;
import service.review.RevUpdate;
import service.review.RevgetAllinfo;
import service.review.RevgetMovie;
import service.review.Revsearch;
import service.screen.ScreenDelete;
import service.screen.ScreenGetAllInfo;
import service.screen.ScreenInsert;
import service.screen.ScreenSearchone;
import service.screen.ScreenUpdate;
import service.stime.InterGetStime;
import service.stime.stimeDelete;
import service.stime.stimeInsert;
import service.stime.stimeSearchone;
import service.stime.stimeUpdate;
import service.theater.InterGetTheater;
import service.theater.theDelete;
import service.theater.theInsert;
import service.theater.theSearchone;
import service.theater.theUpdate;
import service.user.GetPoster;
import service.user.Pay;
import service.user.PayResult;
import service.user.Rev;
import service.user.book22;
import service.userboard.BookInfo;
import service.userboard.BookInfoCancel;
import service.userboard.Delete;
import service.userboard.Insert;
import service.userboard.Searchone;
import service.userboard.Update;
import service.userboard.getAllInfo;
import service.userboard.getMy;

@WebServlet("*.do")
public class FrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public FrontController() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String path = request.getRequestURI().substring(request.getContextPath().length());
		String str = null;

		Inter inter = null;

		switch (path) {
// =================== USER ==========================================
		case "/register.do": // 정보를 입력 후 회원가입 버튼을 눌렀을경우
			inter = new Register();
			try {
				inter.inter(request, response);
				if (request.getAttribute("regfall") != null || request.getAttribute("erpw") != null
						|| request.getAttribute("erpw2") != null || request.getAttribute("erid") != null) {
					str = "joinForm.jsp";
					break;
				}
			} catch (Exception e) {
				e.printStackTrace();
				str = "joinForm.jsp";
				break;
			}
			str = "index.jsp";
			break;
		case "/login.do": // 아이디와 비밀번호 입력 후 로그인 버튼을 눌렀을 경우
			inter = new Login();
			try {
				inter.inter(request, response);
				HttpSession session = request.getSession();
				if (session.getAttribute("admin") != null && session.getAttribute("admin").equals("admin")) {
					str = "admin/admin.jsp";
					break;
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			str = "index.jsp";
			break;
		case "/logout.do":
			inter = new Logout();
			try {
				inter.inter(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			str = "/main.do";
			break;
		case "/idcheck.do":
			inter = new IdCheck();
			try {
				inter.inter(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			str = "joinForm.jsp";
			break;
		case "/selbook.do":
			inter = new book22();
			try {
				inter.inter(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			str = "book2.jsp";
			break;

		case "/selbook1.do": // 상세영화에서 예매 추가
			inter = new book22();
			try {
				inter.inter(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			str = "book22.jsp";
			break;

		case "/boseat.do":
			inter = new GetPoster();
			try {
				inter.inter(request, response);
			} catch (Exception e) {
			}
			str = "seat3.jsp";
			break;
		case "/pay.do":
			inter = new Pay();
			try {
				inter.inter(request, response);
			} catch (Exception e) {
			}
			str = "kakaopay.jsp";
			break;
		case "/main.do": // 매인화면 사진 띄우기
			inter = new XMLParser44();
			try {
				inter.inter(request, response);
			} catch (Exception e) {
			}
			str = "main.jsp";
			break;

		case "/sang.do":// 현재상영작 불러오기
			inter = new XMLParser44();
			try {
				inter.inter(request, response);
			} catch (Exception e) {
			}
			str = "sang.jsp";
			break;
		case "/rev.do":
			inter = new Rev();
			try {
				inter.inter(request, response);
			} catch (Exception e) {
			}
			str = "payment.jsp";
			break;
		case "/payresult.do":
			inter = new PayResult();
			try {
				inter.inter(request, response);
			} catch (Exception e) {
			}
			str = "payment_fin.jsp";
			break;

//======================== 회원 관리 ========================================
		// 조회
		case "/admin/adminMember/getMember.do":
			inter = new InterGetMember2();
			try {
				inter.inter(request, response);

			} catch (Exception e) {
				e.printStackTrace();
			}
			str = "getMember.jsp";
			break;

		// 조회 (하나만)
		case "/admin/adminMember/memberSearchone.do":
			inter = new memberSearchone();
			try {
				inter.inter(request, response);

			} catch (Exception e) {
				e.printStackTrace();
			}
			str = "memberUpdateForm.jsp";
			break;

		case "/admin/adminMember/memberUpdate.do":
			inter = new memberUpdate();
			try {
				inter.inter(request, response);

			} catch (Exception e) {
				e.printStackTrace();
			}
			str = "getMember.do";
			break;
		// =======================영화 관리===================================
		case "/admin/adminMovie/MovieGetAll.do":// 등록된 모든 영화 정보 모두 불러오기
			inter = new MoviegetAllInfo();
			try {
				inter.inter(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			str = "getMovieall.jsp";
			break;
		case "/admin/adminMovie/DeleteMovie.do":// 등록된 영화 삭제
			inter = new MovieDelete();
			try {
				inter.inter(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			str = "MovieGetAll.do";
			break;
		case "/admin/adminMovie/updateMovie.do":
			inter = new UpdateMovie();// 영화 정보 수정
			try {
				inter.inter(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			str = "MovieGetAll.do";
			break;
		case "/admin/adminMovie/insertMovie.do": // 영화 추가
			inter = new MovieInsert();
			try {
				inter.inter(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			str = "MovieGetAll.do";
			break;
		case "/admin/adminMovie/getMovieInfoOne.do": // 영화코드를 이용해 하나의 정보 불러오기
			inter = new getMovieInfoOne();
			try {
				inter.inter(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			str = "getMovieInfoOne.jsp";
			break;

		case "/admin/adminMovie/MovieMain.do": // 어제의 영화 순위 불러오기
			inter = new XMLParser44();
			try {
				inter.inter(request, response);
			} catch (Exception e) {
			}
			str = "MovieMain.jsp";
			break;

		case "/admin/adminMovie/MovieSearch.do": // 어제의 영화 순위 불러오기
			inter = new XMLParser4();
			try {
				inter.inter(request, response);
			} catch (Exception e) {
			}
			str = "MovieSearch.jsp";
			break;

		case "/admin/adminMovie/MovieSearch2.do": // vod
			inter = new XMLParser5();
			try {
				inter.inter(request, response);
			} catch (Exception e) {
			}
			str = "MovieSearch2.jsp";
			break;
// =================== Screen ==============================================
		case "/admin/adminScreen/ScreenGetAll.do":
			inter = new ScreenGetAllInfo();
			try {
				inter.inter(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			str = "getAllScreen.jsp";
			break;

		case "/admin/adminScreen/ScreenSearchone.do":
			inter = new ScreenSearchone();
			try {
				inter.inter(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			str = "ScreenUpdateForm.jsp";
			break;

		case "/admin/adminScreen/ScreenInsert.do":
			inter = new ScreenInsert();
			try {
				inter.inter(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			str = "ScreenGetAll.do";
			break;

		case "/admin/adminScreen/ScreenUpdate.do":
			inter = new ScreenUpdate();
			try {
				inter.inter(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			str = "ScreenGetAll.do";
			break;

		case "/admin/adminScreen/ScreenDelete.do":
			inter = new ScreenDelete();
			try {
				inter.inter(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			str = "ScreenGetAll.do";
			break;
//============== Thearter=====================================
		// 영화관 전체 조회
		case "/admin/adminTheater/TheaterGetAll.do":
			inter = new InterGetTheater();
			try {
				inter.inter(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			str = "getTheater.jsp";
			break;
		// 영화관 조회 (하나만)
		case "/admin/adminTheater/theSearchone.do":
			inter = new theSearchone();
			try {
				inter.inter(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			str = "theUpdateForm.jsp";
			break;
		// 영화관 추가
		case "/admin/adminTheater/theInsert.do":
			inter = new theInsert();
			try {
				inter.inter(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			str = "TheaterGetAll.do";
			break;

		// 영화관 수정
		case "/admin/adminTheater/theUpdate.do":
			inter = new theUpdate();
			try {
				inter.inter(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			str = "TheaterGetAll.do";
			break;

		// 영화관 삭제
		case "/admin/adminTheater/theDelete.do":
			inter = new theDelete();
			try {
				inter.inter(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			str = "TheaterGetAll.do";
			break;
// ================= book ============================================
		case "/admin/adminBook/getAllBook.do": // 어드민 예매 내역 전체 조회
			inter = new BookGetAllInfo();
			try {
				inter.inter(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			str = "getAllBook.jsp";
			break;

		case "/admin/adminBook/BookAdminSearchone.do": // 어드민 예매 내역 1개 조회
			inter = new BookAdminSearchone();
			try {
				inter.inter(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			str = "BookUpdateForm.jsp";
			break;

		case "/admin/adminBook/BookInsert.do":
			inter = new BookInsert();
			try {
				inter.inter(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			str = "getAllBook.do";
			break;

		case "/admin/adminBook/BookUpdate.do": // 어드민 예매 취소
			inter = new BookUpdate();
			try {
				inter.inter(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			str = "getAllBook.do";
			break;

		case "/admin/adminBook/BookDelete.do":
			inter = new BookDelete();
			try {
				inter.inter(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			str = "getAllBook.do";
			break;
//=================== review ==================================
		case "/admin/adminReview/RevgetAllInfo.do": // 리뷰 불러오기
			inter = new RevgetAllinfo();
			try {
				inter.inter(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			str = "RgetAllinfo.jsp";
			break;

		case "/admin/adminReview/MovieGetAll.do":// 등록된 모든 영화 정보 모두 불러오기
			inter = new MoviegetAllInfo();
			try {
				inter.inter(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			str = "ReMovAll.jsp";
			break;

		case "/admin/adminReview/RevgetMovie.do": // 영화코드를 이용해 코드와 같은 리뷰 불러오기
			inter = new RevgetMovie();
			try {
				int mo_code = Integer.parseInt(request.getParameter("mo_code"));// 새로 추가
				request.setAttribute("mo_code", mo_code); // 영화 코드를 request 속성에 저장 //새로추가
				inter.inter(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			str = "RgetAllinfo.jsp";
			break;

		case "/admin/adminReview/Revsearch.do":
			inter = new Revsearch();
			try {
				inter.inter(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			str = "Rview.jsp";
			break;

		case "/admin/adminReview/RevDelete.do": // 등록된 리뷰 삭제
			inter = new RevDelete();
			try {
				inter.inter(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			str = "MovieGetAll.do";
			break;

		case "/admin/adminReview/InsertRev.do": // 후기 등록
			inter = new InsertRev();
			try {
				inter.inter(request, response);
				str = "MovieGetAll.do";
			} catch (Exception e) {
				e.printStackTrace();
				str = "error.jsp";
			}
			break;

		case "/admin/adminReview/RevUpdate.do":
			inter = new RevUpdate();
			try {
				inter.inter(request, response);
				str = "RgetAllinfo.do";
			} catch (Exception e) {
				e.printStackTrace();
				str = "error.jsp";
			}
			break;
// ================== Stime =====================================
		// 조회
		case "/admin/adminStime/getStime.do": // 상영일정 전체 조회
			inter = new InterGetStime();
			try {
				inter.inter(request, response);

			} catch (Exception e) {
				e.printStackTrace();
			}
			str = "getStime.jsp";
			break;

		// 추가
		case "/admin/adminStime/stimeInsert.do":
			inter = new stimeInsert();
			try {
				inter.inter(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			str = "getStime.do";
			break;

		// 조회 (하나만)
		case "/admin/adminStime/stimeSearchone.do":
			inter = new stimeSearchone();
			try {
				inter.inter(request, response);

			} catch (Exception e) {
				e.printStackTrace();
			}
			str = "stimeUpdateForm.jsp";
			break;
		// 수정
		case "/admin/adminStime/stimeUpdate.do":
			inter = new stimeUpdate();
			try {
				inter.inter(request, response);

			} catch (Exception e) {
				e.printStackTrace();
			}
			str = "getStime.do";
			break;

		// 삭제
		case "/admin/adminStime/stimeDelete.do":
			inter = new stimeDelete();
			try {
				inter.inter(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			str = "getStime.do";
			break;
		// ================== adminboard =====================================
		case "/admin/adminBoard/getAdminOnlyBoard.do":
			inter = new adminboardgetAllInfo();
			try {
				inter.inter(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			str = "getAdminBoard.jsp";
			break;

		case "/admin/adminBoard/adminsearchone.do":
			inter = new adminSearchone();
			try {
				inter.inter(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			str = "adminUpdateForm.jsp";
			break;

		case "/admin/adminBoard/admininsert.do":
			inter = new adminInsert();
			try {
				inter.inter(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			str = "/admin/adminBoard/getAdminOnlyBoard.do";
			break;

		case "/admin/adminBoard/adminUpdate.do":
			inter = new adminUpdate();
			try {
				inter.inter(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			str = "/admin/adminBoard/getAdminOnlyBoard.do";
			break;

		case "/admin/adminBoard/admindelete.do":
			inter = new adminDelete();
			try {
				inter.inter(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			str = "/admin/adminBoard/getAdminOnlyBoard.do";
			break;
		// =================== USER ==========================================
//		case"/userboard/getUserBoard2.do":
//			inter = new getAllInfo();
//			try {
//				inter.inter(request, response);
//			} catch(Exception e) {
//				e.printStackTrace();
//			}
//			str="getUserBoard2.jsp";
//			break;

		case "/userboard/insert.do": // 회원 게시글 작성
			inter = new Insert();
			try {
				inter.inter(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			str = "getUserBoard.do";
			break;

		case "/userboard/getMember.do": // 회원 한명 조회
			inter = new InterGetMember2();
			try {
				inter.inter(request, response);

			} catch (Exception e) {
				e.printStackTrace();
			}
			str = "getMember.jsp";
			break;

		// 조회 (하나만)
//			case "/userboard/memberSearchone.do":
//				inter = new memberSearchone();
//				try {					 
//					inter.inter(request, response);
//							
//				} catch (Exception e) {
//						e.printStackTrace();					}
//					str = "memberUpdateForm.jsp";
//					break;
//					
//			case "/userboard/memberUpdate.do":
//				inter = new memberUpdate();
//				try {
//						inter.inter(request, response);
//								
//				} catch (Exception e) {
//					e.printStackTrace();
//				}
//					str = "getMember.do";
//					break;
//								
//								
		case "/userboard/getUserBoard.do": // 공지사항 + 유저 게시글 조회
			inter = new getAllInfo();
			try {
				inter.inter(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			str = "getUserBoard.jsp";
			break;
		case "/userboard/getAdminBoard.do": // 공지사항 + 유저 게시글 조회 (헤더 삭제, 어드민페이지)
			inter = new getAllInfo();
			try {
				inter.inter(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			str = "getAdminBoard.jsp";
			break;

		case "/userboard/searchone.do": // 게시글 번호로 게시글 조회
			inter = new Searchone();
			try {
				inter.inter(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			str = "UpdateForm.jsp";
			break;
		case "/userboard/Myboard.do": // 내가 작성한 글
			inter = new getMy();
			try {
				inter.inter(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			str = "Myboard.jsp";
			break;
		case "/userboard/Mysearchone.do": // 마이게시글 번호로 게시글 조회
			inter = new Searchone();
			try {
				inter.inter(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			str = "MyUpdate.jsp";
			break;

		case "/userboard/Myupdate.do": // 마이 게시글 수정
			inter = new Update();
			try {
				inter.inter(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			str = "Myboard.do";
			break;
		case "/userboard/Mydelete.do": // 게시글 삭제
			inter = new Delete();
			try {
				inter.inter(request, response);
			} catch (Exception e1) {
				e1.printStackTrace();
			}
			str = "Myboard.do";
			break;
		case "/userboard/update.do": // 게시글 수정
			inter = new Update();
			try {
				inter.inter(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			str = "getUserBoard.do";
			break;

		case "/userboard/delete.do": // 게시글 삭제
			inter = new Delete();
			try {
				inter.inter(request, response);
			} catch (Exception e1) {
				e1.printStackTrace();
			}
			str = "getUserBoard.do";
			break;
		case "/userboard/searchone2.do":
            inter = new Searchone();
            try {
               inter.inter(request, response);
            } catch (Exception e) {
               e.printStackTrace();
            }
            str="adminUpdateForm.jsp";
            break;

		case "/userboard/adminsearchone.do": // 공지사항 조회
			inter = new adminSearchone();
			try {
				inter.inter(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			str = "AdminForm.jsp";
			break;

		case "/userboard/memberDelete.do": // 마이페이지 회원 탈퇴
			inter = new memberDelete();
			try {
				inter.inter(request, response);
			} catch (Exception e1) {
				e1.printStackTrace();
			}
			str = "csp.jsp";
			break;
//			case "/BookInfo.do":
//				inter = new BookInfo();
//				try {
//					inter.inter(request, response);
//				}catch(Exception e) {
//					e.printStackTrace();
//				}
//				str="BookInfo.jsp";
//				break;
		case "/userboard/getMembertoMypage.do": // 마이페이지 메인
			inter = new mypage();
			try {
				inter.inter(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			str = "myMain.jsp";
			break;
		case "/userboard/BookInfo.do": // 마이페이지 예메 내역 조회
			inter = new BookInfo();
			try {
				inter.inter(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			str = "BookInfo.jsp";
			break;
		case "/userboard/Cancel.do":// 마이페이지 예매 취소
			inter = new Cancel();
			try {
				inter.inter(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			str = "BookInfoCancel.jsp";
			break;
		case "/userboard/BookInfoCancel.do": // 마이페이지 예매 취소 조회
			inter = new BookInfoCancel();
			try {
				inter.inter(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			str = "BookInfoCancel.jsp";
			break;
		case "/userboard/MemberInfoMy.do": // 마이페이지 회원정보 조회
			inter = new memberSearchone2();
			try {
				inter.inter(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			str = "MemberInfoMy.jsp";
			break;
		case "/userboard/MyUpdate.do": // 마이페이지 회원 정보 수정
			inter = new memberUpdate2();
			try {
				inter.inter(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			str = "usp.jsp";
			break;
		 case "/userboard/delete2.do": // 게시글 삭제
	          inter = new Delete();
	          try {
	             inter.inter(request, response);
	          } catch (Exception e1) {
	             e1.printStackTrace();
	          }
	          str = "getAdminBoard.do";
	          break;
		}
		RequestDispatcher rd1 = request.getRequestDispatcher(str);
		rd1.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
