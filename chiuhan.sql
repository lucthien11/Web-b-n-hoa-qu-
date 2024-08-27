-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th4 17, 2024 lúc 05:26 AM
-- Phiên bản máy phục vụ: 10.4.28-MariaDB
-- Phiên bản PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `chiuhan`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `account`
--

CREATE TABLE `account` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `phone` varchar(30) NOT NULL,
  `address` text NOT NULL,
  `status` enum('Active','Inactive') NOT NULL DEFAULT 'Active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `type` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `account`
--

INSERT INTO `account` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `phone`, `address`, `status`, `created_at`, `updated_at`, `type`) VALUES
(2, '', 'midiu@gmail.com', NULL, 'a', NULL, '', '', 'Active', '0000-00-00 00:00:00', '2024-04-10 08:49:39', 0),
(3, '', 'admin@gmail.com', NULL, 'a', NULL, '', '', 'Active', '2024-04-10 01:06:57', '2024-04-10 08:50:25', 0),
(5, '', 'midius@gmail.com', NULL, 's', NULL, '', '', 'Active', '2024-04-09 19:15:46', NULL, 0),
(6, '', 'admin@news.com', NULL, 'a', NULL, '', '', 'Active', '2024-04-09 19:16:45', NULL, 0),
(10, 'dien thoai', 'admdddin@gmail.com', NULL, 'a', NULL, '09999999999', 'a', 'Active', '0000-00-00 00:00:00', NULL, 1),
(11, '', 'huyen@map123', NULL, '1234', NULL, '', '', 'Active', '2024-04-11 03:51:50', NULL, 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `brands`
--

CREATE TABLE `brands` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `status` enum('Active','Inactive') NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `brands`
--

INSERT INTO `brands` (`id`, `name`, `slug`, `status`, `created_at`, `updated_at`) VALUES
(11, 'Hàn Quốc', 'Han Quoc', 'Active', NULL, NULL),
(12, 'Việt Nam', 'Viet Nam', 'Active', NULL, NULL),
(13, 'Nhật Bản', 'nh-t-b-n', 'Active', NULL, NULL),
(14, 'Canada', 'canada', 'Active', NULL, NULL),
(15, 'Pháp', 'ph-p', 'Active', NULL, NULL),
(16, 'Mỹ', 'my', 'Active', NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `status` enum('Active','Inactive') NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `categories`
--

INSERT INTO `categories` (`id`, `name`, `slug`, `status`, `created_at`, `updated_at`) VALUES
(10, 'Trái cây tươi', 'trai cay tuoi', 'Active', NULL, NULL),
(11, 'Trái cây nhập khẩu', 'trai cay nhap khau', 'Active', NULL, NULL),
(12, 'Trái cây sấy khô', 'trai cay say kho', 'Active', NULL, NULL),
(13, 'Trái cây đóng hộp', 'trai cay dong hop', 'Active', NULL, NULL),
(14, 'Hộp quà trái cây', 'h-p-qu-tr-i-c-y', 'Active', NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `news`
--

CREATE TABLE `news` (
  `id` bigint(20) NOT NULL,
  `title` varchar(100) NOT NULL,
  `avatar` varchar(200) NOT NULL,
  `slug` varchar(100) NOT NULL,
  `sumary` text NOT NULL,
  `description` text NOT NULL,
  `newscategory_id` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `news`
--

INSERT INTO `news` (`id`, `title`, `avatar`, `slug`, `sumary`, `description`, `newscategory_id`, `created_at`, `updated_at`) VALUES
(13, 'Những lợi ích tuyệt vời của trái Cherry ', 'uploads/news/660bf6d518bc3z552607811117_20efc1119abc247d522c8cfff112cdb7.jpg', 'nh-ng-l-i-ch-tuy-t-v-i-c-a-tr-i-cherry-', 'Cherry đang rất \"hot\" trên thị trường hiện nay khi mà nhu cầu của người tiêu dùng tăng cao nhưng mùa vụ lại ngắn hạn, hiện đang là mùa của Cherry NewZealand  sẽ về hàng đầy đủ để phục vụ quý khách trong dịp Tết Đinh Dậu 2017 ạ, và hãy cùng xem Cherry có những công dụng tuyệt vời như thế nào nha...\r\n                        ', '1. Tốt cho tim.\r\nCác loại thực phẩm tốt cho tim luôn luôn là một món ăn tuyệt vời. Cherry được chứng minh làm giảm nguy cơ bệnh tim và rất tốt cho sức khỏe tổng thể.\r\n2. Tăng năng lượng cho cơ thể.\r\nTiêu thụ cherry sẽ giúp tăng năng lượng trong cơ thể bạn một cách tự nhiên. Phần lớn lượng calo trong trái này có được từ các loại đường tự nhiên, giúp thúc đẩy tâm trạng vui vẻ và tăng năng lượng trong cơ thể bạn. Nếu cảm thấy mệt mỏi, hãy ăn một vài quả cherry tươi bạn sẽ cảm thấy hưng phấn hơn nhiều.\r\n\r\n3. Giúp ngủ ngon hơn.\r\nHãy ăn cherry thường xuyên để cải thiện tình trạng mất ngủ. Cherry chứa melatonin làm cho giấc ngủ sâu và ngon hơn. Đừng vội uống thuốc an thần vì nó có thể gây ra một tác dụng phụ khiến bạn khó chịu. Thay vào đó hãy cố gắng ăn vài trái cherry mỗi ngày sẽ đem lại cho bạn giấc ngủ chất lượng hơn nhiều.\r\n                        ', 5, '2024-04-02 19:15:17', '2024-04-02 19:15:17'),
(14, 'Top 10 loại quả mang lại công dụng bất ngờ', 'uploads/news/660c194c345ce1233.jpg', 'top-10-lo-i-qu-mang-l-i-c-ng-d-ng-b-t-ng-', 'Top 10 loại quả mang lại công dụng bất ngờ\r\nTrái cây luôn là một trong những thực phẩm vàng mang lại lợi ích to lớn không ngờ cho sức khỏe con người. Dưới đây Trái cây nhập khẩu xin giới thiệu top 10 loại trái cây có tác dụng mà bạn không ngờ, hãy sử dụng chúng điều độ và tránh xa những thực phẩm gây hại nhé !!\r\n', '               Chuối:\r\nNhững người tập thể hình luôn yêu thích và sử dụng chuối hàng ngày, đơn giản vì hàm lượng Kali trong chuối rất cao, giúp làm giảm áp lực máu, hỗ trợ tốt cho người cao huyết áp. Và có nhiều nghiên cứu chứng minh về tác dụng của chuối trong điều trị tiêu chảy và kích ứng dạ dày. Đặc biệt, một nghiên cứu lâm sàng được tiến hành trên trẻ em gần đây cũng chững minh rằng chuối còn có tác dụng kiểm soát cân nặng ở trẻ nhỏ.\r\n\r\nTáo:\r\n\r\nĐã có quá nhiều minh chứng cho việc trái táo giúp phòng chống các bệnh ung thư, giúp xương rắn chắc, chống oxy hóa, giảm chất béo trong máu, giảm huyết áp.\r\nĐọc thêm: Lợi ích không ngờ từ việc ăn táo mỗi ngày\r\nDâu đen\r\n\r\nQuả dâu đen là một trong những loại quả bổ dưỡng nhất thế giới. Với một lượng vitamin C và chất chống oxy hóa cao, chúng giúp bảo vệ sức khỏe của bạn và ngăn ngừa được rất nhiều bênh. Loại quả này cũng rất giàu acid ellagic, một chất dinh dưỡng giúp duy trì làn da trẻ đẹp và rạng rỡ.\r\n \r\nBơ\r\n\r\nBơ có hàm lượng kali cao hơn chuối, bơ chứa nhiều axit béo không bão hòa rất tốt cho sức khỏe, lại mang nhiều chất xơ đóng vai trò trong việc giảm cân. Ngoài ra bơ còn giúp giảm lượng Cholesterol và Tryglyceride.\r\nNam việt quất:\r\n\r\nTrái nam việt quất có hình dạng gần giống như cà chua bi nhưng đỏ và nhỏ hơn. Nam việt quất rất giàu chất chống oxy hóa giúp tăng cường cholesterol rất tốt cũng như chống ung thư. Ngoài ra loại quả mọng này còn giúp ngăn ngừa bệnh nhiễm trùng đường tiết nhiệu, các bệnh về tiêu hóa và làm giảm huyết áp. \r\n \r\nNho:\r\n\r\nCó nhiều chứng minh cho thấy nho có thể phòng tránh các bệnh tim mạch, ngừa ung thư, chống lão hóa.    ', 6, '2024-04-02 21:32:43', '2024-04-02 21:42:20'),
(15, 'Những lợi ích tuyệt vời của trái lựu', 'uploads/news/660c185081cacluu da cat.jpg', 'nh-ng-l-i-ch-tuy-t-v-i-c-a-tr-i-l-u', '                        Quả lựu là loại trái cây dinh dưỡng, lại ngon ngọt, nhiều nước nên được rất nhiều người tiêu dùng yêu thích. Từ xưa, quả lựu đã trở thành một trong những thành phần trong phương pháp Ayurveda – khoa học y tế có nguồn gốc từ Ấn Độ giáo. Hãy cùng xem những tác dụng không ngờ của trái lựu nhé \r\n                                                ', '                        Phòng chống ung thư\r\nCác nghiên cứu cho biết hàm lượng cao chất chống oxy hóa và polyphenol trong lựu ngoài khả năng bảo vệ tim còn có đặc tính chống ung thư hiệu quả. Thường xuyên uống nước ép lựu là điều rất tốt. Việc này có thể ức chế sự tăng trưởng và phát triển của khối u, tế bào ung thưvà cũng thúc đẩy tác dụng của phương pháp điều trị chống ung thư hoặc các phương pháp điều trị bệnh khác.\r\nTrong quá trình mang thai, phụ nữ cần bổ sung nhiều chất dinh dưỡng cho cơ thể: Chất xơ, sắt, vitamin và khoáng chất. Bên cạnh đó, các bà bầu cũng cần bổ sung hàm lượng cao niacin và axit folic, hai hợp chất này đóng một vai trò rất quan trọng cho quá trình phát triển của thai nhi. Quả lựu là thứ trái cây chứa nhiều hàm lượng trên.Ngoài ra, quả lựu cũng giúp cải thiện lưu lượng máu cho em bé.\r\nỗ trợ chuyển hóa, sạch răng\r\nMột lợi ích khác từ quả lựu mà ít người biết đó là khả năng điều chỉnh insulin, điều tiết lượng đường trong máu. Điều này, có lợi cho việc ngăn ngừa sự tấn công của bệnh tiểu đường loại 2, và tác dụng đáng kể với ai muốn giảm cân.\r\n\r\nBên cạnh tác dụng kháng viêm, quả lựu còn làm sạch răng, đánh bật các mảng bám, loại bỏ vi khuẩn gây nên các bệnh răng lợi.\r\n\r\nPhòng chứng liệt dương\r\n\"Liệt dương\" là vấn đề khá phổ biến của nam giới ngày nay và ảnh hưởng đến đời sống của rất nhiều thanh niên trẻ. Nước ép lựu không chỉ giúp ngăn ngừa hoặc ức chế tình trạng xơ vữa động mạch, ung thư tuyến tiền liệt mà còn giúp phòng ngừa chứng liệt dương. Điều này đặc biệt quan trọng đối với những cặp vợ chồng đang mong mỏi có con.\r\n\r\nGiảm nguy cơ mắc bệnh Alzheimer\r\nMột lợi ích quan trọng của quả lựu là có thể ngăn ngừa bệnh Alzheimer, một bệnh nguy hiểm và phổ biến. Một lần nữa, hợp chất chống oxy hóa tự nhiên vốn rất phong phú trong nước ép quả lựu sẽ giúp làm giảm lượng protein có hại gây ra bệnh Alzheimer.\r\nỨc chế bệnh ung thư\r\nDưỡng chất trong quả lựu có khả năng ức chế nhiều loại ung thư trong đó phải kể đến là ung thư tuyến tiền liệt và ức chế sự phát triển của các khối u. Cơ chế đơn giản: Các chất chống oxy hóa dồi dào và các hợp chất khác trong quả lựu có thể sửa chữa các DNA của cơ thể để ngăn chặn tăng trưởng của các tế bào ung thư, thậm chí là tiêu diệt chúng, thúc đẩy sự phát triển của cơ thể.\r\n\r\nGiúp làn da tươi sáng\r\nNgoài các giá trị chữa bệnh, quả lựu còn đóng vai trò trong việc tái tạo tế bào da, cải thiện lưu lượng máu từ đó cải thiện chất lượng da.Hơn nữa, nước ép quả lựu cũng có thể ngăn ngừa các đốm đồi mồi và tăng sắc tố, làm chậm phần nào quá trình lão hóa và oxy hóa, nuôi dưỡng cơ thể từ trong ra ngoài. Nếu bạn có làn da khô hãy ăn lựu để cải thiện tình hình này.\r\n\r\nChống viêm khớp\r\nVào năm 2005, các nhà nghiên cứu thuộc Đại học Y Cape Western Reserve phát hiện ra một loại enzyme trong quả lựu có thể làm giảm sự suy thoái của sụn dẫn đến viêm xương khớp.\r\n\r\nNên thường xuyên ăn lựu để nâng cao sức khỏe và trẻ hóa làn da. Có rất nhiều cách để chế biến món lựu cho bớt nhàm chán: Ăn trực tiếp, làm salad, sinh tố...\r\n\r\nNguồn: Tổng hợp.\r\n                                                ', 7, '2024-04-02 21:36:43', '2024-04-02 21:38:08'),
(16, 'Bụng mỡ nhiều đến mấy cũng trở nên phẳng lỳ với công thức từ củ đậu và rau cải mỗi ngày.', 'uploads/news/6610f08144a8fbungmo.jpg', 'b-ng-m-nhi-u-n-m-y-c-ng-tr-n-n-ph-ng-l-v-i-c-ng-th-c-t-c-u-v-rau-c-i-m-i-ng-y-', '                                                GIẢM CÂN BẰNG SALAD RAU\r\n                                                                        ', 'Chẳng cần tập luyện hay kiêng khem khổ cực, bạn có thể lấy lại vóc dáng eo thon, vòng 2 con kiến chỉ với rau và củ đậu.Với công thức rất đơn giản mà lại hiệu quả vô cùng bạn sẽ có vóc dáng cân đối.\r\n\r\nGIẢM CÂN BẰNG SALAD RAU\r\n\r\nNguyên liệu cần chuẩn bị\r\n\r\n– ¼ bắp cải tím\r\n\r\n– 5-6 quả cà chua bi\r\n\r\n– 50g ngô ngọt\r\n\r\n– 50g bánh mỳ\r\n\r\n– 1 quả trứng gà\r\n\r\n– 2 củ khoai tây nhỏ\r\n\r\n– 20g cá ngừ đóng hộp\r\n\r\n– Sốt salad (hoặc hỗn hợp mayonnaise + dầu olive)\r\n\r\n', 5, '2024-04-06 13:49:37', '2024-04-06 13:57:31'),
(17, 'Kỹ thuật trồng rau sạch trong chậu xốp tại nhà đơn giản', 'uploads/news/6610f1a739566kythuattrongrau.jpg', 'k-thu-t-tr-ng-rau-s-ch-trong-ch-u-x-p-t-i-nh-n-gi-n', 'Tự trồng rau trong thùng xốp tại nhà là sự lựa chọn của rất nhiều gia đình trong thành phố bởi phương pháp trồng rau đơn giản, dễ trồng, dễ quản lý, an toàn và tiện lợi. \r\n                        ', 'Nhưng người trồng cũng cần phải đảm bảo đúng kỹ thuật trồng rau để đảm bảo vệ sinh an toàn thực phẩm và giá trị dinh dưỡng của rau.Kỹ thuật trồng cây rau sạch trong hộp xốp rất dễ thực hiện, chỉ cần bỏ chút công sức và thời gian chờ đợi, những đợt rau sạch tự tay trồng đảm bảo an toàn sẽ đến ngày thu hoạch.\r\n\r\nCách trồng rau sạch tại nhà thì trồng bằng chậu xốp là đơn giản và dễ thực hiện nhất. Ngoài ra, có thể tận dụng thau, rổ, chậu cũ…. để làm vật dụng trồng rau, lưu ý tạo lỗ thoát nước cho những vật dụng này.\r\n\r\nSử dụng các vật dụng đơn giản có trong gia đình để tạo nên các chậu trồng cây: Thùng xốp, hạt giống, đất, phân hữu cơ, gạch.\r\n\r\nVới chậu xốp, cần khoét lỗ thoát nước, thường thì từ 6 đến 8 lỗ 1 chậu, không nên khoét to quá, sẽ làm trôi đất, nếu trồng các loại cây cần thoát nước nhanh, có thể dùng lưới thép hoặc lưới nhựa bịt các lỗ vừa khoét trong hộp, vừa đảm bảo thoát nước vừa không bị trôi đất.\r\n\r\nVới các loại thau, chậu, rổ cũ, nên chọn loại nhựa để bền và dễ vệ sinh. Cũng cần đục lỗ giống như hộp xốp để thoát nước,với các loại rổ đã có lỗ, có thể lồng 2 chiếc vào nhau làm 1 chậu để trồng, sẽ bền và tránh mất đất. Tất cả các loại chậu để trồng cần tránh tiếp xúc trực tiếp với mặt đất bằng cách kê cao 4 góc để cân bằng giúp dễ cây lưu thông thoáng.\r\n\r\nLưu ý: Gạch kê tránh lỗ hổng dưới đáy hộp\r\n\r\n\r\n                        ', 6, '2024-04-06 13:54:31', '2024-04-06 13:54:31'),
(18, 'Tháng giải phóng mỡ thừa, da xấu, độc tố trong cơ thể', 'uploads/news/6610f20b36884thangmothuagiaiphonghinhanh.jpg', 'th-ng-gi-i-ph-ng-m-th-a-da-x-u-c-t-trong-c-th-', 'Tháng 4, hoà trong không khí giải phóng dân tộc, đối với chúng tôi, đây là tháng: GIẢI PHÓNG MỠ THỪA, KHÔNG CHỪA 1 LẠNG\r\n                        ', 'Kế hoạch cho những ngày nghỉ lớn của tháng 4 đã sẵn sàng, tuy nhiên bạn vẫn chưa cảm thấy tự tin với vóc dáng, làn da chưa được đẹp, cơ thể khó chịu, thiếu sức sống. Giờ là lúc bạn lấy lại vóng dáng chuẩn, làn da tươi trẻ và cơ thể tươi trẻ từ bên trong bằng liệu trình detox giảm cân, trẻ hoá làn da, đào thải chất cặn bả trong cơ thể từ công nghệ ÉP LẠNH HPP đầu tiên tại Việt Nam.\r\n\r\nLiệu trình đã chiếm được sự tin yêu của khách hàng trong hơn 2 năm qua, đã giúp hơn 19,888 khách hàng tại thành phố Hồ Chí Minh tự tin hơn mỗi ngày và thành công hơn trong cuộc sống.\r\n\r\nBí quyết liệu trình detox giảm cân của Fresh Saigon\r\n\r\nGiảm 2-4kg: Sự kết hợp của hơn 10 loại trái cây, rau củ như Ớt chuông có chứa chất capsaicin có tác dụng đốt cháy chất béo hiệu quả và làm cơ thể sử dụng nhiều calo hơn ngay sau bữa ăn.\r\n\r\nChống lão hoá, tươi trẻ từ hơn 40 loại vitamin, vitamin C, khoáng chất, chất xơ hàm lượng cao giúp cho quá trình detox thanh lọc cho bạn 1 làn da tươi trẻ từ bên trong. Những trái cây giàu Vitamin C hay chất chống oxy hoá đều có trong liệu trình giảm cân như thanh long đỏ,…\r\n\r\nKhông đường, nước ép TƯƠI thật 100%, công nghệ ÉP LẠNH HPP lần đầu tiên có mặt tại Việt Nam, Nature Care đã mang trọn dưỡng chất của trái cây tươi vào trong sản phẩm mà không 1 công nghệ ép nào trên thị trường có được. Hàm lượng dinh dưỡng hơn 40% so với cách ép hiện nay, thời gian sử dụng lên đến 30 ngày mà không chứa bất kỳ chất bảo quản nào. Sản phẩm đạt tiêu chuẩn của Clean Label. Tất cả sản phẩm của Nature Care không có thêm đường hay bất kỳ hương phụ liệu, tất cả là từ thiên nhiên.\r\n\r\nThanh lọc cơ thể: Nhiều chất xơ, hỗ trợ đào thải chất cặn bả trong ruột mang đến hệ tiêu hoá khoẻ mạnh từ bên trong.\r\n\r\nSau khi kết thúc liệu trình, bạn còn có thể chọn chế độ tái detox thường xuyên hàng tháng tại Nature Care với nhiều ưu đãi hấp dẫn để có được thói quen ăn uống lành mạnh tốt cho sức khỏe. Đó cũng là lý do tại sao Detox của Nature Care được mệnh danh là thức uống làm đẹp của hoa hậu, người đẹp: Hoa hậu Ngọc Diễm, hoa hậu Ngụy Thanh Lan, diễn viên Thanh Trúc, diễn viên Yaya Trương Nhi; các beauty blogger và hàng ngàn khách hàng luôn tin chọn liệu trình detox từ Nature Care.\r\n\r\nGIẢI PHÓNG MỠ THỪA NGAY\r\n                        ', 7, '2024-04-06 13:56:11', '2024-04-06 13:56:11');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `newscategories`
--

CREATE TABLE `newscategories` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `slug` varchar(100) NOT NULL,
  `status` enum('Active','Innactive') NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `newscategories`
--

INSERT INTO `newscategories` (`id`, `name`, `slug`, `status`, `created_at`, `updated_at`) VALUES
(5, 'Danh mục A', 'danh-m-c-a', 'Active', NULL, NULL),
(6, 'Danh mục B', 'danh-m-c-b', 'Active', NULL, NULL),
(7, 'Danh mục C', 'danh-m-c-c', 'Active', NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `firstname` varchar(50) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `address` text NOT NULL,
  `phone` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `status` enum('Processing','Confirmed','Shipping','Delivered','Cancelled') NOT NULL DEFAULT 'Processing',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `firstname`, `lastname`, `address`, `phone`, `email`, `status`, `created_at`, `updated_at`) VALUES
(15, 0, 'Đỗ Thị', 'Huyền', 'Tổ 6 phuong song hien', '0886877418', 'luchoanxyz@gmail.com', 'Cancelled', '2024-04-02 11:26:16', '2024-04-02 11:26:16'),
(16, 0, 'Lục', 'Thiên', 'Tổ 7 Phường Sông hiến', '0886877418', 'thien.luc.ytb@gmail.com', 'Processing', '2024-04-02 23:20:42', '2024-04-02 23:20:42'),
(17, 0, 'Thien ', 'luc', 'Tổ 7 Phường Sông hiến', '0886877418', 'daica@gmail.com', 'Processing', '2024-04-06 06:20:03', '2024-04-06 06:20:03'),
(18, NULL, 'dgdf', 'dfdf', 'dfdf', '0886877418', 'huyen@map123', 'Cancelled', '2024-04-11 15:52:35', '2024-04-11 15:52:35');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `order_details`
--

CREATE TABLE `order_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `price` double NOT NULL,
  `qty` tinyint(4) NOT NULL,
  `total` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `order_details`
--

INSERT INTO `order_details` (`id`, `order_id`, `product_id`, `price`, `qty`, `total`, `created_at`, `updated_at`) VALUES
(8, 15, 34, 400000, 2, 800000, '2024-04-02 11:26:16', '2024-04-02 11:26:16'),
(9, 16, 36, 100000, 3, 300000, '2024-04-02 23:20:42', '2024-04-02 23:20:42'),
(10, 17, 46, 500000, 10, 5000000, '2024-04-06 06:20:03', '2024-04-06 06:20:03'),
(11, 18, 49, 100000, 4, 400000, '2024-04-11 15:52:35', '2024-04-11 15:52:35');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `summary` text NOT NULL,
  `stock` tinyint(3) UNSIGNED NOT NULL,
  `price` double NOT NULL,
  `disscounted_price` double NOT NULL,
  `images` text NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `brand_id` bigint(20) UNSIGNED NOT NULL,
  `status` enum('Active','Inactive') NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT INTO `products` (`id`, `name`, `slug`, `description`, `summary`, `stock`, `price`, `disscounted_price`, `images`, `category_id`, `brand_id`, `status`, `created_at`, `updated_at`) VALUES
(31, 'Việt Quất', 'vi-t-qu-t', '(Sản phẩm có thể thay đổi mẫu mã theo từng thời điểm)\r\n                        ', '\r\nViệt quất rất tốt cho sức khỏe con người\r\nNhập khẩu trực tiếp từ Hàn Quốc\r\nTrái cứng, giòn, vị ngọt thanh, mọng nước\r\nMàu xanh đậm, nhiều phấn bảo vệ khỏi vi khuẩn, không mốc\r\n100% nói không với chất bảo quản & trái cây Trung Quốc\r\nĐổi trả sản phẩm trong vòng 24h', 5, 200000, 180000, 'uploads/660bdefbc341bViet_quat.png', 11, 11, 'Active', NULL, NULL),
(32, 'Táo Xanh Granny Smith Mỹ', 't-o-xanh-granny-smith-m-', '\r\n         (Sản phẩm có thể thay đổi mẫu mã theo từng thời điểm) ', 'Táo có màu xanh lá, vị chua nhẹ, rất giòn, nhiều nước\r\nSang trọng và lịch sự, thích hợp để làm quà biếu tặng\r\nChứa nhiều dưỡng chất tốt cho sức khỏe, ít calo, thích hợp để giảm cân\r\nCó thể ăn tươi, làm bánh, nước ép hoặc salad\r\nNhập khẩu trực tiếp từ Mỹ\r\n100% nói không với chất bảo quản & trái cây Trung Quốc\r\nĐổi trả sản phẩm trong vòng 24h\r\n                        ', 10, 300000, 250000, 'uploads/660be29ea1bb1taoxanhmy.png', 11, 16, 'Active', NULL, NULL),
(33, 'Lê Hàn Quốc', 'l-h-n-qu-c', '(Sản phẩm có thể thay đổi mẫu mã theo từng thời điểm)\r\n                        ', 'Hàng loại 1, khối lượng trung bình từ 650g – 700g/ trái\r\nLê chuẩn gốc Hàn Quốc, quả to, tươi ngon, đi biếu tặng rất sang\r\nLê nhiều nước, giòn và ngọt, vỏ mỏng, màu nâu hấp dẫn\r\n100% nói không với chất bảo quản & trái cây Trung Quốc\r\nĐổi trả sản phẩm trong vòng 24h\r\n                        ', 5, 250000, 200000, 'uploads/660be35f11ed7lehanquoc.png', 11, 11, 'Active', NULL, NULL),
(34, 'Dâu Tây 330g Hàn Quốc (Hộp)', 'd-u-t-y-330g-h-n-qu-c-h-p-', '                        (Sản phẩm có thể thay đổi mẫu mã theo từng thời điểm)\r\n                                                ', '                        trái có kích thước lớn, màu sắc đỏ tươi, cuống tươi xanh\r\nMùi vị rất thơm, có vị ngọt thanh tự nhiên\r\nTrái cây mọng, không bị dập nát\r\nTrọng lượng là 330gr/hộp\r\nNhập khẩu trực tiếp từ Hàn Quốc\r\n100% nói không với chất bảo quản & trái cây Trung Quốc\r\nĐổi trả sản phẩm trong vòng 24h\r\n                                                ', 20, 459000, 400000, 'uploads/660be44c5ad4eDautay_hanquoc.jpg', 11, 11, 'Active', NULL, NULL),
(35, 'Nho Đen Canada', 'nho-en-canada', '(Sản phẩm có thể thay đổi mẫu mã theo từng thời điểm)\r\n                        ', 'Nhập khẩu trực tiếp từ Úc\r\nQuả to tròn, vỏ mỏng, không hạt, có độ giòn và mọng nước\r\nChứa nhiều chất dinh dưỡng bổ ích cho cơ thể\r\n100% nói không với chất bảo quản & nói không với trái cây Trung Quốc\r\nĐổi trả sản phẩm trong vòng 24h\r\n                        ', 15, 400000, 350000, 'uploads/660be5d26e675nho_den.jpg', 11, 14, 'Active', NULL, NULL),
(36, 'Mít Sấy Giòn', 'm-t-s-y-gi-n', 'CHÚ Ý: Không sử dụng sản phẩm khi có dấu hiệu hư hỏng hoặc hết hạn sử dụng\r\n                        ', 'HÔNG TIN SẢN PHẨM\r\nThương hiệu: Vinfruits\r\nXuất xứ: Việt Nam\r\nNSX & HSD: in trên bao bì\r\n                        ', 20, 200000, 100000, 'uploads/660be75b375d2mit_say.png', 12, 12, 'Active', NULL, NULL),
(37, 'Xoài Sấy Dẻo', 'xo-i-s-y-d-o', 'HƯỚNG DẪN BẢO QUẢN:\r\n✓ Bảo quản nơi khô ráo, thoáng mát.\r\n✓ Tránh ánh nắng trực tiếp.\r\n✓ Đóng chặt khóa zip sau khi mở bao bì lần đầu\r\n                        ', 'THÔNG TIN SẢN PHẨM\r\nThương hiệu: Vinfruits\r\nXuất xứ: Việt Nam\r\nNSX & HSD: in trên bao bì\r\n                        ', 20, 150000, 100000, 'uploads/660be7dfd7f62xoai_say.png', 12, 12, 'Active', NULL, NULL),
(38, 'Nho Khô Raisins Sunview Mix Mỹ', 'nho-kh-raisins-sunview-mix-m-', 'Đôi nét về Nho khô Sunview\r\nNho Khô Không Hạt Sunview là một trong những loại nho khô được nhập khẩu trực tiếp từ Mỹ. Áp dụng công nghệ sấy khô hiện đại, giúp giữ được hương vị tự nhiên của nho tươi, đồng thời không làm mất đi giá trị dinh dưỡng của loại trái cây này.\r\n\r\nNho Khô Không Hạt Sunview khi ăn có vị chua chua ngọt ngọt, không bị ngọt đậm, ngọt sắc như nho khô thông thường, chút dai dai từ vỏ, chút mềm, chắc của thịt nho.\r\n\r\nNhững quả nho không hạt tươi ngon, được trồng ở khu vườn nho hữu cơ lớn tại vùng California (Mỹ), trải qua quá trình thu hái và tuyển lựa kỹ lưỡng, sấy khô trên công nghệ hiện đại, hoàn toàn không thêm chất phụ gia và đường hóa học, đảm bảo an toàn sức khỏe cho người sử dụng.\r\n\r\nPhần thịt nho khô Sunview chắc, chứa nhiều chất sắt, canxi trong khi phần vỏ lại giàu vitamin A và C.\r\n                        ', 'Nho Khô Đen Không Hạt Sunview là một trong những loại nho khô được nhập khẩu trực tiếp từ Mỹ\r\nSấy khô trên công nghệ hiện đại, hoàn toàn không thêm chất phụ gia và đường hóa học\r\nPhần thịt mềm, dày thịt và có vị ngọt vừa phải\r\n                        ', 20, 190000, 150000, 'uploads/660be9746f678nhokhosay_my.png', 12, 16, 'Active', NULL, NULL),
(39, 'Bliss Gift', 'bliss-gift', 'Bliss Gift được thiết kế tối giản, thể hiện sự chân thành và ngập tràn yêu thương.\r\n                        ', 'UÀ TẶNG TRÁI CÂY – TRAO LỜI MUỐN NÓI \r\nQuà tặng là một sự thay mặt và là sự gửi trao yêu thương đầy chân thành của người gửi dành cho người nhận. Bộ sưu tập Quà tặng trái cây của VinFruits ra đời nhằm đáp ứng nhu cầu tìm mua một món quà ý nghĩa của Quý khách hàng, đó là một món quà trang trọng – chỉn chu –  tinh tế và đầy thiết thực để gửi đến một ai đó.\r\n\r\nPhong phú với những loại trái cây nhập khẩu hạng nhất được lựa chọn kỹ lưỡng và tỉ mỉ theo tiêu chuẩn 3C: Chuẩn tươi – Chuẩn ngon – Chuẩn sạch. Trái cây nhập khẩu kết hợp hoa tươi ngoại nhập sẽ mang đến những sản phẩm vừa chất lượng vừa có tính thẩm mỹ cao. Đa dạng từ mẫu mã cho đến kiểu dáng, việc chọn lựa quà tặng của Quý khách hàng sẽ trở nên dễ dàng hơn bao giờ hết vì giờ đây đã có Quà tặng trái cây của VinFruits.\r\n\r\nQuà tặng trái cây – có đây VinFruits – trao lời muốn nói – gửi gắm tình cảm chân thành đến đối phương.\r\n                        ', 15, 500000, 400000, 'uploads/660bea4a05326blisss_gìt.png', 14, 15, 'Active', NULL, NULL),
(40, 'Giỏ Trái Cây Việt Quất', 'gi-tr-i-c-y-vi-t-qu-t', 'QUÀ TẶNG TRÁI CÂY – TRAO LỜI MUỐN NÓI \r\nQuà tặng là một sự thay mặt và là sự gửi trao yêu thương đầy chân thành của người gửi dành cho người nhận. Bộ sưu tập Quà tặng trái cây của VinFruits ra đời nhằm đáp ứng nhu cầu tìm mua một món quà ý nghĩa của Quý khách hàng, đó là một món quà trang trọng – chỉn chu –  tinh tế và đầy thiết thực để gửi đến một ai đó.\r\n\r\nPhong phú với những loại trái cây nhập khẩu hạng nhất được lựa chọn kỹ lưỡng và tỉ mỉ theo tiêu chuẩn 3C: Chuẩn tươi – Chuẩn ngon – Chuẩn sạch. Trái cây nhập khẩu kết hợp hoa tươi ngoại nhập sẽ mang đến những sản phẩm vừa chất lượng vừa có tính thẩm mỹ cao. Đa dạng từ mẫu mã cho đến kiểu dáng, việc chọn lựa quà tặng của Quý khách hàng sẽ trở nên dễ dàng hơn bao giờ hết vì giờ đây đã có Quà tặng trái cây của VinFruits.\r\n\r\nQuà tặng trái cây – có đây VinFruits – trao lời muốn nói – gửi gắm tình cảm chân thành đến đối phương.\r\n                        ', 'Giỏ Trái Cây Việt Quất bao gồm:\r\n\r\nViệt quất Mỹ/Peru: 3 hộp\r\nMẫu mã sản phẩm có thể thay đổi tùy theo mùa vụ trái cây.\r\n                        ', 5, 500000, 400000, 'uploads/660beb078c18dGio_qua_trai_cayvietquat.png', 14, 16, 'Active', NULL, NULL),
(41, 'DỨA TƯƠI ĐÓNG LON 565G', 'd-a-t-i-ng-lon-565g', '                        \r\n\r\nKhối lượng chất rắn: 230 gam\r\n\r\nKhối lượng tịnh hỗn hợp: 565 gam\r\n\r\nThành phần: Nước 49.3%, Dứa 40.7%, đường 10%\r\n\r\nHướng dẫn bảo quản: Bảo quản nơi khô ráo, thoáng mát, bảo quản lạnh sau khi mở nắp.\r\n\r\nHướng dẫn sử dụng: dùng ăn liền ( ngon hơn khi ướp lạnh) hoặc pha chế món thức uống khác.\r\n\r\nHạn sử dụng: 24 tháng\r\n\r\nSố XNCB: 27/DINHNAM/2020\r\n\r\nĐạt tiêu chuẩn ISO:22000-2018 – HACCP\r\n                                                ', '                        Tên sản phẩm:  Dứa  đóng lon\r\n                                                ', 10, 70000, 50000, 'uploads/660bed37ac0dfduatuoidonglon.png', 13, 12, 'Active', NULL, NULL),
(42, 'Nhãn tươi đóng hộp', 'nh-n-t-i-ng-h-p', '\r\n                        Tên sản phẩm: Nhãn tươi đóng lon\r\n\r\nKhối lượng chất rắn: 230 gam\r\n\r\nKhối lượng tịnh hỗn hợp: 565 gam\r\n\r\nThành phần: Nhãn 40.7%, đường 10%, nước 49.3%\r\n\r\nHướng dẫn bảo quản: Bảo quản nơi khô ráo, thoáng mát, bảo quản lạnh sau khi mở nắp.\r\n\r\nHướng dẫn sử dụng: Dùng ăn liền (ngon hơn khi ướp lạnh) hoặc pha chế món thức uống khác.\r\n\r\nHạn sử dụng: 24 tháng\r\n\r\nSố XNCB: 29/DINHNAM/2020\r\n\r\nĐạt tiêu chuẩn ISO:22000-2018 – HACCP', 'Được tuyển lựa từ những trái Nhãn tươi ngon nhất, chúng tôi mong muốn đem đến sản phẩm Nhãn tươi đóng lon đảm bảo an toàn, dinh dưỡng cho sức khỏe bạn & gia đình thân yêu.', 5, 50000, 50000, 'uploads/660bede2c364anhantuoi.png', 13, 12, 'Active', NULL, NULL),
(43, 'Bưởi Da Xanh Ruột Hồng', 'b-i-da-xanh-ru-t-h-ng', '                        Thông tin chi tiết\r\nBưởi da xanh là một trong những trái cây tươi chứa nhiều vitamin, nó không chỉ dễ ăn, vị ngọt mát mà còn chứa rất ít calorie, bưởi còn giúp bạn có được làn da đẹp và có tác dụng bổ dưỡng cơ thể, phòng và chữa một số bệnh như cao huyết áp, đau dạ dày, tiểu đường… Bưởi da xanh có chứa đường, phốt pho, sắt, caroten, vitamin B1, B2, C, PP và tinh dầu nằm ở vỏ, thành phần chủ yếu là xitronelol. Hạt bưởi chứa một loại este, dầu, prôtit, chất xơ… Chất glucôxit trong vỏ bưởi có tác dụng chống viêm, chống vi trùng; nước quả tươi có thể làm hạ đường trong máu.\r\n                                                ', '                        Mô tả chung: BƯỞI DA XANH\r\nBưởi da xanh dóc múi, ruột màu phớt hồng hoặc đỏ, thơm ngon, múi đều, vị thanh, ngọt rất đặc trưng. Dùng để tráng miệng, ăn vặt, thực phẩm bổ dưỡng cho những người mắc bệnh tiểu đường, táo bón.\r\n                                                ', 50, 100000, 100000, 'uploads/660bef99e6ce2buoi.png', 10, 12, 'Active', NULL, NULL),
(44, 'Thanh Long Ruột Đỏ 500G', 'thanh-long-ru-t-500g', 'Tốt cho tim, người mắc chứng tiểu đường: Lượng chất xơ cao trong thanh long tốt cho nghững người mắc bệnh tiểu đường. Ngoài ra, thanh long còn có tác dụng tuyệt vời trong việc làm giảm lượng cholesterol xấu và tăng mức cholesterol tốt trong cơ thể. Thanh long là một nguồn tuyệt vời chất béo không bão hòa đơn, giúp cho trái tim bạn nghỉ ngơi trong tình trạng thái tốt.\r\n\r\nBảo vệ tóc khi làm hóa chất: Nước trái cây thanh long là một dưỡng chất tuyệt vời cho tóc nhuộm hoặc tóc đã qua xử lý hóa học. Bằng cách thoa nước ép thanh long hoặc một sản phẩm chiết xuất từ quả thanh long lên da đầu của bạn, bạn có thể bảo vệ mái tóc đã nhuộm hoặc đã qua xử lý hóa học của bạn. Nước ép thanh long giữ cho các nang lông mở, giúp cho mái tóc của bạn khỏe mạnh và mềm mượt.\r\n\r\nTham khảo các sản phẩm trái cây tươi khác tại Nam An Market\r\n                        ', 'Thanh long ruột đỏ có đặc tính hoàn toàn khác so với loại thanh long trắng.Thành phần dinh dưỡng của thanh long ruột đỏ được đánh giá là gấp đôi thanh long ruột trắng.\r\n\r\nLàm đẹp da, chống lão hóa: Mỗi 100g thanh long ruột đỏ chỉ cung cấp 40kcalo vì trong thanh long thành phần nước chiếm đến 87,6%. Hàm lượng nước cao này giúp giữ ẩm cho làn da, giúp da mịn màng hơn, giảm bớt hiện tượng da khô nứt, sừng hóa và lão hóa, giữ cho làn da có vẻ đẹp trẻ trung tươi mát.\r\n\r\nTiêu hóa tốt: Thành phần chất xơ chứa trong trái thanh long ruột đỏ cũng rất cao so với các loại trái cây khác, bao gồm cả 2 loại chất xơ không hòa tan (cellulose) và chất xơ hòa tan (pectin) giúp điều hòa hoạt động của hệ tiêu hóa, làm giảm các chất nguy hiểm đối với cơ thể như: các chất béo, cholesterol, các độc chất... làm giảm nguy cơ bị mụn, nhọt trên da.\r\n\r\nGiúp giảm béo: Thành phần của thanh long ruột đỏ hoàn toàn không chứa chất béo, cùng với mức năng lượng thấp và giàu chất xơ giúp giữ gìn cơ thểtránh khỏi hiện tượng béo phì, kẻ thù nguy hiểm nhất cho sắc đẹp và sức khỏe của phụ nữ.\r\n                        ', 25, 70000, 50000, 'uploads/660bf05a48358thanhlong.png', 10, 12, 'Active', NULL, NULL),
(45, 'Hạt Hạnh Nhân', 'h-t-h-nh-nh-n', '                        Hạnh nhân có nguồn gốc từ Trung Đông. Trong 28 gram hạnh nhân (khoảng 10 hạt) có chứa hàm lượng chất dinh dưỡng như sau:\r\nChất xơ: 3,5 gram\r\nProtein: 6 gram\r\nChất béo: 14 gram\r\nVitamin E: 37% RDI (mức tiêu thụ khuyến cáo hàng ngày)\r\nMangan: 32% RDI\r\nMagiê: 20% RDI\r\nHạnh nhân cũng chứa một lượng đồng, vitamin B2 (riboflavin) và phốt pho.\r\nCách sử dụng\r\nĂn vặt\r\nLàm kẹo, bánh quy,…\r\nĂn kèm với một số loại trái cây, sữa chua, bột yến mạch\r\nĐập nhỏ hạt và rắc lên món súp.\r\nLàm sữa hạnh nhân\r\n                                                ', '                        Nhập khẩu trực tiếp từ Mỹ, phân phối bởi công ty VinFruits\r\nTrọng lượng: 250gr\r\n                                                ', 7, 130000, 130000, 'uploads/660bf1dfc154chanhnhan.png', 12, 12, 'Active', NULL, NULL),
(46, 'Lovely Gift', 'lovely-gift', '\r\n     QUÀ TẶNG TRÁI CÂY – TRAO LỜI MUỐN NÓI \r\nQuà tặng là một sự thay mặt và là sự gửi trao yêu thương đầy chân thành của người gửi dành cho người nhận. Bộ sưu tập Quà tặng trái cây của VinFruits ra đời nhằm đáp ứng nhu cầu tìm mua một món quà ý nghĩa của Quý khách hàng, đó là một món quà trang trọng – chỉn chu –  tinh tế và đầy thiết thực để gửi đến một ai đó.\r\n\r\nPhong phú với những loại trái cây nhập khẩu hạng nhất được lựa chọn kỹ lưỡng và tỉ mỉ theo tiêu chuẩn 3C: Chuẩn tươi – Chuẩn ngon – Chuẩn sạch. Trái cây nhập khẩu kết hợp hoa tươi ngoại nhập sẽ mang đến những sản phẩm vừa chất lượng vừa có tính thẩm mỹ cao. Đa dạng từ mẫu mã cho đến kiểu dáng, việc chọn lựa quà tặng của Quý khách hàng sẽ trở nên dễ dàng hơn bao giờ hết vì giờ đây đã có Quà tặng trái cây              ', 'Lovely Gift được thiết kế tối giản kết hợp với hoa tươi, thể hiện sự chân thành và ngập tràn yêu thương.\r\n                        ', 10, 500000, 500000, 'uploads/660bf340c9b19lovly.png', 14, 15, 'Active', NULL, NULL),
(47, 'Dưa Lưới Fuji Giống Nhật (Trái)', 'd-a-l-i-fuji-gi-ng-nh-t-tr-i-', '                        MÔ TẢ\r\nDưa lưới Fuji giống Nhật – chính hiệu là một trong những loại trái cây nhập khẩu được bán tại VinFruits (100% nói không với chất bảo quản & trái cây Trung Quốc).\r\n                                                ', '                        Loại dưa được trồng, chăm sóc trực tiếp bởi người Nhật, là loại dưa ngon THỨ 2 ở Nhật\r\nTiêu chuẩn xuất khẩu đi các thị trường EU, Hong Kong và Mỹ\r\nĐộ ngọt (brix) từ 19\r\nCanh tác 100% theo hướng hữu cơ, an toàn tuyệt đối\r\nThích hợp để ăn và để biếu rất sang trọng\r\nDưa Lưới Nhật 1 trái tầm 1.5kg\r\n100% nói không với chất bảo quản & trái cây Trung Quốc\r\nĐổi trả sản phẩm trong vòng 24h\r\n                                                ', 25, 400000, 390000, 'uploads/6610f4ce07cc8dualoinhat.png', 11, 13, 'Active', NULL, NULL),
(48, 'Xoài Cát Hòa Lộc', 'xo-i-c-t-h-a-l-c', '1. Giống và chủng loại của quả xoài cát Hòa Lộc\r\nXoài cát Hòa Lộc là giống quả nức tiếng, có nguồn gốc từ xã Hòa Lộc, huyện Giáo Đức, Định Tường. Tuy nhiên, đến nay thì vùng này đã đổi thành xã Hòa Hưng, Huyện Cái Bè, Tiền Giang.\r\n\r\nVào những năm 1930, một tá điền đã mang giống xoài đầu tiên về và trồng tại xã Hòa Lộc cũ. Cùng từ lý do, thức quả đã được gọi với cái tên thân thuộc như ngày hôm nay. Bên cạnh đó, đây cũng là một tên gọi ý nghĩa và mang điều tốt lành. Vì vậy, giống xoài được nhiều gia đình Việt ưa chuộng sử dụng khi biếu tặng và cúng kiếng.\r\nHiện nay, xoài Hòa Lộc được trồng rộng rãi ở những vùng thuộc đồng bằng Sông Cửu Long. Trong đó, tỉnh Đồng Tháp là phổ biến nhất, đặc biệt khi thức quả còn gắn liền với tên gọi khác “xoài Cao Lãnh”. Thế nhưng, theo nhiều bình chọn từ dân sành ăn, loại xoài cát ngon nhất vẫn là xuất xứ từ Cái Bè – Tiền Giang.\r\n                        ', 'Mọng nước, ngọt thịt, ít xơ và hột nhỏ\r\nTrọng lượng trung bình từ 400-600gr\r\nQuả đẹp, khi chín vỏ màu vàng tươi đẹp mắt\r\nThích hợp để mua dùng hoặc chưng cúng\r\n100% nói không với chất bảo quản & trái cây Trung Quốc\r\nĐổi trả sản phẩm trong vòng 24h\r\n                        ', 7, 80000, 60000, 'uploads/6610f622ed20bxoaivietnam.png', 11, 12, 'Active', NULL, NULL),
(49, 'Dưa Lưới Pháp (Trái)', 'd-a-l-i-ph-p-tr-i-', '   Dưa lưới Pháp – chính hiệu là một trong những loại trái cây nhập khẩu được bán tại VinFruits (100% nói không với chất bảo quản & trái cây Trung Quốc). \r\nDưa lưới Đài Loan có vỏ bên ngoài màu xanh vừa, không quá đậm hoặc nhạt. Có các đường gân đặc trưng của dòng dưa lưới, 2 đầu quả dưa thon hình bầu dục. \r\n\r\nBên ngoài dưa lưới khi chín quả sẽ có màu trắng ngà hoặc màu vàng, vỏ mỏng, gân lưới xuất hiện rõ hơn và có mùi thơm đặc trưng.', 'Trái dưa to đều, thon dài, căng mọng, vỏ dưa màu xanh tươi mát, không quá đậm hoặc quá nhạt.\r\nTrên da quả có những đường gân đặc trưng của dòng dưa lưới bắt mắt.\r\nRuột có màu vàng nhạt, khi chín sẽ có màu vàng đậm hơn.\r\nDưa mang hương vị tươi ngon, thanh mát, giòn tan và ngọt ngào.\r\nDưa Lưới Đài Loan 1 trái tầm 1.5kg\r\n100% nói không với chất bảo quản & nói không với trái cây Trung Quốc\r\nĐổi trả sản phẩm trong vòng 24h\r\n                        ', 1, 200000, 100000, 'uploads/661104517affbdualuoihanquoc.png', 11, 15, 'Active', NULL, NULL),
(50, 'Nam Việt Quất Sấy Canada', 'nam-vi-t-qu-t-s-y-canada', 'Giá trị dinh dưỡng\r\nCalo: 46 kcal\r\nProtein: 0,4g\r\nCarbs: 12,2g\r\nĐường: 4g\r\nChất xơ: 4,6g\r\nChất béo: 0,1g\r\nCách sử dụng\r\nLàm món tráng miệng\r\nLàm đồ ăn vặt giữa giờ ra chơi cho học sinh, giờ giải lao cho dân công sở, cho mẹ bầu, chống nhạt miệng cho người lớn tuổi, mang đi picnic,…\r\nĂn kèm với salad, sữa chua, kem, ngũ cốc, yến mạch,…\r\nTrang trí bánh kem\r\nToping cho bánh cake\r\n                        ', 'Quả nam việt quất sấy khô có vị ngon ngọt hơn và tiện lợi khi sử dụng\r\nQuả nam việt quất khô chứa vitamin C giúp sản xuất collagen. Hàm lượng này rất quan trọng để duy trì khả năng miễn dịch của cơ thể. Hàm lượng phenol có trong quả nam việt quất sấy khô là hàm lượng chất chống oxy hóa cao nhất so với 20 loại trái cây tương tự\r\n                        ', 14, 90000, 90000, 'uploads/6611063985265vietquatsaycanada.png', 12, 14, 'Active', NULL, NULL),
(51, 'Nho Khô Đen Chile', 'nho-kh-en-chile', 'NHO KHÔ ĐEN CHILE\r\nTheo Bộ Nông nghiệp Hoa Kỳ (USDA), nho khô chứa rất nhiều các yếu tố dinh dưỡng. Trong khoảng 40 – 50 gam có:\r\nNăng lượng: 299 Kcal\r\nCarbohydrate: 79,18 g\r\nChất đạm: 3,07 g\r\nTổng số chất béo: 0,46 g\r\nCholesterol: 0 mg\r\nChất xơ: 3,7 g\r\nVitamin: Folates, Niacin, Axit pantothenic, Pyridoxine, Riboflavin, Thiamin (Vitamin B1), Vitamin A – C – E – K.\r\nĐiện giải: Natri, Kali.\r\nKhoáng chất: Canxi, Photpho, Magie, Sắt, Kẽm, Selen,…\r\nCách sử dụng\r\nLàm món tráng miệng\r\nLàm đồ ăn vặt giữa giờ ra chơi cho học sinh, giờ giải lao cho dân công sở, cho mẹ bầu, chống nhạt miệng cho người lớn tuổi, mang đi picnic,…\r\nĂn kèm với salad, sữa chua, kem, ngũ cốc, yến mạch,…\r\nTrang trí bánh kem\r\nToping cho bánh cake\r\n                        ', 'Nhập khẩu trực tiếp từ Chile, phân phối bởi công ty VinFruits\r\nTrọng lượng: 250g / 500g\r\n(Sản phẩm có thể thay đổi mẫu mã theo từng thời điểm)\r\n                        ', 7, 452000, 400000, 'uploads/661106d30c139nhokhodenchile.png', 12, 12, 'Active', NULL, NULL);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `account`
--
ALTER TABLE `account`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Chỉ mục cho bảng `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `brands_slug_unique` (`slug`);

--
-- Chỉ mục cho bảng `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_slug_unique` (`slug`);

--
-- Chỉ mục cho bảng `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_newscategory_id` (`newscategory_id`);

--
-- Chỉ mục cho bảng `newscategories`
--
ALTER TABLE `newscategories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_id` (`id`);

--
-- Chỉ mục cho bảng `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orders_user_id_foreign` (`user_id`);

--
-- Chỉ mục cho bảng `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_details_order_id_foreign` (`order_id`),
  ADD KEY `order_details_product_id_foreign` (`product_id`);

--
-- Chỉ mục cho bảng `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `products_slug_unique` (`slug`),
  ADD KEY `products_category_id_foreign` (`category_id`),
  ADD KEY `products_brand_id_foreign` (`brand_id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `account`
--
ALTER TABLE `account`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT cho bảng `brands`
--
ALTER TABLE `brands`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT cho bảng `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT cho bảng `news`
--
ALTER TABLE `news`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT cho bảng `newscategories`
--
ALTER TABLE `newscategories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT cho bảng `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT cho bảng `order_details`
--
ALTER TABLE `order_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT cho bảng `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `news`
--
ALTER TABLE `news`
  ADD CONSTRAINT `news_ibfk_1` FOREIGN KEY (`newscategory_id`) REFERENCES `newscategories` (`id`);

--
-- Các ràng buộc cho bảng `order_details`
--
ALTER TABLE `order_details`
  ADD CONSTRAINT `order_details_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  ADD CONSTRAINT `order_details_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Các ràng buộc cho bảng `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_brand_id_foreign` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id`),
  ADD CONSTRAINT `products_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
