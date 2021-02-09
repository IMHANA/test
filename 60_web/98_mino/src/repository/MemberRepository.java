package repository;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import domain.Member;

public interface MemberRepository {	//실제 데이터 보관장소

	void addMember(Member member);
	
	Member findByMember(Member member) throws Exception;
	
	Member findById(String id);
	
	public List<String> findIdAll();
}
