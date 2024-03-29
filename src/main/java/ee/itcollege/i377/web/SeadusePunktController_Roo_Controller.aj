// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ee.itcollege.i377.web;

import ee.itcollege.i377.entities.IsikuSeadusIntsidendi;
import ee.itcollege.i377.entities.ObjektiSeadusIntsidendi;
import ee.itcollege.i377.entities.PiirivalvuriSeadusIntsidendi;
import ee.itcollege.i377.entities.Seadus;
import ee.itcollege.i377.entities.SeadusePunkt;
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

privileged aspect SeadusePunktController_Roo_Controller {
    
    @RequestMapping(method = RequestMethod.POST)
    public String SeadusePunktController.create(@Valid SeadusePunkt seadusePunkt, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            uiModel.addAttribute("seadusePunkt", seadusePunkt);
            addDateTimeFormatPatterns(uiModel);
            return "seadusepunkts/create";
        }
        uiModel.asMap().clear();
        seadusePunkt.persist();
        return "redirect:/seadusepunkts/" + encodeUrlPathSegment(seadusePunkt.getSeadusePunktId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", method = RequestMethod.GET)
    public String SeadusePunktController.createForm(Model uiModel) {
        uiModel.addAttribute("seadusePunkt", new SeadusePunkt());
        addDateTimeFormatPatterns(uiModel);
        return "seadusepunkts/create";
    }
    
    @RequestMapping(value = "/{seadusePunktId}", method = RequestMethod.GET)
    public String SeadusePunktController.show(@PathVariable("seadusePunktId") Long seadusePunktId, Model uiModel) {
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("seadusepunkt", SeadusePunkt.findSeadusePunkt(seadusePunktId));
        uiModel.addAttribute("itemId", seadusePunktId);
        return "seadusepunkts/show";
    }
    
    @RequestMapping(method = RequestMethod.GET)
    public String SeadusePunktController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            uiModel.addAttribute("seadusepunkts", SeadusePunkt.findSeadusePunktEntries(page == null ? 0 : (page.intValue() - 1) * sizeNo, sizeNo));
            float nrOfPages = (float) SeadusePunkt.countSeadusePunkts() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("seadusepunkts", SeadusePunkt.findAllSeadusePunkts());
        }
        addDateTimeFormatPatterns(uiModel);
        return "seadusepunkts/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT)
    public String SeadusePunktController.update(@Valid SeadusePunkt seadusePunkt, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            uiModel.addAttribute("seadusePunkt", seadusePunkt);
            addDateTimeFormatPatterns(uiModel);
            return "seadusepunkts/update";
        }
        uiModel.asMap().clear();
        seadusePunkt.merge();
        return "redirect:/seadusepunkts/" + encodeUrlPathSegment(seadusePunkt.getSeadusePunktId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{seadusePunktId}", params = "form", method = RequestMethod.GET)
    public String SeadusePunktController.updateForm(@PathVariable("seadusePunktId") Long seadusePunktId, Model uiModel) {
        uiModel.addAttribute("seadusePunkt", SeadusePunkt.findSeadusePunkt(seadusePunktId));
        addDateTimeFormatPatterns(uiModel);
        return "seadusepunkts/update";
    }
    
    @RequestMapping(value = "/{seadusePunktId}", method = RequestMethod.DELETE)
    public String SeadusePunktController.delete(@PathVariable("seadusePunktId") Long seadusePunktId, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        SeadusePunkt.findSeadusePunkt(seadusePunktId).remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/seadusepunkts";
    }
    
    @ModelAttribute("isikuseadusintsidendis")
    public Collection<IsikuSeadusIntsidendi> SeadusePunktController.populateIsikuSeadusIntsidendis() {
        return IsikuSeadusIntsidendi.findAllIsikuSeadusIntsidendis();
    }
    
    @ModelAttribute("objektiseadusintsidendis")
    public Collection<ObjektiSeadusIntsidendi> SeadusePunktController.populateObjektiSeadusIntsidendis() {
        return ObjektiSeadusIntsidendi.findAllObjektiSeadusIntsidendis();
    }
    
    @ModelAttribute("piirivalvuriseadusintsidendis")
    public Collection<PiirivalvuriSeadusIntsidendi> SeadusePunktController.populatePiirivalvuriSeadusIntsidendis() {
        return PiirivalvuriSeadusIntsidendi.findAllPiirivalvuriSeadusIntsidendis();
    }
    
    @ModelAttribute("seaduses")
    public Collection<Seadus> SeadusePunktController.populateSeaduses() {
        return Seadus.findAllSeaduses();
    }
    
    @ModelAttribute("seadusepunkts")
    public Collection<SeadusePunkt> SeadusePunktController.populateSeadusePunkts() {
        return SeadusePunkt.findAllSeadusePunkts();
    }
    
    void SeadusePunktController.addDateTimeFormatPatterns(Model uiModel) {
        uiModel.addAttribute("seadusePunkt_avatud_date_format", DateTimeFormat.patternForStyle("M-", LocaleContextHolder.getLocale()));
        uiModel.addAttribute("seadusePunkt_muudetud_date_format", DateTimeFormat.patternForStyle("M-", LocaleContextHolder.getLocale()));
        uiModel.addAttribute("seadusePunkt_suletud_date_format", DateTimeFormat.patternForStyle("M-", LocaleContextHolder.getLocale()));
    }
    
    String SeadusePunktController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
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
