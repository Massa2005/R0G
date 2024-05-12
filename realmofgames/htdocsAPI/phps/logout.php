<?php
    session_start();

    $_SESSION["name"] = "";
    $_SESSION["mail"] = "";
    $_SESSION["dev"]= "";
?>

<script>
    window.location.href="../index.php";
</script>