package com.umg.inventariobackend.repository;

import com.umg.inventariobackend.model.Bodega;
import org.springframework.data.jpa.repository.JpaRepository;

public interface BodegaRepository extends JpaRepository<Bodega, Long> {
}
