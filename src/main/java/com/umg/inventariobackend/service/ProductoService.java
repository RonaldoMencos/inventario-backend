package com.umg.inventariobackend.service;

import com.umg.inventariobackend.model.Producto;
import com.umg.inventariobackend.repository.ProductoRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;
import javax.transaction.Transactional;
import java.util.List;

@Service
public class ProductoService {
    @Autowired
    private ProductoRepository productoRepository;
    @PersistenceContext
    private EntityManager entityManager;

    @Transactional
    public List<Producto> findAllProductos() {
        List<Producto> productos = productoRepository.findAll();
        for (Producto producto : productos) {
            if (producto.getCategoria() != null) {
                producto.getCategoria().getIdProductoCategoria();
            }
        }
        return productos;
    }

    @Transactional
    public List<Producto> findProductosByFiltros(String codigo, String nombre, String descripcion, Long categoria) {
        boolean inicio = true;
        StringBuilder query = new StringBuilder("SELECT e FROM Producto e");
        if (codigo!=null && !codigo.isEmpty()){
            query.append(" WHERE e.codigo = '").append(codigo).append("'");
            inicio = false;
        }
        if (nombre!=null && !nombre.isEmpty()){
            if (inicio) {
                query.append(" WHERE e.nombre = '").append(nombre).append("'");
                inicio = false;
            } else {
                query.append(" AND e.nombre = '").append(nombre).append("'");
            }
        }
        if (descripcion!=null && !descripcion.isEmpty()){
            if (inicio) {
                query.append(" WHERE e.descripcion = '").append(descripcion).append("'");
                inicio = false;
            } else {
                query.append(" AND e.descripcion = '").append(descripcion).append("'");
            }
        }
        if (categoria!=null){
            if (inicio) {
                query.append(" WHERE e.categoria.idProductoCategoria = ").append(categoria).append("");
                inicio = false;
            } else {
                query.append(" AND e.categoria.idProductoCategoria = ").append(categoria).append("");
            }
        }

        TypedQuery<Producto> jpaQuery = entityManager.createQuery(query.toString(), Producto.class);
        return jpaQuery.getResultList();
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
