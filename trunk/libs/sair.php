<?
 session_start("usuarios");
 session_destroy();
 sleep(1);
 echo "<script>window.close();</script>"
 ?>

