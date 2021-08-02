<?php

class Work { // düzenlenebilir ve parça parça geliştirilebilir olabilmesi için sınıf oluşturuyorum
	private $db; // sınıfın yapıcı fonksiyonunda bağlantıyı sağlayıp diğer fonksiyonlarda bağlantıyı tekrarlamamak amacıyla oluşturdum.
	function __construct() {
		try { // try kullanıyorum ki bağlantı kurulamazsa bunu bildirelim
			$this->db = new PDO('mysql:host=localhost;dbname=work1;charset=utf8', "root", "123456"); // pdo sınıfından pdomysql nesnesi üretiyoruz.
			// pdo kullanmamın sebebi eski usül mysql kütüphanesinin saçma sql açıklarıyla uğraşmamız gerekmiyor. (real escape string vb.)
		} catch (PDOException $e) {
			print ("Bağlantı kurulamadı: " . $e->getMessage());
			die(); // bağlantı kurulamadıysa işlemleri devam ettirmenin bir manası yok.
		}
	}
	// nesne yok edildiğinde bağlantıyı kapatıyoruz
	function __destruct()
	{
		$this->db = null; // pdo'yu yok ettiğimizde otomatik bağlantıyı kapatır.
		// referans https://www.php.net/manual/en/pdo.connections.php
	}
	
	// çıktılarla ilgili tüm açıklamalar buradadır
	// 1- Prepare kullanımının başlıca sebebi boşlukları veri tipine göre dolduruyor olması bu da sql injection olayını engelliyor
	// 2- PDO::FETCH_ASSOC kullanım sebebim çıktıyı index değerleriyle değil anahtar değerleriyle versin
	// 3- Çıktıdaki satırları sıfır bir diziye atıyorum ki jsonda dizinin veri tipi saf olsun (gerekli olmayabilir)
	
	function book($id)
	{
		$query = $this->db->prepare('SELECT * FROM `books` WHERE id = ?'); // sorguyu hazırlıyoruz
		$query->execute(array($id)); // ? koyduğumuz yere gerekli veriyi gönderiyoruz
		return $query->fetch(PDO::FETCH_ASSOC); // fetch ile çıktıyı alıyoruz, tek satır çekmek istediğimiz için fetchAll kullanmıyoruz
	}
	function latestBooks()
	{
		$results = array();
		$query = $this->db->query("SELECT * FROM `books` order by ID desc LIMIT 8", PDO::FETCH_ASSOC);
		array_push($results, array("book_count" => $query->rowCount()));
		if ($query->rowCount()) foreach($query as $row) array_push($results, $row);
		return !empty($results) ? $results : null;
	}
	function searchBook($q)
	{
		$results = array();
		$query = $this->db->prepare('SELECT * FROM `books` WHERE title LIKE ? order by ID desc');
		$query->execute(array("%$q%"));
		$rows = $query->fetchAll(PDO::FETCH_ASSOC);
		if ($query->rowCount()) foreach($rows as $row) array_push($results, $row);
		return !empty($results) ? $results : null;
	}
	function addBook($data)
	{
		// api'den $_GET parametrelerini $data dizisine aktarıyorum ki api kısmında tek tek elle yazmayalım ve gerekli özelleştirmeleri fonksiyona göre yapabilelim
        $title = $data["title"] ?? null;
        $summary = $data["summary"] ?? null;
        $cover = $data["cover"] ?? null;
        $author = $data["author"] ?? null;
        $page_count = $data["page_count"] ?? 0;
        $publishing_date = $data["publishing_date"] ?? null;
        $market_link = $data["market_link"] ?? null;
        $market_price = $data["market_price"] ?? 0;
	
		$query = $this->db->prepare('INSERT INTO `books` (title, summary, cover, author, page_count, publishing_date, market_link, market_price) VALUES (?, ?, ?, ?, ?, ?, ?, ?)');
		$result = $query->execute(array($title, $summary, $cover, $author, $page_count, $publishing_date, $maket_link, $market_price));
		return $result ? $this->db->lastInsertId() : null; // ekleme işlemi başarılıysa eklenenin id değerini döndürüyoruz değilse null
	}
	function editBook($data)
	{
		$id = $data["id"] ?? null;
        $title = $data["title"] ?? null;
        $summary = $data["summary"] ?? null;
        $cover = $data["cover"] ?? null;
        $author = $data["author"] ?? null;
        $page_count = $data["page_count"] ?? 0;
        $publishing_date = $data["publishing_date"] ?? null;
        $market_link = $data["market_link"] ?? null;
        $market_price = $data["market_price"] ?? 0;
		
		$query = $this->db->prepare('UPDATE `books` SET title = ?, summary = ?, cover = ?, author = ?, page_count = ?, publishing_date = ?, market_link = ?, market_price = ? WHERE id = ?');
		$result = $query->execute(array($title, $summary, $cover, $author, $page_count, $publishing_date, $maket_link, $market_price, $id));
		return $result ? true : false; // $result bool değil null da olabilir çıktı da olabilir biz işimizi sağlama alalım
	}
	function removeBook($id)
	{
		$query = $this->db->prepare('DELETE FROM `books` WHERE id = ?');
		$result = $query->execute(array($id));
		return $result ? true : false;
	}
}

?>