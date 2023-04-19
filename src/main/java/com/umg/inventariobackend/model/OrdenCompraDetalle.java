package com.umg.inventariobackend.model;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import javax.persistence.*;
import java.io.Serializable;

@Entity
@Table(name = "orden_compra_detalle")
@Getter
@Setter
@ToString
public class OrdenCompraDetalle implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id_orden_compra_detalle")
    private Long idOrdenCompraDetalle;
    private Integer cantidad;
    private Double precio;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "orden_compra")
    @ToString.Exclude
    private OrdenCompra ordenCompra;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "producto")
    @ToString.Exclude
    private Producto producto;
}
