package com.bc.mybatis;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

//장바구니(카트) 역할 클래스
public class Cart {
	private List<ShopVO> list;	//카트에 담긴 제품 목록
	private int total;	//카트에 담긴 전체 품목 가격 합계 금액
	
	public Cart() {
		list = new ArrayList<ShopVO>();
	}
	public List<ShopVO> getList() {	//카트에 담긴 물품리스트 뽑을때 쓸수있음
		return list;
	}
	public int getTotal() {	//카트에 담긴 총금액 알고싶을때 쓸수있음
		return total;
	}

	/** 장바구니에 담기 요청 처리 (카트에 제품 추가)
	 *	list에 없으면 제품 추가
	 *	list에 동일한 제품이 있으면 수량 1개 증가 처리
	 */
	public void addProduct(String p_num, ShopDAO dao ) {
		//카트에 제품이 있는지 확인
		ShopVO vo = findProduct(p_num);
		if (vo == null) {	//카트에 제품이 없을때
			vo = dao.selectOne(p_num);	//p_num 사용해서 DB에서 조회에서 vo생성
			vo.setQuant(1);	//카트에 물건 1개 담을 준비 (단일품목 금액 계산까지 완료)
			list.add(vo);	//카트에 담기
			total += vo.getP_saleprice();	//카트 total 재계산(제품하나 가격추가)
		} else {	//카트에 제품이 있음 -> 수량 1 증가처리 -> 카트 total 재계산 처리
			vo.setQuant(vo.getQuant() + 1);
			//total 재계산 : 기존금액 + 새로 추가된 제품 1개 가격
			total = total + vo.getP_saleprice();
		}
	}
	
	public ShopVO findProduct(String p_num) {
		ShopVO vo = null;
		Iterator<ShopVO> ite = list.iterator();
		while (ite.hasNext()) {
			ShopVO listVO = ite.next();
			if (listVO.getP_num().equals(p_num)) {
				vo = listVO;
				break;
			}
		}
		return vo;
	}
	
	//카트에서 제품 삭제 (꺼내기)
	public void delProduct(String p_num) {
		ShopVO vo = findProduct(p_num);
		if (vo != null) {
			list.remove(vo);
			
			// 카트에서 물건 꺼낸만큼 합계 금액에서 제품금액 빼주기
			total -= vo.getTotalprice();
		}
	}
	
//	//제품수량 변경 처리
//	public void setQuent(String p_num, int su) {
//		//0. 카트에 있는지 확인 (있으면 작업하고, 없으면 종료)
//		ShopVO vo = findProduct(p_num);
//		if (vo != null) {
//			total = total - vo.getTotalprice();
//			if (su > 0) {
//				vo.setQuant(su);
//				total = total + vo.getTotalprice();
//			} else {
//				list.remove(vo);
//			}
//		}
//		
//		//1. 카트합계금액 수정 : 기존 품목 금액 빼기
//		
//		//2. 제품 수량 변경 
//		
//		//3. 카트 합계금액 변경 : 합계금액에 변경된 품목합계금액 더하기
//		
//	}
	//제품수량 변경 처리
	public void setQuant2(String p_num, int su) {
		//0. 카트에 있는지 확인(있으면 작업하고 없으면 종료)
		ShopVO vo = findProduct(p_num);
		if(vo == null) return; //없으면 작업 끝
		
		//새로 구입할 수량과 기존에 있는 수량 계산
		int gapCnt = su - vo.getQuant();
		
		vo.setQuant(su);	//수량 변경, 품목 합계 재계산
		
		//카트 합계금액에 차이나는 금액 더하기
		total = total + (gapCnt * vo.getP_saleprice());
	}
}
