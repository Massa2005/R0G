<form action="../pages/dev-add-game.php" id="form" method="POST">
<?php
ini_set('display_errors','On');
error_reporting(E_ALL);
session_start();
$servername = "localhost";
$username = "root";
$password = "";

echo '<input type="hidden" name="name" value="'.$_POST["name"].'">';
echo '<input type="hidden" name="description" value="'.$_POST["description"].'">';
echo '<input type="hidden" name="cost" value="'.$_POST["cost"].'">';
echo '<input type="hidden" name="date" value="'.$_POST["date"].'">';

try {
    $conn = new PDO("mysql:host=$servername;dbname=rogdb", $username, $password);
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    $sql = "SELECT * FROM giochi WHERE nome='".$_POST["name"]."' AND mail_editore='".$_SESSION["mail"]."' ";
    $res = $conn->query($sql) ->fetchAll();
    if(count($res)==0){
        echo "aggiunto";
        $sql = "SELECT max(id) FROM giochi";
        $res = $conn->query($sql) ->fetchAll();
        $id = $res[0]["max(id)"]+1;
        
        $sql = "INSERT INTO `giochi`( `nome`, `descrizione`, `prezzo`, `mail_editore`, `main_img`, `data_pubblicazione`) VALUES ('".$_POST["name"]."','".$_POST["description"]."','".$_POST["cost"]."','".$_SESSION["mail"]."','".$_POST["img"]."','".$_POST["date"]."')";
        $res = $conn->query($sql);
        echo '<input type="hidden" name="result" value="ok-added">';
    }else{
        echo "non aggiunto";
        echo '<input type="hidden" name="result" value="no-name">';
    }

} catch(PDOException $e) {}

?>

</form>

<script>
    document.getElementById("form").submit();
</script>