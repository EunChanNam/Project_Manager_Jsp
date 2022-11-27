package team.projectmanager.web.login;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import team.projectmanager.LoginConst;
import team.projectmanager.domain.login.LoginService;
import team.projectmanager.domain.member.Member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
@RequiredArgsConstructor
public class LoginController {

    private final LoginService loginService;

    @GetMapping("/login")
    public String loginForm(@ModelAttribute("loginForm") LoginForm loginForm, Model model,
                            @RequestParam String join) {
        if (join.equals("success")) {
            model.addAttribute("isAfterJoin", true);
        } else model.addAttribute("isAfterJoin", false);

        model.addAttribute("hasError", false);
        return "login/loginForm";
    }

    @PostMapping("/login")
    public String loginForm(@ModelAttribute LoginForm loginForm,
                            BindingResult bindingResult, HttpServletRequest request,
                            Model model) {

        Member loginMember = loginService.login(loginForm.getLoginId(), loginForm.getPw());

        if (loginMember == null) {
            model.addAttribute("hasError", true);
            return "login/loginForm";
        }

        HttpSession session = request.getSession();
        session.setAttribute(LoginConst.LOGIN_MEMBER, loginMember.getId());

        return "redirect:/";
    }
}
