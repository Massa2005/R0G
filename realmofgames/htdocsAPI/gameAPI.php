<?php
class Game
    {   //variabili pprivate, quelle che servono solo all'interno di questo file
        private $conn;
        private $table_name = "giochi";   

        public $id;
        public $nome;
        public $descrizione;
        public $prezzo;
        public $sconto;
        public $mail_editore;
        public $main_img;
        public $valutazione;
        public $data_pubblicazione;

        public function __construct($db){
            $this->conn = $db;
        }
        function readGamesAllParameters()
            {
            $query = "SELECT id, nome, descrizione, prezzo, sconto, mail_editore, main_img, valutazione, data_pubblicazione FROM ". $this->table_name ." ORDER BY id DESC LIMIT 20";
            $stmt = $this->conn->prepare($query);
            $stmt->execute();
            return $stmt;
            }
        function readGameByInput()
            {
                $query = "SELECT id, nome, descrizione, prezzo, sconto, mail_editore, main_img, valutazione, data_pubblicazione FROM ". $this->table_name ." WHERE nome LIKE '".$this->nome."%'";
                $stmt = $this->conn->prepare($query);
                $stmt->execute();
                return $stmt;
            }
    }