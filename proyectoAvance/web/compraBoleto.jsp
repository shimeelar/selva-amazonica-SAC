<%-- 
    Document   : compraBoleto
    Created on : 13/06/2015, 02:01:30 PM
    Author     : CARSA COMPUTO
--%>

<%@page import="proy.modelo.entidad.Boleto"%>
<%@page import="proy.modelo.entidad.Pasajero"%>
<%@page import="proy.modelo.dao.Impl.ViajeDaoImpl"%>
<%@page import="proy.modelo.dao.ViajeDao"%>
<%@page import="proy.modelo.entidad.Persona"%>
<%@page import="proy.modelo.dao.Impl.PersonaDaoImpl"%>
<%@page import="proy.modelo.dao.personaDao"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="WEB-INF/jspf/top.jsp" %>

<%
    ViajeDao dao = new ViajeDaoImpl();
    
    personaDao d = new PersonaDaoImpl();
    
    Pasajero pasajero = new Pasajero();
    Persona p = new Persona();
    Boleto b=new Boleto();
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
    String id_viajes = request.getParameter("id_viajes");
    id_viajes = id_viajes == null ? "" : id_viajes;
     String dnibuscar = request.getParameter("dnibuscar");
    dnibuscar = dnibuscar == null ? "" : dnibuscar;
    String telefono = request.getParameter("telefono");
    telefono = telefono == null ? "" : telefono;
    String opcion = request.getParameter("opcion");
    opcion = opcion == null ? "" : opcion;
    String boletos = request.getParameter("boletos");
    boletos = boletos == null ? "" : boletos;
    String precio = request.getParameter("precio");
    precio = precio == null ? "" : precio;
     if(opcion.equals("boleto")&&!precio.equals("")&&!id_viajes.equals("")&&!id_persona.equals("")){
         b.setIdPasajero(id_persona);
         b.setIdViaje(id_viajes);
         b.setValorPagar(precio);
         b.setBoletos(boletos);
       if(dao.RegistrarBoleto(b)){
       }
     }
    if(opcion.equals("registrarp")){
    String id_personareg = request.getParameter("id_personareg");id_personareg = id_personareg == null ? "" : id_personareg;
    String nombresreg = request.getParameter("nombresreg"); nombresreg = nombresreg == null ? "" : nombresreg;
    String apellidosreg = request.getParameter("apellidosreg");apellidosreg = apellidosreg == null ? "" : apellidosreg;
    String generoreg = request.getParameter("generoreg"); generoreg = generoreg == null ? "" : generoreg;
    String dnireg = request.getParameter("dnibuscar");dnireg = dnireg == null ? "" : dnireg;
    String telefonoreg = request.getParameter("telefonoreg"); telefonoreg = telefonoreg == null ? "" : telefonoreg;
    String mensaje = "";
   
    if(!nombresreg.equals("") && !apellidosreg.equals("") && !dnireg.equals("") && !generoreg.equals("")){
        
        p.setNombres(nombresreg);
        p.setApellidos(apellidosreg);
        p.setDni(dnireg);
        p.setGenero(generoreg);
        p.setTelefono(telefonoreg);
        p.setFecNacimiento("");
        p.setDireccion("");
        if(d.agregarpersona(p)){
        p=d.Obtenerid(dnireg);
        id_persona=p.getIdPersona();
        pasajero.setIdPasajero(id_persona);
        if(d.insertarPasajero(pasajero)){
          
        }else{
            response.sendRedirect("regPsajero.jsp");
        }
        }
    }
    }
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
                                <input type="hidden" class="form-control" name="id_viajes" value="<%=id_viajes%>">
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
            <form method="post" action="regPsajero.jsp">
                <table>
                    <tbody>  
                         <tr>
                            <td>
                                <input type="hidden" class="form-control"  name="id_viajes" value="<%=id_viajes%>">
                                <label class="control-label col-xs-3">No se encuentra registrado</label></td>
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
                                 <input type="hidden" class="form-control"  name="id_viajes" value="<%=id_viajes%>">
                            </td>
                        </tr>
                        <tr>
                            <td><label class="control-label col-xs-3">Telefono:</label></td>
                            <td> 
                                <input type="text" class="form-control" placeholder="telefono" name="telefono" value="<%=telefono%>">
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
            <form method="post" action="compraBoleto.jsp">
                <table>
                    <tbody> 
                        <tr>
                            <td><label class="control-label col-xs-3">Cant Boletos:</label></td>
                            <td>
                                <input type="text" class="form-control" placeholder="boletos a comprar" name="boletos">
                            </td>
                        </tr>
                        <tr>
                            <td><label class="control-label col-xs-3">pasaje:</label></td>
                            <td>
                                <input type="text" class="form-control" placeholder="precio" name="precio">
                                <input type="hidden" class="form-control"   name="opcion" value="boleto">
                                <input type="hidden" class="form-control"   name="id_viajes" value="<%=id_viajes%>">
                                <input type="hidden" class="form-control"   name="id_persona" value="<%=id_persona%>">
                            </td>
                        </tr>
                         <tr>
                            <td>
                                <input type="submit" value="Guardar" class="btn btn-success">
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