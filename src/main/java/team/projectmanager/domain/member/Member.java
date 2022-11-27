package team.projectmanager.domain.member;

import lombok.Getter;
import lombok.Setter;
import lombok.extern.slf4j.Slf4j;
import team.projectmanager.domain.memberproject.MemberProject;
import team.projectmanager.domain.position.Position;
import team.projectmanager.domain.skill.Skills;;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Entity
@Getter @Setter
@Slf4j
public class Member {

    @Id @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "member_id")
    private Long id;

    private String loginId;

    private String pw;

    @Column(name = "member_name")
    private String name;

    @Enumerated(EnumType.STRING)
    private Position position;

    private String email;

    private String gitAddress;

    private String intro;

    @ElementCollection
    @CollectionTable(name = "member_skills",
            joinColumns = @JoinColumn(name = "member_id"))
    @Enumerated(EnumType.STRING)
    private List<Skills> skills = new ArrayList<>();

    @OneToMany(mappedBy = "member")
    private List<MemberProject> memberProjects =  new ArrayList<>();

    public void removeMP(MemberProject memberProject) {
        getMemberProjects().removeIf(mp -> mp.getId().equals(memberProject.getId()));
    }

    public void addSkills(List<Skills> skillsList) {
        skillsList.forEach(s -> this.skills.add(s));
    }

    public static Member createMember(String name, String loginId, String pw, Position position, String email, String gitAddress, String intro, List<Skills> skills) {
        Member member = new Member();
        member.setName(name);
        member.setLoginId(loginId);
        member.setEmail(email);
        member.setGitAddress(gitAddress);
        member.setPw(pw);
        member.setPosition(position);
        member.addSkills(skills);
        member.setIntro(intro);

        return member;
    }
}
