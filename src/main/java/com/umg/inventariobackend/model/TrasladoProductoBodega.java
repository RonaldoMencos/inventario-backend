package com.umg.inventariobackend.model;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import javax.persistence.*;
import java.io.Serializable;

@Entity
@Table(name="traslado_producto_bodega")
@Getter
@Setter
@ToString
public class TrasladoProductoBodega implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id_traslado_producto_bodega")
    private Long idTrasladoProductoBodega;
    private Integer cantidad;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "bodega_origen")
    @ToString.Exclude
    private Bodega bodegaOrigen;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "bodega_destino")
    @ToString.Exclude
    private Bodega bodegaDestino;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "producto")
    @ToString.Exclude
    private Producto producto;
}
