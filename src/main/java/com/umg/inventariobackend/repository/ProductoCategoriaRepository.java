package com.umg.inventariobackend.repository;

import com.umg.inventariobackend.model.ProductoCategoria;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ProductoCategoriaRepository extends JpaRepository<Long, ProductoCategoria> {
}
