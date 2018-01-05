<%--
  Created by IntelliJ IDEA.
  User: weskl
  Date: 14/12/2017
  Time: 13:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <title>Loja de Livros</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
          integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
          crossorigin="anonymous">
</head>

<body background="/img/background.jpg">
<div class="container-fluid col-lg-8 col-lg-offset-2" align="center">

    <div class="panel panel-info">
        <div class="panel-heading text-center"><strong>E-LIVROS</strong></div>

        <div class="panel panel-body text-center">Cadastro de Livros - Área do Administrador</div>

        <div class="text-center">
            <div class="btn-group" role="group">

                <div class="btn btn-info" onclick="location.href = 'livros/cadastro'">
                    <span class="glyphicon glyphicon-plus"></span> Livro
                </div>

                <div class="btn btn-info" onclick="location.href = 'livros'">
                    <span class="glyphicon glyphicon-list"></span> Listar
                </div>
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

        <br>

    </div>
</div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
        integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
        crossorigin="anonymous"></script>
</body>
</html>
