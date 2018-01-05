package br.com.paulowalmeida.lojalivros.validation;

import br.com.paulowalmeida.lojalivros.model.Livro;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

public class LivroValidation implements Validator{

    @Override
    public boolean supports(Class<?> clazz) {
        return Livro.class.isAssignableFrom(clazz);
    }

    @Override
    public void validate(Object target, Errors errors) {
        ValidationUtils.rejectIfEmpty(errors, "titulo", "field.required");
        ValidationUtils.rejectIfEmpty(errors, "descricao", "field.required");
        Livro livro = (Livro) target;

        if (livro.getTotalPaginas() <= 0){
            errors.rejectValue("totalPaginas", "field.required");
        }
    }
}
