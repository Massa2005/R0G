<link rel="stylesheet" href="../mainStyle.css">
<html>
    <?php
        ini_set('display_errors','Off');
        echo '<input type="hidden" id="result" value="'.$_POST["result"].'">';
        echo '<input type="hidden" id="namein" value="'.$_POST["name"].'">';
        echo '<input type="hidden" id="sedein" value="'.$_POST["sede"].'">';
        echo '<input type="hidden" id="mailin" value="'.$_POST["mail"].'">';
        echo '<input type="hidden" id="passwordin" value="'.$_POST["password"].'">';
    ?>

    <div class="borderContainer center" style="width: fit-content; top:200px">
        <form action="../phps/dev-register.php" id="form" method="POST">
            <div class="center" style="width: fit-content;">Mail</div>
            <input type="text" id="mail" name="mail" class="center"><br><br>
            <div class="center" id="error" style="width: fit-content; color:red;"></div>

            <div class="center" style="width: fit-content;">Name</div>
            <input type="text" id="name" name="name" class="center"><br><br>

            <div class="center" style="width: fit-content;">Sede</div>
            <input type="text" id="sede" name="sede" class="center"><br><br>

            <div class="center"  style="width: fit-content;">Password</div>
            <input type="password" id="password" name="password" class="center"><br><br>
            

            <div class="center"  style="width: fit-content;">Repeat password</div>
            <input type="password" id="password2" name="password2" class="center"><br><br>
            <div class="center" id="error2" style="width: fit-content; color:red;"></div>
        </form>
        <button onclick="register()" class="center">Register</button>
    </div>
</html>

<script>
    let res =document.getElementById("result");
    let error =document.getElementById("error");
    let error2 =document.getElementById("error2");
    let name =document.getElementById("name");
    let namein =document.getElementById("namein");
    let sede =document.getElementById("sede");
    let sedein =document.getElementById("sedein");
    let mail =document.getElementById("mail");
    let mailin =document.getElementById("mailin");
    let password =document.getElementById("password");
    let passwordin =document.getElementById("passwordin");
    let password2 =document.getElementById("password2");

    name.value = namein.value;
    sede.value = sedein.value;
    mail.value = mailin.value;
    password.value = passwordin.value;

    error.innerHTML="";
    error2.innerHTML="";

    if(res.value == "ok"){
        error.innerHTML="";
        window.location.href="../index.php";
    }else if(res.value == "no"){
        error.innerHTML="email già registrata";
    }

    function register(){
        if(password.value == password2.value){
            document.getElementById("form").submit();
        }else{
            error2.innerHTML = "password diverse";
        }
    }
</script>