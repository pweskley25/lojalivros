<%--
  Created by IntelliJ IDEA.
  User: weskl
  Date: 14/12/2017
  Time: 19:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Livro Cadastrado</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
          integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
          crossorigin="anonymous">
</head>
<body>
<div class="jumbotron">
    <div class="container col-lg-8">
        <form>
            <h2 class="label label-info">Novo Livro</h2>
        </form>
        <h1>Livro cadastrado com Sucesso!</h1>
        <label>Informações do livro adicionado:</label><br>
        <label> º Título: ${livroCadastrado.titulo}</label><br>
        <label> º Descrição: ${livroCadastrado.descricao}</label><br>
        <label> º Total de Páginas: ${livroCadastrado.totalPaginas}</label><br>
        <label> Precos:</label><br>
        <label> º E-Book: ${livroCadastrado.precos[0].valor}</label><br>
        <label> º Impresso: ${livroCadastrado.precos[1].valor}</label><br>
        <label> º Combo: ${livroCadastrado.precos[2].valor}</label><br>
        <br>
        <form action="/lojalivros/livros/cadastro" method="get">
            <button type="submit">Cadastrar outro Livro</button>
        </form>

        <form action="/lojalivros/livros" method="get">
            <button type="submit">Listar Livros</button>
        </form>

        <form action="/lojalivros" method="post">
            <button type="submit">Home</button>
        </form>
    </div>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
        integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
        crossorigin="anonymous"></script>
</body>
</html>
