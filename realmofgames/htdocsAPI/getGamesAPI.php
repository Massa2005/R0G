<?php				// preleva dei dati dal database e li restituisce in formato json 
								
header("Access-Control-Allow-Origin: *");				// tutti possono accedere alla pagina
header("Content-Type: application/json; charset=UTF-8");		// restituisce in formato json UTF-8

include_once 'database.php';						
include_once 'gameAPI.php';

$database = new Database();						// crea un oggetto Database e si collega al database
$db = $database->getConnection();

$game = new Game($db);						// crea un oggetto gioco
//$inputMail = $_GET["e_mail"];
//$utente->e_mail = $inputMail;
//$inputPassword = $_GET["password"];
$stmt = $game->readGamesAllParameters();						// legge i dati col metodo read creato da noi
//$num = $stmt->rowCount();



if(true){								// se vengono trovati utenti nel database 
    $games_arr = array();						// array di utenti
    $games_arr["records"] = array();
    while ($row = $stmt->fetch(PDO::FETCH_ASSOC)){
        
        extract($row);
        $game_item = array(
            "id" => $id,
            "nome" => $nome,
            "descrizione" => $descrizione,
            "prezzo" => $prezzo,
            "sconto" => $sconto,
            "mail_editore" => $mail_editore,
            "main_img" => $main_img,
            "valutazione" => $valutazione,
            "data_pubblicazione" => $data_pubblicazione
            /*						// crea un array con i dati in formato json
            "e_mail" => $e_mail,
            "password" => $password, 
            "nome" => $nome
            //"eta" => $eta
            */
        );
        
            array_push($games_arr["records"], $game_item);
            http_response_code(200);
        
        
        
        
    }
    echo json_encode($games_arr);	
	
}
else{
    echo json_encode( array("message" => "Nessun gioco trovato.")  );
     //quando l'utente non viene trovato
    http_response_code(400);
}
?>