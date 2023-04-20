package com.umg.inventariobackend.controller;

import com.umg.inventariobackend.model.Producto;
import com.umg.inventariobackend.service.ProductoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;

import java.util.List;
@CrossOrigin("http://127.0.0.1:5173/")
@RestController
@RequestMapping("/api/productos")
public class ProductoController {
     @Autowired
     private ProductoService productoService;

    @GetMapping("/")
    public List<Producto> getProductos() {
        return productoService.findAllProductos();
    }

    @GetMapping("/{id}")
    public Producto getProducto (@PathVariable Long id) {
        return productoService.findOneProducto(id);
    }

    @PostMapping("/")
    @ResponseStatus(HttpStatus.CREATED)
    public Producto saveProducto(@RequestBody Producto producto) {
        return productoService.saveProducto(producto);
    }

    @PutMapping("/{id}")
    @ResponseStatus(HttpStatus.CREATED)
    public Producto updateProducto(@RequestBody Producto producto, @PathVariable Long id) {
        Producto productoActual = productoService.findOneProducto(id);
        productoActual.setActivo(producto.getActivo());
        productoActual.setCategoria(producto.getCategoria());
        productoActual.setCodigo(producto.getCodigo());
        productoActual.setDescripcion(producto.getDescripcion());
        return productoService.saveProducto(producto);
    }

    @DeleteMapping("/{id}")
    @ResponseStatus(HttpStatus.OK)
    public void deleteProducto(@PathVariable Long id) {
       productoService.deleteProducto(id);
    }
}
