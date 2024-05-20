package com.emergentes.dao;

import com.emergentes.modelo.Posts;
import com.emergentes.utiles.ConexionDB;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class PostsDAOimpl extends ConexionDB implements PostsDAO {

    @Override
    public void insert(Posts posts) throws Exception {
        String sql = "insert into posts (fecha, titulo, contenido) values (?,?,?)";
        this.conectar();
        PreparedStatement ps = this.conn.prepareStatement(sql);
        ps.setString(1, posts.getFecha());
        ps.setString(2, posts.getTitulo());
        ps.setString(3, posts.getContenido());
        ps.executeUpdate();
    }

    @Override
    public void update(Posts posts) throws Exception {
        String sql = "update posts set fecha = ?, titulo = ?, contenido = ? where id = ?";
        this.conectar();
        PreparedStatement ps = this.conn.prepareStatement(sql);
        ps.setString(1, posts.getFecha());
        ps.setString(2, posts.getTitulo());
        ps.setString(3, posts.getContenido());
        ps.setInt(4, posts.getId());
        ps.executeUpdate();
    }

    @Override
    public void delete(int id) throws Exception {
        String sql = "delete from posts where id = ?";
        this.conectar();
        PreparedStatement ps = this.conn.prepareStatement(sql);
        ps.setInt(1, id);
        ps.executeUpdate();
        this.desconectar();
    }

    @Override
    public Posts getById(int id) throws Exception {
        Posts pst = new Posts();
        try {
            String sql= "select * from posts where id=?";
            this.conectar();
            PreparedStatement ps = this.conn.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                pst.setId(rs.getInt("id"));
                pst.setFecha(rs.getString("fecha"));
                pst.setTitulo(rs.getString("titulo"));
                pst.setContenido(rs.getString("contenido"));
            }
        } catch(SQLException e) {
                throw e;
        } finally {
            this.desconectar();
        }
        return pst;
    }

    @Override
    public List<Posts> getAll() throws Exception {
        List<Posts> lista=null;
        String sql= "select * from posts";
        this.conectar();
        PreparedStatement ps = this.conn.prepareStatement(sql);
        ResultSet rs = ps.executeQuery();
        lista = new ArrayList<Posts>();
        while(rs.next()){
            Posts pst =new Posts();
            pst.setId(rs.getInt("id"));
            pst.setFecha(rs.getString("fecha"));
            pst.setTitulo(rs.getString("titulo"));
            pst.setContenido(rs.getString("contenido"));
            lista.add(pst);
        }
        this.desconectar();
        return lista;
    }
}
