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
String id_viajes=request.getParameter("id_viajes");id_viajes=id_viajes==null?"": id_viajes;
%>

<div class="container">
    <div class="row">
        <div class="col-xs-12 col-sm-3 col-md-3"></div>
        <div class="col-xs-12 col-sm-6 col-md-6 well well-sm">
            <form method="post" action="compraBoleto.jsp">
                <table>
                    <tbody>
                        <tr>
                            <td><label class="control-label col-xs-3">Nombres:</label></td>
                            <td> 
                                <input type="text" class="form-control" placeholder="nombres" name="nombresreg">
                            </td>
                        </tr>
                        <tr>
                            <td><label class="control-label col-xs-3">Apellidos:</label></td>
                            <td>
                                <input type="text" class="form-control" placeholder="apellidos" name="apellidosreg">
                            </td>
                        </tr>
                        <tr>
                            <td> <label class="control-label col-xs-3">DNI:</label></td>
                            <td>
                                <input type="hidden" class="form-control"  name="opcion" value="registrarp" >
                            
                                <input type="text" class="form-control" required="required"  maxlength="8" placeholder="dni" name="dnibuscar">
                            </td>
                        </tr>
                        <tr>
                            <td><label class="control-label col-xs-3">Telefono:</label></td>
                            <td> 
                                <input type="text" class="form-control" maxlength="9" placeholder="telefono" name="telefonoreg">
                                <input type="hidden" class="form-control"   name="id_viajes" value="<%=id_viajes%>">
                            </td>
                        </tr>
                        <tr>
                            <td><label class="control-label col-xs-3">G&eacute;nero:</label></td>
                            <td>
                                <label class="radio-inline">
                                    <input type="radio" name="generoreg" value="M">Masculino
                                </label>
                                <label class="radio-inline">
                                    <input type="radio" name="generoreg" value="F">Femenino
                                </label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                    <input type="submit" class="btn btn-primary" value="Enviar">
                    <input type="reset" class="btn btn-default" value="Limpiar">
                          </td>
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



<%@include file="WEB-INF/jspf/bottom.jsp" %>