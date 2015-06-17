
<%@page import="proy.modelo.entidad.Conductor"%>
<%@page import="proy.modelo.entidad.Persona"%>
<%@page import="proy.modelo.dao.Impl.ViajeDaoImpl"%>
<%@page import="proy.modelo.dao.ViajeDao"%>
<%@page import="proy.modelo.entidad.Ciudad"%>
<%@page import="proy.modelo.entidad.Vehiculo"%>
<%@page import="proy.modelo.entidad.Viajes"%>
<%@page import="proy.modelo.dao.Impl.PersonaDaoImpl"%>
<%@page import="proy.modelo.dao.personaDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="WEB-INF/jspf/top.jsp" %>
<%

    ViajeDao vd = new ViajeDaoImpl();
    Viajes viajes = new Viajes();

    String idConductor = request.getParameter("conductor");
    idConductor = idConductor == null ? "" : idConductor;
    String idVehiculo = request.getParameter("vehiculo");
    idVehiculo = idVehiculo == null ? "" : idVehiculo;
    String enviar = request.getParameter("enviar");
    enviar = enviar == null ? "" : enviar;
    String IdCiudad = request.getParameter("ciudadSalida");
    IdCiudad = IdCiudad == null ? "" : IdCiudad;
    String IdCiudaddestino = request.getParameter("ciudaDestino");
    IdCiudaddestino = IdCiudaddestino == null ? "" : IdCiudaddestino;
    String horaViaje = request.getParameter("hora");
    horaViaje = horaViaje == null ? "" : horaViaje;
    String fechaViaje = request.getParameter("fechaviaje");
    fechaViaje = fechaViaje == null ? "" : fechaViaje;

    viajes.setIdConductor(idConductor);
    viajes.setIdVehiculo(idVehiculo);
    viajes.setIdCiudad(IdCiudad);
    viajes.setIdCiudaddestino(IdCiudaddestino);
    viajes.setHoraViaje(horaViaje);
    viajes.setFechaViaje(fechaViaje);

    if (vd.RegistrarViaje(viajes)) {
        response.sendRedirect("viaje.jsp");
    } else {

    }
    if(enviar.equals("Enviar"))
    {
        response.sendRedirect("listarConductorViaje.jsp");
    }


%>



<div class="container">
    <div class="row">
        <div class="col-xs-12 col-sm-3 col-md-3"></div>
        <div class="col-xs-12 col-sm-6 col-md-5 well well-sm">
            <form method="post" action="viaje.jsp">
                <table class="table table-condensed">
                    <tbody>
                        <tr>
                            <td><label class="col-sm-12">Conductor</label></td>
                            <td><select class="form-control" name="conductor">
                                    <option>Seleccione Conductor</option>
                                    <%                                for (Persona conductor : vd.listarConductor()) {

                                    %>
                                    <option value="<%=conductor.getIdPersona()%>"><%=conductor.getNombres()%><%=conductor.getApellidos()%></option>
                                    <%}%>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td><label class="col-sm-12">Ciudad Salida:</label></td>
                            <td>
                                <select class="form-control" name="ciudadSalida">
                                    <option>Seleccionar ciudad de Salida</option>
                                    <%
                                        for (Ciudad ciudad : vd.listarCiudad()) {
                                    %>
                                    <option value="<%=ciudad.getIdCiudad()%>"><%=ciudad.getNombre()%></option>
                                    <%}%>
                                </select></td>
                        </tr>
                        <tr>
                            <td><label class="col-sm-12">Ciudad Destino</label></td>
                            <td><select class="form-control" name="ciudaDestino">
                                    <option>Seleccionar ciudad de Destino</option>
                                    <%
                                        for (Ciudad ciudad : vd.listarCiudad()) {
                                    %>
                                    <option value="<%=ciudad.getIdCiudad()%>"><%=ciudad.getNombre()%></option>
                                    <%}%>
                                </select></td>
                        </tr>
                        <tr>
                            <td><label class="col-sm-12">Genero</label></td>
                            <td> <select class="form-control" name="vehiculo">
                                    <option>Seleccionar Vehiculo</option>
                                    <%
                                        for (Vehiculo vehiculo : vd.listarVehiPlaca()) {
                                    %>
                                    <option value="<%=vehiculo.getIdVehiculo()%>"><%=vehiculo.getNroPlaca()%></option>
                                    <%}%>
                                </select></td>
                        </tr>
                        <tr>
                            <td><label class="col-sm-12">Fecha</label></td>
                            <td><input type="date" class="form-control" name="fechaviaje"></td>
                        </tr>
                          <tr>
                            <td><label class="col-sm-12">Hora de salida:</label></td>
                            <td><input type="text" class="form-control" name="hora"></td>
                        </tr>
                          
                         <tr><td>
                               <input type="submit" class="btn btn-primary" value="Guardar" > 
                            </td>
                            <td>
                                <input type="submit" class="btn btn-primary" name="enviar" value="Enviar" > 
                            </td>
                        </tr>
                    </tbody>
                </table>
            </form>
        </div>
        <div class="col-xs-12 col-sm-3 col-md-3"></div>
    </div>
</div>
<%@include file="WEB-INF/jspf/bottom.jsp" %>