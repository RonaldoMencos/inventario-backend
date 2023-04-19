package com.umg.inventariobackend.repository;

import com.umg.inventariobackend.model.Factura;
import org.springframework.data.jpa.repository.JpaRepository;

public interface FacturaRepository extends JpaRepository<Long, Factura> {
}
