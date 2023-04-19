package com.umg.inventariobackend.repository;

import com.umg.inventariobackend.model.Producto;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ProductoRepository extends JpaRepository<Producto, Long> {
}
