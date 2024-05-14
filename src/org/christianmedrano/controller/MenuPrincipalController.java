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
import javafx.scene.control.MenuItem;
import org.christianmedrano.System.Main;

/**
 *
 * @author medra
 */
public class MenuPrincipalController implements Initializable{
    private Main stage;
    
    @FXML
    MenuItem btnMenuClientes,btnMenuTicketSoporte, btnMenuProductos, btnMenuCargos, btnMenuDistribuidores, btnMenuCompras;
    
    @Override 
    public void initialize(URL location, ResourceBundle resources){
        
    }

    public Main getStage() {
        return stage;
    }

    public void setStage(Main stage) {
        this.stage = stage;
    }
    
    @FXML
    public void handleButtonAction(ActionEvent event){
        if(event.getSource() == btnMenuClientes){
            stage.menuClienteView();
        }else if(event.getSource() == btnMenuTicketSoporte){
            stage.menuTicketView();
        }else if(event.getSource() == btnMenuProductos){
            stage.menuProductoView();
        }else if(event.getSource() == btnMenuCargos){
            stage.menuCargoView();
        }else if(event.getSource() == btnMenuDistribuidores){
            stage.menuDistribuidoresView();
        }else if(event.getSource() == btnMenuCompras){
            stage.menuComprasView();
        }
    }
}