<?
header('Content-type: image/jpeg');
$imagem = "mod_img.jpg";
$img = @imagecreatefromjpeg($imagem);
$x = 70 - ((strlen(trim($texto)) / 2) * 7);
$c1 = imagecolorallocate($img, 0, 0, 0);
imagestring($img, 3, $x, 55, $texto, $c1);
imagejpeg($img);
imagedestroy($img);
?>
