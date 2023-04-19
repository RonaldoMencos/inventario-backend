package com.umg.inventariobackend.repository;

import com.umg.inventariobackend.model.ControlInventario;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ControlInventarioRepository extends JpaRepository<Long, ControlInventario> {
}
