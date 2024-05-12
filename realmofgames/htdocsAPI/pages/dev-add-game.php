<link rel="stylesheet" href="../mainStyle.css">
<html>
    <?php
        ini_set('display_errors','Off');
        echo '<input type="hidden" id="result" value="'.$_POST["result"].'">';
        echo '<input type="hidden" id="namein" value="'.$_POST["name"].'">';
        echo '<input type="hidden" id="descriptionin" value="'.$_POST["description"].'">';
        echo '<input type="hidden" id="datein" value="'.$_POST["data"].'">';
        echo '<input type="hidden" id="costin" value="'.$_POST["cost"].'">';
    ?>

    <div class="borderContainer center" style="width: fit-content; top:200px">
        <form action="../phps/add-game.php" id="form" method="POST">

            <div class="center" style="width: fit-content;">Name</div>
            <input type="text" id="name" name="name" class="center"><br>
            <div class="center" id="error" style="width: fit-content; color:red;"></div><br>

            <div class="center" style="width: fit-content;">Description</div>
            <textarea id="description" name="description" rows="6" cols="50"></textarea><br><br>

            <div class="center"  style="width: fit-content;">prezzo</div>
            <input type="number" id="cost" name="cost" class="center"><br><br>
            
            <div class="center"  style="width: fit-content;">data pubblicazione</div>
            <input type="date" id="date" name="date" class="center"><br><br>
            <input type="hidden" name="img" id="img" value = "x">
        </form>
        <form action="" id="formimg">
            <input type="file" name="" id="inpFile">
        </form>
        <button onclick="register()" class="center">Upload</button>
    </div>
</html>

<script>
    let res =document.getElementById("result");
    let error =document.getElementById("error");
    let name =document.getElementById("name");
    let namein =document.getElementById("namein");
    let description =document.getElementById("description");
    let descriptionin =document.getElementById("descriptionin");
    let date =document.getElementById("date");
    let datein =document.getElementById("datein");
    let cost =document.getElementById("cost");
    let costin =document.getElementById("costin");
    let form = document.getElementById("formimg");
    let img = document.getElementById("img");
    let inpFile = document.getElementById("inpFile");

    
    name.value = namein.value;
    description.value = descriptionin.value;
    date.value = datein.value;
    cost.value = costin.value;

    error.innerHTML="";
    console.log("result: ->"+res.value);
    if(res.value == "ok-added"){
        error.innerHTML="";
        window.location.href="dev-personal_area.php";
    }else if(res.value == "no-name"){
        error.innerHTML="nome gia usato";
    }


    function register(){
        const endpoint = "../phps/upload_img.php";
        const formData = new FormData();
        try {
            img.value = inpFile.files[0].name;
            console.log("nome ->"+inpFile.files[0].name);
            formData.append("inpFile", inpFile.files[0]);
            fetch(endpoint, {
                method: "post",
                body: formData
            }).catch(console.error);
        } catch (error) {
            console.log("immagine vuota");
        }
        
        document.getElementById("form").submit();
    }
</script>