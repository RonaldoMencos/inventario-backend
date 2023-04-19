package com.umg.inventariobackend.model;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import javax.persistence.*;
import java.io.Serializable;

@Entity
@Table(name = "proveedor")
@Getter
@Setter
@ToString
public class Proveedor implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id_proveedor")
    private Long idProveedor;
    private String codigo;
    private String nit;
    private String direccion;
    private String telefono;

    @Column(name = "nombre_fiscal")
    private String nombreFiscal;
}
