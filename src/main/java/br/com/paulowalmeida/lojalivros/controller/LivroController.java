package br.com.paulowalmeida.lojalivros.controller;

import br.com.paulowalmeida.lojalivros.dao.LivroDAO;
import br.com.paulowalmeida.lojalivros.model.Livro;
import br.com.paulowalmeida.lojalivros.model.TipoPreco;
import br.com.paulowalmeida.lojalivros.validation.LivroValidation;
import com.sun.java.swing.plaf.motif.resources.motif_de;
import org.hibernate.annotations.Parameter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Errors;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.persistence.criteria.CriteriaBuilder;
import javax.validation.Valid;
import java.math.BigDecimal;
import java.math.BigInteger;
import java.util.GregorianCalendar;
import java.util.IntSummaryStatistics;
import java.util.List;
import java.util.TimeZone;

@Controller
@RequestMapping("/livros")
public class LivroController {

    @Autowired
    private LivroDAO livroDAO;

    @InitBinder
    public void initBinder(WebDataBinder dataBinder) {
        dataBinder.addValidators(new LivroValidation());
    }

    @GetMapping("/cadastro")
    public ModelAndView cadastrarLivro(Livro livro) {
        ModelAndView modelAndView = new ModelAndView("livro/formulario");
        modelAndView.addObject("tipos", TipoPreco.values());
        return modelAndView;
    }

    @PostMapping
    public ModelAndView adicionar(@Valid Livro livro, BindingResult result, RedirectAttributes attributes) {
        if (result.hasErrors()) {
            return cadastrarLivro(livro);
        }

        this.livroDAO.adicionar(livro);
        attributes.addFlashAttribute("sucesso", "Livro cadastrado com sucesso!");
        return new ModelAndView("redirect:/livros");
    }

    @GetMapping
    public ModelAndView listar() {
        List<Livro> livros = this.livroDAO.listar();
        ModelAndView modelAndView = new ModelAndView("/livro/lista");
        modelAndView.addObject("livros", livros);
        return modelAndView;
    }

    @RequestMapping("/remove/{id}")
    public ModelAndView remover(@PathVariable int id, RedirectAttributes attributes) {
        this.livroDAO.remover(id);
        attributes.addFlashAttribute("sucesso", "Registro apagado!");
        return new ModelAndView("redirect:/livros");
    }

    @PostMapping("/pesquisa")
    public ModelAndView pesquisar(String titulo) {
        List<Livro> livros = this.livroDAO.listar();
        Livro livro = null;
        ModelAndView modelAndView = null;

        for (int i = 0; i < livros.size(); i++) {
            if (livros.get(i).getTitulo().equals(titulo)) {
                livro = this.livroDAO.pesquisar(livros.get(i).getId());
            }
        }
        modelAndView = new ModelAndView("/livro/pesquisa");
        modelAndView.addObject("livro", livro);
        return modelAndView;
    }
}