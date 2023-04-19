package com.umg.inventariobackend.repository;

import com.umg.inventariobackend.model.OrdenCompraDetalle;
import org.springframework.data.jpa.repository.JpaRepository;

public interface OrdenCompraDetalleRepository extends JpaRepository<OrdenCompraDetalle, Long> {
}
