package team.projectmanager.domain.member.memberservice;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import team.projectmanager.domain.member.Member;
import team.projectmanager.domain.member.memberrepository.MemberRepository;

import java.util.List;

@Service
@RequiredArgsConstructor
@Transactional
public class MemberServiceImp implements MemberService{

    private final MemberRepository memberRepository;

    public void join(Member member) {
        memberRepository.save(member);
    }

    public Member findById(Long id) {
        return memberRepository.findById(id);
    }

    public List<Member> findMembers() {
        return memberRepository.findAll();
    }
}
