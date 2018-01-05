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
        <div class="panel-heading text-center"><strong>Cadastar um Novo Livro</strong></div>
        <div class="panel panel-body">
            <form:form action="${s:mvcUrl('LC#adicionar').build()}" modelAttribute="livro" method="POST">

                <!-- Botões -->
                <div class="text-right">
                    <div class="btn-group" role="group" align="center" id="btn-grupo">
                        <button type="button" class="btn btn-info" onclick="location.href ='/lojalivros'">
                            <span class="glyphicon glyphicon-home"></span> Home
                        </button>

                        <button type="button" class="btn btn-info" onclick="location.href ='/lojalivros/livros'">
                            <span class="glyphicon glyphicon-list"></span> Listar
                        </button>
                    </div>
                </div>
                <br>

                <!-- Campo do titulo com o icone e verificação de erro -->
                <div class="form-group">
                    <div class="inputGroupContainer">
                        <div class="input-group">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-book"></i></span>
                            <form:input cssClass="form-control" placeholder="Título do Livro" path="titulo"/>
                        </div>
                    </div>
                </div>

                <form:errors path="titulo">
                    <div class="alert alert-warning alert-dismissible" role="alert">
                        <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span
                                aria-hidden="true">&times;</span></button>
                        <strong>Atenção!</strong> Falta o título.
                    </div>
                </form:errors>

                <!-- Campo da descrição com o icone e verificação de erro -->
                <div class="form-group">
                    <div class="inputGroupContainer">
                        <div class="input-group">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-pencil"></i></span>
                            <form:textarea cssClass="form-control" resize="none"
                                           placeholder="Descreva brevemente o Livro" path="descricao" rows="3"
                                           cols="6"/>
                        </div>
                    </div>
                </div>

                <form:errors path="descricao">
                    <div class="alert alert-warning alert-dismissible" role="alert">
                        <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span
                                aria-hidden="true">&times;</span></button>
                        <strong>Atenção!</strong> A descrição está vazia.
                    </div>
                </form:errors>

                <!-- Campo do numero de paginas com o icone e verificação de erro -->
                <div class="row">
                    <div class="container-fluid col-lg-5 col-md-5 col-sm-5 col-xs-12">
                        <div class="form-group">
                            <div class="inputGroupContainer">
                                <div class="input-group ">
                                    <span class="input-group-addon"><i class="glyphicon glyphicon-list-alt"></i></span>
                                    <form:input cssClass="form-control" placeholder="Páginas"
                                                aria-describedby="basic-addon1"
                                                path="totalPaginas"/>
                                </div>
                            </div>
                        </div>
                    </div>

                    <form:errors path="totalPaginas">
                        <div class="alert alert-warning alert-dismissible" role="alert">
                            <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span
                                    aria-hidden="true">&times;</span></button>
                            <strong>Atenção!</strong> O total de páginas tem que ser maior que zero.
                        </div>
                    </form:errors>

                    <!-- Campo da data de lançamento do livro com o icone e verificação de erro -->
                    <div class="container-fluid col-lg-7 col-md-5 col-sm-12 col-xs-12">
                        <div class="form-group">
                            <div class="inputGroupContainer">
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="glyphicon glyphicon-time"></i></span>
                                    <form:input cssClass="form-control" placeholder="Lançamento (dd/MM/aaaa)"
                                                aria-describedby="basic-addon1"
                                                path="dataLancamento" required="required"/>
                                </div>
                            </div>
                        </div>
                    </div>
                    <form:errors path="dataLancamento">
                        <div class="alert alert-warning alert-dismissible" role="alert">
                            <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span
                                    aria-hidden="true">&times;</span></button>
                            <strong>Atenção!</strong> A data de lançamento não pode ficar vazia.
                        </div>
                    </form:errors>

                </div>

                <div class="row">
                    <c:forEach items="${tipos}" var="tipoPreco" varStatus="status">
                        <div class="container-fluid col-xs-7 col-lg-4">
                            <!-- Campo da data de lançamento do livro com o icone e verificação de erro -->
                            <div class="form-group">
                                <div class="inputGroupContainer">
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="glyphicon glyphicon-usd"></i></span>
                                        <form:input cssClass="form-control" placeholder="${tipoPreco}"
                                                    aria-describedby="basic-addon1"
                                                    path="precos[${status.index}].valor" required="required"/>
                                    </div>
                                    <form:hidden path="precos[${status.index}].tipo" value="${tipoPreco}"/>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
                <div class="row">
                    <div class="container-fluid">
                        <div class="text-right">
                            <button type="submit" class="btn btn-success">
                                <span class="glyphicon glyphicon-ok"></span> Salvar
                            </button>
                        </div>
                    </div>
                </div>
            </form:form>
        </div>
    </div>
</div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
        integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
        crossorigin="anonymous"></script>
</body>
</html>