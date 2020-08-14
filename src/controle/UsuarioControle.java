package controle;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import modelo.Usuario;
public class UsuarioControle {

	public boolean inserirUsuario(Usuario user){
		boolean retorno = false;
		try {
			Conexao con = new Conexao();
			PreparedStatement ps = con.getCon().prepareStatement("INSERT INTO usuarios (usuario,email,senha) VALUES (?,?,?)");
			ps.setString(1, user.getUsuario());
			ps.setString(2, user.getEmail());
			ps.setString(3, user.getSenha());
			if(!ps.execute()) {
				retorno = true;
			}
			con.fecharConexao();
		}catch(SQLException e){
			System.out.println("Erro de SQL: " + e.getMessage());
		}catch(Exception e) {
			System.out.println("Erro geral: " + e.getMessage());
		}
		return retorno;
	}
	
	public ArrayList<Usuario> selecionarTodos(){
		ArrayList<Usuario> lista = null;
		try {
			Conexao con = new Conexao();
			PreparedStatement ps = con.getCon().prepareStatement("SELECT * FROM usuarios;");
			ResultSet rs = ps.executeQuery();
			if(rs != null) {
				lista = new ArrayList<Usuario>();
				while(rs.next()) {
					Usuario user = new Usuario();
					user.setId(rs.getInt("id"));
					user.setUsuario(rs.getString("usuario"));
					user.setEmail(rs.getString("email"));
					user.setSenha(rs.getString("senha"));
					lista.add(user);
				}
			}
			
		}catch(SQLException e) {
			System.out.println(e.getMessage());
		}
		return lista;

	}
	public Usuario selecionarUm(int id) {
		Usuario user = null;
		try {
			Conexao con = new Conexao();
			PreparedStatement ps = con.getCon().prepareStatement("SELECT * FROM usuarios WHERE id=?");
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();	
			if(rs != null) {
				while(rs.next()){
					user = new Usuario();
					user.setId(rs.getInt("id"));
					user.setUsuario(rs.getString("usuario"));
					user.setEmail(rs.getString("email"));
					user.setSenha(rs.getString("senha"));
				}
			}
			}catch(SQLException e){
				System.out.println("Erro ao buscar usuário"+e.getMessage());
			}
		return user;
	
	}
	public boolean atualizar(Usuario user) {
		boolean retorno = false;
		try {
			Conexao con = new Conexao();
			String sql = "UPDATE usuarios SET usuario = ?,email = ?, senha = ? WHERE id = ?;";
			PreparedStatement ps = con.getCon().prepareStatement(sql);
			ps.setString(1,user.getUsuario());
			ps.setString(2,user.getEmail());
			ps.setString(3,user.getSenha());
			ps.setInt(4,user.getId());
			if(!ps.execute()) {
				retorno = true;
			}
		}catch(SQLException e) {
			System.out.println("Erro de sql:"+e.getMessage());
		}catch(Exception e) {
			System.out.println("Erro geral:"+e.getMessage());
		}
		return retorno;
	}
	public boolean delete(int id) {
		try {
			Conexao con = new Conexao();
			String sql = "DELETE FROM usuarios WHERE id = ?;";
			PreparedStatement ps = con.getCon().prepareStatement(sql);
			ps.setInt(1,id);
			ps.executeUpdate();
		}catch(SQLException e) {
			System.out.println("Erro de SQL:"+e.getMessage());
		}catch(Exception e) {
			System.out.println("Erro geral:"+e.getMessage());
		}
		return true;
	}


}