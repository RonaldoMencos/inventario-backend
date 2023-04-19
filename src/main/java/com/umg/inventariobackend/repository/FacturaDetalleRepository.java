package com.umg.inventariobackend.repository;

import com.umg.inventariobackend.model.FacturaDetalle;
import org.springframework.data.jpa.repository.JpaRepository;

public interface FacturaDetalleRepository extends JpaRepository<Long, FacturaDetalle> {
}
