package com.umg.inventariobackend.service;

import com.umg.inventariobackend.model.ProductoCategoria;
import com.umg.inventariobackend.repository.ProductoCategoriaRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ProductoCategoriaService {
    @Autowired
    private ProductoCategoriaRepository productoCategoriaRepository;

    public List<ProductoCategoria> findAllProductosCategorias() {
        return productoCategoriaRepository.findAll();
    }

    public ProductoCategoria findOneProductoCategoria(Long id) {
        return productoCategoriaRepository.findById(id).orElse(null);
    }

    public ProductoCategoria saveProductoCategoria(ProductoCategoria productoCategoria) {
        return productoCategoriaRepository.save(productoCategoria);
    }

    public void deleteProductoCategoria(Long id) {
        productoCategoriaRepository.deleteById(id);
    }
}
