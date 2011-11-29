// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ee.itcollege.i377.entities;

import ee.itcollege.i377.entities.VaeosaAlluvus;
import java.lang.Integer;
import java.lang.Long;
import java.util.List;
import javax.persistence.Column;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Version;
import org.springframework.transaction.annotation.Transactional;

privileged aspect VaeosaAlluvus_Roo_Entity {
    
    @PersistenceContext
    transient EntityManager VaeosaAlluvus.entityManager;
    
    @Version
    @Column(name = "version")
    private Integer VaeosaAlluvus.version;
    
    public Integer VaeosaAlluvus.getVersion() {
        return this.version;
    }
    
    public void VaeosaAlluvus.setVersion(Integer version) {
        this.version = version;
    }
    
    @Transactional
    public void VaeosaAlluvus.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void VaeosaAlluvus.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            VaeosaAlluvus attached = VaeosaAlluvus.findVaeosaAlluvus(this.vaeosaAlluvusId);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void VaeosaAlluvus.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void VaeosaAlluvus.clear() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.clear();
    }
    
    @Transactional
    public VaeosaAlluvus VaeosaAlluvus.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        VaeosaAlluvus merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
    public static final EntityManager VaeosaAlluvus.entityManager() {
        EntityManager em = new VaeosaAlluvus().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long VaeosaAlluvus.countVaeosaAlluvuses() {
        return entityManager().createQuery("SELECT COUNT(o) FROM VaeosaAlluvus o", Long.class).getSingleResult();
    }
    
    public static List<VaeosaAlluvus> VaeosaAlluvus.findAllVaeosaAlluvuses() {
        return entityManager().createQuery("SELECT o FROM VaeosaAlluvus o", VaeosaAlluvus.class).getResultList();
    }
    
    public static VaeosaAlluvus VaeosaAlluvus.findVaeosaAlluvus(Long vaeosaAlluvusId) {
        if (vaeosaAlluvusId == null) return null;
        return entityManager().find(VaeosaAlluvus.class, vaeosaAlluvusId);
    }
    
    public static List<VaeosaAlluvus> VaeosaAlluvus.findVaeosaAlluvusEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM VaeosaAlluvus o", VaeosaAlluvus.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
}
