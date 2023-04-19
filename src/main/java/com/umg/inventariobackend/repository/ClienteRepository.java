package com.umg.inventariobackend.repository;

import com.umg.inventariobackend.model.Cliente;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ClienteRepository extends JpaRepository<Long, Cliente> {
}
