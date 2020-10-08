-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th9 14, 2020 lúc 10:53 AM
-- Phiên bản máy phục vụ: 10.4.14-MariaDB
-- Phiên bản PHP: 7.4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `web3`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `category`
--

CREATE TABLE `category` (
  `ID_CATEGORY` bigint(20) NOT NULL,
  `NAME_CATEGORY` varchar(20) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `category`
--

INSERT INTO `category` (`ID_CATEGORY`, `NAME_CATEGORY`) VALUES
(8, 'Bootstrap'),
(10, 'C#'),
(2, 'CSS'),
(1, 'HTML'),
(9, 'Java'),
(3, 'JavaScript'),
(7, 'jQuery'),
(5, 'PHP'),
(6, 'Python'),
(4, 'SQL');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `comment`
--

CREATE TABLE `comment` (
  `ID_COMMENT` bigint(20) NOT NULL,
  `ID_POST` bigint(20) NOT NULL,
  `DATE` datetime NOT NULL,
  `CONTENT` text COLLATE utf8_unicode_ci NOT NULL,
  `ID_USER` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `posts`
--

CREATE TABLE `posts` (
  `ID_POST` bigint(20) NOT NULL,
  `ID_CATEGORY` bigint(20) NOT NULL,
  `TITLE` text COLLATE utf8_unicode_ci NOT NULL,
  `CONTENT` text COLLATE utf8_unicode_ci NOT NULL,
  `IMAGE` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `DATE` datetime NOT NULL,
  `ID_USER` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `posts`
--

INSERT INTO `posts` (`ID_POST`, `ID_CATEGORY`, `TITLE`, `CONTENT`, `IMAGE`, `DATE`, `ID_USER`) VALUES
(3, 1, 'Bài 1: Giới thiệu về HTML', '<p>Ng&ocirc;n ngữ đ&aacute;nh dấu si&ecirc;u văn bản (html) chỉ r&otilde; một trang Web sẽ được hiển thị như thế n&agrave;o trong một tr&igrave;nh duyệt. Sử dụng c&aacute;c thẻ v&agrave; c&aacute;c phần tử html, bạn c&oacute; thể:</p>\r\n\r\n<ul>\r\n	<li>Điều khiển h&igrave;nh thức v&agrave; nội dung của trang</li>\r\n	<li>Xuất bản c&aacute;c t&agrave;i liệu trực tuyến v&agrave; truy xuất th&ocirc;ng tin trực tuyến bằng c&aacute;ch sử dụng c&aacute;c li&ecirc;n kết được ch&egrave;n v&agrave;o t&agrave;i liệu html</li>\r\n	<li>Tạo c&aacute;c biểu mẫu trực tuyến để thu thập th&ocirc;ng tin về người d&ugrave;ng, quản l&yacute; c&aacute;c giao dịch .....</li>\r\n	<li>Ch&egrave;n c&aacute;c đối tượng như audio clip, video clip, c&aacute;c th&agrave;nh phần ActiveX, Flash v&agrave; c&aacute;c Java Applet v&agrave;o t&agrave;i liệu html</li>\r\n</ul>\r\n\r\n<p>T&agrave;i liệu html tạo th&agrave;nh m&atilde; nguồn của trang Web. Khi được xem tr&ecirc;n tr&igrave;nh soạn thảo, t&agrave;i liệu n&agrave;y l&agrave; một chuỗi c&aacute;c thẻ v&agrave; c&aacute;c phần tử, m&agrave; ch&uacute;ng x&aacute;c định trang web hiển thị như thế n&agrave;o. Tr&igrave;nh duyệt đọc c&aacute;c file c&oacute; đu&ocirc;i .htm hay .html v&agrave; hiển thị trang web đ&oacute; theo c&aacute;c lệnh c&oacute; trong đ&oacute;. HTML l&agrave; kiến thức cơ bản m&agrave; bất cứ ai muốn&nbsp;học lập tr&igrave;nh web&nbsp;hoặc&nbsp;học thiết kế web&nbsp;đều phải biết. Tất cả c&aacute;c trang web d&ugrave; xử l&yacute; phức tạp đến đ&acirc;u đều phải trả về dưới dạng m&atilde; nguồn HTML để tr&igrave;nh duyệt c&oacute; thể hiểu v&agrave; hiển thị l&ecirc;n được.</p>\r\n\r\n<p>V&iacute; dụ, theo c&uacute; ph&aacute;p html dưới đ&acirc;y sẽ hiển thị th&ocirc;ng điệp &ldquo;My first html document&rdquo;&nbsp;</p>\r\n\r\n<p><code>&lt;</code><code>html</code><code>&gt;</code></p>\r\n\r\n<p><code>&nbsp;&nbsp;&nbsp;</code><code>&lt;</code><code>head</code><code>&gt;</code></p>\r\n\r\n<p><code>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</code><code>&lt;</code><code>title</code><code>&gt;Welcome to html&lt;/</code><code>title</code><code>&gt;</code></p>\r\n\r\n<p><code>&nbsp;&nbsp;&nbsp;</code><code>&lt;/</code><code>head</code><code>&gt;</code></p>\r\n\r\n<p><code>&nbsp;&nbsp;&nbsp;</code><code>&lt;</code><code>body</code><code>&gt;</code></p>\r\n\r\n<p><code>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</code><code>&lt;</code><code>H3</code><code>&gt;My first html document&lt;/</code><code>H3</code><code>&gt;</code></p>\r\n\r\n<p><code>&nbsp;&nbsp;&nbsp;</code><code>&lt;/</code><code>body</code><code>&gt;</code></p>\r\n\r\n<p><code>&lt;/</code><code>html</code><code>&gt;</code></p>\r\n\r\n<p>&nbsp;Tr&igrave;nh duyệt th&ocirc;ng dịch những lệnh n&agrave;y v&agrave; hiển thị trang web như h&igrave;nh sau:</p>\r\n\r\n<p><img alt=\"\" src=\"https://hoclaptrinhweb.org/images/ecode/hoc-lap-trinh-web/html/hoc-html.png\" style=\"height:410px; width:590px\" /></p>\r\n\r\n<p><strong>Cấu tr&uacute;c của một t&agrave;i liệu html</strong></p>\r\n\r\n<p>Một t&agrave;i liệu html gồm 3 phần cơ bản:</p>\r\n\r\n<ul>\r\n	<li>Phần html: Mọi t&agrave;i liệu html phải bắt đầu bằng thẻ mở html &lt;html&gt; v&agrave; kết th&uacute;c bằng thẻ đ&oacute;ng html &lt;/html&gt;</li>\r\n</ul>\r\n\r\n<p>&lt;html&gt; &hellip;. &lt;/html&gt;</p>\r\n\r\n<p>&nbsp;&nbsp;&nbsp;&nbsp; Thẻ html b&aacute;o cho tr&igrave;nh duyệt biết nội dung giữa hai thẻ n&agrave;y l&agrave; một t&agrave;i liệu html</p>\r\n\r\n<ul>\r\n	<li>Phần ti&ecirc;u đề: Phần ti&ecirc;u đề bắt đầu bằng thẻ &lt;head&gt; v&agrave; kết th&uacute;c bởi thẻ &lt;/head&gt;. Phần n&agrave;y chứa ti&ecirc;u đề m&agrave; được hiển thị tr&ecirc;n thanh điều hướng của trang Web. Ti&ecirc;u đề nằm trong thẻ title, bắt đầu bằng thẻ &lt;title&gt; v&agrave; kết th&uacute;c l&agrave; thẻ &lt;/title&gt;.</li>\r\n</ul>\r\n\r\n<p>Ti&ecirc;u đề l&agrave; phần kh&aacute; quan trọng. Khi người d&ugrave;ng t&igrave;m kiếm th&ocirc;ng tin, ti&ecirc;u đề của trang Web cung cấp từ kh&oacute;a ch&iacute;nh yếu cho việc t&igrave;m kiếm.</p>\r\n\r\n<ul>\r\n	<li>Phần th&acirc;n: phần n&agrave;y nằm sau phần ti&ecirc;u đề. Phầ̀n th&acirc;n bao gồm văn bản, h&igrave;nh ảnh v&agrave; c&aacute;c li&ecirc;n kết m&agrave; bạn muốn hiển thị tr&ecirc;n trang web của m&igrave;nh. Phần th&acirc;n bắt đầu bằng thẻ &lt;body&gt; v&agrave; kết th&uacute;c bằng thẻ &lt;/body&gt;</li>\r\n</ul>\r\n', 'html-tags.png', '2020-09-07 00:00:00', 22),
(4, 1, 'Bài 2: Các thẻ HTML cơ bản', '<p><strong>Headings (Ti&ecirc;u đề)</strong></p>\r\n\r\n<p>Phần tử n&agrave;y được sử dụng để tr&igrave;nh b&agrave;y ti&ecirc;u đề cho phần nội dung hiển thị tr&ecirc;n trang web.</p>\r\n\r\n<p>Những phần ti&ecirc;u đề được hiển thị to v&agrave; in đậm hơn để ph&acirc;n biệt ch&uacute;ng với c&aacute;c phần c&ograve;n lại của văn bản. Ch&uacute;ng ta cũng c&oacute; thể hiển thị phần ti&ecirc;u đề theo một trong s&aacute;u k&iacute;ch thước từ h1 đến h6. Tất cả những g&igrave; ch&uacute;ng ta l&agrave;m l&agrave; định r&otilde; k&iacute;ch thước h1, h2&hellip; Thẻ H1 d&agrave;nh cho c&aacute;c ti&ecirc;u đề quan trọng nhất v&agrave; giảm dần đến h6</p>\r\n\r\n<p><code>&lt;</code><code>h1</code><code>&gt;This is a heading&lt;/</code><code>h1</code><code>&gt;</code></p>\r\n\r\n<p><code>&lt;</code><code>h2</code><code>&gt;This is a heading&lt;/</code><code>h2</code><code>&gt;</code></p>\r\n\r\n<p><code>&lt;</code><code>h3</code><code>&gt;This is a heading&lt;/</code><code>h3</code><code>&gt;</code></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>Thẻ khối &lt;span&gt;, &lt;div&gt;</strong></p>\r\n\r\n<p>C&oacute; những trường hợp ch&uacute;ng ta muốn chia văn bản trong một trang web th&agrave;nh những khối th&ocirc;ng tin logic khi đ&oacute; phần tử div v&agrave; span được sử dụng để nh&oacute;m nội dung lại với nhau. Thẻ div rất thường được sử dụng trong&nbsp;thiết kế layout website.</p>\r\n\r\n<ul>\r\n	<li>Phần tử div d&ugrave;ng để chia t&agrave;i liệu th&agrave;nh c&aacute;c th&agrave;nh phần c&oacute; li&ecirc;n quan với nhau.</li>\r\n	<li>Phần tử span d&ugrave;ng để định nghĩa nội dung trong d&ograve;ng(in-line) c&ograve;n phần tử div d&ugrave;ng để định nghĩa nội dung mức khối (block-level)</li>\r\n</ul>\r\n\r\n<p>V&iacute; dụ:</p>\r\n\r\n<p><code>&lt;</code><code>html</code><code>&gt;</code></p>\r\n\r\n<p><code>&nbsp;&nbsp;</code><code>&lt;</code><code>head</code><code>&gt;</code></p>\r\n\r\n<p><code>&nbsp;&nbsp;&nbsp;&nbsp;</code><code>&lt;</code><code>title</code><code>&gt;Learning HTML&lt;/</code><code>title</code><code>&gt;</code></p>\r\n\r\n<p><code>&nbsp;&nbsp;</code><code>&lt;/</code><code>head</code><code>&gt;</code></p>\r\n\r\n<p><code>&nbsp;&nbsp;</code><code>&lt;</code><code>body</code><code>&gt;</code></p>\r\n\r\n<p><code>&nbsp;&nbsp;&nbsp;&nbsp;</code><code>&lt;</code><code>div</code><code>&gt;</code></p>\r\n\r\n<p><code>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</code><code>division 1</code></p>\r\n\r\n<p><code>&nbsp;&nbsp;&nbsp;&nbsp;</code><code>&lt;</code><code>p</code><code>&gt;The div element is used to group elements&lt;/</code><code>p</code><code>&gt;</code></p>\r\n\r\n<p><code>&nbsp;&nbsp;&nbsp;&nbsp;</code><code>&lt;</code><code>p</code><code>&gt;Typically, div is used for block level elements&lt;/</code><code>p</code><code>&gt;</code></p>\r\n\r\n<p><code>&nbsp;&nbsp;&nbsp;&nbsp;</code><code>&lt;/</code><code>div</code><code>&gt;</code></p>\r\n\r\n<p><code>&nbsp;&nbsp;&nbsp;&nbsp;</code><code>&lt;</code><code>div</code> <code>align</code><code>=</code><code>&quot;right&quot;</code><code>&gt;</code></p>\r\n\r\n<p><code>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</code><code>division 2</code></p>\r\n\r\n<p><code>&nbsp;&nbsp;&nbsp;&nbsp;</code><code>&lt;</code><code>p</code><code>&gt;This is a second division</code></p>\r\n\r\n<p><code>&nbsp;&nbsp;&nbsp;&nbsp;</code><code>&lt;/</code><code>p</code><code>&gt;</code></p>\r\n\r\n<p><code>&nbsp;&nbsp;&nbsp;&nbsp;</code><code>&lt;</code><code>h2</code><code>&gt;Are you having fun?&lt;/</code><code>h2</code><code>&gt;</code></p>\r\n\r\n<p><code>&nbsp;&nbsp;&nbsp;&nbsp;</code><code>&lt;/</code><code>div</code><code>&gt;</code></p>\r\n\r\n<p><code>&nbsp;&nbsp;&nbsp;&nbsp;</code><code>&lt;</code><code>p</code><code>&gt;The second division is right aligned.</code></p>\r\n\r\n<p><code>&nbsp;&nbsp;&nbsp;&nbsp;</code><code>&lt;</code><code>span</code><code>&gt;Common formatting&lt;/</code><code>span</code><code>&gt; is applied to all the elements in the division</code></p>\r\n\r\n<p><code>&nbsp;&nbsp;&nbsp;&nbsp;</code><code>&lt;/</code><code>p</code><code>&gt;</code></p>\r\n\r\n<p><code>&nbsp;&nbsp;</code><code>&lt;/</code><code>body</code><code>&gt;</code></p>\r\n\r\n<p><code>&lt;/</code><code>html</code><code>&gt;</code></p>\r\n', 'html-tags.png', '2020-09-08 07:00:00', 22),
(6, 1, 'Bài 3: Các thẻ HTML định dạng văn bản', '<p>B&agrave;i h&ocirc;m nay ch&uacute;ng ta sẽ c&ugrave;ng t&igrave;m hiểu c&aacute;c&nbsp;thẻ&nbsp;HTML&nbsp;định dạng văn bản thường d&ugrave;ng trong một trang web. B&agrave;i học nằm trong Serie học&nbsp;<a href=\"https://blogloi.com/html-css/html-can-ban/\" target=\"_blank\">HTML căn bản</a>.</p>\r\n\r\n<p>Khi bạn v&agrave;o một website bất kỳ&nbsp;bạn thường&nbsp;thấy rất nhiều c&aacute;c kiểu định dạng kh&aacute;c nhau cho văn bản như in đậm, in nghi&ecirc;ng, gạch dưới, gạch ngang&nbsp;nh&igrave;n rất bắt mắt v&agrave; chuy&ecirc;n nghiệp. Tiếp tục Serie n&agrave;y, h&ocirc;m nay m&igrave;nh sẽ giới thiệu đến c&aacute;c bạn tất cả c&aacute;c thẻ định dạng văn bản tr&ecirc;n.</p>\r\n\r\n<h2>C&aacute;c thẻ HTML định dạng văn bản th&ocirc;ng dụng:</h2>\r\n\r\n<p>Dưới đ&acirc;y l&agrave; danh s&aacute;ch những thẻ&nbsp;HTML&nbsp;d&ugrave;ng để định dạng văn bản</p>\r\n\r\n<h3>Thẻ P &ndash; ph&acirc;n đoạn văn bản</h3>\r\n\r\n<p>Mỗi đoạn văn bản sẽ được xuống d&ograve;ng v&agrave; c&aacute;ch nhau với một tỷ lệ nhất định.</p>\r\n\r\n<p><code>&lt;</code><code>p</code><code>&gt;&nbsp;Đ&acirc;y l&agrave; một đoạn văn sẽ được ph&acirc;n đoạn theo tỷ lệ nhất định.&nbsp;&lt;/</code><code>p</code><code>&gt;</code></p>\r\n\r\n<p><code>&lt;</code><code>p</code><code>&gt;&nbsp;Học HTML căn bản d&agrave;nh cho người mới bắt đầu.&nbsp;&lt;/</code><code>p</code><code>&gt;</code></p>\r\n\r\n<p><strong>Kết quả:</strong></p>\r\n\r\n<p><strong><img alt=\"\" src=\"https://blogloi.com/wp-content/uploads/2015/08/cac-the-html-dinh-dang-van-ban.gif\" style=\"height:99px; width:413px\" /><img alt=\"\" src=\"https://blogloi.com/wp-content/uploads/2015/08/cac-the-html-dinh-dang-van-ban.gif\" style=\"float:left; height:99px; width:413px\" /></strong></p>\r\n', 'html-tags.png', '2020-09-09 00:00:00', 22),
(7, 2, 'CSS Introduction', '<h2>What is CSS?</h2>\r\n\r\n<ul>\r\n	<li><strong>CSS</strong>&nbsp;stands for&nbsp;<strong>C</strong>ascading&nbsp;<strong>S</strong>tyle&nbsp;<strong>S</strong>heets</li>\r\n	<li>CSS describes&nbsp;<strong>how HTML elements are to be displayed on screen, paper, or in other media</strong></li>\r\n	<li>CSS&nbsp;<strong>saves a lot of work</strong>. It can control the layout of multiple web pages all at once</li>\r\n	<li>External stylesheets are stored in&nbsp;<strong>CSS files</strong></li>\r\n</ul>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h2>Why Use CSS?</h2>\r\n\r\n<p>CSS is used to define styles for your web pages, including the design, layout and variations in display for different devices and screen sizes.</p>\r\n\r\n<h3>CSS Example</h3>\r\n\r\n<pre>\r\nbody {\r\n  background-color: lightblue;\r\n}\r\n\r\nh1 {\r\n  color: white;\r\n  text-align: center;\r\n}\r\n\r\np {\r\n  font-family: verdana;\r\n  font-size: 20px;\r\n}\r\n</pre>\r\n\r\n<h2>CSS Solved a Big Problem</h2>\r\n\r\n<p>HTML was NEVER intended to contain tags for formatting a web page!</p>\r\n\r\n<p>HTML was created to&nbsp;<strong>describe the content</strong>&nbsp;of a web page, like:</p>\r\n\r\n<p>&lt;h1&gt;This is a heading&lt;/h1&gt;</p>\r\n\r\n<p>&lt;p&gt;This is a paragraph.&lt;/p&gt;</p>\r\n\r\n<p>When tags like &lt;font&gt;, and color attributes were added to the HTML 3.2 specification, it started a nightmare for web developers. Development of large websites, where fonts and color information were added to every single page, became a long and expensive process.</p>\r\n\r\n<p>To solve this problem, the World Wide Web Consortium (W3C) created CSS.</p>\r\n\r\n<p>CSS removed the style formatting from the HTML page!</p>\r\n', 'css.jpg', '2020-09-07 00:00:00', 22),
(8, 2, 'CSS Syntax', '<h2>CSS Syntax</h2>\r\n\r\n<p>A CSS rule-set consists of a selector and a declaration block:</p>\r\n\r\n<p><img alt=\"\" src=\"https://www.w3schools.com/css/selector.gif\" style=\"height:119px; width:569px\" /></p>\r\n\r\n<p>The selector points to the HTML element you want to style.</p>\r\n\r\n<p>The declaration block contains one or more declarations separated by semicolons.</p>\r\n\r\n<p>Each declaration includes a CSS property name and a value, separated by a colon.</p>\r\n\r\n<p>Multiple CSS declarations are separated with semicolons, and declaration blocks are surrounded by curly braces.</p>\r\n\r\n<h3>Example</h3>\r\n\r\n<p>In this example all &lt;p&gt; elements will be center-aligned, with a red text color:</p>\r\n\r\n<pre>\r\np {\r\n  color: red;\r\n  text-align: center;\r\n}</pre>\r\n', 'css.jpg', '2020-09-08 00:00:00', 22),
(9, 2, 'CSS Selectors', '<h2>CSS Selectors</h2>\r\n\r\n<p>CSS selectors are used to &quot;find&quot; (or select) the HTML elements you want to style.</p>\r\n\r\n<p>We can divide CSS selectors into five categories:</p>\r\n\r\n<ul>\r\n	<li>Simple selectors (select elements based on name, id, class)</li>\r\n	<li><a href=\"https://www.w3schools.com/css/css_combinators.asp\">Combinator selectors</a>&nbsp;(select elements based on a specific relationship between them)</li>\r\n	<li><a href=\"https://www.w3schools.com/css/css_pseudo_classes.asp\">Pseudo-class selectors</a>&nbsp;(select elements based on a certain state)</li>\r\n	<li><a href=\"https://www.w3schools.com/css/css_pseudo_elements.asp\">Pseudo-elements selectors</a>&nbsp;(select and style a part of an element)</li>\r\n	<li><a href=\"https://www.w3schools.com/css/css_attribute_selectors.asp\">Attribute selectors</a>&nbsp;(select elements based on an attribute or attribute value)</li>\r\n</ul>\r\n\r\n<p>This page will explain the most basic CSS selectors.</p>\r\n\r\n<hr />\r\n<h2>The CSS element Selector</h2>\r\n\r\n<p>The element selector selects HTML elements based on the element name.</p>\r\n\r\n<h3>Example</h3>\r\n\r\n<p>Here, all &lt;p&gt; elements on the page will be center-aligned, with a red text color:&nbsp;</p>\r\n\r\n<pre>\r\np {\r\n  text-align: center;\r\n  color: red;\r\n}</pre>\r\n', 'css.jpg', '2020-09-09 00:00:00', 22),
(10, 3, 'JavaScript Introduction', '<h2>JavaScript Can Change HTML Content</h2>\r\n\r\n<p>One of many JavaScript HTML methods is&nbsp;<code>getElementById()</code>.</p>\r\n\r\n<p>The example below &quot;finds&quot; an HTML element (with id=&quot;demo&quot;), and changes the element content (innerHTML) to &quot;Hello JavaScript&quot;:</p>\r\n\r\n<h3>Example</h3>\r\n\r\n<div style=\"background:#eeeeee;border:1px solid #cccccc;padding:5px 10px;\">document.getElementById(&quot;demo&quot;).innerHTML = &quot;Hello JavaScript&quot;;</div>\r\n', 'javascript-5.png', '2020-09-07 00:00:00', 22),
(11, 3, 'JavaScript Where To', '<h2>The &lt;script&gt; Tag</h2>\r\n\r\n<p>In HTML, JavaScript code is inserted between&nbsp;<code>&lt;script&gt;</code>&nbsp;and&nbsp;<code>&lt;/script&gt;</code>&nbsp;tags.</p>\r\n\r\n<h3>Example</h3>\r\n\r\n<div style=\"background:#eeeeee;border:1px solid #cccccc;padding:5px 10px;\">&lt;script&gt;<br />\r\ndocument.getElementById(&quot;demo&quot;).innerHTML&nbsp;=&nbsp;&quot;My First JavaScript&quot;;<br />\r\n&lt;/script&gt;</div>\r\n\r\n<h2>JavaScript Functions and Events</h2>\r\n\r\n<p>A JavaScript&nbsp;<code>function</code>&nbsp;is a block of JavaScript code, that can be executed when &quot;called&quot; for.</p>\r\n\r\n<p>For example, a function can be called when an&nbsp;<strong>event</strong>&nbsp;occurs, like when the user clicks a button.</p>\r\n\r\n<h2>JavaScript in &lt;head&gt; or &lt;body&gt;</h2>\r\n\r\n<p>You can place any number of scripts in an HTML document.</p>\r\n\r\n<p>Scripts can be placed in the&nbsp;<code>&lt;body&gt;</code>, or in the&nbsp;<code>&lt;head&gt;</code>&nbsp;section of an HTML page, or in both.</p>\r\n\r\n<hr />\r\n<h2>JavaScript in &lt;head&gt;</h2>\r\n\r\n<p>In this example, a JavaScript&nbsp;<code>function</code>&nbsp;is placed in the&nbsp;<code>&lt;head&gt;</code>&nbsp;section of an HTML page.</p>\r\n\r\n<p>The function is invoked (called) when a button is clicked:</p>\r\n\r\n<h3>Example</h3>\r\n\r\n<div style=\"background:#eeeeee;border:1px solid #cccccc;padding:5px 10px;\">&lt;!DOCTYPE&nbsp;html&gt;<br />\r\n&lt;html&gt;</div>\r\n\r\n<div style=\"background:#eeeeee;border:1px solid #cccccc;padding:5px 10px;\">&lt;head&gt;<br />\r\n&lt;script&gt;<br />\r\nfunction&nbsp;myFunction() {<br />\r\n&nbsp;&nbsp;document.getElementById(&quot;demo&quot;).innerHTML&nbsp;=&nbsp;&quot;Paragraph changed.&quot;;<br />\r\n}<br />\r\n&lt;/script&gt;<br />\r\n&lt;/head&gt;<br />\r\n&lt;body&gt;</div>\r\n\r\n<div style=\"background:#eeeeee;border:1px solid #cccccc;padding:5px 10px;\">&lt;h1&gt;A Web Page&lt;/h1&gt;<br />\r\n&lt;p&nbsp;id=&quot;demo&quot;&gt;A Paragraph&lt;/p&gt;<br />\r\n&lt;button&nbsp;type=&quot;button&quot;&nbsp;onclick=&quot;myFunction()&quot;&gt;Try it&lt;/button&gt;</div>\r\n\r\n<div style=\"background:#eeeeee;border:1px solid #cccccc;padding:5px 10px;\">&lt;/body&gt;<br />\r\n&lt;/html&gt;</div>\r\n', 'javascript-5.png', '2020-09-08 00:00:00', 22),
(12, 3, 'JavaScript Output', '<h2>JavaScript Display Possibilities</h2>\r\n\r\n<p>JavaScript can &quot;display&quot; data in different ways:</p>\r\n\r\n<ul>\r\n	<li>Writing into an HTML element, using&nbsp;<code>innerHTML</code>.</li>\r\n	<li>Writing into the HTML output using&nbsp;<code>document.write()</code>.</li>\r\n	<li>Writing into an alert box, using&nbsp;<code>window.alert()</code>.</li>\r\n	<li>Writing into the browser console, using&nbsp;<code>console.log()</code>.</li>\r\n</ul>\r\n\r\n<hr />\r\n<h2>Using innerHTML</h2>\r\n\r\n<p>To access an HTML element, JavaScript can use the&nbsp;<code>document.getElementById(id)</code>&nbsp;method.</p>\r\n\r\n<p>The&nbsp;<code>id</code>&nbsp;attribute defines the HTML element. The&nbsp;<code>innerHTML</code>&nbsp;property defines the HTML content:</p>\r\n\r\n<h3>Example</h3>\r\n\r\n<div style=\"background:#eeeeee;border:1px solid #cccccc;padding:5px 10px;\">&lt;!DOCTYPE&nbsp;html&gt;<br />\r\n&lt;html&gt;<br />\r\n&lt;body&gt;<br />\r\n<br />\r\n&lt;h1&gt;My First Web Page&lt;/h1&gt;<br />\r\n&lt;p&gt;My First Paragraph&lt;/p&gt;<br />\r\n<br />\r\n&lt;p&nbsp;id=&quot;demo&quot;&gt;&lt;/p&gt;<br />\r\n<br />\r\n&lt;script&gt;<br />\r\ndocument.getElementById(&quot;demo&quot;).innerHTML&nbsp;=&nbsp;5&nbsp;+&nbsp;6;<br />\r\n&lt;/script&gt;<br />\r\n<br />\r\n&lt;/body&gt;<br />\r\n&lt;/html&gt;</div>\r\n', 'javascript-5.png', '2020-09-09 00:00:00', 22);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `roles`
--

CREATE TABLE `roles` (
  `ID_ROLE` int(11) NOT NULL,
  `NAME_ROLE` varchar(50) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `roles`
--

INSERT INTO `roles` (`ID_ROLE`, `NAME_ROLE`) VALUES
(1, 'admin'),
(2, 'user');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `ID_USER` bigint(20) NOT NULL,
  `USERNAME` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `PASSWORD` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ID_ROLE` int(11) NOT NULL,
  `FULLNAME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PHONE` varchar(11) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ADDRESS` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`ID_USER`, `USERNAME`, `PASSWORD`, `ID_ROLE`, `FULLNAME`, `PHONE`, `ADDRESS`) VALUES
(20, 'test1@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 2, 'test1', '0987654321', '12 duong abcd'),
(22, 'khoa@khoa.com', 'e10adc3949ba59abbe56e057f20f883e', 1, 'Khoa', '0329034289', '123 abc streets'),
(28, 'test2@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 2, 'test2', '0123456789', '23 duong abc');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`ID_CATEGORY`),
  ADD UNIQUE KEY `CATEGORY_UK` (`NAME_CATEGORY`);
ALTER TABLE `category` ADD FULLTEXT KEY `NAME_CATEGORY` (`NAME_CATEGORY`);

--
-- Chỉ mục cho bảng `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`ID_COMMENT`),
  ADD KEY `COMMENT_FK1` (`ID_POST`),
  ADD KEY `COMMENT_FK2` (`ID_USER`);

--
-- Chỉ mục cho bảng `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`ID_POST`),
  ADD KEY `POSTS_FK1` (`ID_CATEGORY`),
  ADD KEY `POSTS_FK2` (`ID_USER`);
ALTER TABLE `posts` ADD FULLTEXT KEY `TITLE` (`TITLE`);
ALTER TABLE `posts` ADD FULLTEXT KEY `CONTENT` (`CONTENT`);

--
-- Chỉ mục cho bảng `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`ID_ROLE`),
  ADD UNIQUE KEY `ROLES_UK` (`NAME_ROLE`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`ID_USER`),
  ADD UNIQUE KEY `USERS_UK` (`USERNAME`),
  ADD KEY `USERS_FK` (`ID_ROLE`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `category`
--
ALTER TABLE `category`
  MODIFY `ID_CATEGORY` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT cho bảng `comment`
--
ALTER TABLE `comment`
  MODIFY `ID_COMMENT` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `posts`
--
ALTER TABLE `posts`
  MODIFY `ID_POST` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `ID_USER` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `comment`
--
ALTER TABLE `comment`
  ADD CONSTRAINT `COMMENT_FK1` FOREIGN KEY (`ID_POST`) REFERENCES `posts` (`ID_POST`),
  ADD CONSTRAINT `COMMENT_FK2` FOREIGN KEY (`ID_USER`) REFERENCES `users` (`ID_USER`);

--
-- Các ràng buộc cho bảng `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `POSTS_FK1` FOREIGN KEY (`ID_USER`) REFERENCES `users` (`ID_USER`),
  ADD CONSTRAINT `POSTS_FK2` FOREIGN KEY (`ID_CATEGORY`) REFERENCES `category` (`ID_CATEGORY`);

--
-- Các ràng buộc cho bảng `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `USERS_FK` FOREIGN KEY (`ID_ROLE`) REFERENCES `roles` (`ID_ROLE`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
