package com.umg.inventariobackend.model;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import javax.persistence.*;
import java.io.Serializable;

@Entity
@Table(name = "producto_categoria")
@Getter
@Setter
@ToString
public class ProductoCategoria implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id_producto_categoria")
    private Long idProductoCategoria;
    private String codigo;
    private String nombre;
    private String descripcion;
}
