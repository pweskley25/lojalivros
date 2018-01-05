package br.com.paulowalmeida.lojalivros.model;

import org.hibernate.annotations.LazyCollection;
import org.hibernate.annotations.LazyCollectionOption;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import java.math.BigInteger;
import java.util.Calendar;
import java.util.List;

@Entity
@Table(name = "Livro")
public class Livro {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column
    private String titulo;

    @Lob
    @Column
    private String descricao;

    @Column
    private int totalPaginas;

    @DateTimeFormat
    @Column
    private Calendar dataLancamento;

    @ElementCollection
    @LazyCollection(value = LazyCollectionOption.FALSE)
    private List<Preco> precos;

    public int getId() {
        return this.id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitulo() {
        return this.titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public String getDescricao() {
        return this.descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

    public int getTotalPaginas() {
        return this.totalPaginas;
    }

    public void setTotalPaginas(int totalPaginas) {
        this.totalPaginas = totalPaginas;
    }

    public List<Preco> getPrecos() {
        return this.precos;
    }

    public void setPrecos(List<Preco> precos) {
        this.precos = precos;
    }

    public Calendar getDataLancamento() {
        return dataLancamento;
    }

    public void setDataLancamento(Calendar dataLancamento) {
        this.dataLancamento = dataLancamento;
    }

    @Override
    public String toString(){
        return "Titulo: " + this.getTitulo() +
               "\n º Descrição: " + this.getDescricao() +
               "\n º Total de Páginas: " + this.getTotalPaginas() +
               "\n Preços: " +
               "\n  º Ebook: " + this.getPrecos().get(0).getValor() +
               "\n  º Impresso: " + this.getPrecos().get(1).getValor() +
               "\n  º Combo: " + this.getPrecos().get(2).getValor();
    }
}
