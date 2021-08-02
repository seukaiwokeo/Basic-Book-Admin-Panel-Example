<?php

// dosya yüklerken türkçe karakter vb. sorunlar olmasın diye ismini rastgele oluşturuyoruz
function generateRandomString($length = 32) {
	$characters = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
	$charactersLength = strlen($characters);
	$randomString = '';
	for ($i = 0; $i < $length; $i++) {
		$randomString .= $characters[rand(0, $charactersLength - 1)];
	}
	return $randomString;
}

// minimal bir json api yapıyorum

header("Content-Type: application/json"); // dönen içerik tipini json yapıyorum
// çıktıları sabit bir yapıda vermek için fonksiyon yapıyorum ki apiyi kullanırken şekilden şekle girmeyeyim
function json_out($data, $message, $status = 200) 
{
	http_response_code($status); // apilerde dönen veride response code çok önemlidir çoğu client buna göre işlem yapar
	// çıktıyı json formatına çeviriyorum
	exit(json_encode(array("data" => $data, "message" => $message, "status" => $status)));
}

if(!file_exists("work.php")) // her şeyin kusursuz olması için work sınıfımızı da kontrol edelim
	json_out(null, "Sistem hatası", 500);

require("work.php"); // work sınıfını kullanabilmek için

$img_exts = array("jpg","jpeg","png", "webp"); // izin verilen resim dosyası uzantıları
$routes = array("upload_cover", "book_list", "book_add", "book_edit", "book_remove", "book"); // kontroller v.b şeyler için
// route olayını laravel mantığıyla basit şekilde yapıyorum

// değerler tanımlıysa alıyoruz değilse null veriyoruz ki bi' sakatlık çıkmasın
$route = isset($_GET["a"]) ? $_GET["a"] : null; // url'deki a parametresenin değeri
$query = isset($_POST["q"]) ? $_POST["q"] : null; // url'deki q parametresinin değeri

if(!$route)
	json_out(null, "Parametre hatası", 400);

// route kontrolü (listemizde var mı?)
if(!in_array($route, $routes))
	json_out(null, "Geçersiz istek", 404);

// her şey sorunsuz görünüyor, nesnemizi üretelim ve bağlantıyı kuralım
$work = new Work();
// < yönlendirmeler >

switch($route)
{
	case "book":
		json_out($work->book($query), "Başarılı", 200);
		break;
	case "book_list":
		json_out(!$query ? $work->latestBooks() : $work->searchBook($query), "Başarılı", 200);
		break;
	case "book_add":
		$result = $work->addBook($_POST);
		json_out($result, $result ? "Başarılı" : "Başarısız", $result ? 200 : 500);
		break;
	case "book_edit":
		$result = $work->editBook($_POST);
		json_out($result, $result ? "Başarılı" : "Başarısız", $result ? 200 : 500);
		break;
	case "book_remove":
		if(!$query)
			json_out(null, "Parametre hatası", 400);
		$result = $work->removeBook($query);
		json_out($result, $result ? "Başarılı" : "Başarısız", $result ? 200 : 500);
		break;
	case "upload_cover":
		$response = 0;
		if(isset($_FILES["file"]["name"])) { // dosya verisi gönderilmişse
		
			$filename = $_FILES["file"]["name"]; // dosya ismini al
			$ftype = strtolower(pathinfo($filename, PATHINFO_EXTENSION)); // yüklenmek istenen dosya uzantısını çek
			$filename = md5(generateRandomString()) . "." . $ftype; // dosya ismindeki türkçe karakter boşluk v.b şeylerle uğraşmamak için yeni bir isim oluştur.
			
			$loc = "upload/" . rand(1, 99999999) . "_" . $filename; // dosya ismine rastgele sayı ekle çakışmasın diye
			while(file_exists($loc)) // eğer oluşturulan isim varsa olmayana kadar bunu tekrarla
			{
				$loc = "upload/" . rand(1, 99999999) . "_" . $filename;
			}
			
			if(in_array(strtolower($ftype), $img_exts)) { // dosya uzantısı bizim izin verdiğimiz listede var mı
				if(move_uploaded_file($_FILES["file"]["tmp_name"], $loc)){ // dosyayı yükle
					$response = "api/" . $loc;
				}
			} else { $response = 1; }
		}
		json_out($response, null, 200);
		break;
}

unset($work); // work nesnemizi yok ediyoruz ki bağlantı düzgün bir şekilde kapatılsın. (ne kadar gerekli bilinmez zaten compile time ama öneriliyor.)

// </ yönlendirmeler >

?>