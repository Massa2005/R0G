<form action="" id="form">
    <input type="file" name="" id="inpFile">
    <input type="submit" value="submit">

</form>

<script>
    let form = document.getElementById("form");
    let inpFile = document.getElementById("inpFile");

    form.addEventListener("submit", e => {
        e.preventDefault();
        console.log("dovrei");
        const endpoint = "phps/upload_img.php";
        const formData = new FormData();

        formData.append("inpFile", inpFile.files[0]);
        fetch(endpoint, {
            method: "post",
            body: formData

        }).catch(console.error);
    });

</script>