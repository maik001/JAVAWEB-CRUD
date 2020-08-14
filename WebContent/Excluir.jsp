<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="includes/header.jsp"><c:param name="titulo" value="Remover"></c:param></c:import>
<c:choose>
	<c:when test="${not empty param.busca}">
		<div class="container">
		<form class="form-inline mt-2 mt-md-0" method="post" action="home">
			<input type='hidden' name='form' value='buscarem' />
            <input class="form-control mr-sm-2" type="text" name="buscaIdRem" placeholder="Buscar Id" aria-label="Search">
            <button class="btn btn-outline-primary my-2 my-sm-0" type="submit">Pesquisar</button>
          </form>
        </div>
	</c:when>
	<c:when test="${not empty requestScope['usuario']}">
		<div class="container">
		<form class="form-inline mt-2 mt-md-0" method="post" action="home">
			<input type='hidden' name='form' value='remove'  />
			<input type='hidden' name='removeid' value="${usuario.id}" />
            <input class="form-control" type="text" name="userDel" placeholder="${usuario.usuario}" readonly>
            <button class="btn btn-outline-danger my-2 my-sm-0" type="submit">Remover</button>
          </form>
        </div>
	</c:when>
	<c:otherwise>
		<c:redirect url="404.jsp"></c:redirect>
	</c:otherwise>
</c:choose>
<c:import url="includes/footer.jsp"></c:import>