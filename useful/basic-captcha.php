<?php
// NOTE: use this to generate the image, and check the user input against {$_SESSION['captcha']}

# start the session
session_start();

# set headers
header("Expires: Mon, 26 Jul 1997 05:00:00 GMT");
header("Last-Modified: " . gmdate("D, d M Y H:i:s") . " GMT");
header("Cache-Control: no-store, no-cache, must-revalidate");
header("Cache-Control: post-check=0, pre-check=0", false);
header("Pragma: no-cache");
header( "Content-type: image/png" );

# create the captia text
$text = substr(md5(rand(0,9999999)),2,14);
$_SESSION['captcha'] = $text;

# generate the image
$my_img = imagecreate( 200, 80 );
$background = imagecolorallocate( $my_img, 0, 0, 255 );
$text_colour = imagecolorallocate( $my_img, 255, 255, 0 );
$line_colour = imagecolorallocate( $my_img, 128, 255, 0 );
$x=30;
for($i=0;$i<=13;$i++){
    $text_colour = imagecolorallocate( $my_img, rand(140,255), rand(0,255), rand(0,255));
    imagestring($my_img,rand(3,7),$x,25,$text[$i],$text_colour);
    $x+=10;
}
imagesetthickness ( $my_img, 5 );
imageline( $my_img, 30, 45, 165, 45, $line_colour );
imagepng( $my_img );
imagecolordeallocate( $line_color );
imagecolordeallocate( $text_color );
imagecolordeallocate( $background );
imagedestroy( $my_img );
?>
