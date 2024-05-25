/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.christianmedrano.controller;

import java.net.URL;
import java.util.ResourceBundle;
import javafx.fxml.Initializable;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.scene.control.Button;
import javafx.scene.control.TextField;
import org.christianmedrano.dao.Conexion;
import org.christianmedrano.dto.DistribuidorDTO;
import org.christianmedrano.model.Distribuidor;
import org.christianmedrano.System.Main;

/**
 * FXML Controller class
 *
 * @author medra
 */
public class FormDistribuidoresController implements Initializable {

    private Main stage;
    private int op;   
    
    private static Connection conexion = null;
    private static PreparedStatement statement = null;
    
    @FXML
    TextField tfDistribuidorId, tfNomDistri, tfDirecDistri, tfNitDistri, tfTelDistri, tfWebDistri;
    @FXML
    Button btnGuardar, btnCancelar;
    /**
     * Initializes the controller class.
     */

    @Override
    public void initialize(URL url, ResourceBundle rb) {
        if(DistribuidorDTO.getDistribuidorDTO().getDistribuidor() != null){
            cargarDatos(DistribuidorDTO.getDistribuidorDTO().getDistribuidor());
        }
    }    
    
    public void cargarDatos(Distribuidor distribuidor){
        tfDistribuidorId.setText(Integer.toString(distribuidor.getDistribuidorId()));
        tfNomDistri.setText(distribuidor.getNombreDistribuidor());
        tfDirecDistri.setText(distribuidor.getDireccionDistribuidor());  
        tfNitDistri.setText(distribuidor.getNitDistribuidor());        
        tfTelDistri.setText(distribuidor.getTelefonoDistribuidor());      
        tfWebDistri.setText(distribuidor.getWeb());
    }

    public Main getStage() {
        return stage;
    }

    public void setStage(Main stage) {
        this.stage = stage;
    }
    
    public void agregarDistribuidores(){
        try{
            conexion = Conexion.getInstance().obtenerConexion();
            String sql = "call sp_agregarDistribuidores(?, ?, ?, ?, ?)";
            statement = conexion.prepareStatement(sql);
            statement.setString(1, tfNomDistri.getText());
            statement.setString(2, tfDirecDistri.getText());
            statement.setString(3, tfNitDistri.getText());
            statement.setString(4, tfTelDistri.getText());
            statement.setString(5, tfWebDistri.getText());
            statement.execute();
        }catch(SQLException e){
            System.out.println(e.getMessage());
        }finally{            
            try{
                if(statement != null){
                    statement.close();
                }
                if(conexion != null){
                    conexion.close();
                }
            }catch(SQLException e){
                System.out.println(e.getMessage());
            }
        }
    }
    
    public void editarDistribuidores(){
        try{
            conexion = Conexion.getInstance().obtenerConexion();
            String sql = "call sp_editarDistribuidores(?, ?, ?, ?, ?, ?)";
            statement = conexion.prepareStatement(sql);
            statement.setInt(1, Integer.parseInt(tfDistribuidorId.getText()));
            statement.setString(2, tfNomDistri.getText());
            statement.setString(3, tfDirecDistri.getText());
            statement.setString(4, tfNitDistri.getText());
            statement.setString(5, tfTelDistri.getText());
            statement.setString(6, tfWebDistri.getText());      
            statement.execute();
        }catch(SQLException e){
            System.out.println(e.getMessage());
        }finally{
            try{
                if(statement != null){
                    statement.close();
                }
            }catch(SQLException e){
            System.out.println(e.getMessage());                
            }
        }
    }
    
    @FXML
    public void handleButtonAction(ActionEvent event){
        if(event.getSource() == btnCancelar){
            DistribuidorDTO.getDistribuidorDTO().setDistribuidor(null);
            stage.menuDistribuidoresView();
        }else if(event.getSource() == btnGuardar){
            if(op == 1){
            agregarDistribuidores(); 
            stage.menuDistribuidoresView();
            }else if(op == 2){
                editarDistribuidores();
                DistribuidorDTO.getDistribuidorDTO().setDistribuidor(null);
                stage.menuDistribuidoresView();
            }          
        }
    }

    public void setOp(int op) {
        this.op = op;
    }
}
