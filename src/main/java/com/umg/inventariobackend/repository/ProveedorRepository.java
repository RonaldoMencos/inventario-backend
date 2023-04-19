package com.umg.inventariobackend.repository;

import com.umg.inventariobackend.model.Proveedor;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ProveedorRepository extends JpaRepository<Long, Proveedor> {
}
