package kr.co.mis.systemmisproject.mushroom;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.server.adapter.ForwardedHeaderTransformer;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.View;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.mvc.ServletForwardingController;
import org.springframework.web.servlet.view.RedirectView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@RestController()
@RequestMapping("/mushroom")
public class MushroomController {
    @Autowired
    private MushroomService mushroomService;

    @GetMapping
    public ModelAndView main() {
        return new ModelAndView("mushroom/main");
    }

    @GetMapping("/view")
    public ModelAndView view() {
        return new ModelAndView("mushroom/view");
    }


    @GetMapping(consumes = MediaType.APPLICATION_JSON_VALUE)
    public Mushroom viewMushroom(Mushroom mushroom) {
        return mushroomService.selectOne(mushroom);
    }
}
