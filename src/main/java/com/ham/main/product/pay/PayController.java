package com.ham.main.product.pay;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.http.HttpClient;
import java.net.http.HttpHeaders;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.JsonObject;
import com.ham.main.member.MemberDTO;
import com.ham.main.member.MemberService;
import com.ham.main.partner.PartnerDTO;
import com.ham.main.partner.PartnerService;
import com.ham.main.product.ProductDTO;
import com.ham.main.product.ProductService;
import com.ham.main.product.book.BookDTO;
import com.ham.main.product.book.BookService;
import com.ham.main.product.pay.port.PortController;
import com.ham.main.util.AlterDate;
import com.ham.main.util.CreatOrderNum;
import com.ham.main.util.Pager;

@Controller
@RequestMapping("/pay/*")
public class PayController {

	@Autowired
	private PayService payService;

	@Autowired
	private CreatOrderNum creatOrderNum;

	@Autowired
	private AlterDate alterDate;

	@Autowired
	private PortController portController;

	@Autowired
	private MemberService memberService;

	@Autowired
	private PartnerService partnerService;

	@Autowired
	private BookService bookService;

	@Autowired
	private ProductService productService;

	@GetMapping("add")
	public void setPay(BookDTO bookDTO, Model model, HttpSession session) throws Exception {
//		파트너디테일,productdetail 넣어야함 
		bookDTO = bookService.getDetail(bookDTO);

//		예약번호로 상품번호 조회
		ProductDTO productDTO = new ProductDTO();
		productDTO.setProductNum(bookDTO.getProductNum());
		productDTO = productService.getDetail(productDTO);

//		상품번호로 파트너조회
		PartnerDTO partnerDTO = new PartnerDTO();
		partnerDTO.setPartnerNum(productDTO.getPartnerNum());
		partnerDTO = partnerService.getDetail(partnerDTO);

		model.addAttribute("kto", partnerDTO);
		model.addAttribute("book", bookDTO);
	}

	@PostMapping("add")
	public String setPay(PayDTO payDTO, Model model) throws Exception {
//	    Pay-method받을까 말까

		int result = payService.setPay(payDTO);

		String payNum = payDTO.getPayNum();
		model.addAttribute("payNum", payNum);
//		model.addAttribute("result", result);
		return "commons/ajaxPayResult";
	}

	@GetMapping("detail")
	public void getDetail(PayDTO payDTO, Model model) throws Exception {

		payDTO = payService.getDetail(payDTO);
		model.addAttribute("kto", payDTO);
//	String token = portController.getImportToken();
//    	
//	System.out.println(token);
	}

	@PostMapping("refund")
	public String setRefund(Model model, PayDTO payDTO, @RequestParam("reason") String reason) throws Exception {
//		payDTO =  payService.getDetail(payDTO);

		RefundDTO refundDTO = new RefundDTO();
		refundDTO.setPayNum(payDTO.getPayNum());

		long payAmount = payDTO.getPayAmount();

//      현재 날짜 구하기
		LocalDate date = LocalDate.now();
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");

		String now = date.format(formatter);

		System.out.println(now);

		BookDTO bookDTO = new BookDTO();
		bookDTO.setBookNum(payDTO.getBookNum());
		bookDTO = bookService.getDetail(bookDTO);

		SimpleDateFormat fmt = new SimpleDateFormat("yyyy-MM-dd");

		String bookDateStr = fmt.format(bookDTO.getBookDate().getTime());
		java.util.Date today = fmt.parse(now);
		java.util.Date bookDate = fmt.parse(bookDateStr);

		Calendar cal = Calendar.getInstance();
		cal.setTime(bookDate);
		cal.add(Calendar.DATE, -4);

		bookDateStr = fmt.format(cal.getTime());
		bookDate = fmt.parse(bookDateStr);

		int compare = bookDate.compareTo(today);
		if (compare <= 0) {
			refundDTO.setRefundCheck("1");
		} else {
			refundDTO.setRefundCheck("0");
		}

//		당일 환불이거나 일정 시간 지난 후 환불이면
//      여기서 메서드 추가해서 계산
//      적립금 없애기도 가능할듯
		refundDTO.setRefundAmount(payAmount);
		refundDTO.setRefundReason(reason);

		String token = portController.getImportToken();
		payDTO = payService.getDetail(payDTO);
		String uid = payDTO.getPayNum().toString();

		portController.payMentCancle(token, uid, refundDTO.getRefundAmount(), reason);

		int result = payService.setRefund(refundDTO);

		model.addAttribute("result", result);

//		조회를 하고 uid빼서넣기

		return "commons/ajaxResult";

	}

	@GetMapping("list")
	public void getList(MemberDTO memberDTO, Model model, Pager pager) throws Exception {
        pager.setPerPage(3L);
		List<BookDTO> bl = bookService.getBookInfo(memberDTO, pager);

		List<ProductDTO> pdl = new ArrayList<ProductDTO>();
		List<PayDTO> pl = new ArrayList<PayDTO>();

		for (BookDTO b : bl) {
			PayDTO payDTO = new PayDTO();
			payDTO.setBookNum(b.getBookNum());
			
			payDTO = payService.getPayInfo(payDTO);
			System.out.println("-----");
		    System.out.println(payDTO);
			if (payDTO!= null) {
				pl.add(payDTO);	
			}
			ProductDTO productDTO = new ProductDTO();
			productDTO.setProductNum(b.getProductNum());

			productDTO = productService.getDetail(productDTO);
			if (productDTO != null) {
				pdl.add(productDTO);
			}
		}
		pager.setPerPage(3L);
		pager.makePageNum(pl.size()/1L);
		List<RefundDTO> rl = new ArrayList<RefundDTO>();
		for (PayDTO p : pl) {
			RefundDTO refundDTO = new RefundDTO();
			refundDTO.setPayNum(p.getPayNum());

			refundDTO = payService.getRefundInfo(refundDTO);
			if (refundDTO != null) {
				rl.add(refundDTO);
			}
		}

		if (pl.size() != 0) {
			model.addAttribute("payList", pl);
			model.addAttribute("list", bl);
			model.addAttribute("productList", pdl);
			model.addAttribute("refundList", rl);
		}

	}

	@GetMapping("refundList")
	public void getRefundList(MemberDTO memberDTO, Model model, Pager pager) throws Exception {
		List<BookDTO> bl = bookService.getBookInfo(memberDTO, pager);

		List<ProductDTO> pdl = new ArrayList<ProductDTO>();

		List<PayDTO> pl = new ArrayList<PayDTO>();

		List<RefundDTO> rl = new ArrayList<RefundDTO>();
		for (BookDTO b : bl) {
			PayDTO payDTO = new PayDTO();
			payDTO.setBookNum(b.getBookNum());
			payDTO = payService.getPayInfo(payDTO);
			if (payDTO != null) {
				System.out.println(payDTO);
				pl.add(payDTO);
			}

			ProductDTO productDTO = new ProductDTO();
			productDTO.setProductNum(b.getProductNum());

			productDTO = productService.getDetail(productDTO);
			if (productDTO != null) {
				pdl.add(productDTO);
			}
		}

		for (PayDTO p : pl) {
			RefundDTO refundDTO = new RefundDTO();
			refundDTO.setPayNum(p.getPayNum());

			pager.makePageNum(payService.getRefundTotal(refundDTO));
			refundDTO = payService.getRefundInfo(refundDTO);
			if (refundDTO != null) {
				rl.add(refundDTO);
			}
		}

		if (rl.size() != 0) {
			model.addAttribute("payList", pl);
			model.addAttribute("list", bl);
			model.addAttribute("productList", pdl);
			model.addAttribute("refundList", rl);
		}

	}

	@GetMapping("checklist")
	public void getChecklist(HttpSession session, Model model) throws Exception {
		PartnerDTO partnerDTO = (PartnerDTO) session.getAttribute("partner");

		List<ProductDTO> pdl = productService.getInfo(partnerDTO);

		List<PayDTO> payList = new ArrayList<PayDTO>();
		List<MemberDTO> ml = new ArrayList<MemberDTO>();
		for (ProductDTO p : pdl) {
			List<BookDTO> bl = bookService.getBook(p);
			System.out.println("-----------------");
			System.out.println("bl");
			for (BookDTO b : bl) {

				if (Integer.parseInt(b.getBookCheck()) > 0) {
					PayDTO payDTO = new PayDTO();
					payDTO.setBookNum(b.getBookNum());
					payDTO = payService.getPayInfo(payDTO);

					MemberDTO memberDTO = new MemberDTO();
					memberDTO.setId(b.getId());

					memberDTO = memberService.getDetail(memberDTO);
					ml.add(memberDTO);

					if (payDTO != null) {
						payList.add(payDTO);
						model.addAttribute("memberList", ml);
					}
				}
			}
		}

		List<RefundDTO> rl = new ArrayList<RefundDTO>();

		for (PayDTO pay : payList) {
			RefundDTO refundDTO = new RefundDTO();
			refundDTO.setPayNum(pay.getPayNum());
			refundDTO = payService.getRefundInfo(refundDTO);

			if (refundDTO != null) {
				int refundCheck = Integer.parseInt(refundDTO.getRefundCheck());

				if (refundCheck == 0) {
					rl.add(refundDTO);
					model.addAttribute("refundList", rl);
				}
			}
		}

		List<ProductDTO> pdlTwo = new ArrayList<ProductDTO>();
		List<BookDTO> blTwo = new ArrayList<BookDTO>();
		for (RefundDTO r : rl) {
			PayDTO payDTO = new PayDTO();
			payDTO.setPayNum(r.getPayNum());
			payDTO = payService.getDetail(payDTO);

			BookDTO bookDTO = new BookDTO();
			bookDTO.setBookNum(payDTO.getBookNum());
			bookDTO = bookService.getDetail(bookDTO);

			blTwo.add(bookDTO);

			if (bookDTO != null) {
				ProductDTO productDTO = new ProductDTO();
				productDTO.setProductNum(bookDTO.getProductNum());
				productDTO = productService.getDetail(productDTO);
				pdlTwo.add(productDTO);
				if (pdlTwo != null) {
					model.addAttribute("productList", pdlTwo);
					model.addAttribute("list", blTwo);
				}
			}
		}

	}

	@PostMapping("setRefundCheck")
	public String setRefundCheck(RefundDTO refundDTO, Model model) throws Exception {
		int result = payService.setRefundCheck(refundDTO);

		model.addAttribute("result", result);

		return "commons/ajaxResult";
	}

}
