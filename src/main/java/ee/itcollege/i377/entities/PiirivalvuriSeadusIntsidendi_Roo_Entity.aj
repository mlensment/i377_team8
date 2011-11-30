// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ee.itcollege.i377.entities;

import ee.itcollege.i377.entities.PiirivalvuriSeadusIntsidendi;
import java.lang.Integer;
import java.lang.Long;
import java.util.List;
import javax.persistence.Column;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Version;
import org.springframework.transaction.annotation.Transactional;

privileged aspect PiirivalvuriSeadusIntsidendi_Roo_Entity {
    
    @PersistenceContext
    transient EntityManager PiirivalvuriSeadusIntsidendi.entityManager;
    
    @Version
    @Column(name = "version")
    private Integer PiirivalvuriSeadusIntsidendi.version;
    
    public Integer PiirivalvuriSeadusIntsidendi.getVersion() {
        return this.version;
    }
    
    public void PiirivalvuriSeadusIntsidendi.setVersion(Integer version) {
        this.version = version;
    }
    
    @Transactional
    public void PiirivalvuriSeadusIntsidendi.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void PiirivalvuriSeadusIntsidendi.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            PiirivalvuriSeadusIntsidendi attached = PiirivalvuriSeadusIntsidendi.findPiirivalvuriSeadusIntsidendi(this.piirivalvuriSeadusIntsidendi);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void PiirivalvuriSeadusIntsidendi.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void PiirivalvuriSeadusIntsidendi.clear() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.clear();
    }
    
    @Transactional
    public PiirivalvuriSeadusIntsidendi PiirivalvuriSeadusIntsidendi.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        PiirivalvuriSeadusIntsidendi merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
    public static final EntityManager PiirivalvuriSeadusIntsidendi.entityManager() {
        EntityManager em = new PiirivalvuriSeadusIntsidendi().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long PiirivalvuriSeadusIntsidendi.countPiirivalvuriSeadusIntsidendis() {
        return entityManager().createQuery("SELECT COUNT(o) FROM PiirivalvuriSeadusIntsidendi o", Long.class).getSingleResult();
    }
    
    public static List<PiirivalvuriSeadusIntsidendi> PiirivalvuriSeadusIntsidendi.findAllPiirivalvuriSeadusIntsidendis() {
        return entityManager().createQuery("SELECT o FROM PiirivalvuriSeadusIntsidendi o", PiirivalvuriSeadusIntsidendi.class).getResultList();
    }
    
    public static PiirivalvuriSeadusIntsidendi PiirivalvuriSeadusIntsidendi.findPiirivalvuriSeadusIntsidendi(Long piirivalvuriSeadusIntsidendi) {
        if (piirivalvuriSeadusIntsidendi == null) return null;
        return entityManager().find(PiirivalvuriSeadusIntsidendi.class, piirivalvuriSeadusIntsidendi);
    }
    
    public static List<PiirivalvuriSeadusIntsidendi> PiirivalvuriSeadusIntsidendi.findPiirivalvuriSeadusIntsidendiEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM PiirivalvuriSeadusIntsidendi o", PiirivalvuriSeadusIntsidendi.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
}