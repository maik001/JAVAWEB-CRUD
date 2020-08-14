<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="includes/header.jsp"><c:param name="titulo" value="Lista de Usuarios"></c:param></c:import>


<div class='container'>
    <div id='list' class='row'>
    <div class='table-responsive col-md-12' style='background-color: white;'>
        <table class='table table-striped' cellspacing='0' cellpadding='0'>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Usuario:</th>
                    <th>Email:</th>
                    <th class='actions'>Ações</th>
                 </tr>
            </thead>
            <tbody>
 			<c:set var="listaUsuarios" value="${requestScope['lista']}"></c:set>
 			<c:forEach var="user" items="${listaUsuarios}">
 				<tr>
 					<td><c:out value="${user.id}"></c:out></td>
 					<td><c:out value="${user.usuario}"></c:out></td>
 					<td><c:out value="${user.email}"></c:out></td>
 					<td class='actions'>
                        <a class='btn btn-warning btn-xs' href="${pageContext.request.contextPath}/home?pagina=editar&usuario=${user.id}">Editar</a>
                        <a class='btn btn-danger btn-xs'  href="${pageContext.request.contextPath}/home?pagina=excluir&usuario=${user.id}" data-toggle='modal' data-target='#delete-modal'>Excluir</a>
                    </td>
 				</tr>
                	</c:forEach>
            </tbody>
         </table>
     </div>
    </div>
   </div>
   
<c:import url="includes/footer.jsp"></c:import>