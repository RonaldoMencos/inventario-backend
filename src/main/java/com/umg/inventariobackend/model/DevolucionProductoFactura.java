package com.umg.inventariobackend.model;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import javax.persistence.*;
import java.io.Serializable;

@Entity
@Table(name = "devolucion_producto_factura")
@Getter
@Setter
@ToString
public class DevolucionProductoFactura implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id_devolucion_producto_factura")
    private Long idDevolucionProductoFactura;
    private Integer cantidad;

    @Column(name = "descripcion_devolucion")
    private String descripcionDevolucion;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "factura")
    @ToString.Exclude
    private Factura factura;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "producto")
    @ToString.Exclude
    private Producto producto;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "bodega")
    @ToString.Exclude
    private Bodega bodega;
}
