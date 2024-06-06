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
import org.christianmedrano.controller.IniciarSesionController;
import org.christianmedrano.controller.FormDetalleFacturasController;
import org.christianmedrano.controller.FormFacturasController;
import org.christianmedrano.controller.MenuFacturasController;
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
        stage.setTitle("SuperKinal APP by:cmedrano");
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
            MenuPrincipalController menuPrincipalView = (MenuPrincipalController)switchScene("MenuPrincipalView.fxml", 950, 675);
            menuPrincipalView.setStage(this);
        }catch(Exception e){
            System.out.println(e.getMessage());
            e.printStackTrace();
        }
    }
    
    public void menuClienteView(){
        try{
            MenuClienteController menuClienteView = (MenuClienteController)switchScene("MenuClienteView.fxml", 1200, 750);
            menuClienteView.setStage(this);
        
        }catch(Exception e){
            System.out.println(e.getMessage());
            e.printStackTrace();
        }
    }
    
    public void formClienteView(int op){
        try{
            FormClienteController formClienteView = (FormClienteController) switchScene("FormClienteView.fxml", 500, 750);
            formClienteView.setOp(op);
            formClienteView.setStage(this);
            formClienteView.setStage(this);
        }catch(Exception e){
            System.out.println(e.getMessage());
            e.printStackTrace();
        }
    }
    
    public void menuTicketView(){
        try{
            MenuTicketSoporteController menuTicketView = (MenuTicketSoporteController) switchScene("MenuTicketSoporteView.fxml", 1200, 750);
            menuTicketView.setStage(this);
        }catch (Exception e){
            System.out.println(e.getMessage());
            e.printStackTrace();
        }
    }
    
    public void menuProductoView(){
        try{
            MenuProductoController menuProductoView = (MenuProductoController) switchScene("MenuProductoView.fxml", 1250, 675);
            menuProductoView.setStage(this);
        }catch (Exception e){
            System.out.println(e.getMessage());
            e.printStackTrace();
        }
    }
    public void formCargoView(int op){
        try{
            FormCargoController formCargosView = (FormCargoController) switchScene("FormCargosView.fxml", 900, 800);
            formCargosView.setOp(op);
            formCargosView.setStage(this);
        }catch (Exception e){
            System.out.println(e.getMessage());
            e.printStackTrace();
        }
    }
    
    public void menuCargoView(){
        try{
            MenuCargoController menuCargosView = (MenuCargoController) switchScene("MenuCargoView.fxml", 900, 800);
            menuCargosView.setStage(this);
        }catch (Exception e){
            System.out.println(e.getMessage());
            e.printStackTrace();
        }
    }
    public void menuDistribuidoresView(){
        try{
            MenuDistribuidoresController menuDistribuidoresView = (MenuDistribuidoresController) switchScene("MenuDistribuidoresView.fxml", 1200, 700);
            menuDistribuidoresView.setStage(this);
        }catch(Exception e){
            System.out.println(e.getMessage());
            e.printStackTrace();
        }
    }
    
    public void formDistribuidoresView(int op){
        try{
            FormDistribuidoresController formDistribuidoresView = (FormDistribuidoresController)switchScene("FormDistribuidoresView.fxml", 500, 750);
            formDistribuidoresView.setOp(op);
            formDistribuidoresView.setStage(this);
            formDistribuidoresView.setStage(this);
        }catch(Exception e){
            System.out.println(e.getMessage());
            e.printStackTrace();
        }
    }
    
    public void menuComprasView(){
        try{
            MenuComprasController menuComprasView = (MenuComprasController) switchScene("MenuComprasView.fxml", 1200, 700);
            menuComprasView.setStage(this);
        }catch(Exception e){
            System.out.println(e.getMessage());
            e.printStackTrace();
        }
    }
    
    public void formComprasView(int op){
        try{
            FormComprasController formComprasView = (FormComprasController) switchScene("FormComprasView.fxml", 500, 600);
            formComprasView.setOp(op);
            formComprasView.setStage(this);
            formComprasView.setStage(this);
        }catch(Exception e){
            System.out.println(e.getMessage());
            e.printStackTrace();
        }
    }
    
    public void IniciarSesionView(){
        try{
            IniciarSesionController IniciarSesionView = (IniciarSesionController)switchScene("IniciarSesionView.fxml", 500, 750);
            IniciarSesionView.setStage(this);
        }catch(Exception e){
            System.out.println(e.getMessage());
        }
    }

    public void menuFacturasView() {
        try{
            MenuFacturasController menuFacturas = (MenuFacturasController)switchScene("MenuFacturasView.fxml", 1200, 750);
            menuFacturas.setStage(this);
        }catch(Exception e){
            System.out.println(e.getMessage());
        }
    }

    public void formFacturasView(int op) {
        try{
            FormFacturasController formFacturas = (FormFacturasController)switchScene("FormFacturasView.fxml", 500, 750);
            formFacturas.setOp(op);
            formFacturas.setStage(this);
        }catch(Exception e){
            System.out.println(e.getMessage());
        }
    }

    public void formDetalleFacturasView(int op) {
        try{
            FormDetalleFacturasController formDetalleFacturas = (FormDetalleFacturasController)switchScene("FormDetalleFacturasView.fxml", 500, 750);
            formDetalleFacturas.setOp(op);
            formDetalleFacturas.setStage(this);
        }catch(Exception e){
            System.out.println(e.getMessage());
        }
    }

}



