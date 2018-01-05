package br.com.paulowalmeida.lojalivros.dao;

import br.com.paulowalmeida.lojalivros.model.Livro;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import java.math.BigInteger;
import java.util.List;

@Repository
@Transactional
public class LivroDAO {

    @PersistenceContext
    private EntityManager manager;

    public void adicionar(Livro novoLivro){
        this.manager.persist(novoLivro);
    }

    public List<Livro> listar() {
        return this.manager.createQuery("select l from Livro l", Livro.class).getResultList();
    }

    public void editar(Livro livro){
        this.manager.merge(livro);
    }

    public Livro pesquisar(int id){
        return this.manager.find(Livro.class, id);
    }

    @Transactional
    public void remover(int id) {
        manager.remove(pesquisar(id));
    }

}
