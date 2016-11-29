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
                                                                <input class='form-control' type="email" name="email" placeholder="email">
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
			<?php 
				session_start(); // Starting session to keep username variable
               $postdata = file_get_contents("php://input");
    	       $request = json_decode($postdata);
    	       $iniemail = $request->email;
    	       $inipassword = $request->password;

            $dbconn = pg_connect('host=localhost port=5432 dbname=postgres user=postgres password= ') or die('Could not connect: ' . pg_last_error());

	       $email = htmlspecialchars($iniemail);
            $password = htmlspecialchars($inipassword);

	           pg_prepare($dbconn, "auth", 'SELECT password_hash FROM FROM swebd.users WHERE email = $1');
                $result = pg_execute($dbconn, "auth", array($email));

	           $row = pg_fetch_assoc($result); 
	           $localhash = sha1( intval($row['email']) . $password);
	           if ($localhash == $row['password_hash']) {
		 
                   if(!isset($_SESSION['email'])) {
                       $_SESSION['email'] = $row['email'];
                       setcookie('email', $row['email']);
		  }  else {

		  }
                   echo json_encode($_SESSION);

	 } else {
		 echo 0 ; 
	 }

   	

   	?>


 </div>
        </body>
</html>
