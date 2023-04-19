package com.umg.inventariobackend.controller;

import com.umg.inventariobackend.model.Producto;
import com.umg.inventariobackend.service.ProductoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/api/productos")
public class ProductoController {
     @Autowired
     private ProductoService productoService;

    @GetMapping("/")
    public ResponseEntity<List<Producto>> getProductos() {
        return ResponseEntity.ok(productoService.findAllProductos());
    }

    @GetMapping("/")
    public ResponseEntity<Producto> getProducto() {
        return null;
//        return ResponseEntity.ok(productoService.findOneProducto());
    }

}
