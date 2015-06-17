<%@page import="proy.modelo.entidad.Conductor"%>
<%@page import="proy.modelo.entidad.Pasajero"%>
<%@page import="proy.modelo.entidad.Usuario"%>
<%@page import="proy.modelo.dao.Impl.PersonaDaoImpl"%>
<%@page import="proy.modelo.entidad.Persona"%>
<%@page import="proy.modelo.dao.personaDao"%>
<%@include file="WEB-INF/jspf/top.jsp" %>

<%
    String licencia = request.getParameter("licencia"); licencia = licencia == null ? "" : licencia;
    String usuario = request.getParameter("usuario"); usuario = usuario == null ? "" : usuario;
    String contrasena = request.getParameter("contrasena"); contrasena = contrasena == null ? "" : contrasena;
    String opcion = request.getParameter("opcion");  opcion = opcion == null ? "Guardar" :opcion;
    String nombres = request.getParameter("nombres");  nombres = nombres == null ? "" :nombres;
    String tipo = request.getParameter("tipo");  tipo = tipo == null ? "" :tipo;
    String id_persona = request.getParameter("id_persona");  id_persona = id_persona == null ? "" :id_persona;
    String apellidos = request.getParameter("apellidos");apellidos = apellidos == null ? "" :apellidos;
    String dni = request.getParameter("dni"); dni = dni == null ? "" : dni;
    String genero = request.getParameter("genero");genero = genero == null ? "" :genero;
    String fec_nacimiento = request.getParameter("fecNacimiento");fec_nacimiento = fec_nacimiento == null ? "" :fec_nacimiento;
    String direccion = request.getParameter("direccion"); direccion = direccion == null ? "" :direccion;
    String telefono = request.getParameter("telefono"); telefono = telefono == null ? "" : telefono; 
    String nro_licencia = request.getParameter("numLicencia"); nro_licencia = nro_licencia == null ? "" :nro_licencia;
    String mensaje = "";
    
    personaDao dao = new PersonaDaoImpl();
    Persona persona = new Persona();
    
    if (!nombres.equals("") && !apellidos.equals("") && !dni.equals("") && !genero.equals("")) {    
        persona.setNombres(nombres);
        persona.setApellidos(apellidos);
        persona.setDni(dni);
        persona.setGenero(genero);
        persona.setFecNacimiento(fec_nacimiento);
        persona.setDireccion(direccion);
        persona.setTelefono(telefono);
        
        if (dao.agregarpersona(persona)) {
            mensaje="Se registró correctamente...";
            
            opcion="Registrar";
            persona=dao.Obtenerid(dni);
            id_persona=persona.getIdPersona();
            
        } else {
            mensaje = "Ocurrio unerror al registrar";
            opcion="Guardar";
        }    
    }
    
    if(opcion.equals("Registrando")){
        
        if(!id_persona.equals("")){
            personaDao d= new PersonaDaoImpl();
        
            if(tipo.equals("us")){
                Usuario u = new Usuario();
                u.setIdUsuario(id_persona);
                u.setLogin(usuario);
                u.setPassword(contrasena);         
               
                if(d.insertarUsuario(u)){
                      mensaje="se agrego correctamente";
                }   else{
                      mensaje="no se pudo agregar correctamente";
                         }  
            }
           
            if(tipo.equals("con")){
                
                Conductor c = new Conductor();
                c.setIdConductor(id_persona);
                c.setNroLicencia(licencia);
                if(d.insertarConductor(c)){
                     mensaje="se agrego correctamente";
                     response.sendRedirect("opci_reegistrar.jsp");
                } 
                else{
                     mensaje="no se pudo agregar correctamente";
                         }
                
            }
        }
    }

%>

<%if(opcion.equals("Guardar")||opcion.equals("Actualizar")){%>
<div class="row">      
    <div class="col-md-2">           
    </div>
    <div class="col-md-8 well">
         <div class="titleform1">
           <h2>Registrar Personas</h2>
        </div>
        <br>
        <div class="form1">
      ..    <form class="form-horizontal" action="opci_reegistrar.jsp">
                <div class="form-group">
                    <label class="control-label col-xs-3">Nombres:</label>
                    <div class="col-xs-8">
                        <div class="input-group">
                            <span class="input-group-addon">@</span>
                            <input type="text" class="form-control" placeholder="nombres" name="nombres">
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-xs-3">Apellidos:</label>
                    <div class="col-xs-8">
                      <input type="text" class="form-control" placeholder="apellidos" name="apellidos">
                      <input type="hidden" class="form-control" name="opcion" value="1">
                    </div>
                </div>
                <div class="form-group">
                  <label class="control-label col-xs-3">N&deg;dni:</label>
                  <div class="col-xs-8">
                      <input type="text" class="form-control" required="required" placeholder="dni" name="dni">
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-xs-3">G&eacute;nero:</label>
                    <div class="col-xs-3">
                        <label class="radio-inline">
                            <input type="radio" name="genero" value="M">Masculino
                        </label>
                    </div>
                    <div class="col-xs-3">
                        <label class="radio-inline">
                            <input type="radio" name="genero" value="F">Femenino
                        </label>
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-xs-3" >F.Nacimiento:</label>
                    <div class="col-xs-8">
                        <input type="date" class="form-control" name="fecNacimiento">
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-xs-3">Dirección:</label>
                    <div class="col-xs-8">
                        <textarea rows="3" class="form-control" placeholder="direccion" name="direccion"></textarea>
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-xs-3" >Telefono:</label>
                    <div class="col-xs-8">
                        <input type="text" class="form-control" placeholder="Telefono" name="telefono">
                    </div>
                </div>
                <br>
                <div class="row">
                    <div class="col-md-7">                           
                        <div class="form-group">
                            <div class="col-xs-offset-3 col-xs-9">
                                <input type="submit" class="btn btn-primary" value="Enviar">
                                <input type="reset" class="btn btn-default" value="Limpiar">
                            </div>
                            <br><br><br>            
                        </div>
                    </div>
                    <div class="col-md-3">                       
                    </div>
                </div>
            </form>
        </div>       
    </div>
</div> 
<%}%>

<%if(opcion.equals("Registrar")){%>
<div class="row">
    <div class="col-md-12">
        
        <div class="form-group">
             <div class="col-xs-offset-3 col-xs-9">
                 <a href="opci_reegistrar.jsp?id_persona=<%=id_persona%>&tipo=us&opcion=reg"><input type="submit" class="btn btn-primary" value="Usuario"></a>
                 <a href="opci_reegistrar.jsp?id_persona=<%=id_persona%>&tipo=con&opcion=reg"><input type="submit" class="btn btn-primary" value="Conductor"></a>
            </div>
        </div>
        
    </div>
</div>

<%}%>

<%if(tipo.equals("us")){%>

<form class="form-horizontal" action="opci_reegistrar.jsp">
        <div class="form-group">
            <label class="control-label col-xs-3">Usuario:</label>
            <div class="col-xs-8">
                <div class="input-group">
                    <input type="text" class="form-control" placeholder="usuario" name="usuario">
                </div>
            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-xs-3">Contrasena:</label>
            <input type="hidden" name="tipo" value="us">
            <input type="hidden" name="opcion" value="Registrando">
             <input type="hidden" name="id_persona" value="<%=id_persona%>">       
            <div class="col-xs-8">
              <input type="text" class="form-control" placeholder="contraseña" name="contrasena">
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
                        <td width="8%"><label class="col-sm-12">nombres</label></td>
                        <td width="15%"><label class="col-sm-12">Apellidos</label></td>
                        <td width="10%"><label class="col-sm-12">dni</label></td>
                        <td width="10%"><label class="col-sm-12">genero</label></td>
                        <td width="10%"><label class="col-sm-12">f:nacimiento</label></td>
                        <td width="20%"><label class="col-sm-12">Dirección</label></td>
                        <td width="20%"><label class="col-sm-12">telefono</label></td>
                    </tbody>
                </table>
            </form>
        </div>
        <div class="col-xs-12 col-sm-3 col-md-3"></div>
    </div>
</div>
            
        <div class="form-group">
            <div class="col-xs-offset-3 col-xs-9">
                <input type="submit" class="btn btn-primary" value="Enviar">
                <input type="reset" class="btn btn-default" value="Limpiar">
            </div>         
        </div>
</form>

<%}%>

<%if(tipo.equals("con")){%>

<form class="form-horizontal" action="opci_reegistrar.jsp">
        <div class="form-group">
            <label class="control-label col-xs-3">N°Licencia:</label>
            <input type="hidden" name="tipo" value="con">
            <input type="hidden" name="opcion" value="Registrando">
             <input type="hidden" name="id_persona" value="<%=id_persona%>">      
            <div class="col-xs-8">
                <div class="input-group">
                    <input type="text" class="form-control" placeholder="licencia" name="licencia">
                </div>
            </div>
        </div>
       
        <div class="form-group">
            <div class="col-xs-offset-3 col-xs-9">
                <input type="submit" class="btn btn-primary" value="Enviar">
                <input type="reset" class="btn btn-default" value="Limpiar">
            </div>
        </div>
</form>

<%}%>
<%@include file="WEB-INF/jspf/bottom.jsp" %>