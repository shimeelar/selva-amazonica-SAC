<%-- 
    Document   : compraBoleto
    Created on : 13/06/2015, 02:01:30 PM
    Author     : CARSA COMPUTO
--%>

<%@page import="proy.modelo.dao.Impl.ViajeDaoImpl"%>
<%@page import="proy.modelo.dao.ViajeDao"%>
<%@page import="proy.modelo.entidad.Persona"%>
<%@page import="proy.modelo.dao.Impl.PersonaDaoImpl"%>
<%@page import="proy.modelo.dao.personaDao"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="WEB-INF/jspf/top.jsp" %>

<%
    ViajeDao dao = new ViajeDaoImpl();
    String id_persona = request.getParameter("id_persona");
    id_persona = id_persona == null ? "" : id_persona;
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
 
%>

<h1>Registro de Asistentes</h1>
<div class="container">
    <div class="row">
        <div class="col-xs-12 col-sm-3 col-md-3"></div>
        <div class="col-xs-12 col-sm-6 col-md-6 well well-sm">
            <form method="post" action="compraBoleto.jsp">
                <table>
                    <tbody>
                        <tr>
                            <td>
                                <input type="hidden" class="form-control" name="buscar" value="buscar">
                                <input type="text" class="form-control" maxlength="8" placeholder="dni" name="dnibuscar">
                            </td>
                            <td><input type="submit" class="btn btn-primary" name="buscar" value="Buscar"></td>
                        </tr>
                    </tbody>
                </table>
            </form>
        </div>
        <div class="col-xs-12 col-sm-3 col-md-3"></div>
    </div>
</div>
<%
    if (!dnibuscar.equals("")) {
        for (Persona persona : dao.buscarPasajero(dnibuscar)) {
            
            id_persona = persona.getIdPersona();
            nombres = persona.getNombres();
            apellidos = persona.getApellidos();
            genero = persona.getGenero();
            dni = persona.getDni();
            telefono = persona.getTelefono();
        }
        if (buscar.equals("buscar") && id_persona.equals("") && nombres.equals("") && apellidos.equals("")
                && genero.equals("") && dni.equals("") && telefono.equals("")) {

%>
<div class="container">  
    <div class="row">
        <div class="col-xs-12 col-sm-3 col-md-3"></div>
        <div class="col-xs-12 col-sm-6 col-md-6 well well-sm">
            <form method="post" action="regPasajero.jsp">
                <table>
                    <tbody>  
                         <tr>
                            <td><label class="control-label col-xs-3">No se encuentra registrado</label></td>
                            <td>
                                <input type="submit" class="form-control"   value="Registrar">
                              
                            </td>
                        </tr>
                    </tbody>
                </table>
            </form>
        </div>
        <div class="col-xs-12 col-sm-3 col-md-3"></div>
    </div>
</div>     
<%}}%>
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
                    </tbody>
                </table>
            </form>
        </div>
        <div class="col-xs-12 col-sm-3 col-md-3"></div>
    </div>
</div>
<div class="container">
    <div class="row">
        <div class="col-xs-12 col-sm-3 col-md-3"></div>
        <div class="col-xs-12 col-sm-6 col-md-6 well well-sm">
            <form>
                <table>
                    <tbody> 
                        <tr>
                            <td><label class="control-label col-xs-3">Cant Boletos:</label></td>
                            <td>
                                <input type="hidden" class="form-control"  name="id_persona" value="">
                                <input type="text" class="form-control" placeholder="pasajes a comprar" name="pasajes">
                            </td>
                        </tr>
                        <tr>
                            <td><label class="control-label col-xs-3">pasaje:</label></td>
                            <td>
                                <input type="text" class="form-control" placeholder="pasaje" name="pasaje">
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