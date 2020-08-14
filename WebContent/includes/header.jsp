<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${param.titulo}</title>
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">

</head>
<body>
 <div class="d-flex flex-column flex-md-row align-items-center p-3 px-md-4 mb-3 bg-white border-bottom shadow-sm">
  <h5 class="my-0 mr-md-auto font-weight-normal"><a href="${pageContext.request.contextPath}/home?pagina=home">Aulas Java Web</a></h5>
  <nav class="my-2 my-md-0 mr-md-3">
    <a class="p-2 text-dark" href="#"></a>
    <a class="p-2 text-dark" href="${pageContext.request.contextPath}/home?pagina=cadastro">Cadastrar Usuário</a>
    <a class="p-2 text-dark" href="${pageContext.request.contextPath}/home?pagina=editar&busca=vazia">Editar Usuários</a>
    <a class="p-2 text-dark" href="${pageContext.request.contextPath}/home?pagina=excluir&busca=vazia">Remover Usuários</a>
  </nav>
</div>
</body>
</html>