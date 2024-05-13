/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.christianmedrano.System;

import java.io.InputStream;
import javafx.application.Application;
import javafx.fxml.FXMLLoader;
import javafx.fxml.Initializable;
import javafx.fxml.JavaFXBuilderFactory;
import javafx.scene.Scene;
import javafx.scene.layout.AnchorPane;
import javafx.stage.Stage;
import org.christianmedrano.controller.FormCargoController;
import org.christianmedrano.controller.FormClienteController;
import org.christianmedrano.controller.MenuCargoController;
import org.christianmedrano.controller.MenuClienteController;
import org.christianmedrano.controller.MenuDistribuidoresController;
import org.christianmedrano.controller.MenuPrincipalController;
import org.christianmedrano.controller.MenuProductoController;
import org.christianmedrano.controller.MenuTicketSoporteController;
import org.christianmedrano.controller.FormDistribuidoresController;
import org.christianmedrano.controller.MenuComprasController;
import org.christianmedrano.controller.FormComprasController;

/**
 *
 * @author medra
 */
public class Main extends Application {
    
    private Stage stage;
    private Scene scene;
    private final String URLVIEW = "/org/christianmedrano/view/";
    
    @Override
    public void start(Stage stage){
        this.stage = stage;
        stage.setTitle("SuperKinalAPP");
        menuPrincipalView();
        stage.show();
    }
    
    public Initializable switchScene(String fxmlName, int width, int height) throws Exception{
        Initializable resultado;
        FXMLLoader loader = new FXMLLoader();
        
        InputStream file = Main.class.getResourceAsStream(URLVIEW + fxmlName);
        loader.setBuilderFactory(new JavaFXBuilderFactory());
        loader.setLocation(Main.class.getResource(URLVIEW + fxmlName));
        
        scene = new Scene((AnchorPane)loader.load(file), width, height);
        stage.setScene(scene);
        stage.sizeToScene();
        
        resultado = (Initializable)loader.getController();
        return resultado;
    }
    
    public void menuPrincipalView(){
        try{
            MenuPrincipalController menuPrincipalView = (MenuPrincipalController)switchScene("MenuPrincipalView.fxml", 950, 700);
            menuPrincipalView.setStage(this);
        }catch(Exception e){
            System.out.println(e.getMessage());
        }
    }
    
    public void menuClienteView(){
        try{
            MenuClienteController menuClienteView = (MenuClienteController)switchScene("MenuClienteView.fxml", 1200, 750);
            menuClienteView.setStage(this);
        }catch(Exception e){
            System.out.println(e.getMessage());
        }
    }
    
    public void formClienteView(int op){
        try{
            FormClienteController formClienteView = (FormClienteController)switchScene("FormClientesView.fxml", 500, 700);
            formClienteView.setOp(op);
            formClienteView.setStage(this);
            formClienteView.setStage(this);
        }catch(Exception e){
            System.out.println(e.getMessage());
        }
    }
    
    public void menuTicketView(){
        try{
            MenuTicketSoporteController menuTicketView = (MenuTicketSoporteController) switchScene("MenuTicketSoporteView.fxml", 1200, 750);
            menuTicketView.setStage(this);
        }catch (Exception e){
            System.out.println(e.getMessage());
        }
    }
    
    public void menuProductoView(){
        try{
            MenuProductoController menuProductoView = (MenuProductoController) switchScene("MenuProductoView.fxml", 850, 650);
            menuProductoView.setStage(this);
        }catch (Exception e){
            System.out.println(e.getMessage());
        }
    }
    public void formCargoView(int op){
        try{
            FormCargoController formCargosView = (FormCargoController) switchScene("FormCargosView.fxml", 500, 400);
            formCargosView.setOp(op);
            formCargosView.setStage(this);
        }catch (Exception e){
            System.out.println(e.getMessage());
        }
    }
    
    public void menuCargoView(){
        try{
            MenuCargoController menuCargosView = (MenuCargoController) switchScene("MenuCargosView.fxml", 500, 400);
            menuCargosView.setStage(this);
        }catch (Exception e){
            System.out.println(e.getMessage());
        }
    }
    public void menuDistribuidoresView(){
        try{
            MenuDistribuidoresController menuDistribuidorView = (MenuDistribuidoresController) switchScene("MenuDistribuidores.fxml", 1200, 750);
            menuDistribuidorView.setStage(this);
        }catch(Exception e){
            System.out.println(e.getMessage());
            e.printStackTrace();
        }
    }
    
    public void formDistribuidoresView(int op){
        try{
            FormDistribuidoresController formDistribuidorView = (FormDistribuidoresController)switchScene("FormDistribuidor.fxml", 500, 800);
            formDistribuidorView.setOp(op);
            formDistribuidorView.setStage(this);
            formDistribuidorView.setStage(this);
        }catch(Exception e){
            System.out.println(e.getMessage());
        }
    }
    
    public void menuComprasView(){
        try{
            MenuComprasController menuComprasView = (MenuComprasController) switchScene("MenuComprasView.fxml", 600, 500);
            menuComprasView.setStage(this);
        }catch(Exception e){
            System.out.println(e.getMessage());
            e.printStackTrace();
        }
    }
    
    public void formComprasView(int op){
        try{
            FormComprasController formComprasView = (FormComprasController) switchScene("FormsComprasView.fxml", 400, 500);
            formComprasView.setOp(op);
            formComprasView.setStage(this);
            formComprasView.setStage(this);
        }catch(Exception e){
            System.out.println(e.getMessage());
        }
    }

}


