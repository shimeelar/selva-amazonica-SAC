<%-- 
    Document   : regPsajero
    Created on : 13/06/2015, 10:39:42 PM
    Author     : CARSA COMPUTO
--%>

<%@page import="proy.modelo.entidad.Pasajero"%>
<%@page import="proy.modelo.entidad.Persona"%>
<%@page import="proy.modelo.dao.Impl.PersonaDaoImpl"%>
<%@page import="proy.modelo.dao.personaDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="WEB-INF/jspf/top.jsp" %>
<%
    personaDao dao = new PersonaDaoImpl();
    Persona persona = new Persona();

    String tipo = request.getParameter("tipo");
    tipo = tipo == null ? "" : tipo;
    String id_persona = request.getParameter("id_persona");
    id_persona = id_persona == null ? "" : id_persona;
    String opcion = request.getParameter("opcion");
    opcion = opcion == null ? "Guardar" : opcion;
    String buscar = request.getParameter("buscar");
    buscar = buscar == null ? "" : buscar;
    String nombres = request.getParameter("nombres");
    nombres = nombres == null ? "" : nombres;
    String apellidos = request.getParameter("apellidos");
    apellidos = apellidos == null ? "" : apellidos;
    String genero = request.getParameter("genero");
    genero = genero == null ? "" : genero;
    String dni = request.getParameter("dni");
    dni = dni == null ? "" : dni;
    String dnibuscar = request.getParameter("dnibuscar");
    dnibuscar = dnibuscar == null ? "" : dnibuscar;
    String telefono = request.getParameter("telefono");
    telefono = telefono == null ? "" : telefono;
    String fechanacimiento = request.getParameter("fecNacimiento");
    fechanacimiento = fechanacimiento == null ? "" : fechanacimiento;
    String mensaje = " ";

    if (opcion.equals("Registrando")) {
        if (!id_persona.equals("")) {
            personaDao d = new PersonaDaoImpl();

            if (tipo.equals("pas")) {

                Pasajero p = new Pasajero();
                p.setIdPasajero(id_persona);
                if (d.insertarPasajero(p)) {
                    mensaje = "se agrego correctamente";
                } else {
                    mensaje = "no se pudo agregar correctamente";
                }
            }
        }
    }
%>

<%if (opcion.equals("Guardar") || opcion.equals("Actualizar")) {%>
<div class="container">
    <div class="row">
        <div class="col-xs-12 col-sm-3 col-md-3"></div>
        <div class="col-xs-12 col-sm-6 col-md-6 well well-sm">
            <form>
                <table>
                    <tbody>
                        <tr>
                            <td><label class="control-label col-xs-3">Nombres:</label></td>
                            <td> 
                                <input type="text" class="form-control" placeholder="nombres" name="nombres" value="<%=nombres%>">
                            </td>
                        </tr>
                        <tr>
                            <td><label class="control-label col-xs-3">Apellidos:</label></td>
                            <td>
                                <input type="text" class="form-control" placeholder="apellidos" name="apellidos" value="<%=apellidos%>">
                            </td>
                        </tr>
                        <tr>
                            <td> <label class="control-label col-xs-3">DNI:</label></td>
                            <td>
                                <input type="text" class="form-control" required="required" placeholder="dni" name="dni" value="<%=dni%>">
                            </td>
                        </tr>
                        <tr>
                            <td><label class="control-label col-xs-3">Telefono:</label></td>
                            <td> 
                                <input type="text" class="form-control" placeholder="telefono" name="telefono" value="<%=telefono%>">
                            </td>
                        </tr>
                        <tr>
                            <td> <label class="control-label col-xs-3">Fecha Nacimiento:</label></td>
                            <td>
                                <input type="date" class="form-control" name="fecNacimiento">
                            </td>
                        </tr>
                        <tr>
                            <td><label class="control-label col-xs-3">G&eacute;nero:</label></td>
                            <td>
                                <label class="radio-inline">
                                    <input type="radio" name="genero" value="<%=genero%>">Masculino
                                </label>
                            </td>
                            <td>
                                <label class="radio-inline">
                                    <input type="radio" name="genero" value="<%=genero%>">Femenino
                                </label>
                            </td>
                        </tr>
                        <tr>
                    <input type="submit" class="btn btn-primary" value="Enviar">
                    <input type="reset" class="btn btn-default" value="Limpiar">
                    </tr>
                    </tbody>
                </table>
            </form>
        </div>
        <div class="col-xs-12 col-sm-3 col-md-3"></div>
    </div>
</div>
<div class="col-xs-12 col-sm-3 col-md-3"></div>
<div class="col-xs-12 col-sm-6 col-md-6 well well-sm"></div>
<%}%>
<%if (opcion.equals("Registrar")) {%>
<div class="row">
    <div class="col-md-12">
        <div class="form-group">
            <div class="col-xs-offset-3 col-xs-9">
                <a href="opci_reegistrar.jsp?id_persona=<%=id_persona%>&tipo=pas&opcion=Registrando"><input type="submit" class="btn btn-primary" value="Pasajero"></a>
            </div>
        </div>
    </div>
</div>

<%}%>

<%if (tipo.equals("us")) {%>

<form class="form-horizontal" action="regPasajero.jsp">
    <label class="control-label col-xs-3">Contrasena:</label>
    <input type="hidden" name="tipo" value="us">
    <input type="hidden" name="opcion" value="Registrando">
    <input type="hidden" name="id_persona" value="<%=id_persona%>">
    <div class="form-group">
        <div class="col-xs-offset-3 col-xs-9">
            <input type="submit" class="btn btn-primary" value="Enviar">
            <input type="reset" class="btn btn-default" value="Limpiar">
        </div>
        <br><           
    </div>
</form>

<%}%>

<%@include file="WEB-INF/jspf/bottom.jsp" %>