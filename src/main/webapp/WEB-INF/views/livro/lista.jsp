<%--
  Created by IntelliJ IDEA.
  User: weskl
  Date: 20/12/2017
  Time: 18:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html lang="pt-br">
<head>

    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Livros Cadastrados</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
          integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
</head>
<body>
<div class="container col-lg-10 col-lg-offset-1">
    <div class="panel panel-info">
        <div class="panel-heading panel-fixed-top" align="center"><strong>Livros Cadastrados</strong>
            <div class="center-block">${sucesso}</div>
        </div>

        <div class="panel panel-body">
            <div class="container-fluid">
                <div align="center">
                    <div class="btn-group" role="group">

                        <button type="button" class="btn btn-info" onclick="location.href = '/lojalivros'">
                            <span class="glyphicon glyphicon-home"></span> Home
                        </button>

                        <button type="button" class="btn btn-info"
                                onclick="location.href ='/lojalivros/livros/cadastro'">
                            <span class="glyphicon glyphicon-plus"></span> Livro
                        </button>
                    </div>
                </div>

                <br>
                <div class="container-fluid">
                    <div class="col-lg-6 col-lg-offset-3" align="center">
                        <form action="/lojalivros/livros/pesquisa" method="POST" class="text-right">
                            <div class="input-group">
                                <input type="text" class="form-control" name="titulo" placeholder="Título do Livro">
                                <span class="input-group-btn">
                                    <button class="btn btn-info" type="submit">
                                        <span class="glyphicon glyphicon-search"></span>
                                    </button>
                                </span>
                            </div>
                        </form>
                    </div>
                </div>
            </div>

            <br>

            <!-- Table -->
            <div class="table-responsive">
                <table class="table" align="center">
                    <thead>
                    <tr>
                        <th class="text-center"><strong>#</strong></th>
                        <th class="text-center"><strong>Título</strong></th>
                        <th class="text-center"><strong>Descrição</strong></th>
                        <th class="text-center"><strong>Total de Páginas</strong></th>
                        <th class="text-center"><strong>Lançamento</strong></th>
                        <th class="text-center"><strong>E-Book</strong></th>
                        <th class="text-center"><strong>Impresso</strong></th>
                        <th class="text-center"><strong>Combo</strong></th>
                    </tr>
                    </thead>

                    <tbody>
                    <c:forEach items="${livros}" var="livro">
                        <tr class="text-center">
                            <td>${livro.id}</td>
                            <td>${livro.titulo}</td>
                            <td>${livro.descricao}</td>
                            <td>${livro.totalPaginas}</td>
                            <td><fmt:formatDate value="${livro.dataLancamento.time}" pattern="dd/MM/yyyy"/></td>
                            <td><strong>R$</strong> ${livro.precos[0].valor}</td>
                            <td><strong>R$</strong> ${livro.precos[1].valor}</td>
                            <td><strong>R$</strong> ${livro.precos[2].valor}</td>
                            <td>
                                <button type="button" class="btn btn-xs btn-danger"
                                        onclick="location.href='${pageContext.request.contextPath}/livros/remove/${livro.id}'">
                                    <span class="glyphicon glyphicon-remove"></span>
                                </button>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
            integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
            crossorigin="anonymous"></script>
</body>
</html>