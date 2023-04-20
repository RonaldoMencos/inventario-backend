package com.umg.inventariobackend.service;

import com.umg.inventariobackend.model.Producto;
import com.umg.inventariobackend.repository.ProductoRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ProductoService {
    @Autowired
    private ProductoRepository productoRepository;

    public List<Producto> findAllProductos() {
        return productoRepository.findAll();
    }

    public Producto findOneProducto(Long id) {
        return productoRepository.findById(id).orElse(null);
    }

    public Producto saveProducto(Producto producto) {
        return productoRepository.save(producto);
    }

    public void deleteProducto(Long id) {
        productoRepository.deleteById(id);
    }
}
