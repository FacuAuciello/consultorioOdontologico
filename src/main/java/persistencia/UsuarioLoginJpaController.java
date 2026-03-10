
package persistencia;

import Entidades.UsuarioLogin;
import java.io.Serializable;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Query;
import javax.persistence.EntityNotFoundException;
import javax.persistence.Persistence;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import persistencia.exceptions.NonexistentEntityException;

public class UsuarioLoginJpaController implements Serializable {

    public UsuarioLoginJpaController(EntityManagerFactory emf) {
        this.emf = emf;
    }
    private EntityManagerFactory emf = null;

    public EntityManager getEntityManager() {
        return emf.createEntityManager();
    }
    
    public UsuarioLoginJpaController() {
        emf = Persistence.createEntityManagerFactory("consultorioOdontologicoPU");

    }

    public void create(UsuarioLogin usuarioLogin) {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            em.persist(usuarioLogin);
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void edit(UsuarioLogin usuarioLogin) throws NonexistentEntityException, Exception {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            usuarioLogin = em.merge(usuarioLogin);
            em.getTransaction().commit();
        } catch (Exception ex) {
            String msg = ex.getLocalizedMessage();
            if (msg == null || msg.length() == 0) {
                int id = usuarioLogin.getId();
                if (findUsuarioLogin(id) == null) {
                    throw new NonexistentEntityException("The usuarioLogin with id " + id + " no longer exists.");
                }
            }
            throw ex;
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void destroy(int id) throws NonexistentEntityException {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            UsuarioLogin usuarioLogin;
            try {
                usuarioLogin = em.getReference(UsuarioLogin.class, id);
                usuarioLogin.getId();
            } catch (EntityNotFoundException enfe) {
                throw new NonexistentEntityException("The usuarioLogin with id " + id + " no longer exists.", enfe);
            }
            em.remove(usuarioLogin);
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public List<UsuarioLogin> findUsuarioLoginEntities() {
        return findUsuarioLoginEntities(true, -1, -1);
    }

    public List<UsuarioLogin> findUsuarioLoginEntities(int maxResults, int firstResult) {
        return findUsuarioLoginEntities(false, maxResults, firstResult);
    }

    private List<UsuarioLogin> findUsuarioLoginEntities(boolean all, int maxResults, int firstResult) {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            cq.select(cq.from(UsuarioLogin.class));
            Query q = em.createQuery(cq);
            if (!all) {
                q.setMaxResults(maxResults);
                q.setFirstResult(firstResult);
            }
            return q.getResultList();
        } finally {
            em.close();
        }
    }

    public UsuarioLogin findUsuarioLogin(int id) {
        EntityManager em = getEntityManager();
        try {
            return em.find(UsuarioLogin.class, id);
        } finally {
            em.close();
        }
    }

    public int getUsuarioLoginCount() {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            Root<UsuarioLogin> rt = cq.from(UsuarioLogin.class);
            cq.select(em.getCriteriaBuilder().count(rt));
            Query q = em.createQuery(cq);
            return ((Long) q.getSingleResult()).intValue();
        } finally {
            em.close();
        }
    }
    
}
