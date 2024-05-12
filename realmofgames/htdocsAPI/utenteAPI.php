<?php
class Utenti
	{
	private $conn;
	private $table_name = "utenti";
	
	public $e_mail;				// colonne della tabella utente
    public $password;
	public $nome;
	//public $eta;
	public $cognome;

	public $data_nascita;
	
	public function __construct($db)	// costruttore
		{
		$this->conn = $db;
		}
	
	function read()				
		{
		$query = "SELECT  e_mail, password, nome, cognome  FROM ". $this->table_name;
		$stmt = $this->conn->prepare($query);
		$stmt->execute();		
		return $stmt;
		}
    function readOne()				
		{
		$query = "SELECT  e_mail, password, nome, cognome  FROM ". $this->table_name . " WHERE e_mail='".$this->e_mail."'";
		$stmt = $this->conn->prepare($query);
		$stmt->execute();		
		return $stmt;
		}


	function createUtente(){	 
		$query = "INSERT INTO " . $this->table_name ." SET  e_mail=:e_mail, password=:password, nome=:nome, cognome=:cognome, data_nascita=:data_nascita"; 
		$stmt = $this->conn->prepare($query);  
    		
		$this->e_mail = htmlspecialchars(strip_tags($this->e_mail));		// strip_tags rimuove i tag HTML e PHP
   		$this->nome = htmlspecialchars(strip_tags($this->nome));	// htmlspecialchars converte i caratteri in HTML
    	//$this->eta =  htmlspecialchars(strip_tags($this->eta));
        $this->password = htmlspecialchars(strip_tags($this->password));
		$this->cognome = htmlspecialchars(strip_tags($this->cognome));
		$this->data_nascita = htmlspecialchars(strip_tags($this->data_nascita));


		$stmt->bindParam(":e_mail",   $this->e_mail);
		$stmt->bindParam(":password", $this->password);		
		$stmt->bindParam(":nome", $this->nome);
		$stmt->bindParam(":cognome", $this->cognome);
		$stmt->bindParam(":data_nascita", $this->data_nascita);


			
		//$stmt->bindParam(":eta",  $this->eta);

		if($stmt->execute()){return true;} 
		else{return false;}	    
	}


	function update(){

echo "*************  PUNTO 4";
    		$query = "UPDATE ". $this->table_name ." SET password= :password, nome= :nome WHERE e_mail= :e_mail";
    		$stmt = $this->conn->prepare($query);
 
    		$this->e_mail =   htmlspecialchars(strip_tags($this->e_mail));
		$this->password = htmlspecialchars(strip_tags($this->password));
    		$this->nome = htmlspecialchars(strip_tags($this->nome));
    		////$this->eta =  htmlspecialchars(strip_tags($this->eta));
 
    		$stmt->bindParam(":e_mail", $this->e_mail);
                $stmt->bindParam(":password", $this->password);
    		$stmt->bindParam(":nome", $this->nome);
    		//$stmt->bindParam(":eta", $this->eta);

    		if($stmt->execute()) return true;
    		return false;
		}



	function delete(){
	    	$query = "DELETE FROM " . $this->table_name . " WHERE e_mail = ?";
    		$stmt = $this->conn->prepare($query);
    		$this->e_mail= htmlspecialchars(strip_tags($this->e_mail));
    		$stmt->bindParam(1, $this->e_mail);	
    		if($stmt->execute())   return true;
    		return false;    
		}
 



	// CREARE Utente		da fare metodo create()
	// AGGIORNARE Utente    da fare metodo update()
	// CANCELLARE Utente	da fare	metodo delete()
	}
?>