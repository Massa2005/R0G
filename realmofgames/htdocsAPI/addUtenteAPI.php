<?php
/*
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: POST");					// indica che usa il metodo post
//header("Access-Control-Max-Age: 3600");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");
 
include_once 'database.php';
include_once 'utenteAPI.php';
 
$database = new Database();
$db = $database->getConnection();
$utente = new Utenti($db);
$data = json_decode(file_get_contents("php://input"));			// prende il contenuto URL e lo converte da  JSON a PHP		
	

								
if( !empty($data->e_mail) && !empty($data->password) && !empty($data->nome) && !empty($data->cognome) && !empty($data->data_nascita) && !empty($data->data_account) ){
    $utente->e_mail = $data->e_mail;
    $utente->password = $data->password;
    $utente->nome = $data->nome;
    $utente->cognome = $data->cognome;
    $utente->
 
    if($utente->create()){
        
        echo json_encode(array("message" => "Utente creato correttamente."));
       }
    else{
        http_response_code(503);				  		//503 servizio non disponibile
        echo json_encode(array("message" => "Impossibile creare utente."));
       }
   }
else{
    http_response_code(400); 							//400 bad request
    echo json_encode(array("message" => "Impossibile creare utente i dati sono incompleti."));
   }
   */
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: POST");
include_once 'database.php';
include_once 'utenteAPI.php';	
$database = new Database();
$db = $database->getConnection();
$utente = new Utenti($db);
$data = json_decode(file_get_contents("php://input"));	

    if( !empty($data->e_mail) && !empty($data->password) && !empty($data->nome) && !empty($data->cognome) && !empty($data->data_nascita)){
        $utente->e_mail = $data->e_mail;
        $utente->password = $data->password;
        $utente->nome = $data->nome;
        $utente->cognome = $data->cognome;
        $utente->data_nascita = $data->data_nascita;
        if($utente->createUtente()){
        
                //echo json_encode(array("message" => "Utente creato correttamente."));
                http_response_code(200);
        }
        else{
            http_response_code(400);
        }

    }
    else{
        http_response_code(500);
    }
?>