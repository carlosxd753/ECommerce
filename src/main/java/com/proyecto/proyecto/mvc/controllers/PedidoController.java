package com.proyecto.proyecto.mvc.controllers;

import java.util.Calendar;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.proyecto.proyecto.mvc.modelos.DetallesDePedido;
import com.proyecto.proyecto.mvc.modelos.Pedido;
import com.proyecto.proyecto.mvc.modelos.Producto;
import com.proyecto.proyecto.mvc.modelos.Tracking;
import com.proyecto.proyecto.mvc.servicios.DetallesDePedidoService;
import com.proyecto.proyecto.mvc.servicios.PedidoService;
import com.proyecto.proyecto.mvc.servicios.ProductoService;
import com.proyecto.proyecto.mvc.servicios.TrackingService;

import jakarta.validation.Valid;

@RequestMapping("/pedidos")
@Controller
public class PedidoController {
  @Autowired
  PedidoService pedidoService;

  @Autowired
  ProductoService productoService;

  @Autowired
  DetallesDePedidoService detallesDePedidoService;

  @Autowired
  TrackingService trackingService;

  @PostMapping("/new")
  public String createPedido(@Valid @ModelAttribute("pedido") Pedido pedido, BindingResult result,
      @RequestParam("url") String url, @RequestParam("productId") String productId,
      @RequestParam("quantity") String quantity, @RequestParam("size") String size) {
    if (result.hasErrors()) {
      return "/mvc/showProduct.jsp";
    } else {
      Producto productoAComprar = productoService.findById(Long.parseLong(productId));
      float totalDelPedido = (float) productoAComprar.getPrecio() * Integer.parseInt(quantity);
      productoAComprar.setStockDisponible(productoAComprar.getStockDisponible() - Integer.parseInt(quantity));
      productoService.save(productoAComprar);
      pedido.setFechaYHoraDelPedido(new Date());
      pedido.setTotalDelPedido(totalDelPedido);
      pedidoService.save(pedido);
      DetallesDePedido detalleDePedido = new DetallesDePedido();
      detalleDePedido.setQuantity(Integer.parseInt(quantity));
      detalleDePedido.setSize(size);
      detalleDePedido.setPedido(pedido);
      detalleDePedido.setProducto(productoAComprar);
      detallesDePedidoService.save(detalleDePedido);
      Calendar c = Calendar.getInstance();
      c.setTime(new Date());
      c.add(Calendar.DATE, 2);
      Tracking tracking = new Tracking();
      tracking.setFechaDeEnvio(c.getTime());
      c.add(Calendar.DATE, 5);
      tracking.setFechaDeEntrega(c.getTime());
      tracking.setEstadoActual("Por Enviar");
      tracking.setLocalizacion("Bogota, Colombia");
      tracking.setPedidoParaEntregar(pedido);
      trackingService.save(tracking);
      return "redirect:" + url;
    }
  }

  @PostMapping("/newGuest")
  public String createPedidoGuest(@Valid @ModelAttribute("pedido") Pedido pedido, BindingResult result,
      @RequestParam("url") String url, @RequestParam("productId") String productId,
      @RequestParam("quantity") String quantity, @RequestParam("size") String size) {
    if (result.hasErrors()) {
      return "/mvc/showProduct.jsp";
    } else {
      Producto productoAComprar = productoService.findById(Long.parseLong(productId));
      float totalDelPedido = (float) productoAComprar.getPrecio() * Integer.parseInt(quantity);
      productoAComprar.setStockDisponible(productoAComprar.getStockDisponible() - Integer.parseInt(quantity));
      productoService.save(productoAComprar);
      pedido.setFechaYHoraDelPedido(new Date());
      pedido.setTotalDelPedido(totalDelPedido);
      pedidoService.save(pedido);
      DetallesDePedido detalleDePedido = new DetallesDePedido();
      detalleDePedido.setQuantity(Integer.parseInt(quantity));
      detalleDePedido.setSize(size);
      detalleDePedido.setPedido(pedido);
      detalleDePedido.setProducto(productoAComprar);
      detallesDePedidoService.save(detalleDePedido);
      Calendar c = Calendar.getInstance();
      c.setTime(new Date());
      c.add(Calendar.DATE, 2);
      Tracking tracking = new Tracking();
      tracking.setFechaDeEnvio(c.getTime());
      c.add(Calendar.DATE, 5);
      tracking.setFechaDeEntrega(c.getTime());
      tracking.setEstadoActual("Por Enviar");
      tracking.setLocalizacion("Bogota, Colombia");
      tracking.setPedidoParaEntregar(pedido);
      trackingService.save(tracking);
      return "redirect:" + url;
    }
  }
}
