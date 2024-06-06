/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.christianmedrano.controller;

import java.net.URL;
import java.util.ResourceBundle;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.Button;
import javafx.scene.control.MenuItem;
import javafx.scene.control.PasswordField;
import javafx.scene.control.TextField;
import org.christianmedrano.System.Main;
import org.christianmedrano.utils.SuperKinalAlert;


public class IniciarSesionController implements Initializable {
    private Main stage;
    
    @FXML
    PasswordField tfContra;
    
    @FXML
    TextField tfIniciarUsuario;
    
    @FXML
    Button btnIniciar, btnRegistrar;
    
    
    @FXML
    private void handleButtonAction(ActionEvent event) {
        if(!tfIniciarUsuario.getText().equals("") && !tfContra.getText().equals("")){
            if(event.getSource() == btnIniciar){
                stage.menuPrincipalView();
            }else if(event.getSource() == btnRegistrar){
                stage.menuPrincipalView();
            }
        }else{
            SuperKinalAlert.getInstance().mostrarAlertaInfo(33);
            if(tfIniciarUsuario.getText().equals("")){
                tfIniciarUsuario.requestFocus();
            }else if(tfContra.getText().equals("")){
                tfContra.requestFocus();
            }   
        }
    }
    
    @Override
    public void initialize(URL location, ResourceBundle resources) {

    }    
    
    public Main getStage() {
        return stage;
    }

    public void setStage(Main stage) {
        this.stage = stage;
    }  
    
    
}
