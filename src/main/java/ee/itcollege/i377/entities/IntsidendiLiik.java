package ee.itcollege.i377.entities;

import java.io.Serializable;
import java.util.Date;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.roo.addon.entity.RooEntity;
import org.springframework.roo.addon.tostring.RooToString;


/**
 * The persistent class for the INTSIDENDI_LIIK database table.
 * 
 */
@Entity
@RooToString
@RooEntity
@Table(name="INTSIDENDI_LIIK")
public class IntsidendiLiik implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name="INTSIDENDI_LIIK_ID")
	private Long intsidendiLiikId;

	private String avaja;

    @Temporal( TemporalType.DATE)
    @DateTimeFormat(style="M-")
	private Date avatud; // ok

	private String kommentaar;

	private String kood;

    @Temporal( TemporalType.DATE)
    @DateTimeFormat(style="M-")
	private Date muudetud; // ok

	private String muutja;

	private String nimetus;

    @Temporal( TemporalType.DATE)
    @DateTimeFormat(style="M-")
	private Date suletud; // ok

	private String sulgeja;

	//bi-directional many-to-one association to Intsident
	@OneToMany(mappedBy="intsidendiLiik")
	private Set<Intsident> intsidents;

    public IntsidendiLiik() {
    }

	public Long getIntsidendiLiikId() {
		return this.intsidendiLiikId;
	}

	public void setIntsidendiLiikId(Long intsidendiLiikId) {
		this.intsidendiLiikId = intsidendiLiikId;
	}

	public String getAvaja() {
		return this.avaja;
	}

	public void setAvaja(String avaja) {
		this.avaja = avaja;
	}

	public Date getAvatud() {
		return this.avatud;
	}

	public void setAvatud(Date avatud) {
		this.avatud = avatud;
	}

	public String getKommentaar() {
		return this.kommentaar;
	}

	public void setKommentaar(String kommentaar) {
		this.kommentaar = kommentaar;
	}

	public String getKood() {
		return this.kood;
	}

	public void setKood(String kood) {
		this.kood = kood;
	}

	public Date getMuudetud() {
		return this.muudetud;
	}

	public void setMuudetud(Date muudetud) {
		this.muudetud = muudetud;
	}

	public String getMuutja() {
		return this.muutja;
	}

	public void setMuutja(String muutja) {
		this.muutja = muutja;
	}

	public String getNimetus() {
		return this.nimetus;
	}

	public void setNimetus(String nimetus) {
		this.nimetus = nimetus;
	}

	public Date getSuletud() {
		return this.suletud;
	}

	public void setSuletud(Date suletud) {
		this.suletud = suletud;
	}

	public String getSulgeja() {
		return this.sulgeja;
	}

	public void setSulgeja(String sulgeja) {
		this.sulgeja = sulgeja;
	}

	public Set<Intsident> getIntsidents() {
		return this.intsidents;
	}

	public void setIntsidents(Set<Intsident> intsidents) {
		this.intsidents = intsidents;
	}
	
}
