// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ee.itcollege.i377.entities;

import ee.itcollege.i377.entities.AuastmeMuutumine;
import java.lang.Integer;
import java.lang.Long;
import java.util.List;
import javax.persistence.Column;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Version;
import org.springframework.transaction.annotation.Transactional;

privileged aspect AuastmeMuutumine_Roo_Entity {
    
    @PersistenceContext
    transient EntityManager AuastmeMuutumine.entityManager;
    
    @Version
    @Column(name = "version")
    private Integer AuastmeMuutumine.version;
    
    public Integer AuastmeMuutumine.getVersion() {
        return this.version;
    }
    
    public void AuastmeMuutumine.setVersion(Integer version) {
        this.version = version;
    }
    
    @Transactional
    public void AuastmeMuutumine.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void AuastmeMuutumine.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            AuastmeMuutumine attached = AuastmeMuutumine.findAuastmeMuutumine(this.auastmeMuutumineId);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void AuastmeMuutumine.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void AuastmeMuutumine.clear() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.clear();
    }
    
    @Transactional
    public AuastmeMuutumine AuastmeMuutumine.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        AuastmeMuutumine merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
    public static final EntityManager AuastmeMuutumine.entityManager() {
        EntityManager em = new AuastmeMuutumine().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long AuastmeMuutumine.countAuastmeMuutumines() {
        return entityManager().createQuery("SELECT COUNT(o) FROM AuastmeMuutumine o", Long.class).getSingleResult();
    }
    
    public static List<AuastmeMuutumine> AuastmeMuutumine.findAllAuastmeMuutumines() {
        return entityManager().createQuery("SELECT o FROM AuastmeMuutumine o", AuastmeMuutumine.class).getResultList();
    }
    
    public static AuastmeMuutumine AuastmeMuutumine.findAuastmeMuutumine(Long auastmeMuutumineId) {
        if (auastmeMuutumineId == null) return null;
        return entityManager().find(AuastmeMuutumine.class, auastmeMuutumineId);
    }
    
    public static List<AuastmeMuutumine> AuastmeMuutumine.findAuastmeMuutumineEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM AuastmeMuutumine o", AuastmeMuutumine.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
}
