package com.umg.inventariobackend.model;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import javax.persistence.*;
import java.io.Serializable;

@Entity
@Table(name = "bodega")
@Getter
@Setter
@ToString
public class Bodega implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id_bodega")
    private Long idBodega;
    private String codigo;
    private String nombre;
    private String direccion;
    private String telefono;
}
