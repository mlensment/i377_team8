// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ee.itcollege.i377.web;

import ee.itcollege.i377.entities.Piirivalvur;
import ee.itcollege.i377.entities.Vahtkond;
import ee.itcollege.i377.entities.VahtkonnaLiige;
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

privileged aspect VahtkonnaLiigeController_Roo_Controller {
    
    @RequestMapping(method = RequestMethod.POST)
    public String VahtkonnaLiigeController.create(@Valid VahtkonnaLiige vahtkonnaLiige, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            uiModel.addAttribute("vahtkonnaLiige", vahtkonnaLiige);
            addDateTimeFormatPatterns(uiModel);
            return "vahtkonnaliiges/create";
        }
        uiModel.asMap().clear();
        vahtkonnaLiige.persist();
        return "redirect:/vahtkonnaliiges/" + encodeUrlPathSegment(vahtkonnaLiige.getVahtkonnaLiigeId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", method = RequestMethod.GET)
    public String VahtkonnaLiigeController.createForm(Model uiModel) {
        uiModel.addAttribute("vahtkonnaLiige", new VahtkonnaLiige());
        addDateTimeFormatPatterns(uiModel);
        return "vahtkonnaliiges/create";
    }
    
    @RequestMapping(value = "/{vahtkonnaLiigeId}", method = RequestMethod.GET)
    public String VahtkonnaLiigeController.show(@PathVariable("vahtkonnaLiigeId") Long vahtkonnaLiigeId, Model uiModel) {
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("vahtkonnaliige", VahtkonnaLiige.findVahtkonnaLiige(vahtkonnaLiigeId));
        uiModel.addAttribute("itemId", vahtkonnaLiigeId);
        return "vahtkonnaliiges/show";
    }
    
    @RequestMapping(method = RequestMethod.GET)
    public String VahtkonnaLiigeController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            uiModel.addAttribute("vahtkonnaliiges", VahtkonnaLiige.findVahtkonnaLiigeEntries(page == null ? 0 : (page.intValue() - 1) * sizeNo, sizeNo));
            float nrOfPages = (float) VahtkonnaLiige.countVahtkonnaLiiges() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("vahtkonnaliiges", VahtkonnaLiige.findAllVahtkonnaLiiges());
        }
        addDateTimeFormatPatterns(uiModel);
        return "vahtkonnaliiges/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT)
    public String VahtkonnaLiigeController.update(@Valid VahtkonnaLiige vahtkonnaLiige, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            uiModel.addAttribute("vahtkonnaLiige", vahtkonnaLiige);
            addDateTimeFormatPatterns(uiModel);
            return "vahtkonnaliiges/update";
        }
        uiModel.asMap().clear();
        vahtkonnaLiige.merge();
        return "redirect:/vahtkonnaliiges/" + encodeUrlPathSegment(vahtkonnaLiige.getVahtkonnaLiigeId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{vahtkonnaLiigeId}", params = "form", method = RequestMethod.GET)
    public String VahtkonnaLiigeController.updateForm(@PathVariable("vahtkonnaLiigeId") Long vahtkonnaLiigeId, Model uiModel) {
        uiModel.addAttribute("vahtkonnaLiige", VahtkonnaLiige.findVahtkonnaLiige(vahtkonnaLiigeId));
        addDateTimeFormatPatterns(uiModel);
        return "vahtkonnaliiges/update";
    }
    
    @RequestMapping(value = "/{vahtkonnaLiigeId}", method = RequestMethod.DELETE)
    public String VahtkonnaLiigeController.delete(@PathVariable("vahtkonnaLiigeId") Long vahtkonnaLiigeId, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        VahtkonnaLiige.findVahtkonnaLiige(vahtkonnaLiigeId).remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/vahtkonnaliiges";
    }
    
    @ModelAttribute("piirivalvurs")
    public Collection<Piirivalvur> VahtkonnaLiigeController.populatePiirivalvurs() {
        return Piirivalvur.findAllPiirivalvurs();
    }
    
    @ModelAttribute("vahtkonds")
    public Collection<Vahtkond> VahtkonnaLiigeController.populateVahtkonds() {
        return Vahtkond.findAllVahtkonds();
    }
    
    @ModelAttribute("vahtkonnaliiges")
    public Collection<VahtkonnaLiige> VahtkonnaLiigeController.populateVahtkonnaLiiges() {
        return VahtkonnaLiige.findAllVahtkonnaLiiges();
    }
    
    void VahtkonnaLiigeController.addDateTimeFormatPatterns(Model uiModel) {
        uiModel.addAttribute("vahtkonnaLiige_avatud_date_format", DateTimeFormat.patternForStyle("M-", LocaleContextHolder.getLocale()));
        uiModel.addAttribute("vahtkonnaLiige_muudetud_date_format", DateTimeFormat.patternForStyle("M-", LocaleContextHolder.getLocale()));
        uiModel.addAttribute("vahtkonnaLiige_suletud_date_format", DateTimeFormat.patternForStyle("M-", LocaleContextHolder.getLocale()));
    }
    
    String VahtkonnaLiigeController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
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