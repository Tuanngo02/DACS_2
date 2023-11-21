<?php
setcookie("user_cookie", "", time() - 3600);
setcookie("idu", "", time()-3600);
header("location: index.php");
?>