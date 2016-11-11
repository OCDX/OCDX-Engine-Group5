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
                                                                <input class='form-control' type="username" name="username" placeholder="username">
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
                                $error=''; // Error variable
                                if (isset($_POST['submit'])) {
                                       if (empty($_POST['email']) || empty($_POST['password'])) {
                                                $error = "email or Password is invalid";
                                                echo $error;
                                        }
                                        else
                                        {
                                              //  Variabel email dan password
                                                  $email=$_POST['email'];
                                                $password=$_POST['password'];
                                              //   connection to database
                                               $dbconn = pg_connect ("host=localhost port=5432 dbname=postgres user=postgres") or die ('Could not connect:'.pg_last_error ()$

                                                // SQL statement
                                                $sql = " SELECT hashed_password FROM swebd.users WHERE email = '{$email}'";
                                                if ($stmt = pg_prepare($dbconnect, $sql)) {
                                                    #pg_stmt_bind_param($stmt, "s", $username) or die("bind param");
                                                        if(pg_stmt_execute($stmt)) {
                                                                echo "<h4>Success</h4>";

                                                        } else {
                                                                echo "<h4>Failed</h4>";
                                                      }
                                                        $result = pg_stmt_get_result($stmt);
                                                        $row=$result->fdetch_assoc();
                                                        echo $row;
                                                       if (password_verify($password,$row['hashed_password'])){
                                                                $_SESSION['login_user']=$email;
                                                                header("location:index.php");
                                                        } else{
                                                                echo 'Invalid email or password.';
                                                        }
                                                }
                                                                                                                                       


                                        }
                                                
                               }


                        ?>
 </div>
        </body>
</html>
    
