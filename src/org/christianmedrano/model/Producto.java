/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.christianmedrano.model;

import java.sql.Blob;

/**
 *
 * @author Carlos
 */
public class Producto {
    private int productoId;
    private String nombre;
    private Blob imagen;

    public Producto() {
    }

    public Producto(int productoId, String nombre, Blob imagen) {
        this.productoId = productoId;
        this.nombre = nombre;
        this.imagen = imagen;
    }

    public int getProductoId() {
        return productoId;
    }

    public void setProductoId(int productoId) {
        this.productoId = productoId;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public Blob getImagen() {
        return imagen;
    }

    public void setImagen(Blob imagen) {
        this.imagen = imagen;
    }

    @Override
    public String toString() {
        return "Producto{" + "productoId=" + productoId + ", nombre=" + nombre + ", imagen=" + imagen + '}';
    }
    
    
}
