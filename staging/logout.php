<?php
include_once("header.php");

setcookie("jimeluser[id_user]", null);
setcookie("jimeluser[username]", null);
setcookie("jimeluser[firstname]", null);
setcookie("jimeluser[lastname]", null);
setcookie("jimeluser[profile]", null);
setcookie("jimeluser[association]", null);
setcookie("jimeluser[igreja]", null);
echo "<meta http-equiv='refresh' content='0; url=$base_path/'>";
?>