// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ee.itcollege.i377.entities;

import ee.itcollege.i377.entities.SeotudKontaktisik;
import java.lang.Integer;
import java.lang.Long;
import java.util.List;
import javax.persistence.Column;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Version;
import org.springframework.transaction.annotation.Transactional;

privileged aspect SeotudKontaktisik_Roo_Entity {
    
    @PersistenceContext
    transient EntityManager SeotudKontaktisik.entityManager;
    
    @Version
    @Column(name = "version")
    private Integer SeotudKontaktisik.version;
    
    public Integer SeotudKontaktisik.getVersion() {
        return this.version;
    }
    
    public void SeotudKontaktisik.setVersion(Integer version) {
        this.version = version;
    }
    
    @Transactional
    public void SeotudKontaktisik.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void SeotudKontaktisik.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            SeotudKontaktisik attached = SeotudKontaktisik.findSeotudKontaktisik(this.piirivalvuriKontaktId);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void SeotudKontaktisik.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void SeotudKontaktisik.clear() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.clear();
    }
    
    @Transactional
    public SeotudKontaktisik SeotudKontaktisik.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        SeotudKontaktisik merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
    public static final EntityManager SeotudKontaktisik.entityManager() {
        EntityManager em = new SeotudKontaktisik().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long SeotudKontaktisik.countSeotudKontaktisiks() {
        return entityManager().createQuery("SELECT COUNT(o) FROM SeotudKontaktisik o", Long.class).getSingleResult();
    }
    
    public static List<SeotudKontaktisik> SeotudKontaktisik.findAllSeotudKontaktisiks() {
        return entityManager().createQuery("SELECT o FROM SeotudKontaktisik o", SeotudKontaktisik.class).getResultList();
    }
    
    public static SeotudKontaktisik SeotudKontaktisik.findSeotudKontaktisik(Long piirivalvuriKontaktId) {
        if (piirivalvuriKontaktId == null) return null;
        return entityManager().find(SeotudKontaktisik.class, piirivalvuriKontaktId);
    }
    
    public static List<SeotudKontaktisik> SeotudKontaktisik.findSeotudKontaktisikEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM SeotudKontaktisik o", SeotudKontaktisik.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
}
