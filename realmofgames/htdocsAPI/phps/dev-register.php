<form action="../pages/dev-pre-register.php" id="form" method="POST">
<?php
session_start();
$servername = "localhost";
$username = "root";
$password = "";

echo '<input type="hidden" name="name" value="'.$_POST["name"].'">';
echo '<input type="hidden" name="surname" value="'.$_POST["surname"].'">';
echo '<input type="hidden" name="mail" value="'.$_POST["mail"].'">';
echo '<input type="hidden" name="password" value="'.$_POST["password"].'">';
echo '<input type="hidden" name="sede" value="'.$_POST["sede"].'">';

try {
    $conn = new PDO("mysql:host=$servername;dbname=rogdb", $username, $password);
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    $sql = "SELECT e_mail FROM editori WHERE e_mail='".$_POST["mail"]."'";
    $res = $conn->query($sql) ->fetchAll();
    
    if(count($res)==0){
        $sql = "INSERT INTO `editori`(`e_mail`, `nome`, `password`, `sede`) VALUES ('".$_POST["mail"]."','".$_POST["name"]."', '".$_POST["password"]."', '".$_POST["sede"]."')";
        $res = $conn->query($sql);
        $_SESSION["name"]=$_POST["name"];
        $_SESSION["mail"]=$_POST["mail"];
        $_SESSION["dev"]="true";
        echo '<input type="hidden" name="result" value="ok">';
    }else{
        echo '<input type="hidden" name="result" value="no">';
    }

    
} catch(PDOException $e) {}

?>

</form>

<script>
    document.getElementById("form").submit();
</script>