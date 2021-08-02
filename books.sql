-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Anamakine: 127.0.0.1
-- Üretim Zamanı: 26 Tem 2021, 11:42:58
-- Sunucu sürümü: 10.4.17-MariaDB
-- PHP Sürümü: 7.3.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Veritabanı: `work1`
--

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `books`
--

CREATE TABLE `books` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `summary` text NOT NULL,
  `cover` varchar(255) NOT NULL,
  `author` varchar(255) NOT NULL,
  `page_count` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `publishing_date` date NOT NULL DEFAULT current_timestamp(),
  `market_link` varchar(255) NOT NULL,
  `market_price` double NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Tablo döküm verisi `books`
--

INSERT INTO `books` (`id`, `title`, `summary`, `cover`, `author`, `page_count`, `publishing_date`, `market_link`, `market_price`) VALUES
(1, 'The Hobbit', 'A great modern classic and the prelude to The Lord of the Rings. Bilbo Baggins is a hobbit who enjoys a comfortable, unambitious life, rarely traveling any farther than his pantry or cellar. But his contentment is disturbed when the wizard Gandalf and a company of dwarves arrive on his doorstep one day to whisk him away on an adventure. They have launched a plot to raid the treasure hoard guarded by Smaug the Magnificent, a large and very dangerous dragon. Bilbo reluctantly joins their quest, unaware that on his journey to the Lonely Mountain he will encounter both a magic ring and a frightening creature known as Gollum.', 'api/upload/44927767_943d791acea3a3b6cfce89dea1c94060.webp', 'J. R. R. Tolkien', 300, '2013-01-31', '', 15),
(15, 'Sokratesin Savunması', 'Oylarınızla beni mahkûm ettiniz, Atinalılar. Ve eğer bu karar karşısında kırılmışsam bunun nedenleri var. En başta bunu bekliyordum ve beni asıl şaşırtan yalnızca oyların böyle yakın olması oldu. Çünkü bana karşı olan çoğunluğun çok daha büyük olacağını düşünüyordum ama şimdi, eğer otuz oy daha öte yana geçmiş olsaydı, aklanmış olacaktım. Üstelik şimdi bile Meletus’un suçlamasından kurtulmuş olduğumu düşünüyorum. Dahası, Anitus ve Likon’un yardımı olmasaydı, yasanın gerektirdiği gibi oyların beşte birini alamayacak olduğu açıktır. Ki bu durumda kendisi bin drahmalık cezaya çarptırılacaktı.\n\nŞimdi ceza olarak ölümü öneriyorsunuz. Kendi payıma ben ne önermeliyim, Atinalılar? Açıktır ki hakkım olanı. Ve hakkım nedir? Bütün yaşamım boyunca boş durmaya hiçbir anlam vermemiş olduğum için ama insanların çoğunun kaygılandığı şeyleri, para kazanmayı, ev geçindirmeyi ve askeri görevleri, kamu toplantılarında konuşmayı, memurlukları, komploları, partileri göz ardı ettiğim için katlanmam ya da ödemem gereken asıl karşılık nedir?\n\nGerçekte bir politikacı olarak yaşamak için gereğinden öte dürüst olduğumu düşünerek, size ya da kendime hiçbir yararımın olamayacağı yerlere gitmedim ama her birinize kişisel olarak en büyük iyilikte bulunabileceğim her yere gittim. Aranızda bulunan herkesin kendisine bakması gerektiğine, kişisel çıkarların peşine düşmeden önce erdem ve bilgeliği araması gerektiğine, devletin çıkarlarıyla kaygılanmadan önce devletin kendisi ile kaygılanması gerektiğine inandırmaya, tüm eylemlerinde uyması gereken düzenin bu olduğunu anlatmaya çalıştım. Bu yolda davrandığım için neyi hak ediyorum?', 'api/upload/2881467_0001805342001-1.jpg', 'Platon', 54, '1545-07-25', '', 0),
(16, 'Kayıp Tanrılar Ülkesi', 'Ahmet Ümit’ten polisiyeyi arkeoloji ve mitolojiyle harmanlayan usta işi bir roman.\n\nBerlin Emniyet Müdürlüğü’nün cevval başkomiseri Yıldız Karasu ve yardımcısı Tobias Becker, göçmenlerin, işgal evlerinin ve sokak sanatçılarının renklendirdiği Berlin sokaklarından Bergama’ya uzanan bir macerada, hayatı ve insanları yok etmeye muktedir sırların peşinde bir seri cinayetler dizisini çözmeye çalışıyor. Soruşturmanın Türkiye ayağında sürpriz bir ismin olaya dahil olmasıyla heyecanın dozu gitgide artıyor.\n\nKayıp Tanrılar Ülkesi, Zeus Altarı ve Pergamon Tapınağı’nın gölgesinde mitlere günümüzde yeniden hayat verirken, suçun çağlar ve kültürler boyu değişmeyen doğasını bir tokat gibi yüzümüze çarpıyor.\n\n“O yüzden unuttuk dediğiniz yerden başlayacağım. Unutmanın bedelini ödeyecek unutanlar. Cezaların en şiddetlisiyle ödüllendirilecek saygısızlık yapanlar, kalbi yerinden çıkarılacak beni kalbinden çıkaranların, yüzlerinin derisi yüzülecek benden yüz çevirenlerin…”', 'api/upload/47650030_0001924003001-1.jpg', 'Ahmet Ümit', 254, '2018-07-25', '', 0),
(17, 'İskandinav Mitolojisi', 'Ahmet Ümit’ten polisiyeyi arkeoloji ve mitolojiyle harmanlayan usta işi bir roman.\n\nBerlin Emniyet Müdürlüğü’nün cevval başkomiseri Yıldız Karasu ve yardımcısı Tobias Becker, göçmenlerin, işgal evlerinin ve sokak sanatçılarının renklendirdiği Berlin sokaklarından Bergama’ya uzanan bir macerada, hayatı ve insanları yok etmeye muktedir sırların peşinde bir seri cinayetler dizisini çözmeye çalışıyor. Soruşturmanın Türkiye ayağında sürpriz bir ismin olaya dahil olmasıyla heyecanın dozu gitgide artıyor.\n\nKayıp Tanrılar Ülkesi, Zeus Altarı ve Pergamon Tapınağı’nın gölgesinde mitlere günümüzde yeniden hayat verirken, suçun çağlar ve kültürler boyu değişmeyen doğasını bir tokat gibi yüzümüze çarpıyor.\n\n“O yüzden unuttuk dediğiniz yerden başlayacağım. Unutmanın bedelini ödeyecek unutanlar. Cezaların en şiddetlisiyle ödüllendirilecek saygısızlık yapanlar, kalbi yerinden çıkarılacak beni kalbinden çıkaranların, yüzlerinin derisi yüzülecek benden yüz çevirenlerin…”', 'api/upload/58666318_9933257605170.jpg', 'Neil Gaiman', 348, '2018-07-25', '', 0),
(18, 'Kitap Hırsızı', 'Ödüllü yazar Markus Zusak\'ın akıllara kazınacak kadar etkileyici ve şiirsel bir dille yazdığı bu roman, okuyucuya sunulan benzersiz bir hediye gibi...\n\"Hayatınızı böylesine derinden etkileyen başka bir kitaba daha rastlamamışsınızdır. Muhteşem!\"', 'api/upload/75406119_0000000423897-1.jpg', 'Markus Zusak', 214, '2018-07-25', '', 0),
(19, 'Grinin Elli Tonu', 'Edebiyat öğrencisi Ana Steele genç girişimci Christian Grey ile röportaj yapmaya gittiğinde karşısında yakışıklı, zeki ve hükmedici bir adam bulur. Toy ve masum Ana bir anda bu adama karşı arzu duymaya başladığını şaşkınlıkla fark eder. Grey\'in gizemli hali ona yakınlaşma arzusunu daha da alevlendirir. Ana\'nın güzelliğine, zekâsına ve özgür ruhuna karşı koyamayan Grey de onu istediğini itiraf eder ama kendi şartları vardır…\n\nGrey\'in kendine has erotik istekleri karşısında şoke olan Ana bir yandan da heyecanına engel olamaz ama tereddütleri vardır. Büyük başarısına rağmen çokuluslu şirketler, inanılmaz bir servet ve sevgi dolu bir aile Grey kendi canavarlarına esir olmuş ve hükmetme takıntısı olan bir adamdır. Ana ve Grey cüretkâr, tutkulu bir tensel ilişkiye yelken açarken Ana, Christian Grey\'in sırlarını ve kendi karanlık arzularını da keşfedecektir.', 'api/upload/22575984_0000000684811-1.jpg', 'L. James', 560, '2016-07-25', '', 0),
(20, 'Dune', 'Before The Matrix, before Star Wars, before Ender\'s Game and Neuromancer, there was Dune: winner of the prestigious Hugo and Nebula awards, and widely considered one of the greatest science fiction novels ever written.\n\nMelange, or \'spice\', is the most valuable - and rarest - element in the universe; a drug that does everything from increasing a person\'s life-span to making intersteller travel possible. And it can only be found on a single planet: the inhospitable desert world Arrakis.\n\nWhoever controls Arrakis controls the spice. And whoever controls the spice controls the universe.\n\nWhen the Emperor transfers stewardship of Arrakis from the noble House Harkonnen to House Atreides, the Harkonnens fight back, murdering Duke Leto Atreides. Paul, his son, and Lady Jessica, his concubine, flee into the desert. On the point of death, they are rescued by a band for Fremen, the native people of Arrakis, who control Arrakis\' second great resource: the giant worms that burrow beneath the burning desert sands.\n\nIn order to avenge his father and retake Arrakis from the Harkonnens, Paul must earn the trust of the Fremen and lead a tiny army against the innumerable forces aligned against them.\n\nAnd his journey will change the universe.', 'api/upload/27091148_0000000685483-1.jpg', 'Frank Herbert', 256, '2015-07-25', '', 0),
(21, 'Ben Kirke', 'NPR, Washington Post, Buzzfeed, People, Time, Amazon, Entertainment Weekly, Bustle ve Newsweek’e göre Yılın En İyi Kitabı\n\nGoodreads okurlarına göre 2018’in En İyi Fantastik Kitabı\n\n“Bu dikkat çekici hikâye sizi, Kirke’nin yaptığı bir büyü gibi etkisi altına alacak.”', 'api/upload/21527059_0001836978001-1.jpg', 'Madeline Miller', 408, '2019-07-25', '', 0);

--
-- Dökümü yapılmış tablolar için indeksler
--

--
-- Tablo için indeksler `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`id`);

--
-- Dökümü yapılmış tablolar için AUTO_INCREMENT değeri
--

--
-- Tablo için AUTO_INCREMENT değeri `books`
--
ALTER TABLE `books`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
