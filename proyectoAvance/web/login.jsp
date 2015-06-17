


<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title></title>
	<link rel="stylesheet" href="css/estilos2.css">
	<link rel="stylesheet" href="boostrap/css/bootstrap.css">
</head>

<body>
    <article>

        <div class="container">
            <div class="container-fluid" id="login">
                <div class="row">
                    <div class="col-md-6">
                        <h1 class=" form-signin-heading"><strong class="inicio">Inicio</strong></h1>
                        <br>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-6">
                        <form class="login" action="Login.jsp" method="post">
                            <div class="form-group">
                                <input type="text" class="form-control" placeholder="Usuario" name="usuario">

                            </div>
                            <div class="form-group">
                                <input type="password" class="form-control" placeholder="Contrase&ntilde;a" name="password" required>
                            </div>
                            <button class="btn btn-lg btn-default btn-block" type="submit">
                                <strong><a href="index.jsp">Iniciar seci&oacute;n</a></strong>
                            </button>
                        </form>
                    </div>
                </div>          
            </div>

        </div>
    </article>
   
 <script src="jquery/jquery-1.11.2.min.js"></script>
    <script src="boostrap/js/bootstrap.js"></script>
</body>
</html>

