package ee.itcollege.i377.web;

import ee.itcollege.i377.entities.SuguluseRolliLiik;
import org.springframework.roo.addon.web.mvc.controller.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RooWebScaffold(path = "suguluserolliliiks", formBackingObject = SuguluseRolliLiik.class)
@RequestMapping("/suguluserolliliiks")
@Controller
public class SuguluseRolliLiikController {
}
