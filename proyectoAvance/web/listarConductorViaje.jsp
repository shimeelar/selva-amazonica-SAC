<%-- 
    Document   : listarConductorViaje
    Created on : 13/06/2015, 12:12:34 PM
    Author     : CARSA COMPUTO
--%>

<%@page import="proy.modelo.entidad.Conductor"%>
<%@page import="proy.modelo.dao.Impl.ViajeDaoImpl"%>
<%@page import="proy.modelo.dao.ViajeDao"%>
<%@page import="proy.modelo.entidad.Ciudad"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="WEB-INF/jspf/top.jsp" %>

<%
    ViajeDao dao = new ViajeDaoImpl();

    String id_ciudad = request.getParameter("id_ciudad");id_ciudad = id_ciudad == null ? "" : id_ciudad;
    String id_viajes = request.getParameter("id_viajes"); id_viajes = id_viajes == null ? "" : id_viajes;
    
    if(!id_viajes.equals("")){
      
        if(dao.eliminarViajes(id_viajes)){
           
        }
        
    }
    

%>

<div class="container">
    <div class="row">

        <div class="col-xs-12 col-sm-6 col-md-5 well well-sm">
            <form method="post" action="listarConductorViaje.jsp">
                <table class="table table-condensed">
                    <tbody>
                        <tr>
                            <td><label class="col-sm-12">Ciudad de destino</label></td>
                            <td>   <select class="form-control" name="id_ciudad" onchange="submit()">
                                    <option>Seleccione Ciudad</option>
                                    <%                                        for (Ciudad ciudad : dao.listarCiudad()) {
                                    %>
                                    <option value="<%=ciudad.getIdCiudad()%>"><%=ciudad.getNombre()%></option>
                                    <%}%>
                                </select>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </form>
        </div>
        <div class="col-xs-12 col-sm-3 col-md-3"></div>
    </div>
</div>
<%
    if (!id_ciudad.equals("")) {


%>

<div class="container">
    <div class="row">
        <div class="col-xs-12 col-sm-3 col-md-12"></div>
        <div class="col-xs-12 col-sm-6 col-md-12 well well-sm">
            <table class="table table-condensed">
                <thead>
                    <tr>
                        <td width="8%"><label class="col-sm-12">cantidad</label></td>
                        <td width="15%"><label class="col-sm-12">Apellidos</label></td>
                        <td width="10%"><label class="col-sm-12">Nombres</label></td>
                        <td width="10%"><label class="col-sm-12">Fecha</label></td>
                        <td width="10%"><label class="col-sm-12">Hora</label></td>
                        <td width="20%"><label class="col-sm-12">placa del vehiculo</label></td>
                        <td width="20%"><label class="col-sm-12">Ciudad de salida</label></td>
                        <td width="20%"><label class="col-sm-12">Eliminar</label></td>
                        <td width="20%"><label class="col-sm-12">Compra Pasaje</label></td>
                    </tr>
                </thead>
                <%                        int count = 0;
                    for (Conductor conductor : dao.listarConductorViaje(id_ciudad)) {

                        count++;

                %>
                <tbody>
                <td><%=count%></td>
                <td><%=conductor.getApellidos()%></td>
                <td><%=conductor.getNombres()%></td>
                <td><%=conductor.getFecha_viaje()%></td>
                <td><%=conductor.getHora_viaje()%></td>
                <td><%=conductor.getNro_placa()%></td>
                <td><%=conductor.getCiudad_salida()%></td>
                <td>
                    <form method="post" action="listarConductorViaje.jsp">
                        <input type="submit" value="x">
                        <input type="hidden" value="<%=conductor.getId_viajes()%>" name="id_viajes">
                        <input type="hidden" value="<%=id_ciudad%>" name="id_ciudad">
                    </form>
                </td>
                <td>
                    <form method="post" action="compraBoleto.jsp">
                        <input type="submit" value="Comprar">
                        <input type="hidden" value="<%=conductor.getId_viajes()%>" name="id_viajes">
                    </form>
                </td>
                </tbody>
                <%}%>
            </table>
        </div>
    </div>
</div>
<%}%>
<%@include file="WEB-INF/jspf/bottom.jsp" %>