// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ee.itcollege.i377.web;

import java.io.UnsupportedEncodingException;
import java.util.Collection;

import javax.servlet.http.HttpServletRequest;

import org.joda.time.format.DateTimeFormat;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;

import ee.itcollege.i377.entities.Piiripunkt;
import ee.itcollege.i377.entities.Vaeosa;
import ee.itcollege.i377.entities.Vahtkond;
import ee.itcollege.i377.entities.VahtkondIntsidendi;
import ee.itcollege.i377.entities.VahtkonnaLiige;
import ee.itcollege.i377.entities.VahtkonndPiiriloigul;

privileged aspect VahtkondController_Roo_Controller {
    
    @RequestMapping(params = "form", method = RequestMethod.GET)
    public String VahtkondController.createForm(Model uiModel) {
        uiModel.addAttribute("vahtkond", new Vahtkond());
        addDateTimeFormatPatterns(uiModel);
        return "vahtkonds/create";
    }
    
    @RequestMapping(value = "/{vahtkondId}", method = RequestMethod.GET)
    public String VahtkondController.show(@PathVariable("vahtkondId") Long vahtkondId, Model uiModel) {
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("vahtkond", Vahtkond.findVahtkond(vahtkondId));
        uiModel.addAttribute("itemId", vahtkondId);
        return "vahtkonds/show";
    }
    
    @RequestMapping(method = RequestMethod.GET)
    public String VahtkondController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            uiModel.addAttribute("vahtkonds", Vahtkond.findVahtkondEntries(page == null ? 0 : (page.intValue() - 1) * sizeNo, sizeNo));
            float nrOfPages = (float) Vahtkond.countVahtkonds() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("vahtkonds", Vahtkond.findAllVahtkonds());
        }
        addDateTimeFormatPatterns(uiModel);
        return "vahtkonds/list";
    }
    
    @RequestMapping(value = "/{vahtkondId}", params = "form", method = RequestMethod.GET)
    public String VahtkondController.updateForm(@PathVariable("vahtkondId") Long vahtkondId, Model uiModel) {
        uiModel.addAttribute("vahtkond", Vahtkond.findVahtkond(vahtkondId));
        addDateTimeFormatPatterns(uiModel);
        return "vahtkonds/update";
    }
       
    @ModelAttribute("piiripunkts")
    public Collection<Piiripunkt> VahtkondController.populatePiiripunkts() {
        return Piiripunkt.findAllPiiripunkts();
    }
    
    @ModelAttribute("vaeosas")
    public Collection<Vaeosa> VahtkondController.populateVaeosas() {
        return Vaeosa.findAllVaeosas();
    }
    
    @ModelAttribute("vahtkonds")
    public Collection<Vahtkond> VahtkondController.populateVahtkonds() {
        return Vahtkond.findAllVahtkonds();
    }
    
    @ModelAttribute("vahtkondintsidendis")
    public Collection<VahtkondIntsidendi> VahtkondController.populateVahtkondIntsidendis() {
        return VahtkondIntsidendi.findAllVahtkondIntsidendis();
    }
    
    @ModelAttribute("vahtkonnaliiges")
    public Collection<VahtkonnaLiige> VahtkondController.populateVahtkonnaLiiges() {
        return VahtkonnaLiige.findAllVahtkonnaLiiges();
    }
    
    @ModelAttribute("vahtkonndpiiriloiguls")
    public Collection<VahtkonndPiiriloigul> VahtkondController.populateVahtkonndPiiriloiguls() {
        return VahtkonndPiiriloigul.findAllVahtkonndPiiriloiguls();
    }
    
    void VahtkondController.addDateTimeFormatPatterns(Model uiModel) {
        uiModel.addAttribute("vahtkond_alates_date_format", DateTimeFormat.patternForStyle("M-", LocaleContextHolder.getLocale()));
        uiModel.addAttribute("vahtkond_avatud_date_format", DateTimeFormat.patternForStyle("M-", LocaleContextHolder.getLocale()));
        uiModel.addAttribute("vahtkond_kuni_date_format", DateTimeFormat.patternForStyle("M-", LocaleContextHolder.getLocale()));
        uiModel.addAttribute("vahtkond_muudetud_date_format", DateTimeFormat.patternForStyle("M-", LocaleContextHolder.getLocale()));
        uiModel.addAttribute("vahtkond_suletud_date_format", DateTimeFormat.patternForStyle("M-", LocaleContextHolder.getLocale()));
    }
    
    String VahtkondController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
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
