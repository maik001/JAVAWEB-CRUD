<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="includes/header.jsp"><c:param name="titulo" value="Cadastro"></c:param></c:import>

<div class="container">
			<div class='row'>
			<div class='col-md-4'></div>
			<div class='col-md-4'>
				<form class='form-signup' style='padding-top: 7px;' action='home' method='post'>
			<input type="hidden" name="form" value="cadastro" />
      		<div class='text-center mb-4'>
        		<h1 class='h1 mb-3 font-weight' style='color:#00ace6;'>CADASTRO DE USUÁRIO</h1>
      		</div>
      		<div class='form-label-group'>
      			<label for='cadUser' style='color:#00ace6;'>Nome de Usuário</label>
        		<input type='text' id='cadUser' name='usuario' class='form-control' placeholder='Usuário' required autofocus>
        	</div>

      		<div class='form-label-group'>
      			<label for='cadEmail' style='color:#00ace6;'>Email</label>
        		<input type='email' id='cadEmail' name='email' class='form-control' placeholder='Email' required autofocus>
      		</div>

      		<div class='form-label-group'>
      			<label for='cadPassword' style='color:#00ace6;'>Senha</label>
        		<input type='password' id='cadPassword' name='senha' class='form-control' placeholder='Senha' required>
      		</div>
      		<div class='form-label-group'>
      			<label for='confcadPassword' style='color:#00ace6;'>Confirmar senha</label>
        		<input type='password' id='confcadPassword' name='csenha' class='form-control' placeholder='Confirmar senha' required>
      		</div>
    
      		<div class='checkbox mb-3'>
      		</div>
      		<button class='btn btn-lg btn-primary btn-block' type='submit'>CADASTRAR</button>
    			</form>
				</div>
			<div class='col-md-1'></div>
			</div>
		</div>

<c:import url="includes/footer.jsp"></c:import>
