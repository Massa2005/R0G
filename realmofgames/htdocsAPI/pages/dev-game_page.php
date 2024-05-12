<link rel="stylesheet" href="../mainStyle.css">
<html>
    <?php
        ini_set('display_errors','Off');
        session_start();
        echo '<input type="hidden" id="result" value="'.$_POST["result"].'">';
        echo $_SESSION["mail"];

        $servername = "localhost";
        $username = "root";
        $password = "";
        
        
        try {
            $conn = new PDO("mysql:host=$servername;dbname=rogdb", $username, $password);
            $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
            
            $sql = "SELECT * FROM giochi WHERE id='".$_POST["id"]."'";
            $res = $conn->query($sql)->fetchAll();
            
            
        } catch(PDOException $e) {}   




    ?>
    <div id="header">
        <div class="center" style="width:fit-content; top: 110px">
            <div id="register" class="rowButton">
                statistic
            </div>
            <div id="log-in" class="rowButton">
                game
            </div>
            <div id="log-out" class="rowButton">
                boh
            </div>
        </div>
    </div>
    <div id="content" style="position:relative; top: 300px;">


    </div>
</html>
<script>

    
    /*
    let loginButton = document.getElementById("log-in");
    let logoutButton = document.getElementById("log-out");
    let registerButton = document.getElementById("register");
    let result = document.getElementById("result");

    if(result.value=="ok-added"){
        //loadPage("../inPage/dev-game-list.php");
    }

    loginButton.addEventListener("click",(event)=>{loadPage("../inPage/dev-game-list.php");});

    function goToAdd(){
        window.location.href="dev-add-game.php";
    }

    function loadPage(page){
        console.log("fatto");
        fetch(page).then(data => data.text()).then(html => document.getElementById('content').innerHTML = html);
    }
</script>