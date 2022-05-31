package kr.co.mis.systemmisproject.mushroom;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@RestController
@RequestMapping("/mushroom")
public class MushroomController {
    @GetMapping
    public ModelAndView main() {
        return new ModelAndView("mushroom/main");
    }
}
