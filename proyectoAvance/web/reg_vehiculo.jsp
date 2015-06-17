

<%@page import="proy.modelo.entidad.Vehiculo"%>
<%@page import="proy.modelo.entidad.Marca"%>
<%@page import="proy.modelo.entidad.Color"%>
<%@page import="proy.modelo.entidad.Modelo"%>
<%@page import="proy.modelo.dao.Impl.PersonaDaoImpl"%>
<%@page import="proy.modelo.dao.personaDao"%>
<%@include file="WEB-INF/jspf/top.jsp" %>


<%
    personaDao dao = new PersonaDaoImpl();
    Vehiculo vehiculo = new Vehiculo();

    String idModelo = request.getParameter("modelo");idModelo = idModelo == null ? "" : idModelo;
    String idColor = request.getParameter("color");idColor = idColor == null ? "" : idColor;
    String idMarca = request.getParameter("marca"); idMarca = idMarca == null ? "" : idMarca;
    String nroPlaca = request.getParameter("nplaca"); nroPlaca = nroPlaca == null ? "" : nroPlaca;
    String mensaje = "";
    if (!idModelo.equals("") && !idColor.equals("") && !idMarca.equals("") && !nroPlaca.equals("")) {

        vehiculo.setIdModelo(idModelo);
        vehiculo.setIdColor(idColor);
        vehiculo.setIdMarca(idMarca);
        vehiculo.setNroPlaca(nroPlaca);

        if (dao.insertarVehiculo(vehiculo)) {
            response.sendRedirect("reg_vehiculo.jsp");
        } else {
            mensaje = "No se inserto correctamente";
        }
    }

%>

<div class="row">      
    <div class="col-md-8">
        <h2>Formulario Registro Vehiculo</h2>
        <br>
        <div class="form1">
            <form class="form-horizontal" action="">
                <div class="form-group">
                    <label class=" control-label col-xs-3">Modelo:</label>
                    <div class="col-xs-8">
                        <select class="form-control" name="modelo">
                            <option>Seleccione Modelo</option>
                            <%                                
                                for (Modelo modelo : dao.listarModelo()) {
                            %>
                            <option value="<%=modelo.getIdModelo()%>"><%=modelo.getNombre()%></option>
                            <%}%>
                        </select>
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-xs-3 ">Color:</label>
                    <div class="col-xs-8">
                        <select class="form-control" name="color">
                            <option>Seleccione color</option>
                            <%
                                for (Color color : dao.listarColor()) {
                            %>
                            <option value="<%=color.getIdColor()%>"><%=color.getNombre()%></option>
                            <%}%>
                        </select>
                    </div>
                </div>

                <div class="form-group">
                    <label class="control-label col-xs-3">Marca:</label>
                    <div class="col-xs-8">
                        <select class="form-control"  name="marca">
                            <option>Seleccione color</option>
                            <%
                                for (Marca marca : dao.listarMarca()) {
                            %>
                            <option value="<%=marca.getIdMarca() %>"><%=marca.getNombre() %></option>
                            <%}%>
                        </select>
                    </div>
                </div>

                <div class="form-group">
                    <label class="control-label col-xs-3" >N° Placa:</label>
                    <div class="col-xs-8">
                        <input type="text" name="nplaca"  >
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
                        </div>
                    </div>
                </div>
            </form>
        </div>       
    </div> 
    <%=mensaje%>
</div> 



<%@include file="WEB-INF/jspf/bottom.jsp" %>
