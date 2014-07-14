<?php

class Database {
	
}


class User {
	public $uname;
	public $fname;
	public $lname;
	public $email;
	
	function __construct($uname,
											 $fname,
											 $lname,
											 $email
											 ) {
		$this->uname = $uname;
		$this->fname = $fname;
		$this->lname = $lname;
		$this->email = $email;
	}
	
	public function getUser() {
	}
	
	public function addUser() {
	}
	
}

class Athlete {
}

class Team {
}

class Game {
}

class Club {
}

class Place {
}

class Field {
}

class Sport {
}

class SportCategory {
}


class Visual {
	public function form() {
	}
}


?>