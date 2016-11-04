<html>
        <head>
                <!--  I USE BOOTSTRAP BECAUSE IT MAKES FORMATTING/LIFE EASIER -->
                <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css"><!-- Latest compiled and minified CSS -->
                <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap-theme.min.css"><!-- Optional theme -->
                <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script><!-- Latest compiled and minified JavaScript -->
        </head>
        <body>
                <div class="container">
                        <div class="row">
                                <div class="col-md-4 col-sm-4 col-xs-3"></div>
                                <div class="col-md-4 col-sm-4 col-xs-6">
                                        <h2>Login</h2>
                                        <form action="<?=$_SERVER['PHP_SELF']?>" method="POST">
                                                <div class="row form-group">
                                                                <input class='form-control' type="text" name="username" placeholder="username">
                                                </div>
                                                <div class="row form-group">
                                                                <input class='form-control' type="password" name="password" placeholder="password">
                                                </div>
                                                <div class="row form-group">
                                                                <input class=" btn btn-info" type="submit" name="submit" value="Login"/>
                                                </div>
                                                <p>If you don't have account, go <a href='sign_up.php'>here</a></p>
                                        </form>
                                </div>
                        </div>
 </div>
        </body>
</html>