package kr.co.mis.systemmisproject.mushroom;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;

@RestController()
@RequestMapping("/mushroom")
public class MushroomController {
    @Autowired
    private MushroomService mushroomService;

    @GetMapping
    public ModelAndView main() {
        return new ModelAndView("mushroom/main");
    }

    @GetMapping(consumes = MediaType.APPLICATION_JSON_VALUE)
    public ModelAndView viewMushroom(Mushroom mushroom) {
        System.out.println(mushroom.getName());
        ModelAndView mov = new ModelAndView("mushroom/view");

        Mushroom row = mushroomService.selectOne(mushroom);

        mov.addObject("row", row);

        return mov;
    }
}
