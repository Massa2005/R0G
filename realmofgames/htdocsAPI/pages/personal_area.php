<link rel="stylesheet" href="../mainStyle.css">
<html>
    <?php
        ini_set('display_errors','Off');
        session_start();
        echo '<input type="hidden" id="result" value="'.$_POST["result"].'">';
        echo $_SESSION["mail"];
    ?>
    <div id="header">
        <div class="center" style="width:fit-content; top: 110px">
            <div id="games" class="rowButton">
                games
            </div>
            <div id="per-info" class="rowButton">
                personal info
            </div>
        </div>
    </div>
    <div id="content" style="position:relative; top: 300px;">


    </div>
</html>
<script>
    let gamesButton = document.getElementById("games");
    let infoButton = document.getElementById("per-info");
    let result = document.getElementById("result");

    gamesButton.addEventListener("click",(event)=>{loadPage("../inPage/game-list.php");});

    function loadPage(page){
        console.log("fatto");
        fetch(page).then(data => data.text()).then(html => document.getElementById('content').innerHTML = html);
    }
</script>