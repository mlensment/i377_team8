// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ee.itcollege.i377.entities;

import java.lang.String;

privileged aspect PiiriloiguHaldaja_Roo_ToString {
    
    public String PiiriloiguHaldaja.toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("Alates: ").append(getAlates()).append(", ");
        sb.append("Avaja: ").append(getAvaja()).append(", ");
        sb.append("Avatud: ").append(getAvatud()).append(", ");
        sb.append("Kommentaar: ").append(getKommentaar()).append(", ");
        sb.append("Kuni: ").append(getKuni()).append(", ");
        sb.append("Muudetud: ").append(getMuudetud()).append(", ");
        sb.append("Muutja: ").append(getMuutja()).append(", ");
        sb.append("PiiriloiguHaldajaId: ").append(getPiiriloiguHaldajaId()).append(", ");
        sb.append("Piiriloik: ").append(getPiiriloik()).append(", ");
        sb.append("Piiripunkt: ").append(getPiiripunkt()).append(", ");
        sb.append("Suletud: ").append(getSuletud()).append(", ");
        sb.append("Sulgeja: ").append(getSulgeja()).append(", ");
        sb.append("Vaeosa: ").append(getVaeosa()).append(", ");
        sb.append("Version: ").append(getVersion());
        return sb.toString();
    }
    
}
