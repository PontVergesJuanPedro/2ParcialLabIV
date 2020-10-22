package gestor;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Comercio;
import model.Rubro;
import model.Usuario;

public class GestorDB {

    private String CONN = "jdbc:sqlserver://JUANPEDRO;databaseName=RedVecinal";
    private String PASS = "123456";
    private String USER = "sa";
    private Connection con;

    private void abrirConexion() {
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver").newInstance();
            con = DriverManager.getConnection(CONN, USER, PASS);
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    private void cerrarConexion() {
        try {
            if (con != null && !con.isClosed()) {
                con.close();
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

    public ArrayList<Rubro> obtenerRubros() {
        ArrayList<Rubro> lista = new ArrayList<Rubro>();
        try {
            abrirConexion();
            String sql = "select * from rubros";
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery(sql);
            while (rs.next()) {
                int id = rs.getInt("id_rubro");
                String nombre = rs.getString("nombre");
                String descripcion = rs.getString("descripcion");
                lista.add(new Rubro(id, nombre, descripcion));
            }
            rs.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            cerrarConexion();
        }
        return lista;
    }

    public Rubro obtenerRubroPorId(int id) {
        Rubro resultado = null;
        try {
            abrirConexion();
            String sql = "SELECT * FROM rubros WHERE id_rubro = ?;";
            PreparedStatement st = con.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                String nombre = rs.getString("nombre");
                String descripcion = rs.getString("descripcion");
                resultado = new Rubro(nombre, descripcion);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            cerrarConexion();
        }

        return resultado;
    }

    public ArrayList<Comercio> obtenerComercioPorRubro(int idRubro) {
        ArrayList<Comercio> lista = new ArrayList<Comercio>();
        try {
            abrirConexion();
            String sql = "select * from comercios where id_rubro = ?";
            PreparedStatement st = con.prepareStatement(sql);
            st.setInt(1, idRubro);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                int id_comercio = rs.getInt("id_comercio");
                int id_rubro = rs.getInt("id_rubro");
                String nombre = rs.getString("nombre");
                String descripcion = rs.getString("descripcion");
                Rubro r = obtenerRubroPorId(id_rubro);
                lista.add(new Comercio(id_comercio, nombre, r, descripcion));
            }
            rs.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            cerrarConexion();
        }
        return lista;
    }

    public Comercio obtenerComercioPorId(int id) {
        Comercio resultado = null;
        try {
            abrirConexion();
            String sql = "SELECT * FROM comercios WHERE id_comercio = ?;";
            PreparedStatement st = con.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                int id_comercio = rs.getInt("id_comercio");
                int id_rubro = rs.getInt("id_rubro");
                String nombre = rs.getString("nombre");
                String descripcion = rs.getString("descripcion");
                Rubro r = obtenerRubroPorId(id_rubro);
                resultado = new Comercio(id_comercio, nombre, r, descripcion);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            cerrarConexion();
        }

        return resultado;
    }

    public Usuario obtenerUsuarioPorNombre(String user) {
        Usuario resultado = null;
        try {
            abrirConexion();
            String sql = "SELECT * FROM usuarios WHERE usuario = ?;";
            PreparedStatement st = con.prepareStatement(sql);
            st.setString(1, user);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                int id_usuario = rs.getInt("id_usuario");
                String nombre = rs.getString("nombre");
                String usuario = rs.getString("usuario");
                String contrasena = rs.getString("contrasena");
                resultado = new Usuario(id_usuario, usuario, nombre, contrasena);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            cerrarConexion();
        }
        return resultado;
    }

    public boolean logearse(String usuario, String contrasena) {
        boolean resultado = false;
        Usuario fetchedUser = obtenerUsuarioPorNombre(usuario);
        if (fetchedUser.getUsuario().equals(usuario) && fetchedUser.getContrasena().equals(contrasena)) {
            resultado = true;
        }
        return resultado;
    }

    public boolean registrarUsuario(Usuario u) {
        boolean inserto = false;
        try {
            abrirConexion();
            String sql = "INSERT INTO usuarios (nombre, usuario, contrasena) VALUES (?,?,?)";
            PreparedStatement st = con.prepareStatement(sql);
            st.setString(1, u.getNombre());
            st.setString(2, u.getUsuario());
            st.setString(3, u.getContrasena());
            st.execute();
            inserto = true;
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            cerrarConexion();
        }
        return inserto;
    }

    public boolean agregarRubro(Rubro r) {
        boolean inserto = false;
        try {
            abrirConexion();
            String sql = "insert into rubros (nombre, descripcion) values (?,?)";
            PreparedStatement st = con.prepareStatement(sql);
            st.setString(1, r.getNombre());
            st.setString(2, r.getDescripcion());
            st.execute();
            inserto = true;
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            cerrarConexion();
        }
        return inserto;
    }

    public boolean modificarRubro(Rubro r) {
        boolean modificado = false;
        try {
            abrirConexion();
            String sql = "update rubros set nombre = ?, descripcion = ? where id_rubro = ?";
            PreparedStatement st = con.prepareStatement(sql);
            st.setString(1, r.getNombre());
            st.setString(2, r.getDescripcion());
            st.setInt(3, r.getId());
            st.executeUpdate();
            modificado = true;
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            cerrarConexion();
        }
        return modificado;
    }

    public boolean eliminarRubro(int id) {
        boolean eliminado = false;
        try {
            abrirConexion();
            String sql = "DELETE FROM rubros WHERE id_rubro = ?;";
            PreparedStatement st = con.prepareStatement(sql);
            st.setInt(1, id);
            st.executeUpdate();
            eliminado = true;
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            cerrarConexion();
        }
        return eliminado;
    }
    
    public boolean agregarComercio(Comercio c) {
        boolean inserto = false;
        try {
            abrirConexion();
            String sql = "insert into comercios (id_rubro, nombre, descripcion) values (?,?, ?)";
            PreparedStatement st = con.prepareStatement(sql);
            st.setInt(1, c.getRubro().getId());
            st.setString(2, c.getNombre());
            st.setString(3, c.getDescripcion());
            st.execute();
            inserto = true;
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            cerrarConexion();
        }
        return inserto;
    }

    public boolean modificarComercio(Comercio c) {
        boolean modificado = false;
        try {
            abrirConexion();
            String sql = "update comercios set nombre = ?, descripcion = ?, id_rubro = ? where id_comercio = ?";
            PreparedStatement st = con.prepareStatement(sql);
            st.setString(1, c.getNombre());
            st.setString(2, c.getDescripcion());
            st.setInt(3, c.getRubro().getId());
            st.executeUpdate();
            modificado = true;
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            cerrarConexion();
        }
        return modificado;
    }

    public void eliminarComercio(int id) {
        try {
            abrirConexion();
            String sql = "DELETE FROM comercios WHERE id_comercio = ?;";
            PreparedStatement st = con.prepareStatement(sql);
            st.setInt(1, id);
            st.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            cerrarConexion();
        }
    }
}
