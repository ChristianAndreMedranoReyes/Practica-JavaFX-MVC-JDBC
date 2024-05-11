/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.christianmedrano.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.net.URL;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.ResourceBundle;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.Button;
import javafx.scene.control.Label;
import javafx.scene.control.TextField;
import javafx.scene.image.Image;
import javafx.scene.image.ImageView;
import javafx.scene.input.DragEvent;
import javafx.scene.input.TransferMode;
import org.christianmedrano.dao.Conexion;
import org.christianmedrano.model.Producto;

/**
 * FXML Controller class
 *
 * @author Carlos
 */
public class MenuProductoController implements Initializable {
    private static Connection conexion = null;
    private static PreparedStatement statement = null;
    private static ResultSet resultSet = null;
    private List<File> files = null;
    
    @FXML
    Button btnCargar, btnBuscar;
    @FXML
    TextField tfNombreProducto, tfProductoId;
    @FXML
    ImageView imgCargar, imgMostrar;
    @FXML
    Label lblNombreProducto;
    
    @Override
    public void initialize(URL location, ResourceBundle resources) {
        // TODO
    }    
    
    @FXML
    public void handleButtonAction(ActionEvent event){
        try{
            if(event.getSource() == btnCargar){
                agregarProducto();
            }else if(event.getSource() == btnBuscar){
                Producto producto = buscarProducto();
                if(producto != null){
                    lblNombreProducto.setText(producto.getNombre());
                    InputStream file = producto.getImagen().getBinaryStream();
                    Image image = new Image(file);
                    imgMostrar.setImage(image);
                }
            }   
        }catch(Exception e){
            e.printStackTrace();
        }
    }
    
    @FXML
    public void handleOnDrag(DragEvent event){
        if(event.getDragboard().hasFiles()){
            event.acceptTransferModes(TransferMode.ANY);
        }
    }
    
    @FXML
    public void handleOnDrop(DragEvent event){
        try{
            files = event.getDragboard().getFiles();
            FileInputStream file = new FileInputStream(files.get(0));
            Image image = new Image(file);
            imgCargar.setImage(image);
        }catch(Exception e){
            e.printStackTrace();
        }
    }
    
    public void agregarProducto(){
        try{
            conexion = Conexion.getInstance().obtenerConexion();
            String sql = "call sp_agregarProducto(?,?)";
            statement = conexion.prepareStatement(sql);
            statement.setString(1, tfNombreProducto.getText());
            InputStream img = new FileInputStream(files.get(0));
            statement.setBinaryStream(2, img);
            statement.execute();
        }catch(Exception e){
            e.printStackTrace();
        }finally{
            try{
                if(statement != null){
                    statement.close();
                }
                if(conexion != null){
                    conexion.close();
                }
            }catch(SQLException e){
                e.printStackTrace();
            }
        }
    }
 
    public Producto buscarProducto(){
        Producto producto = null;
        
        try{
            conexion = Conexion.getInstance().obtenerConexion();
            String sql = "call sp_buscarProducto(?)";
            statement = conexion.prepareStatement(sql);
            statement.setInt(1, Integer.parseInt(tfProductoId.getText()));
            
            resultSet = statement.executeQuery();
            
            if(resultSet.next()){
                int productoId = resultSet.getInt("productoId");
                String nombre = resultSet.getString("nombre");
                Blob imagen = resultSet.getBlob("imagen");
                
                producto = new Producto(productoId, nombre, imagen);
            }
        }catch(SQLException e){
            e.printStackTrace();
        }
        
        return producto;
    }
}
