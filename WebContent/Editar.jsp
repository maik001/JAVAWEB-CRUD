<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="includes/header.jsp"><c:param name="titulo" value="Editar"></c:param></c:import>
	<c:if test="${not empty param.busca}">
	<div class="container">
		<div class='row'>
		<div class='col-md-4'></div>
		<form class="form-inline mt-2 mt-md-0" action="home" method="post">
			<input type="hidden" name="form" value="buscaid" />
            <input class="form-control mr-sm-2" type="text" name="buscaId" id="buscaId" placeholder="Id para Busca" aria-label="Search">
            <button class="btn btn-outline-primary my-2 my-sm-0" type="submit">Pesquisar</button>
          </form>
        </div>
		</div>
	</c:if>
	
<c:choose>
	<c:when test="${not empty requestScope['usuario']}">
		<c:set var="usuario" value="${requestScope['usuario']}"></c:set>
	</c:when>
	<c:when test="${param.busca != 'vazia'}">
		<c:redirect url="home?pagina=home"></c:redirect>
	</c:when>
</c:choose>
		
    <div class='container' style="padding-top:20px;">
      <div class='row'>
        <div class='col-md-4'></div>
        <div class='col-md-4'>
          <form class='form-signup' style='padding-top: 7px;' method="post" action="home">
          <input type="hidden" name="form" value="editar" />
                <div class='text-center mb-4'>
                <h1 class='h1 mb-3 font-weight' style='color:#00ace6;'>ATUALIZAR CADASTRO</h1>
                <p></p>
              </div>
          <label for='cadUser' style='color:#00ace6;'>Id do Usuario</label>
		  <input class="form-control" type="text" name="numeroId" placeholder="${usuario.id}" readonly>
		  <input type="hidden" name="idUser" value="${usuario.id}" />
		  
          <div class='form-label-group'>
            <label for='cadUser' style='color:#00ace6;'>Atualizar nome de usuario</label>
            <input type='text' id='atualUser' name="usuario" class='form-control' placeholder='Usuário' value="${usuario.usuario}" required autofocus>
          </div>

          <div class='form-label-group'>
            <label for='cadEmail' style='color:#00ace6;'>Atualizar email</label>
            <input type='email' id='atualEmail' name="email" class='form-control' placeholder='Email' value="${usuario.email}" required autofocus>
          </div>

          <div class='form-label-group'>
            <label for='cadPassword' style='color:#00ace6;'>Atualizar senha</label>
            <input type='password' id='atualcadPassword' name="senha" class='form-control' placeholder='Senha' value="${usuario.senha}" required>
          </div>
          <div class='form-label-group'>
            <label for='atualconfcadPassword' style='color:#00ace6;'>Confirmar senha</label>
            <input type='password' id='atualconfcadPassword' name="csenha" class='form-control' placeholder='Confirmar senha' value="${usuario.senha}" required>
          </div>
          
          <div class='checkbox mb-3'>
          </div>
          <button class='btn btn-lg btn-primary btn-block' type='submit'>ATUALIZAR</button>
          </form>
        </div>
      <div class='col-md-1'></div>
      </div> 
     </div>
      
<c:import url="includes/footer.jsp"></c:import>