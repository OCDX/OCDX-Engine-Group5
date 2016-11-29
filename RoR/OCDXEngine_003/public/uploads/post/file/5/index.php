<!DOCTYPE html>
<html>
<!--Zach Bryant - 14213982 - ZTBC68 - Challenge 8 - CS2830-->
<head>
	<meta charset="UTF-8">
	<title>Challenge 8</title>
	<style>
		img {
		height: 500px;
		width: 800px;
		}
	</style>
</head>
<body>
<?php
	//set directory name and check if exists
	$dir = 'images/';
	if(!is_dir($dir))
	{
		echo "$dir doesn't exist.";
	}

	//find and display all png files from images folder and set alt text
	$pngfiles = glob("images/*.png*");
	for ($i=0; $i<count($pngfiles); $i++)
	{
		$num = $pngfiles[$i];
		$name = basename("$num", ".png");
		echo '<img src="'.$num.'" alt="'.$name.'">'."&nbsp;&nbsp;";
	}

	//find and display all jpg files from images folder and set alt text
	$jpgfiles = glob("images/*.jpg*");
        for ($i=0; $i<count($jpgfiles); $i++)
       	{
                $num = $jpgfiles[$i];
		$name = basename("$num", ".jpg");
                echo '<img src="'.$num.'" alt="'.$name.'">'."&nbsp;&nbsp;";
       	}

	//find and display all jpeg files from images folder and set alt text
	$jpegfiles = glob("images/*.jpeg*");
        for ($i=0; $i<count($jpegfiles); $i++)
       	{
                $num = $jpegfiles[$i];
		$name = basename("$num", ".jpeg");
                echo '<img src="'.$num.'" alt="'.$name.'">'."&nbsp;&nbsp;";
       	}

	//find and display all gif files from images folder and set alt text
	$giffiles = glob("images/*.gif*");
        for ($i=0; $i<count($giffiles); $i++)
       	{
                $num = $giffiles[$i];
		$name = basename("$num", ".gif");
                echo '<img src="'.$num.'" alt="'.$name.'">'."&nbsp;&nbsp;";
       	}
?>
</body>
</html>
