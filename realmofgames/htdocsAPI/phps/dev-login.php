<form action="../pages/dev-pre-login.php" id="form" method="POST">
<?php
ini_set('display_errors','On');
session_start();
$servername = "localhost";
$username = "root";
$password = "";


try {
    $conn = new PDO("mysql:host=$servername;dbname=rogdb", $username, $password);
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    
    $sql = "SELECT e_mail,nome,password FROM editori WHERE e_mail='".$_POST["mail"]."'";
    $res = $conn->query($sql)->fetchAll();
    
    if(count($res)>0){
        if($_POST["password"] == $res[0]["password"]){
            echo "ok apposto";
            $_SESSION["mail"]=$_POST["mail"];
            $_SESSION["name"]=$res[0]["nome"];
            $_SESSION["dev"]="true";
            echo '<input type="hidden" name="result" value="ok">';
        }else{
            echo "no password";
            echo '<input type="hidden" name="result" value="no1">';
        }
    }else{
        echo "no mail";
        echo '<input type="hidden" name="result" value="no2">';
    }

    
} catch(PDOException $e) {}

?>
</form>

<script>
    document.getElementById("form").submit();
</script>