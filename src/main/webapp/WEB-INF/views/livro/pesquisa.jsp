<%--
  Created by IntelliJ IDEA.
  User: weskl
  Date: 14/12/2017
  Time: 19:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Cadastrar Novo Livro</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
          integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
</head>
<body>
<div class="container col-lg-6 col-lg-offset-3">
    <div class="panel panel-info">
        <div class="panel-heading text-center"><strong>Informações do Livro</strong></div>
        <div class="panel panel-body">

            <!-- Botões -->
            <div align="center">
                <div class="btn-group" role="group" align="center" id="btn-grupo">
                    <button type="button" class="btn btn-info" onclick="location.href ='/lojalivros'">
                        <span class="glyphicon glyphicon-home"></span>
                        <strong>Home</strong>
                    </button>

                    <button type="button" class="btn btn-info"
                            onclick="location.href ='/lojalivros/livros/cadastro'">
                        <span class="glyphicon glyphicon-plus"></span>
                        <strong>Livro</strong>
                    </button>

                    <button type="button" class="btn btn-info" onclick="location.href ='/lojalivros/livros'">
                        <span class="glyphicon glyphicon-list"></span>
                        <strong>Listar</strong>
                    </button>

                </div>
            </div>

            <br>

            <div class="center-block">
                <ul class="list-group">
                    <c:if test="${livro != null}">
                        <li class="list-group-item">
                            <span class="glyphicon glyphicon-book"></span>
                            <label> Título do Livro: </label>
                            <span>${livro.titulo}</span>
                        </li>

                        <li class="list-group-item">
                            <span class="glyphicon glyphicon-pencil"></span>
                            <label> Descrição: </label>
                            <span>${livro.descricao}</span>
                        </li>

                        <li class="list-group-item">
                            <span class="glyphicon glyphicon-list-alt"></span>
                            <label>Total de Páginas: </label>
                            <span>${livro.totalPaginas}</span>
                        </li>

                        <li class="list-group-item">
                            <span class="glyphicon glyphicon-time"></span>
                            <label> Data de Lançamento: </label>
                            <span>
                            <fmt:formatDate value="${livro.dataLancamento.time}" pattern="dd/MM/yyyy"/>
                        </span>
                        </li>

                        <li class="list-group-item">
                            <span class="glyphicon glyphicon-usd"></span>
                            <label> E-Book: </label>
                            <span>${livro.precos[0].valor}</span>
                        </li>

                        <li class="list-group-item">
                            <span class="glyphicon glyphicon-usd"></span>
                            <label> Impresso:</label>
                            <span>${livro.precos[1].valor}</span>
                        </li>

                        <li class="list-group-item">
                            <span class="glyphicon glyphicon-usd"></span>
                            <label> Combo: </label>
                            <span>${livro.precos[2].valor}</span>
                        </li>
                    </c:if>

                    <c:if test="${livro == null}">
                        <li class="list-group-item text-center">
                            <label> O Livro não foi encontrado. </label>
                        </li>
                    </c:if>
                </ul>
            </div>
        </div>
    </div>
</div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
        integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
        crossorigin="anonymous"></script>
</body>
</html>