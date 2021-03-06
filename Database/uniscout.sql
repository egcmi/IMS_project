-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 18, 2018 at 09:01 AM
-- Server version: 10.1.26-MariaDB
-- PHP Version: 7.1.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `uniscout`
--

-- --------------------------------------------------------

--
-- Table structure for table `album`
--

CREATE TABLE `album` (
  `id_image` int(11) NOT NULL,
  `id_event` int(11) NOT NULL,
  `title` varchar(150) NOT NULL,
  `photo` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `album`
--

INSERT INTO `album` (`id_image`, `id_event`, `title`, `photo`) VALUES
(1, 1, 'Waves along the Talfer river', 'https://goo.gl/nUDwnP'),
(2, 1, 'Fun at the ice rink', 'https://goo.gl/y96esc'),
(3, 1, 'Mounting view behind the city', 'https://goo.gl/dzHzPu'),
(4, 2, 'Chilling at the lake', 'https://goo.gl/7D5Yvi'),
(5, 2, 'Aura of mystery around the lake', 'https://goo.gl/re27d6'),
(6, 2, 'Row, row, row your boat...', 'https://goo.gl/QSzAiP'),
(7, 3, 'Scent of tulips', 'https://goo.gl/Mqws96'),
(8, 3, 'Getting lost in the maze...', 'https://goo.gl/3SzzAg'),
(9, 3, 'Tea party with the Princess', 'https://goo.gl/TNbrrp');

-- --------------------------------------------------------

--
-- Table structure for table `articles`
--

CREATE TABLE `articles` (
  `id_article` int(11) NOT NULL,
  `id_event` int(11) NOT NULL,
  `title` varchar(150) NOT NULL,
  `date_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `articles`
--

INSERT INTO `articles` (`id_article`, `id_event`, `title`, `date_time`, `description`) VALUES
(1, 1, 'A walk to explore Talvera/Talfer', '2018-01-13 18:16:28', 'Nulla facilisi. Nullam ac arcu pellentesque, interdum augue ac, venenatis odio. Maecenas et pharetra mi. Quisque ac tellus porta, scelerisque nunc porttitor, sagittis turpis. Nulla sed rhoncus nibh. Phasellus rutrum mi tortor, quis aliquam nibh varius ac. Sed mattis sapien ante, posuere dignissim quam vestibulum vitae. \r\nPellentesque et ante a nisi maximus venenatis in vel mauris. Interdum et malesuada fames ac ante ipsum primis in faucibus. Donec scelerisque lorem enim, vitae pellentesque felis condimentum ac. Fusce quis condimentum turpis, eget congue augue. Nulla mollis quam sit amet tortor commodo, et elementum tortor blandit. Curabitur iaculis nulla quam, ac molestie sem ullamcorper ut. Maecenas odio mi, scelerisque non mauris sit amet, fermentum feugiat turpis. Ut vitae arcu id ipsum scelerisque lacinia quis quis ex. Nunc vitae ex id lorem pellentesque auctor. Donec cursus risus ligula, a aliquet velit sagittis non. Vivamus gravida elit at orci molestie, ut suscipit nibh fermentum. Vivamus sed metus vel purus pulvinar cursus. Etiam quam tellus, venenatis et porta congue, finibus id arcu. Phasellus hendrerit risus urna, in semper felis semper imperdiet. Mauris id ultrices felis, quis scelerisque nulla. In semper nibh a urna viverra pretium. Nunc malesuada ullamcorper enim vitae congue. Suspendisse euismod egestas eleifend.'),
(2, 2, 'First time in Braies/Pragser See', '2017-07-01 20:16:28', 'Aenean tincidunt, nibh a vestibulum tempor, metus sem interdum eros, a semper nunc turpis pellentesque augue. Proin luctus rutrum augue, id volutpat justo ultrices ac. Sed ut interdum nulla. Donec quam ante, interdum eu dictum non, gravida ut magna. In ut gravida eros, eget rutrum justo. Vestibulum aliquet metus enim, sit amet tincidunt leo convallis et. Donec nec ligula convallis elit elementum commodo vel quis est. Aenean a ornare libero. Vestibulum et massa at velit ullamcorper vehicula. Nulla facilisi. Vestibulum est sapien, dignissim vitae interdum a, suscipit ut purus. Vestibulum id nulla placerat dui cursus ornare. Nulla lacinia sapien et congue commodo. Integer sed venenatis est. Integer lacinia velit est, in aliquet massa convallis quis.\r\nInteger pharetra efficitur dapibus. Vivamus a porta ligula. Nunc turpis nisi, pellentesque vitae tempor quis, imperdiet id mauris. Integer et enim in neque feugiat egestas ac vel lacus. Aenean ut erat sit amet nisi sagittis tempus. Nulla eu libero accumsan, suscipit lorem ac, blandit est. Quisque convallis massa a vulputate condimentum. Sed at massa non sapien lacinia auctor. Ut a rhoncus arcu. Nulla a risus sollicitudin, semper nunc quis, ornare orci. Fusce elementum lacinia commodo. Nulla placerat mi vel ante pulvinar vestibulum. Quisque cursus quam tempus erat malesuada luctus. Suspendisse turpis eros, tincidunt ut ante at, sagittis accumsan elit. Proin sit amet tortor facilisis, convallis ante nec, sodales mi.'),
(3, 3, 'A walk in Meran/Merano', '2017-11-20 19:16:28', 'Proin facilisis dolor ex, id vehicula metus malesuada a. Donec sem lectus, iaculis eget ante id, venenatis maximus mi. Praesent a consectetur elit. In in volutpat neque. Nulla fermentum congue nibh, eu ullamcorper lorem blandit sed. In vitae velit tempor ipsum tristique ultrices ut a velit. Nunc gravida ipsum vitae libero cursus pharetra. Etiam dictum nibh et turpis pulvinar, eget imperdiet nulla posuere. Proin ut neque arcu. Phasellus ultricies orci sit amet volutpat commodo. Sed ac scelerisque nulla, nec suscipit ante. Sed egestas dui metus, ac pretium ipsum efficitur vitae.\r\nAliquam imperdiet lectus vitae justo condimentum, eu posuere ligula molestie. Suspendisse fermentum, enim vitae hendrerit pretium, metus dolor eleifend ante, at finibus dui libero sit amet mi. Proin vitae cursus urna. Fusce vitae ornare nisl, non volutpat mauris. Donec bibendum placerat mauris a ultricies. Nulla sed sem sit amet diam finibus varius et nec turpis. Ut consequat ex non purus molestie, et consectetur sapien dictum. Nulla posuere faucibus lorem. Nam nisl lorem, facilisis quis congue at, efficitur at lectus. Nunc a lobortis quam, eget accumsan purus. Maecenas luctus egestas vulputate. Donec volutpat faucibus massa, ut hendrerit nulla. Nunc efficitur faucibus molestie. Pellentesque condimentum nisi quis varius egestas. Proin sed tincidunt quam. Ut feugiat tincidunt sapien eu viverra.');

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

CREATE TABLE `events` (
  `id_event` int(11) NOT NULL,
  `title` varchar(150) NOT NULL,
  `date_time` datetime NOT NULL,
  `location` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `photo` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `events`
--

INSERT INTO `events` (`id_event`, `title`, `date_time`, `location`, `description`, `photo`) VALUES
(1, 'A walk along Talvera/Talfer', '2018-01-08 14:30:00', 'Bolzano/Bozen', 'Proin leo lorem, iaculis et neque eget, laoreet iaculis diam. Aenean aliquam non nisi id maximus. Maecenas viverra malesuada facilisis. Phasellus porta et tortor a dictum. Cras ut ornare leo. Fusce ultricies maximus condimentum. Phasellus semper ultricies erat nec suscipit. Vestibulum mattis mauris at urna rhoncus tristique. Ut laoreet aliquam lacus, eu pharetra nisl pretium ut.', 'https://goo.gl/5oBZYZ'),
(2, 'First time at Lago di Braies/Pragser See', '2017-06-18 10:00:00', 'Braies/Pragser', 'Etiam vel laoreet lectus, id ultrices erat. Integer ullamcorper non justo a consequat. Maecenas aliquam massa eu nisi eleifend iaculis. Fusce mollis consequat dui at vulputate. Quisque semper auctor pellentesque. Proin purus nisl, cursus at tristique in, tristique in leo. Pellentesque eu luctus augue, vitae mollis massa. Cras dictum id ipsum sed sollicitudin. Integer sit amet massa viverra, feugiat sem non, vulputate est. Quisque sodales ex vitae mattis rhoncus. Etiam a augue eget neque dictum feugiat. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec laoreet tellus sit amet mi bibendum iaculis. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec luctus, erat vitae laoreet facilisis, odio nunc venenatis lacus, ac dignissim justo ante ac est.', 'https://goo.gl/ecNt9t'),
(3, 'Being royal in Meran/Merano', '2017-11-11 10:00:00', 'Meran/Merano', 'Nullam sit amet orci sapien. Quisque viverra in ante vitae dictum. Praesent luctus, eros sed finibus tempus, erat quam consequat turpis, vitae fermentum massa mi pharetra urna. Nullam elementum, augue ut facilisis fringilla, odio sem suscipit tellus, ut eleifend urna nibh at nisl. Ut laoreet tincidunt blandit. Suspendisse sed nulla quis elit gravida dignissim et eget nisl. Proin sodales vulputate est eu laoreet. In at massa pulvinar, hendrerit tortor eu, pellentesque sem. Pellentesque sagittis libero et tellus congue, eget auctor tortor fermentum. Sed scelerisque tellus sit amet tellus vehicula, sit amet viverra ex lacinia. Mauris suscipit tincidunt bibendum. Sed ullamcorper neque vitae justo egestas, in fringilla est facilisis. Suspendisse rhoncus, nisl sagittis imperdiet pellentesque, neque eros viverra turpis, sit amet dictum nisl quam sed tellus. Mauris aliquet tristique felis, nec finibus metus elementum id.', 'https://goo.gl/zPtCQi'),
(4, 'We\'re visiting Ritten/Renon!', '2018-06-10 08:00:00', 'Ritten/Renon', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin in est id enim luctus tempor. Duis ultricies, tortor sit amet aliquam malesuada, enim tortor rhoncus nulla, vel lacinia ex lorem a leo. Vivamus volutpat tempor eros in malesuada. Sed ultrices augue sit amet ipsum imperdiet porttitor. Fusce sapien lorem, viverra ut semper ut, pretium id ante. Ut ultricies orci nec molestie aliquet. Maecenas viverra eget orci in egestas. Donec quis sem in tortor egestas mattis pharetra vel lectus. Cras ac neque purus. Donec interdum tempus quam, a placerat ante semper at. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Sed tempor eros urna, non faucibus est faucibus ut.', 'https://goo.gl/BRdqhS'),
(5, 'Your first trip to Jenesien/San Genesio', '2018-05-15 10:00:00', 'Jenesien/San Genesio', 'Nam eget consectetur turpis, sed cursus lectus. Phasellus pulvinar tristique orci ultricies elementum. Vivamus iaculis nec tellus id suscipit. Vestibulum dapibus sed elit et facilisis. Suspendisse nibh augue, hendrerit vel condimentum vitae, maximus at arcu. Suspendisse rhoncus purus at lacus ullamcorper mattis. Quisque imperdiet lacinia ligula nec scelerisque. Integer ac felis elit. Donec feugiat felis nisi, nec maximus enim tincidunt a. Donec finibus et tellus nec volutpat. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Nulla quis aliquet augue, non tempor mauris.', 'https://goo.gl/DNXwKr'),
(6, 'Barbecue at Colle/Kohlern', '2018-07-08 12:30:00', 'Colle/Kohlern', 'Quisque ex eros, dictum sit amet nunc et, tristique rutrum turpis. Phasellus commodo, arcu in tempor egestas, sapien nisi sodales mauris, eget ullamcorper magna eros vitae justo. Donec vel nisi in nisl tristique dictum. Mauris ut tempor dolor, in mattis turpis. Sed eget sagittis metus. Aenean cursus dignissim velit, posuere commodo est vehicula eu. Suspendisse nunc lectus, blandit placerat ligula sed, mattis bibendum felis. Vivamus vel porta ligula, id porta metus. Curabitur sit amet mattis lorem. Nam ut ultrices ipsum, eget tempor erat.', 'https://goo.gl/9xUyHU'),
(7, 'Trip to Lago di Braies/Pragser See', '2018-04-18 08:00:00', 'Braies/Pragser', 'Mauris luctus, velit id ornare tincidunt, nunc risus lobortis lorem, faucibus sollicitudin orci justo eu ex. Quisque nibh lacus, euismod efficitur porta ut, rhoncus id libero. Aenean faucibus posuere venenatis. Cras lorem augue, convallis at libero laoreet, eleifend tincidunt augue. Integer tempus ante in dictum dictum. Integer ac tristique magna. Vivamus nec consectetur erat, eu porttitor dolor. Sed at urna dapibus, lobortis lorem at, posuere nibh. Suspendisse cursus sit amet orci eget ullamcorper. Pellentesque ullamcorper felis eget venenatis mollis. Mauris in purus in lectus commodo mattis. Nam tincidunt massa id justo consectetur auctor. Donec maximus efficitur libero, sed euismod urna rhoncus quis.', 'https://goo.gl/9sMvDr'),
(8, 'Hiking the Tre Cime di Lavaredo/Dreizinnen', '2018-03-25 07:30:00', 'Tre Cime di Lavaredo/Dreizinnen', 'Phasellus diam dolor, vestibulum et dapibus vitae, facilisis viverra odio. Morbi a eleifend leo. Quisque commodo risus ac nibh elementum, a tempus risus ultrices. Curabitur id consectetur velit. In posuere suscipit ex, eu euismod tortor scelerisque eu. In velit nisl, maximus at dignissim quis, feugiat nec metus. In finibus tellus vitae ipsum congue, sit amet sodales eros molestie. Fusce vestibulum fringilla velit, id cursus sem faucibus a. Donec lectus metus, ultricies sit amet aliquet vel, tempus eu tortor. Praesent blandit magna sit amet turpis eleifend, sit amet interdum nisl dapibus. Nam ac neque nec metus porttitor pulvinar in non leo. Vivamus sollicitudin erat ut metus efficitur, ac tincidunt lacus interdum. Quisque a justo commodo, efficitur libero non, cursus nibh. Pellentesque pharetra mi ac luctus vestibulum. Curabitur rutrum felis et elit hendrerit fringilla.', 'https://goo.gl/My6DBW'),
(9, 'Skiing in Plan de Corones/Kronplatz', '2018-01-19 13:30:00', 'Plan de Corones/Kronplatz', 'Etiam a augue sit amet sem eleifend accumsan. Aliquam erat volutpat. Aliquam finibus et eros suscipit fermentum. Nunc ac metus a metus pretium dignissim sit amet sed velit. Integer id lacinia velit. Duis imperdiet tellus ullamcorper neque feugiat, vitae aliquet odio posuere. Mauris lacus magna, venenatis sed convallis at, aliquam at velit. Phasellus molestie tincidunt velit, ut malesuada urna vestibulum vel. Mauris imperdiet, purus vitae auctor interdum, ante risus varius nisl, ut laoreet nisi risus sit amet justo. Fusce ac tortor fermentum, luctus nisl quis, blandit lorem. Fusce mattis, nulla eget ultricies porttitor, nulla felis aliquam odio, eget euismod libero augue dapibus ante. Sed volutpat at magna et maximus. Ut commodo, est vitae posuere hendrerit, neque risus porttitor leo, quis pulvinar dui leo ut nibh.', 'https://goo.gl/JffDPi');

-- --------------------------------------------------------

--
-- Table structure for table `participants`
--

CREATE TABLE `participants` (
  `id_part` int(11) NOT NULL,
  `id_event` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `surname` varchar(50) NOT NULL,
  `phone_number` varchar(50) NOT NULL,
  `email_address` varchar(254) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `participants`
--

INSERT INTO `participants` (`id_part`, `id_event`, `name`, `surname`, `phone_number`, `email_address`) VALUES
(1, 9, 'Giulia', 'Baldini', '298148948', 'baldinigiuls@gmail.com');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `album`
--
ALTER TABLE `album`
  ADD PRIMARY KEY (`id_image`),
  ADD KEY `id_event` (`id_event`);

--
-- Indexes for table `articles`
--
ALTER TABLE `articles`
  ADD PRIMARY KEY (`id_article`),
  ADD KEY `id_event` (`id_event`);

--
-- Indexes for table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`id_event`);

--
-- Indexes for table `participants`
--
ALTER TABLE `participants`
  ADD PRIMARY KEY (`id_part`),
  ADD UNIQUE KEY `id_event` (`id_event`,`email_address`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `album`
--
ALTER TABLE `album`
  MODIFY `id_image` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `articles`
--
ALTER TABLE `articles`
  MODIFY `id_article` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
  MODIFY `id_event` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `participants`
--
ALTER TABLE `participants`
  MODIFY `id_part` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `album`
--
ALTER TABLE `album`
  ADD CONSTRAINT `album_ibfk_1` FOREIGN KEY (`id_event`) REFERENCES `articles` (`id_event`);

--
-- Constraints for table `articles`
--
ALTER TABLE `articles`
  ADD CONSTRAINT `articles_ibfk_1` FOREIGN KEY (`id_event`) REFERENCES `events` (`id_event`);

--
-- Constraints for table `participants`
--
ALTER TABLE `participants`
  ADD CONSTRAINT `participants_ibfk_1` FOREIGN KEY (`id_event`) REFERENCES `events` (`id_event`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
