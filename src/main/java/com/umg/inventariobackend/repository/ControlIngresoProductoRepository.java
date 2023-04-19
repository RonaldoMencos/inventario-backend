package com.umg.inventariobackend.repository;

import com.umg.inventariobackend.model.ControlIngresoProducto;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ControlIngresoProductoRepository extends JpaRepository<Long, ControlIngresoProducto> {
}
