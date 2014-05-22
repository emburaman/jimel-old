<?php
class Database {
	private $host    = 'localhost';
	private $dbname  = 'jimel';
	private $user    = 'root';
	//private $pass    = '';
	private $dbh;
	private $error;
	private $stmt;

	/* EC2 CREDENTIALS */
	private $pass    = '$marmita@1';
	

	public function __construct(){
		// Set DSN
		$dsn = 'mysql:host=' . $this->host . ';dbname=' . $this->dbname;
		// Set options
		$options = array(
			PDO::ATTR_PERSISTENT    => true,
			PDO::ATTR_ERRMODE       => PDO::ERRMODE_EXCEPTION
		);
		// Create a new PDO instanace
		try{
			$this->dbh = new PDO($dsn, $this->user, $this->pass, $options);
		}
		// Catch any errors
		catch(PDOException $e){
			$this->error = $e->getMessage();
		}
	}
	
	public function query($query){
    $this->stmt = $this->dbh->prepare($query);
	}
	
	public function bind($param, $value, $type = null){
		if (is_null($type)) {
			switch (true) {
				case is_int($value):
					$type = PDO::PARAM_INT;
					break;
				case is_bool($value):
					$type = PDO::PARAM_BOOL;
					break;
				case is_null($value):
					$type = PDO::PARAM_NULL;
					break;
				default:
					$type = PDO::PARAM_STR;
			}
		}
		$this->stmt->bindValue($param, $value, $type);
	}	

	public function execute(){
    return $this->stmt->execute();
	}

	/* Returns a resultset */ 
	public function resultset(){
    $this->execute();
    return $this->stmt->fetchAll(PDO::FETCH_ASSOC);
	}
	
	/* Returns a single record */
	public function single(){
    $this->execute();
    return $this->stmt->fetch(PDO::FETCH_ASSOC);
	}
	
	/* Count Affected rows */
	public function rowCount(){
    return $this->stmt->rowCount();
	}
	
	/* Last Insert ID */
	public function lastInsertId(){
    return $this->dbh->lastInsertId();
	}

  /* Transactions Handling */
	public function beginTransaction(){
		return $this->dbh->beginTransaction();
	}
	public function endTransaction(){
		return $this->dbh->commit();
	}
	public function cancelTransaction(){
		return $this->dbh->rollBack();
	}

	/* Dump debug */
	public function debugDumpParams(){
    return $this->stmt->debugDumpParams();
	}
	
	/*
	 * Auxiliary methods
	 */
	public function getUser($u, $p) {
		$this->query('SELECT * FROM es_user WHERE user_name = :uname AND password = :pword');
		$this->bind(':uname', $u);
		$this->bind(':pword', $p);
		$row = $this->single();
		return $row;
	}
	public function getUsers($e = null) {
		$w = ' WHERE profile > 0';
		if ($e != null) {
			$w .= " AND id_user = $e";
		}
		$qry = 'SELECT u.*, a.name AS church FROM es_user AS u 
									LEFT JOIN es_association AS a ON a.id_association = u.id_association 
									'. $w .' ORDER BY firstname ASC, lastname ASC';
		
		$this->query($qry);
		$row = $this->resultset();
		return $row;
	}

	public function addUser($u = array()) {
		$this->query('INSERT INTO es_user (user_name, password, firstname, lastname, email, birthdate, profile, status, rg, cpf, phone, is_staff) 
		VALUES (:user, :pwd, :fname, :lname, :email, :bdate, :profile, :status, :rg, :cpf, :phone, :is_staff)');
		$this->bind(':user', $u['uname']);
		$this->bind(':pwd', sha1($u['uname']));
		$this->bind(':fname', $u['fname']);
		$this->bind(':lname', $u['lname']);
		$this->bind(':email', $u['email']);
		$this->bind(':bdate', $u['bdate']);
		$this->bind(':status', $u['status']);
		$this->bind(':rg', $u['rg']);
		$this->bind(':cpf', $u['cpf']);
		$this->bind(':phone', $u['phone']);
		$this->bind(':is_staff', $u['is_staff']);
		$this->bind(':profile', $u['profile']);
		
		$this->execute();
		$uid = $this->lastInsertId();
		return $uid;
	}

	public function updUser($u = array()) {
		$this->query('UPDATE es_user SET firstname=:fname, lastname=:lname, email=:email, birthdate=:bdate, status=:status, rg=:rg, cpf=:cpf, is_staff=:is_staff, phone=:phone, profile=:profile WHERE id_user=:id_user');
		
		$this->bind(':id_user', $u['id_user']);
		$this->bind(':fname', $u['fname']);
		$this->bind(':lname', $u['lname']);
		$this->bind(':email', $u['email']);
		$this->bind(':bdate', $u['bdate']);
		$this->bind(':status', $u['status']);
		$this->bind(':rg', $u['rg']);
		$this->bind(':cpf', $u['cpf']);
		$this->bind(':phone', $u['phone']);
		$this->bind(':profile', $u['profile']);
		$this->bind(':is_staff', $u['is_staff']);
		
		$this->execute();
		return true;
	}
	
	public function delUser($id) {
		$this->query('DELETE FROM es_user WHERE id_user ='. $id);
		$this->execute();
		$this->query('DELETE FROM es_athlete WHERE id_user ='. $id);
		$this->execute();
		return true;
	}

	public function getAthletes($e = null) {
		$w = '';
		if ($e != null) {
			$w = " WHERE id_association = $e";
		}
		$this->query('SELECT * FROM vw_athletes'. $w .' ORDER BY team_name ASC, firstname ASC, lastname ASC');
		$row = $this->resultset();
		return $row;
	}

	public function getAthlete($u) {
		$this->query('SELECT * FROM es_user WHERE id_user = :uname');
		$this->bind(':uname', $u);
		$row = $this->single();
		return $row;
	}
	
	public function addAthlete($u = array()) {
		$this->query('INSERT INTO es_user (user_name, password, firstname, lastname, email, birthdate, profile, status, rg, cpf) 
		VALUES (:user, :pwd, :fname, :lname, :email, :bdate, :profile, :status, :rg, :cpf)');
		$this->bind(':user', $u['uname']);
		$this->bind(':pwd', sha1($u['uname']));
		$this->bind(':fname', $u['fname']);
		$this->bind(':lname', $u['lname']);
		$this->bind(':email', $u['email']);
		$this->bind(':bdate', $u['bdate']);
		$this->bind(':profile', 0);
		$this->bind(':status', $u['status']);
		$this->bind(':rg', $u['rg']);
		$this->bind(':cpf', $u['cpf']);
		
		if ($this->execute()) {
			$uid = $this->lastInsertId();
			
			$this->query('INSERT INTO es_athlete (id_user, id_association, status) VALUES (:id_user, :id_assoc, :status)');
			$this->bind(':id_user', $uid);
			$this->bind(':id_assoc', $u['id_association']);
  		$this->bind(':status', $u['status']);
			
			$this->execute();
		}
		return $uid;
	}

	public function updAthlete($u = array()) {
		$this->query('UPDATE es_user SET firstname=:fname, lastname=:lname, email=:email, birthdate=:bdate, status=:status, rg=:rg, cpf=:cpf WHERE id_user=:id_user');
		
		$this->bind(':id_user', $u['id_user']);
		$this->bind(':fname', $u['fname']);
		$this->bind(':lname', $u['lname']);
		$this->bind(':email', $u['email']);
		$this->bind(':bdate', $u['bdate']);
		$this->bind(':status', $u['status']);
		$this->bind(':rg', $u['rg']);
		$this->bind(':cpf', $u['cpf']);
		
		$this->execute();
		return true;
	}

	public function delAthlete($id) {
		$this->query('DELETE FROM es_user WHERE id_user ='. $id);
		$this->execute();
		$this->query('DELETE FROM es_athlete WHERE id_user ='. $id);
		$this->execute();
		return true;
	}

	public function getTeams($e = null, $v = null, $c = null) {
		$w = '';
		if ($e != null) {
			$w .= " entity_id = $e";
		}
		if ($v != null) {
			if ($w != '') { $w .= ' AND '; }
			$w .= " id_event = $v";
		}
		if ($c != null) {
			if ($w != '') { $w .= ' AND '; }
			$w .= " id_category = $c";
		}
		if ($e != null || $c != null) { $w = ' WHERE '. $w; }
		$sql = 'SELECT * FROM vw_teams'. $w .' ORDER BY entity ASC, team_name ASC';
		$this->query($sql);
		$row = $this->resultset();
		return $row;
	}

	public function chkTeams($c = null, $n = null, $e = null) {
		$w = '';
		if ($c != null) {
			$w .= "id_category = $c";
		}
		if ($n != null) {
			if ($w != '') { $w .= ' AND '; }
			$w .= "name = '$n'";
		}
		if ($e != null) {
			if ($w != '') { $w .= ' AND '; }
			$w .= "id_event = $e";
		}
		if ($w != '') { $w = ' WHERE '. $w; }
		$this->query('SELECT * FROM es_team'. $w);
		$this->resultset();
		if ($this->rowCount() > 0) {
			return TRUE;
		}
		return FALSE;
	}

	public function getTeam($t) {
		$this->query('SELECT * FROM vw_teams WHERE id = :id_team');
		$this->bind(':id_team', $t);
		$row = $this->single();
		return $row;
	}
	
	public function addTeams($u = array()) {
		$this->query('INSERT INTO es_team (name, id_association, id_category, jersey_main_color, id_event, status) 
		VALUES (:name, :id_association, :id_category, :color, :id_event, :status)');
		$this->bind(':name', $u['name']);
		$this->bind(':id_association', $u['id_association']);
		$this->bind(':id_category', $u['id_category']);
		$this->bind(':id_event', $u['id_event']);
		$this->bind(':color', $u['color']);
		$this->bind(':status', $u['status']);
		
		$this->execute();
		return $this->lastInsertId();
	}

	public function updTeam($u = array()) {
		$this->query('UPDATE es_team SET name=:name, id_association=:id_association, id_category=:id_category, jersey_main_color=:color, id_event=:id_event, status=:status WHERE id_team=:id_team');
		
		$this->bind(':id_team', $u['id_team']);
		$this->bind(':name', $u['name']);
		$this->bind(':id_association', $u['id_association']);
		$this->bind(':id_category', $u['id_category']);
		$this->bind(':id_event', $u['id_event']);
		$this->bind(':color', $u['color']);
		$this->bind(':status', $u['status']);
		
		$this->execute();
		return true;
	}

	public function delTeam($id) {
		$this->query('DELETE FROM es_team WHERE id_team ='. $id);
		$this->execute();
		$this->query('DELETE FROM es_subscription WHERE id_team ='. $id);
		$this->execute();
		return true;
	}

	public function getEntities($e = null) {
		$w = '';
		if ($e != null) {
			$w = " WHERE id_association = $e";
		}
		print $w;
		$this->query('SELECT * FROM es_association'. $w .' ORDER BY name ASC');
		$row = $this->resultset();
		return $row;
	}

	public function getCategories($e = null) {
		$w = '';
		if ($e != null) {
			$w = " WHERE id_category = $e";
		}
		$this->query('SELECT * FROM es_category'. $w .' ORDER BY name ASC');
		$row = $this->resultset();
		return $row;
	}

	public function getEvents($e = null) {
		$w = '';
		if ($e != null) {
			$w = " WHERE id_event = $e";
		}
		$this->query('SELECT * FROM es_event'. $w .' ORDER BY name ASC');
		$row = $this->resultset();
		return $row;
	}
	
	public function getSubscribed($id_team, $id_event) {
		$this->query('SELECT * FROM vw_subscriptions WHERE id_team ='. $id_team .' AND id_event = '. $id_event);
		$rows = $this->resultset();
		return $rows;
	}
	
	public function getAvailable($id_association, $id_event, $min = null, $max = null) {
		$this->query('SELECT * FROM vw_subscriptions WHERE id_association = '. $id_association .' AND id_event = '. $id_event);
		$atls = $this->resultset();

		$w = '';
		if ($min > 0) {
			$w .= ' AND age >= '. $min;
		}
		if ($max > 0) {
			$w .= ' AND age <= '. $max;
		}
		if ($this->rowCount() > 0) {
			$w .= ' AND id_athlete NOT IN (';
			for ($i = 0; $i < $this->rowCount(); $i++) {
				if ($i > 0) { $w .= ', '; }
				$w .= $atls[$i]['id_athlete'];
			}
			$w .= ')';
		}
		
		$sql = 'SELECT * FROM vw_subscriptions WHERE id_association = '. $id_association . $w;
		$this->query($sql);
		$rows = $this->resultset();
		return $rows;
	}
	
	public function addSubscription($s = array()) {
		$this->query('INSERT INTO es_subscription (id_athlete, id_team, status, id_event) VALUES (:id_athlete,:id_team,:status,:id_event)');
		$this->bind(':id_athlete',$s['id_athlete']);
		$this->bind(':id_team',   $s['id_team']);
		$this->bind(':status',    $s['status']);
		$this->bind(':id_event',  $s['id_event']);
		
		$this->execute();
		return $this->lastInsertId();
	}
	
	public function updSubscription () {
	}
	
	public function delSubscription ($s = array()) {
		$w = '';
		foreach ($s as $i => $v) {
			if ($w <> '') { $w .= ', '; }
			$w .= $s[$i];
		}
		$this->query('DELETE FROM es_subscription WHERE id_subscription IN ('. $w .')');
		$this->execute();
	}
	
	public function getGames($c = null) {
		$w = "";
		if ($c) {
			$w .= " WHERE id_category = $c";
		}
		$this->query('SELECT * FROM vw_games '. $w .' ORDER BY quadra ASC, date_time ASC');
		$rows = $this->resultset();
		return $rows;
	}
	
	public function getGame($id) {
		$sql = 'SElECT * FROM vw_games WHERE id_game = '. $id;
		$this->query($sql);
		$rows = $this->resultset();
		return $rows;
	}
	
	public function updGame($arr) {
		$this->query('UPDATE es_game SET id_team_a = :id_team_a, id_team_b = :id_team_b, date_time = :date_time, id_game_place = :id_game_place WHERE id_game = :id_game');
		$this->bind(':id_game',$arr['id_game']);
		$this->bind(':date_time',$arr['date_time']);
		$this->bind(':id_team_a',$arr['id_team_a']);
		$this->bind(':id_team_b',$arr['id_team_b']);
		$this->bind(':id_game_place',$arr['id_game_place']);

		$this->execute();
		return true;
	}
	
	public function delGame($id) {
		p($id);
		$this->query('DELETE FROM es_game WHERE id_game = '. $id);
		$this->execute();
	}
	
	public function getGamePlaces() {
		$this->query('SElECT * FROM es_game_place');
		$rows = $this->resultset();
		return $rows;
	}
	
	public function addGame($arr) {
		$this->query('INSERT INTO es_game (date_time, id_event, id_team_a, id_team_b, id_game_place) VALUES (:date_time, :id_event, :id_team_a, :id_team_b, :id_game_place)');
		$this->bind(':date_time',$arr['date_time']);
		$this->bind(':id_event', $arr['id_event']);
		$this->bind(':id_team_a',$arr['id_team_a']);
		$this->bind(':id_team_b',$arr['id_team_b']);
		$this->bind(':id_game_place',$arr['id_game_place']);

		$this->execute();
		return $this->lastInsertId();
	}
	
	public function getScore($id_game, $id_subscription, $id_team = null) {
		$w = '';
		if ($id_team) { $w .= " AND id_team = $id_team"; }
		$sql = "SELECT * FROM vw_score WHERE id_game = $id_game AND id_subscription = $id_subscription $w";
		$this->query($sql);
		$rows = $this->resultset();
		$results = array();
		return $rows;
	}
}
?>