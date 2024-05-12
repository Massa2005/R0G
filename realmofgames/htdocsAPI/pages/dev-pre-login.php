<link rel="stylesheet" href="../mainStyle.css">
<html>
    <?php
        ini_set('display_errors','Off');
        session_start();
        echo '<input type="hidden" id="in-mail" value="'.$_SESSION["mail"].'">';
        echo '<input type="hidden" id="result" value="'.$_POST["result"].'">';

    ?>

    <div class="borderContainer center" style="top:250px">
        <form action="../phps/dev-login.php" method="POST">
            <div class="center" style="width: fit-content;">Mail</div>
            <input type="text" id="mail" name="mail" class="center"><br><br>
            <div class="center" id="error2" style="width: fit-content; color:red;"></div>

            <div class="center"  style="width: fit-content;">Password</div>
            <input type="password" name="password" class="center"><br><br>
            <div class="center" id="error1" style="width: fit-content; color:red;"></div>
            <input type="submit" value="Login" class="center">
        </form>
    </div><br>
    
    <div class="center" style="top:250px">
        <a href="dev-pre-register.php" >you haven't registered yet?</a>
    </div>
</html>
<script>
    let inmail = document.getElementById("in-mail");
    let mail = document.getElementById("mail");
    let res = document.getElementById("result");
    let error1 = document.getElementById("error1");
    let error2 = document.getElementById("error2");
    error1.innerHTML = "";
    error2.innerHTML = "";

    mail.value = inmail.value;
    if(res.value == "ok"){
        window.location.href="../index.php";
    }else if(res.value == "no1"){
        error1.innerHTML = "incorrect password";
    }else if(res.value == "no2"){
        error1.innerHTML = "inesistent mail";
    }
    console.log(res.value);

</script>