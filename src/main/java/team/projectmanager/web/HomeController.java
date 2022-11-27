package team.projectmanager.web;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.SessionAttribute;
import team.projectmanager.LoginConst;
import team.projectmanager.domain.member.Member;
import team.projectmanager.domain.member.memberservice.MemberService;
import team.projectmanager.domain.memberproject.MemberProject;
import team.projectmanager.domain.memberproject.mprepository.MemberProjectRepository;
import team.projectmanager.domain.project.Project;
import team.projectmanager.domain.project.ProjectStatus;
import team.projectmanager.domain.project.projectservice.ProjectService;

import java.util.List;

@Controller
@RequiredArgsConstructor
@Slf4j
public class HomeController {

    private final MemberService memberService;
    private final MemberProjectRepository mpr;
    private final ProjectService ps;

        @GetMapping("/")
    public String home(@SessionAttribute(name = LoginConst.LOGIN_MEMBER, required = false) Long memberId,
                       Model model) {

        if (memberId == null) {
            return "redirect:/login";
        }

        Member member = memberService.findById(memberId);
        MemberProject ingMP = mpr.findMPByStatus(memberId, ProjectStatus.ING);
        MemberProject finMP = mpr.findMPByStatus(memberId, ProjectStatus.FIN);
        MemberProject collectMP = mpr.findMPByStatus(memberId, ProjectStatus.COLLECT);

        List<Project> collectProjects = ps.findByStatus(ProjectStatus.COLLECT);

        log.info("size = {}", collectProjects.size());

        model.addAttribute("member", member);
        model.addAttribute("ingMP", ingMP);
        model.addAttribute("finMP", finMP);
        model.addAttribute("collectMP", collectMP);
        model.addAttribute("projects", collectProjects);

        return "home";
    }
}
