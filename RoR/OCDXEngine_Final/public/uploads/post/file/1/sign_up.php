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
                                        <h2>Create a User</h2>
					<hr>
                                        <form action="<?=$_SERVER['PHP_SELF']?>" method="POST">
                                                 <div class="row form-group">
                                                                <input class='form-control' type="email" name="email" placeholder="Email">
                                                </div>
                                                <div class="row form-group">
                                                                <input class='form-control' type="password" name="password" placeholder="password">
                                                </div>
                                                <div class="row form-group">
                                                                <input class='form-control' type="userid" name="userid" placeholder="userid">
                                                </div>
						<div class="row form-group">
                                                                <input class='form-control' type="usertype" name="usertype" placeholder="usertype">
                                                </div>
						<div class="row form-group">
                                                                <input class='form-control' type="gender" name="gender" placeholder="gender">
                                                </div>
						<div class="row form-group">
                                                                <input class='form-control' type="jobtitle" name="jobtitle" placeholder="jobtitle">
                                                </div>
                                                <div class="row form-group">
                                                                <input class='form-control' type="org" name="org" placeholder="org">
                                                </div>
                                                <div class="row form-group">
                                                                <input class='form-control' type="edlevel" name="edlevel" placeholder="edlevel">
                                                </div>
                                                <div class="row form-group">
                                                                <input class='form-control' type="fname" name="fname" placeholder="fname">
                                                </div>
                                                <div class="row form-group">
                                                                <input class='form-control' type="lname" name="lname" placeholder="lname">
                                                </div>
                                                <div class="row form-group">
                                                                <input class='form-control' type="city" name="city" placeholder="city">
                                                </div>
                                                <div class="row form-group">
                                                                <input class='form-control' type="state" name="state" placeholder="state">
                                                </div>
						 <div class="row form-group">
                                                                <input class='form-control' type="zip" name="zip" placeholder="zip">
                                                </div>
                                                <div class="row form-group">
                                                                <input class='form-control' type="country" name="country" placeholder="country">
                                                </div>
                                                <div class="row form-group">
                                                                <input class='form-control' type="phone" name="phone" placeholder="phone">
                                                </div>
                                                <div class="row form-group">
                                                                <input class='form-control' type="banstatus" name="banstatus" placeholder="banstatus">
                                                </div>
                                                <div class="row form-group">
                                                                <input class=" btn btn-info" type="submit" name="submit" value="Sign up"/>
                                                </div>
                                        </form>
                                </div>
                        </div>
			<?php
                                if(isset($_POST['submit'])) { // Was the form submitted?
                                        //connection
                                        $dbconnect = pg_connect("host=localhost port=5432 dbname=postgres user=postgres") or die ("Connection Error " .  pg_error($dbconnect));
                                        //SQL prepared statements
                                        $sql = "INSERT INTO swedb.user(userid, email,hashed_password,usertype,gender,jobtitle,org,edevel,fname,lname,city,state,zip,country,phone,banstatus) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
					 if ($stmt = mysqli_prepare($dbconnect, $sql)) {
                                                $email = $_POST['email'];
						$fname = $_POST['fname'];
						$lname=$_POST['lname'];
						$userid=$_POST['userid'];
						$usertype=$_POST['usertype'];
						$gender=$_POST['gender'];
						$jobtitle=$_POST['jobtitle'];
						$org=$_POST['org'];
						$edlevel=$_POST['edlevel'];
						$city=$_POST['city'];
						$state=$_POST['state'];
						$zip=$_POST['zip'];
						$country=$_POST['country'];
						$banstatus=$_POST['banstatus'];
						$phone=$_POST['phone'];
                                                $hpass = password_hash($_POST['password'], PASSWORD_DEFAULT)  or die("bind param");
                                                pg_stmt_bind_param($stmt, "sssdssssssssssss", $email,$fname,$lname,$userid,$usertype,$gender,$jobtitle,$org,$edlevel,$city,$state,$zip,$country,$banstatus,$phone,$hpass) or die("bind param");
                                                if(pg_stmt_execute($stmt)) {
                                                        echo "<h4>Success</h4>";
                                                } else {
                                                        echo "<h4>Failed</h4>";
                                                }
                                                $result = pg_stmt_get_result($stmt);
                                        } else {
                                                die("prepare failed");
                                        }
                                }
                        ?>
        <p>Go back to login page, click <a href='login_in.php'>here</a></p>

                </div>

        </body>
</html>
