// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ee.itcollege.i377.web;

import ee.itcollege.i377.entities.Kodakondsus;
import ee.itcollege.i377.entities.Riik;
import java.io.UnsupportedEncodingException;
import java.lang.Integer;
import java.lang.Long;
import java.lang.String;
import java.util.Collection;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.joda.time.format.DateTimeFormat;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;

privileged aspect RiikController_Roo_Controller {
    
    @RequestMapping(method = RequestMethod.POST)
    public String RiikController.create(@Valid Riik riik, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            uiModel.addAttribute("riik", riik);
            addDateTimeFormatPatterns(uiModel);
            return "riiks/create";
        }
        uiModel.asMap().clear();
        riik.persist();
        return "redirect:/riiks/" + encodeUrlPathSegment(riik.getRiikId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", method = RequestMethod.GET)
    public String RiikController.createForm(Model uiModel) {
        uiModel.addAttribute("riik", new Riik());
        addDateTimeFormatPatterns(uiModel);
        return "riiks/create";
    }
    
    @RequestMapping(value = "/{riikId}", method = RequestMethod.GET)
    public String RiikController.show(@PathVariable("riikId") Long riikId, Model uiModel) {
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("riik", Riik.findRiik(riikId));
        uiModel.addAttribute("itemId", riikId);
        return "riiks/show";
    }
    
    @RequestMapping(method = RequestMethod.GET)
    public String RiikController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            uiModel.addAttribute("riiks", Riik.findRiikEntries(page == null ? 0 : (page.intValue() - 1) * sizeNo, sizeNo));
            float nrOfPages = (float) Riik.countRiiks() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("riiks", Riik.findAllRiiks());
        }
        addDateTimeFormatPatterns(uiModel);
        return "riiks/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT)
    public String RiikController.update(@Valid Riik riik, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            uiModel.addAttribute("riik", riik);
            addDateTimeFormatPatterns(uiModel);
            return "riiks/update";
        }
        uiModel.asMap().clear();
        riik.merge();
        return "redirect:/riiks/" + encodeUrlPathSegment(riik.getRiikId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{riikId}", params = "form", method = RequestMethod.GET)
    public String RiikController.updateForm(@PathVariable("riikId") Long riikId, Model uiModel) {
        uiModel.addAttribute("riik", Riik.findRiik(riikId));
        addDateTimeFormatPatterns(uiModel);
        return "riiks/update";
    }
    
    @RequestMapping(value = "/{riikId}", method = RequestMethod.DELETE)
    public String RiikController.delete(@PathVariable("riikId") Long riikId, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        Riik.findRiik(riikId).remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/riiks";
    }
    
    @ModelAttribute("kodakondsuses")
    public Collection<Kodakondsus> RiikController.populateKodakondsuses() {
        return Kodakondsus.findAllKodakondsuses();
    }
    
    @ModelAttribute("riiks")
    public Collection<Riik> RiikController.populateRiiks() {
        return Riik.findAllRiiks();
    }
    
    void RiikController.addDateTimeFormatPatterns(Model uiModel) {
        uiModel.addAttribute("riik_avatud_date_format", DateTimeFormat.patternForStyle("M-", LocaleContextHolder.getLocale()));
        uiModel.addAttribute("riik_muudetud_date_format", DateTimeFormat.patternForStyle("M-", LocaleContextHolder.getLocale()));
        uiModel.addAttribute("riik_suletud_date_format", DateTimeFormat.patternForStyle("M-", LocaleContextHolder.getLocale()));
    }
    
    String RiikController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
        String enc = httpServletRequest.getCharacterEncoding();
        if (enc == null) {
            enc = WebUtils.DEFAULT_CHARACTER_ENCODING;
        }
        try {
            pathSegment = UriUtils.encodePathSegment(pathSegment, enc);
        }
        catch (UnsupportedEncodingException uee) {}
        return pathSegment;
    }
    
}
