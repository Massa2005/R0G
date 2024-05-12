<link rel="stylesheet" href="mainStyle.css">
<html>
    <?php
        ini_set('display_errors','Off');
        session_start();
        echo '<input type="hidden" id="in-mail" value="'.$_SESSION["mail"].'">';
        echo '<input type="hidden" id="in-dev" value="'.$_SESSION["dev"].'">';
        echo '<input type="hidden" id="in-search" value="'.$_GET["search"].'">';
        $_SESSION["searched"] = $_GET["search"];
    ?>
    <div id="header">
    <div>
        <img src="/sources/Logo.png" id="logo">
    </div>
        <div class="center" id="searchdiv">
            
            <input type="text" id="searchbar" placeholder="search">
            <button onclick="search()" id="searchbutt">&nbsp;</button>
        </div>
        
        <div class="center" style="width:fit-content; top: 110px">
            <div id="register" class="rowButton">
                register
            </div>
            <div id="log-in" class="rowButton">
                log-in
            </div>
            <div id="log-out" class="rowButton">
                log-out
            </div>
        </div>
    </div>
    <div id="content" style="position:relative; top:160px">

    </div>

    
</html>


<div id="footer" >
    <a href="pages/dev-pre-login.php">are you a developer?</a>
</div>


<script>
    let loginButton = document.getElementById("log-in");
    let logoutButton = document.getElementById("log-out");
    let registerButton = document.getElementById("register");
    let inmail = document.getElementById("in-mail");
    let indev = document.getElementById("in-dev");
    let insearch = document.getElementById("in-search");
    let sbar = document.getElementById("searchbar");

    console.log("dev: ->"+indev.value);
    
    if(inmail.value== ""){
        loginButton.innerHTML = "log-in";
    }else if(indev.value == "true"){
        loginButton.innerHTML = "dev area";
    }else{
        loginButton.innerHTML = "personal area";
    }

    if(insearch.value !=""){
        sbar.value = insearch.value;
        loadPage("inPage/game-search.php");
    }

    loginButton.addEventListener("click",(event)=>{loginBehaviour();});
    logoutButton.addEventListener("click",(event)=>{ window.location.href="phps/logout.php";});
    registerButton.addEventListener("click",(event)=>{ window.location.href="pages/pre-register.php";});

    function search(){
        window.location.href="index.php?search="+sbar.value;
    }

    function loginBehaviour(){
        if(inmail.value== ""){
            window.location.href="pages/pre-login.php";
        }else if(indev.value == "true"){
            window.location.href="pages/dev-personal_area.php";
        }else{
            window.location.href="pages/personal_area.php";
        }
    }
    function loadPage(page){
        console.log("fatto");
        fetch(page).then(data => data.text()).then(html => document.getElementById('content').innerHTML = html);
    }
    
</script>