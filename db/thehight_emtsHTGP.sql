-- phpMyAdmin SQL Dump
-- version 4.3.8
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jan 10, 2017 at 10:36 PM
-- Server version: 5.6.32-78.1
-- PHP Version: 5.4.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `thehight_emtsHTGP`
--

-- --------------------------------------------------------

--
-- Table structure for table `emts_admin_permissions`
--

CREATE TABLE IF NOT EXISTS `emts_admin_permissions` (
  `permission_id` int(10) NOT NULL,
  `code` varchar(100) NOT NULL,
  `name` varchar(255) NOT NULL,
  `group_id` int(10) NOT NULL DEFAULT '0' COMMENT 'parent id',
  `display_order` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=91 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `emts_admin_permissions`
--

INSERT INTO `emts_admin_permissions` (`permission_id`, `code`, `name`, `group_id`, `display_order`) VALUES
(1, 'site-setting', 'Site Setting', 0, 0),
(2, 'blockip-setting', 'Block IP Setting', 0, 0),
(3, 'module-cms', 'CMS Module', 0, 0),
(4, 'add-cms', 'Add Cms', 3, 0),
(5, 'edit-cms', 'Edit CMS', 3, 0),
(6, 'delete-cms', 'Delete CMS', 3, 0),
(22, 'email-settings', 'Email Setting', 0, 0),
(23, 'module-product-category', 'Product Category Module', 0, 0),
(24, 'edit-product-category', 'Edit Product Category', 23, 0),
(25, 'delete-product-categories', 'Delete Product Category', 23, 0),
(26, 'view-product-sub-category', 'View Product Sub Category', 23, 0),
(27, 'add-product-sub-category', 'Add Product Sub Category', 23, 0),
(28, 'edit-product-sub-category', 'Edit Product Sub Category', 23, 0),
(29, 'module-administrator', ' Administrator Module', 0, 0),
(30, 'view-administrator', 'View Admins Details', 29, 0),
(31, 'add-administrator', 'Add Administrator', 29, 0),
(32, 'edit-administrator', 'Edit Administrator', 29, 0),
(33, 'delete-administrator', 'Delete Administrator', 29, 0),
(34, 'role-permission', 'Role Permission', 29, 0),
(39, 'add-product-category', 'Add Product Category', 23, 0),
(40, 'module-member', 'Member Module', 0, 0),
(41, 'add-member', 'Add Member', 40, 0),
(42, 'edit-member', 'Edit Member', 40, 0),
(43, 'delete-member', 'Delete Member', 40, 0),
(44, 'member-transaction', 'View Member transaction', 40, 0),
(45, 'add-balance', 'Add Balance', 40, 0),
(46, 'module-product', 'Product Module', 0, 0),
(47, 'add-product', 'Add Product', 46, 0),
(48, 'edit_product', 'Edit Product', 46, 0),
(49, 'delete-product', 'Delete Product', 46, 0),
(52, 'auction-winner-module', 'Product Winner Module', 0, 0),
(53, 'log-setting', 'Admin Log Settings', 0, 0),
(55, 'module-report', 'Report Module', 0, 0),
(56, 'award-bid', 'Award Bid', 0, 0),
(57, 'admin-communication', 'Admin Communication', 0, 0),
(58, 'module-time-zone-settings', 'Time Zone Settings Module', 0, 0),
(59, 'paypal-payment', 'Payment By Paypal', 0, 0),
(60, 'module-seo', 'SEO Management', 0, 0),
(61, 'module-bidpackage', 'Bidpackage Module', 0, 0),
(62, 'add-bidpackage', 'Add Bidpackage', 61, 0),
(63, 'delete-bidpackage', 'Delete Bidpackage', 61, 0),
(64, 'edit-bidpackage', 'Edit Bid Package', 61, 0),
(65, 'module-help', 'Help Module', 0, 0),
(66, 'add-help', 'Add Help', 65, 0),
(67, 'edit-help', 'Edit Help', 65, 0),
(68, 'delete-help', 'Delete Help', 65, 0),
(69, 'view-help', 'View Help', 65, 0),
(70, 'module-currency', 'Currency Module', 0, 0),
(71, 'view-currency', 'View Currency', 70, 0),
(72, 'add-currency', 'Add Currency', 70, 0),
(73, 'edit-currency', 'Edit Currency', 70, 0),
(74, 'delete-currency', 'Delete Currency', 70, 0),
(75, 'view-bidpackage', 'View Bidpackage', 61, 0),
(76, 'module-newsletter', 'Newsletter Module', 0, 0),
(77, 'view-newsletter', 'View Newsletter', 76, 0),
(78, 'add-newsletter', 'Add NewsLetter', 76, 0),
(79, 'edit-newsletter', 'Edit Newsletter', 76, 0),
(80, 'delete-newsletter', 'Delete Newsletter', 76, 0),
(81, 'module-custom-field', 'Custom Field', 0, 0),
(82, 'add-custom-field', 'Add Custom Field', 81, 0),
(83, 'edit-custom-field', 'Edit Custom Field', 81, 0),
(84, 'delete-custom-field', 'Delete Custom Field', 81, 0),
(85, 'module-how-and-why', 'How It Works/ Why Reverse Auction', 0, 0),
(86, 'add-how-and-why', 'Add Content', 85, 0),
(87, 'edit-how-and-why', 'Edit Content', 85, 0),
(88, 'delete-how-and-why', 'Delete Content', 85, 0),
(89, 'view-how-and-why', 'View Content', 85, 0),
(90, 'send-newsletter', 'Send Newsletters', 76, 0);

-- --------------------------------------------------------

--
-- Table structure for table `emts_admin_roles_permission`
--

CREATE TABLE IF NOT EXISTS `emts_admin_roles_permission` (
  `user_type` int(5) NOT NULL,
  `permission_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `emts_admin_roles_permission`
--

INSERT INTO `emts_admin_roles_permission` (`user_type`, `permission_id`) VALUES
(1, 1),
(2, 1),
(1, 2),
(1, 3),
(2, 3),
(1, 4),
(2, 4),
(1, 5),
(2, 5),
(1, 6),
(2, 6),
(1, 22),
(1, 23),
(1, 24),
(1, 25),
(1, 26),
(1, 27),
(1, 28),
(1, 29),
(1, 30),
(1, 31),
(1, 32),
(1, 33),
(1, 34),
(1, 39),
(1, 40),
(2, 40),
(1, 41),
(2, 41),
(1, 42),
(2, 42),
(1, 43),
(2, 43),
(1, 44),
(2, 44),
(1, 45),
(2, 45),
(1, 46),
(2, 46),
(1, 47),
(2, 47),
(1, 48),
(2, 48),
(1, 49),
(2, 49),
(1, 52),
(1, 53),
(1, 55),
(1, 56),
(1, 57),
(1, 58),
(2, 58),
(1, 59),
(1, 60),
(1, 61),
(1, 62),
(1, 63),
(1, 64),
(1, 65),
(1, 66),
(1, 67),
(1, 68),
(1, 69),
(1, 70),
(1, 71),
(1, 72),
(1, 73),
(1, 74),
(1, 75),
(1, 76),
(1, 77),
(1, 78),
(1, 79),
(1, 80),
(1, 81),
(1, 82),
(1, 83),
(1, 84),
(1, 85),
(1, 86),
(1, 87),
(1, 88),
(1, 89),
(1, 90);

-- --------------------------------------------------------

--
-- Table structure for table `emts_block_ips`
--

CREATE TABLE IF NOT EXISTS `emts_block_ips` (
  `id` int(11) NOT NULL,
  `ip_address` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `message` text COLLATE utf8_unicode_ci NOT NULL,
  `added_date` datetime NOT NULL,
  `last_update` datetime NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `emts_block_ips`
--

INSERT INTO `emts_block_ips` (`id`, `ip_address`, `message`, `added_date`, `last_update`) VALUES
(1, '192.12.12.12', 'yo are blocked', '2016-07-07 11:58:01', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `emts_ci_sessions`
--

CREATE TABLE IF NOT EXISTS `emts_ci_sessions` (
  `session_id` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `ip_address` varchar(45) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `user_agent` varchar(120) COLLATE utf8_unicode_ci NOT NULL,
  `last_activity` int(10) unsigned NOT NULL DEFAULT '0',
  `user_data` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `emts_cms`
--

CREATE TABLE IF NOT EXISTS `emts_cms` (
  `id` int(11) NOT NULL,
  `heading` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8_unicode_ci NOT NULL,
  `cms_slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `page_title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `meta_key` tinytext COLLATE utf8_unicode_ci NOT NULL,
  `meta_description` tinytext COLLATE utf8_unicode_ci NOT NULL,
  `is_display` enum('Yes','No') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Yes',
  `created_date` datetime NOT NULL,
  `last_update` datetime NOT NULL,
  `deletable` enum('Yes','No') COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `emts_cms`
--

INSERT INTO `emts_cms` (`id`, `heading`, `content`, `cms_slug`, `page_title`, `meta_key`, `meta_description`, `is_display`, `created_date`, `last_update`, `deletable`) VALUES
(2, 'About', '<p>\r\n <span xss="removed">Vision: To be the best reverse auction company, adding value to the world.</span></p>\r\n<div xss="removed">\r\n  </div>\r\n<div xss="removed">\r\n Values:</div>\r\n<div xss="removed">\r\n Transparency\r\n <div>\r\n  Integrity</div>\r\n <div>\r\n  Customer First</div>\r\n <div>\r\n  Do more with less</div>\r\n <div>\r\n  Ownership</div>\r\n <div>\r\n   </div>\r\n <div>\r\n   </div>\r\n <div>\r\n  <p class="m_710502401264371966gmail-lead" xss=removed>\r\n   Differently than the regular way that most businesses currently procure goods and services, where the buyer actively search for a supplier and negotiate price and conditions, the Reverse Auction introduces a new concept where the suppliers actively compete on price and conditions and approach the buyer with an offer to obtain a business. </p>\r\n  <p class="m_710502401264371966gmail-lead" xss=removed>\r\n   A reverse auction is a strategy usually used in a B2B sourcing/negotiation to drive cost-out. By driving competition among sellers (bidders), the reverse auction drives a downward price trend, which is the buyer wish, but also gives the sellers a opportunity to assess the current prices and their own limitation, as well as giving the sellers the opportunity to obtain new business.</p>\r\n  <p class="m_710502401264371966gmail-lead" xss=removed>\r\n   Also known as e-auction, e-sourcing, e-procurement, the reverse auction provides many advantages: time efficiency, transparency, helps breaking monopoly/corruption, competitiveness, sourcing opportunities, reduced paperwork.</p>\r\n  <p class="m_710502401264371966gmail-lead" xss=removed>\r\n   The High Tree Group comes to break all paradigms on reverse auction offering not only a robust platform to host your e-auction in a quick, easy and efficient way, but also the knowledge, experience and support to leverage the results.</p>\r\n </div>\r\n</div>\r\n', 'about', 'About Us', 'About Us', 'About Us', 'Yes', '2016-05-10 12:23:58', '2016-12-23 16:57:36', 'No'),
(8, 'Buyers', '<p>\r\n Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam euismod lacus sit amet urna accumsan mattis. Nunc in justo sed libero iaculis consectetur vel ut turpis. Etiam tincidunt venenatis elit, in pretium risus condimentum et. Nullam mauris diam, cursus quis eros in, semper vehicula magna. Morbi aliquam eu felis bibendum aliquam. Duis in dignissim magna, in auctor neque. Aenean et libero quam. Aliquam erat volutpat. Phasellus nec feugiat enim. Praesent sit amet massa efficitur, venenatis orci at, lobortis ligula. Nunc a elementum orci. Suspendisse potenti.</p>\r\n', 'buyers', 'Buyers', 'Buyers', 'Buyers', 'Yes', '2016-06-06 11:05:01', '0000-00-00 00:00:00', 'No'),
(5, 'Privacy Policy', '<p>\r\n Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source.</p>\r\n<p>\r\n Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source.</p>\r\n<p>\r\n Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source.</p>\r\n', 'privacy-policy', 'Privacy Ploicy', 'Privacy Policy, Hightree Group', 'Privacy Policy, Hightree Group', 'Yes', '2016-06-02 13:04:33', '2016-06-22 15:21:31', 'No'),
(6, 'Terms And Conditions', '<p>\r\n <strong>1.</strong> Clip LLC, Company code 12456395 (hereinafter Organiser), organises auctions for new products and services on the internet. If you place a bid at an auction, or register as a user (hereinafter Client), you accept the following terms of use, and enter a contract on the following terms.</p>\r\n<p>\r\n <strong>2.</strong> The Client has to be a real person. The auction user account is personal. The client is not allowed to create various different user names/accounts. When a person has several auction accounts (user accounts), the bids placed by such a user may be annulled and/or the Organiser may close the account (possible purchased or received bids on a closed account will not be remunerated).</p>\r\n<p>\r\n <strong>3.</strong> The password cannot be detrimental towards other Clients (visitors and users of the Yepbid.com site). The Client is expected to present correct details when registering. The Client is liable for their actions regarding their user account. All registered users undertake to keep their username and password confidential. If a registered user has revealed their username and password to a third party, the Organiser cannot be held liable for the consequences of such actions.</p>\r\n<p>\r\n <strong>4. </strong>The Organiser is entitled to annul the winner of an auction, if the rules of the auction have been violated. Funds paid for annulled bids will not be returned. The organiser cannot be held liable for the unlawful actions of the Client.</p>\r\n<p>\r\n <strong>5.</strong>The Client or a visitor at www.Yepbid.com (hereinafter Site) agree not to distribute spam, chain letters, so-called pyramid schemes, viruses or other technology which cause or may cause harm to the Organiser or the Site.</p>\r\n<p>\r\n <strong>6.</strong> If the Organiser detects unlawful actions in the use of the services, the Organiser may suspend the Client’s use of the services and/or forbid such a Client to participate at auctions if deemed necessary.</p>\r\n<p>\r\n <strong>7. </strong>The Organiser is entitled to suspend, close or annul the auction, if Organiser’s server system is being violated, disturbed or such a system error is detected which may harm or affect course of the auction. If it is not possible to restore the auction, funds paid for placing bids at this auction will be returned to the Clients as virtual funds on their Yepbid.com accounts.</p>\r\n<p>\r\n <strong>8.</strong> The Organiser is not liable for errors in the computer system resulting from factors beyond the Organiser’s control (Force Majeure).</p>\r\n<p>\r\n <strong>9.</strong> The Organiser is not liable for errors which originate from the Client’s internet connection, power failure, and computer related errors or for other circumstances beyond the control of the Organiser.</p>\r\n<p>\r\n <strong>10.</strong> The Organiser does not affect the course of auctions in any way.</p>\r\n<p>\r\n <strong>11.</strong> Persons defined as organisers or employees of Yepbid.com are not allowed to participate in auctions.</p>\r\n<p>\r\n <strong>12.</strong> The user of Yepbid.com undertakes to use the services available on the site according to these terms and conditions and applicable legislation.</p>\r\n<p>\r\n <strong>13.</strong> Persons under the age of 18 are not allowed to participate in auctions with the exception of persons participating with their parent’s or guardian’s consent.</p>\r\n<p>\r\n <strong>14.</strong> The Organiser reserves right to close all auctions if a system error is detected.</p>\r\n<p>\r\n <strong>15</strong>. It is forbidden to use scripts at placing bids. If such a conduct is detected, the Organiser is entitled to refrain from selling the item to the Client.</p>\r\n<p>\r\n <strong>16</strong>. The Organiser is not liable for server problems or other problems. The Organiser does their utmost to restore the auction or return bids to the users when this is due to a server problem.</p>\r\n<p>\r\n <strong>17</strong>. The Client is entitled to participate simultaneously in all on-going auctions.</p>\r\n<p>\r\n <strong>18</strong>. The number of bids at auctions is not limited unless otherwise stated.</p>\r\n<p>\r\n <strong>19</strong>. Auctions go on 24h per day unless otherwise stated.</p>\r\n<p>\r\n <strong>20</strong>. Yepbid.com bids may be used on this site only (www.Yepbid.com), and the virtual funds, which the user does not spend, will not be compensated with real funds.</p>\r\n<p>\r\n <strong>21</strong>. Virtual funds may be purchased via available payment options.</p>\r\n<p>\r\n <strong>22</strong>. The Organiser is entitled to change the terms and conditions. The new terms and conditions come into force immediately after they have been published on the site. The Client confirms their acceptance of the modified and/or supplemented terms and conditions after the modifications/supplementations have entered into force.</p>\r\n<p>\r\n <strong>23</strong>. When the Client is entitled to purchase an auctioned item, she or he pays the winning price for the auctioned item (the lowest unique bid or the remaining value of the product or service i.e. the price the user has verified to purchase the item.) according to the Organiser’s invoice. The price includes delivery costs and VAT. Also Client can convert won item into bids before payment.</p>\r\n<p>\r\n <strong>24</strong>. If the Client does not pay for the item won at an auction within 14 days, the Organiser is entitled to annul the sales contract.</p>\r\n<p>\r\n <strong>25</strong>. The item photos are illustrative only. The product displayed in the photograph may differ from the offered product, or include components not included in the product package.</p>\r\n<p>\r\n <strong>26</strong>. The Organiser forwards the purchased items to the Client within 15 (fifteen) business days from the date when the Client paid the invoice to the address the Client has provided. The Organiser pays for the domestic delivery costs of the items.</p>\r\n<p>\r\n <strong>27</strong>. Delivery terms for more sizeable and expensive items are agreed upon separately with the winner.</p>\r\n<p>\r\n <strong>28</strong>. The item is posted to the Client or forwarded on some other agreed means of transport provided that the invoice has been paid in full, and the funds have been transferred to the Organiser&#39;s bank account.</p>\r\n<p>\r\n <strong>29</strong>. If defects are found in an item purchased at auction, the Client undertakes to inform the Organiser of such defects without delay. The Client is entitled to return the purchased item to the Organiser within 14 (fourteen) calendar days. The returned item has to be in prime condition, in its original package and unused. The Organiser returns the funds paid for the item to the Client after the returned item has been checked, but no later than within 15 (fifteen) business days. Costs for placing a bid at the auction or costs for returning the item will not be reimbursed.</p>\r\n', 'terms-and-conditions', 'Terms and Conditions', 'Terms and Conditions', 'Terms and Conditions', 'Yes', '2016-06-02 13:05:49', '2016-06-22 15:22:15', 'No'),
(7, 'Reverse Auction', '<h1>\r\n Reverse Auction</h1>\r\n<h2>\r\n Are you a buyer?</h2>\r\n<p>\r\n <span xss="removed"><strong><span xss="removed"><span xss="removed">Register for free, choose your package and start running your own e-auction. If the packages don`t suit your business, contact us and we will customize a package for you!</span></span></strong></span></p>\r\n<h2>\r\n Are you a supplier?</h2>\r\n<p>\r\n <span xss="removed"><span xss="removed"><strong>Register now and start selling your products. It&#39;s <span xss="removed">FREE!</span></strong></span></span></p>\r\n', 'reverse-auction', 'Reverse Auction', 'Reverse Auction', 'Reverse Auction', 'Yes', '2016-06-02 13:06:44', '2016-12-23 17:02:39', 'No'),
(9, 'Suppliers', '<p>\r\n Vestibulum at dolor semper, posuere libero viverra, blandit nunc. Donec varius dolor nunc, eget rhoncus felis rutrum sed. Duis tristique dolor lectus, et bibendum tellus blandit non. Cras eget purus tortor. Fusce ultricies arcu in orci scelerisque dignissim. Quisque vitae cursus dui. Nulla maximus lectus ut sodales facilisis. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed mauris orci, porttitor et interdum et, lobortis sit amet orci. Curabitur nunc massa, semper eu convallis eu, scelerisque sed velit. Curabitur finibus elit enim, id suscipit odio congue non. Donec risus erat, auctor ac risus id, tempus dignissim justo. Donec sagittis, felis ac vulputate rhoncus, lacus nisi placerat mauris, a rhoncus urna sem eget elit.</p>\r\n', 'suppliers', 'Suppliers', 'Suppliers', 'Suppliers', 'Yes', '2016-06-06 11:05:35', '0000-00-00 00:00:00', 'No'),
(10, 'Why Reverse Auction', '<p>\r\n Vestibulum at dolor semper, posuere libero viverra, blandit nunc. Donec varius dolor nunc, eget rhoncus felis rutrum sed. Duis tristique dolor lectus, et bibendum tellus blandit non. Cras eget purus tortor. Fusce ultricies arcu in orci scelerisque dignissim. Quisque vitae cursus dui. Nulla maximus lectus ut sodales facilisis. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed mauris orci, porttitor et interdum et, lobortis sit amet orci. Curabitur nunc massa, semper eu convallis eu, scelerisque sed velit. Curabitur finibus elit enim, id suscipit odio congue non. Donec risus erat, auctor ac risus id, tempus dignissim justo. Donec sagittis, felis ac vulputate rhoncus, lacus nisi placerat mauris, a rhoncus urna sem eget elit.</p>\r\n<p>\r\n Quisque eu justo vel libero pulvinar finibus quis eget justo. Aenean quis enim tincidunt, efficitur mauris dictum, interdum erat. Vivamus nisl diam, pretium vel sapien sit amet, viverra luctus nibh. Curabitur erat nisi, ullamcorper at eleifend sit amet, sollicitudin nec nisl. Aliquam et justo ut ipsum bibendum aliquet id posuere felis. Etiam facilisis ex sed ex ornare, at ultrices lacus varius. Sed luctus pulvinar dolor, quis feugiat nisl rutrum vitae. Integer finibus est a ullamcorper egestas. Mauris efficitur turpis id suscipit malesuada.</p>\r\n', 'why-reverse-auction', 'Why Reverse Auction', 'Why Reverse Auction', 'Why Reverse Auction', 'Yes', '2016-06-06 11:26:24', '2016-06-06 12:14:06', 'No'),
(11, 'Member Activation Successful', '<p>\n Congratulations! You have successfully registered!<br>\n <br>\n To log in use email address and password you used when you registered.<br>\n <br>\n Your log in details have also emailed to you.</p>\n', 'member-activation-successful', '', '', '', 'Yes', '2016-06-14 09:25:44', '0000-00-00 00:00:00', 'No'),
(12, 'Member Activation Failed', '<p>\r\n Yor activation to our site failed</p>\r\n', 'member-activation-failed', '', '', '', 'Yes', '2016-06-14 09:26:32', '2016-06-23 15:50:28', 'No'),
(13, 'test', '<p>\r\n test</p>\r\n', 'test', '', '', '', 'Yes', '2016-07-07 12:00:52', '0000-00-00 00:00:00', 'Yes'),
(14, 'suplier success registration message', '<p>\r\n  Please check your email for your account verification</p>\r\n', 'suplier-success-registration-message', 'success registration', 'success registration', 'success registration', 'Yes', '2016-08-05 11:56:09', '0000-00-00 00:00:00', 'Yes'),
(15, 'buyer success registration message', '<p>\r\n  Please check your email for your account verification</p>\r\n', 'buyer-success-registration-message', 'success message', 'success message', 'success message', 'Yes', '2016-08-05 11:56:53', '0000-00-00 00:00:00', 'Yes');

-- --------------------------------------------------------

--
-- Table structure for table `emts_cms_others`
--

CREATE TABLE IF NOT EXISTS `emts_cms_others` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` longtext NOT NULL,
  `image` varchar(100) NOT NULL,
  `is_display` enum('0','1') NOT NULL DEFAULT '1' COMMENT '0=No, 1= Yes',
  `cms_type` varchar(100) NOT NULL COMMENT 'how_it_works, why_reverse_auction',
  `post_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `emts_cms_others`
--

INSERT INTO `emts_cms_others` (`id`, `title`, `description`, `image`, `is_display`, `cms_type`, `post_date`) VALUES
(6, 'Sign Up', '<p>\r\n Register for free and choose your package or contact us for customized packages.</p>\r\n', 'sign-up-icon.png', '1', 'how_it_works', '2016-12-23 17:07:34'),
(8, 'Cost Reduction', '<p>\r\n Lorem Ipsum is an simply dummy text of the printing and type enc setting industry. Lorem Ipsum eim has been the an dummy text 1500s, dummy text ever.</p>\r\n', 'cost-reduce-icon.png', '1', 'why_reverse_auction', '2016-06-06 04:48:36'),
(9, 'Set-up auction', '<p>\r\n Describe the product you need, set auction details, invite suppliers or make it public, and get ready.</p>\r\n', 'set-up-auction-icon.png', '1', 'how_it_works', '2016-12-23 17:21:08'),
(10, 'Evaluate Real Time Results', '<p>\r\n <strong>Buyer:</strong> Login during the auction and watch realtime results;</p>\r\n<p>\r\n <strong>Seller:</strong> Login in advance and offer the best price as many times as you want.</p>\r\n', 'real-time-icon.png', '1', 'how_it_works', '2016-12-23 17:24:39'),
(11, 'Choose Most Appropriate Supplier', '<p>\r\n Evaluate the results and choose the most suitable supplier.</p>\r\n', 'choose-supplier-icon.png', '1', 'how_it_works', '2016-12-23 17:33:40'),
(12, 'Competition Leveraging', '<p>\r\n Increase competition</p>\r\n', 'compition-icon.png', '1', 'why_reverse_auction', '2016-09-26 12:45:07'),
(13, 'Transparency in Bids', '<p>\r\n Lorem Ipsum is an simply dummy text of the printing and type enc setting industry. Lorem Ipsum eim has been the an dummy text 1500s, dummy text ever.</p>\r\n', 'bids1-icon.png', '1', 'why_reverse_auction', '2016-06-06 04:49:15'),
(14, 'Negotiation Time Reduction', '<p>\r\n Lorem Ipsum is an simply dummy text of the printing and type enc setting industry. Lorem Ipsum eim has been the an dummy text 1500s, dummy text ever.</p>\r\n', 'navigate-icon.png', '1', 'why_reverse_auction', '2016-06-06 04:49:23'),
(15, 'test', '<p>\r\n this is a test post </p>\r\n', 'logomain_bk.png', '1', 'how_it_works', '2016-07-07 06:21:22');

-- --------------------------------------------------------

--
-- Table structure for table `emts_communication`
--

CREATE TABLE IF NOT EXISTS `emts_communication` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `bid_id` int(11) NOT NULL,
  `message` varchar(500) DEFAULT NULL,
  `messagedate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ismsgseen` enum('0','1') DEFAULT '0' COMMENT '0=No, 1=Yes'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `emts_communication_attachment`
--

CREATE TABLE IF NOT EXISTS `emts_communication_attachment` (
  `id` bigint(20) NOT NULL,
  `msg_id` bigint(20) NOT NULL,
  `file_name` varchar(255) NOT NULL,
  `file_saved` varchar(50) NOT NULL,
  `file_size` float NOT NULL,
  `file_mimetype` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `emts_communication_earlier`
--

CREATE TABLE IF NOT EXISTS `emts_communication_earlier` (
  `id` bigint(20) NOT NULL,
  `msg_root_id` bigint(20) NOT NULL,
  `sender` int(11) NOT NULL COMMENT 'ser_id of member who send the message',
  `receiver` int(11) NOT NULL COMMENT 'user id of member who received the message',
  `subject` varchar(255) NOT NULL,
  `message` longtext NOT NULL,
  `date` timestamp NULL DEFAULT NULL,
  `inbox_status` enum('1','2','3') NOT NULL DEFAULT '1' COMMENT '1=Unread, 2=Read, 3=Delete',
  `outbox_status` enum('1','2','3') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '1=Read, 2=Unread, 3=Deleted',
  `product_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `emts_country`
--

CREATE TABLE IF NOT EXISTS `emts_country` (
  `id` bigint(20) NOT NULL,
  `country` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB AUTO_INCREMENT=199 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `emts_country`
--

INSERT INTO `emts_country` (`id`, `country`) VALUES
(1, 'United Kingdom'),
(2, 'Australia'),
(3, 'Canada'),
(4, 'Ireland'),
(5, 'New Zealand'),
(6, 'Angola'),
(7, 'Antigua'),
(8, 'Argentina'),
(9, 'Armenia'),
(10, 'Australia'),
(11, 'Austria'),
(12, 'Azerbaijan'),
(13, 'Bahamas'),
(14, 'Bahrain'),
(15, 'Bangladesh'),
(16, 'Barbados'),
(17, 'Belarus'),
(18, 'Belgium'),
(19, 'Belize'),
(20, 'Benin'),
(21, 'Bhutan'),
(22, 'Bolivia'),
(23, 'Bosnia'),
(24, 'Herzegovina'),
(25, 'Botswana'),
(26, 'Brazil'),
(27, 'Brunei'),
(28, 'Bulgaria'),
(29, 'Barbuda'),
(30, 'Burkina Faso'),
(31, 'Burma'),
(32, 'Burundi'),
(33, 'Cambodia'),
(34, 'Cameroon'),
(35, 'Afghanistan'),
(36, 'Cape Verde'),
(37, 'Central African Republic'),
(38, 'Chad'),
(39, 'Chile'),
(40, 'China'),
(41, 'Colombia'),
(42, 'Comoros'),
(43, 'Congo (Brazzaville)'),
(44, 'Congo (Kinshasa)'),
(45, 'Costa Rica'),
(46, 'Cote d''Ivoire'),
(47, 'Croatia'),
(48, 'Cuba'),
(49, 'Cyprus'),
(50, 'Czech Republic'),
(51, 'Denmark'),
(52, 'Djibouti'),
(53, 'Dominica'),
(54, 'Dominican Republic'),
(55, 'Ecuador'),
(56, 'Egypt'),
(57, 'El Salvador'),
(58, 'Equatorial Guinea'),
(59, 'Eritrea'),
(60, 'Estonia'),
(61, 'Ethiopia'),
(62, 'Fiji'),
(63, 'Finland'),
(64, 'France'),
(65, 'Gabon'),
(66, 'Gambia'),
(67, 'Georgia'),
(68, 'Germany'),
(69, 'Ghana'),
(70, 'Greece'),
(71, 'Grenada'),
(72, 'Guatemala'),
(73, 'Guinea'),
(74, 'Guinea-Bissau'),
(75, 'Guyana'),
(76, 'Haiti'),
(77, 'Holy See'),
(78, 'Honduras'),
(79, 'Hungary'),
(80, 'Iceland'),
(81, 'India'),
(82, 'Indonesia'),
(83, 'Iran'),
(84, 'Iraq'),
(86, 'Israel'),
(87, 'Italy'),
(88, 'Jamaica'),
(89, 'Japan'),
(90, 'Jordan'),
(91, 'Kazakhstan'),
(92, 'Kenya'),
(93, 'Kiribati'),
(94, 'North Korea'),
(95, 'South Korea'),
(96, 'Kuwait'),
(97, 'Kyrgyzstan'),
(98, 'Laos'),
(99, 'Latvia'),
(100, 'Lebanon'),
(101, 'Lesotho'),
(102, 'Liberia'),
(103, 'Libya'),
(104, 'Liechtenstein'),
(105, 'Lithuania'),
(106, 'Luxembourg'),
(107, 'Macedonia'),
(108, 'Madagascar'),
(109, 'Malaqi'),
(110, 'Malaysia'),
(111, 'Maldives'),
(112, 'Mali'),
(113, 'Malta'),
(114, 'Marshall Islands'),
(115, 'Mauritania'),
(116, 'Mauritius'),
(117, 'Mexico'),
(118, 'Micronesia'),
(119, 'Moldova'),
(120, 'Monaco'),
(121, 'Mongolia'),
(122, 'Morocco'),
(123, 'Mozambique'),
(124, 'Namibia'),
(125, 'Nauru'),
(126, 'Nepal'),
(127, 'Netherlands'),
(128, 'Andorra'),
(129, 'Nicaragua'),
(130, 'Niger'),
(131, 'Nigeria'),
(132, 'Norway'),
(133, 'Oman'),
(134, 'Pakistan'),
(135, 'Palau'),
(136, 'Panama'),
(137, 'Papua New Guinea'),
(138, 'Paraguay'),
(139, 'Peru'),
(140, 'Philippines'),
(141, 'Polska'),
(142, 'Portugal'),
(143, 'Qatar'),
(144, 'Romania'),
(145, 'Russia'),
(146, 'Rwanda'),
(147, 'Saint Kitts & Nevis'),
(148, 'Saint Lucia'),
(149, 'Saint Vincent & the Grenadines'),
(150, 'Samoa'),
(151, 'San Marino'),
(152, 'Sao Tome & Principe'),
(153, 'Saudi Arabia'),
(154, 'Senegal'),
(155, 'Seychelles'),
(156, 'Sierra Leone'),
(157, 'Singapore'),
(158, 'Slovakia'),
(159, 'Slovenia'),
(160, 'Solomon Islands'),
(161, 'Somalia'),
(162, 'South Africa'),
(163, 'Spain'),
(164, 'Sri Lanka'),
(165, 'Sudan'),
(166, 'Suriname'),
(167, 'Swaziland'),
(168, 'Sweden'),
(169, 'Switzerland'),
(170, 'Syria'),
(171, 'Tajikistan'),
(172, 'Tanzania'),
(173, 'Thailand'),
(174, 'Togo'),
(175, 'Tonga'),
(176, 'Trinidad & Tobago'),
(177, 'Tunisia'),
(178, 'Turkey'),
(179, 'Turkmenistan'),
(180, 'Tuvalu'),
(181, 'Uganda'),
(182, 'Ukraine'),
(183, 'United Arab Emirates'),
(184, 'United States'),
(185, 'Uruguay'),
(186, 'Uzbekistan'),
(187, 'Vanuatu'),
(188, 'Venezuela'),
(189, 'Vietnam'),
(190, 'Yemen'),
(191, 'Yugoslavia'),
(192, 'Zambia'),
(193, 'Zimbabwe'),
(194, 'Taiwan'),
(195, 'N. Ireland'),
(196, 'Republic of Ireland'),
(197, 'Albania'),
(198, 'Algeria');

-- --------------------------------------------------------

--
-- Table structure for table `emts_email_settings`
--

CREATE TABLE IF NOT EXISTS `emts_email_settings` (
  `id` int(11) NOT NULL,
  `email_code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `subject` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email_body` longtext COLLATE utf8_unicode_ci NOT NULL,
  `sms_text` text COLLATE utf8_unicode_ci NOT NULL,
  `last_update` datetime NOT NULL,
  `email_type` enum('1','2','3') COLLATE utf8_unicode_ci NOT NULL DEFAULT '1' COMMENT '1=Admin, 2=Buyer, 3=Seller',
  `is_display_notification` enum('0','1') COLLATE utf8_unicode_ci NOT NULL DEFAULT '1' COMMENT '0=disable, 1=enable ; in the user account',
  `is_email_notification_send` enum('0','1') COLLATE utf8_unicode_ci DEFAULT '1' COMMENT '0=No, 1=Yes ',
  `is_sms_notification_send` enum('0','1') COLLATE utf8_unicode_ci NOT NULL DEFAULT '0' COMMENT '0=No,1=Yes',
  `listing_order` int(11) NOT NULL COMMENT 'Display Order in the backend  and front end',
  `enable_rating` enum('0','1') COLLATE utf8_unicode_ci NOT NULL DEFAULT '1' COMMENT '0=disable, 1=enable'
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `emts_email_settings`
--

INSERT INTO `emts_email_settings` (`id`, `email_code`, `subject`, `email_body`, `sms_text`, `last_update`, `email_type`, `is_display_notification`, `is_email_notification_send`, `is_sms_notification_send`, `listing_order`, `enable_rating`) VALUES
(1, 'register_notification', 'Registration Notification', '<p>\r\n Hello <strong>[USERNAME]</strong>,</p>\r\n<p>\r\n Your account was successfully created.</p>\r\n<p>\r\n Your login information is as follows:</p>\r\n<p>\r\n Email: <strong>[EMAIL]</strong><br>\r\n  </p>\r\n<p>\r\n <br>\r\n <strong>[SITENAME]</strong></p>\r\n', 'Hello [EMAIL],\r\n\r\nYour account was successfully created. You will be noified shortly after verification\r\n\r\nYour login information is as follows:\r\n\r\nEmail: [EMAIL]\r\nPassword: [PASSWORD]\r\n\r\nThe reverseauction.com Support Team\r\n[SITENAME]', '2016-12-23 16:49:49', '1', '0', '1', '0', 0, '1'),
(3, 'email_confirmation', 'Email Confirmation', '<p>\r\n Hey <strong>[USERNAME]</strong></p>\r\n<p>\r\n click and follow the link below  to confirm your new email address</p>\r\n<p>\r\n <span>[CONFIRM]</span></p>\r\n<p>\r\n <strong>The hightreegroup.com Support Team<br>\r\n [SITENAME]</strong></p>\r\n', 'Hey [USERNAME]\r\n\r\nclick and follow the link below  to confirm your new email address\r\n\r\n[CONFIRM]\r\n\r\nThe hightreegroup.com Support Team\r\n[SITENAME]', '2016-06-23 13:14:46', '1', '1', '1', '0', 0, '1'),
(5, 'payment_status_email_buyer', 'Payment Completed', '<p>\r\n Hello <strong>[USERNAME]</strong>,</p>\r\n<p>\r\n Your Payment information is as follows:</p>\r\n<p>\r\n Invoice ID: <strong> [INVOICE_ID]</strong><br>\r\n Payment Method:<strong> [PAYMENT_METHOD]</strong><br>\r\n Paid Amount:<strong> [PAID_AMOUNT]</strong><br>\r\n Payment Date: <strong> [PAYMENT_DATE]</strong><br>\r\n Link For Invoice: <strong>[INVOICE_LINK]</strong></p>\r\n<p>\r\n Sincerely,</p>\r\n<p>\r\n <strong><br>\r\n [SITENAME]</strong></p>\r\n', '', '2016-08-09 15:46:01', '1', '1', '1', '0', 0, '1'),
(7, 'product_sold_notification_admin', 'Product Sold Notification- Admin', '<p>\r\n Hello Admin,</p>\r\n<p>\r\n Payment is made for the product. Product and buyer details are mentioned below.</p>\r\n<p>\r\n <strong>Product Information</strong><br>\r\n Invoice ID: <strong> [INVOICE_ID]</strong><br>\r\n Paid Amount:<strong> [PAID_AMOUNT]</strong><br>\r\n Payment Method:<strong> [PAYMENT_METHOD]</strong><br>\r\n Invoice Link: <strong> [INVOICE_LINK]</strong><br>\r\n Payment Date: <strong> [DATE]</strong></p>\r\n<p>\r\n <strong>Member Information</strong><br>\r\n Member ID: <strong>[USER_ID]</strong><br>\r\n Member Name: <strong>[USERNAME]</strong></p>\r\n<p>\r\n Sincerely,</p>\r\n<p>\r\n <strong><br>\r\n [SITENAME]</strong></p>\r\n', '', '2016-08-09 15:48:06', '1', '1', '1', '0', 0, '1'),
(9, 'product_sold_notification_seller', 'Product Sold Notification -Seller', '<p>\r\n Hello <strong>[SELLER]</strong>,</p>\r\n<p>\r\n Payment is made for the product. Product and buyer details are mentioned below.</p>\r\n<p>\r\n <strong>Product Information</strong><br>\r\n Product ID: <strong>[PRODUCT_ID]</strong><br>\r\n Product Name: <strong>[PRODUCT_NAME]</strong><br>\r\n Payment Method:<strong> [PAYMENT_METHOD]</strong><br>\r\n Paid Amount: <strong> [PAID_AMOUNT]</strong><br>\r\n Payment Date: <strong> [DATE]</strong></p>\r\n<p>\r\n <strong>Member Information</strong><br>\r\n Member ID: <strong>[BUYER_ID]</strong><br>\r\n Member Name: <strong>[BUYER_NAME]</strong></p>\r\n<p>\r\n Sincerely,</p>\r\n<p>\r\n <strong><br>\r\n [SITENAME]</strong></p>\r\n', '', '2016-08-09 15:48:18', '1', '1', '1', '0', 0, '1'),
(11, 'forgot_password_notification', 'Login details', '<p>\r\n Hello <strong>[EMAIL]</strong>,<br>\r\n <br>\r\n Your login information is as follows:<br>\r\n <br>\r\n Email: <strong>[EMAIL]</strong><br>\r\n Password: <strong> [PASSWORD]</strong></p>\r\n<p>\r\n <span>Sincerely,</span></p>\r\n<p>\r\n <strong><br>\r\n [SITENAME]</strong></p>\r\n', '', '2016-08-09 15:48:28', '1', '1', '1', '0', 0, '1'),
(13, 'change_password_user', 'Password Changed', '<p>\r\n Hello <strong>[USERNAME]</strong>,<br>\r\n <br>\r\n तपाईंको लगइन पासवर्ड परिवर्तन गरिएको छ। निम्नानुसार तपाईंको नयाँ लगइन विवरण छ:<br>\r\n <br>\r\n Username: <strong>[USERNAME]</strong><br>\r\n Password: <strong> [PASSWORD]</strong></p>\r\n<p>\r\n <strong><br>\r\n [SITENAME]</strong></p>\r\n', '', '2016-08-09 15:48:36', '1', '1', '1', '0', 0, '1'),
(15, 'shipping_status_email_winnner', 'The product has been shipped !!!', '<p>\r\n Hi [USERNAME],</p>\r\n<p>\r\n The below product has been shipped to your shipping address provided during purchase.</p>\r\n<p>\r\n Invoice No: [INVOICE_ID]</p>\r\n<p>\r\n Product Name: [PRODUCT_NAME]</p>\r\n<p>\r\n  </p>\r\n<p>\r\n <strong>[SITENAME]</strong></p>\r\n', '', '2016-08-09 15:49:18', '1', '1', '1', '0', 0, '1'),
(17, 'product_delivered_email_winnner', 'Product Delivered', '<p>\r\n Hi [USERNAME],</p>\r\n<p>\r\n The below product has been Delivered to your shipping address.</p>\r\n<p>\r\n Invoice No: [INVOICE_ID]</p>\r\n<p>\r\n Product Name: [PRODUCT_NAME]</p>\r\n<p>\r\n Shipped Date: [DATE]</p>\r\n<p>\r\n Sincerely,</p>\r\n<p>\r\n  </p>\r\n<p>\r\n <strong>[SITENAME]</strong></p>\r\n', '', '2016-08-09 15:49:27', '1', '1', '1', '0', 0, '1'),
(19, 'no_shipping_status_email_winnner', 'Product Delivery status changed.', '<p>\r\n Hi [USERNAME],</p>\r\n<p>\r\n Shipping of below product has been cancelled</p>\r\n<p>\r\n Invoice No: [INVOICE_ID]</p>\r\n<p>\r\n Product Name: [PRODUCT_NAME]</p>\r\n<p>\r\n  </p>\r\n<p>\r\n <strong>[SITENAME] </strong></p>\r\n', '', '2016-08-09 15:49:37', '1', '1', '1', '0', 0, '1'),
(21, 'product_won_notification_user', 'Product Won Notification', '<p>\r\n Hello <strong>[EMAIL]</strong>,</p>\r\n<p>\r\n You have been awarded the below product with invoie id <strong>[INVOICE]</strong></p>\r\n<p>\r\n Product Name: <strong>[PRODUCTNAME]</strong><br>\r\n Won Amount:<strong> [AMOUNT]</strong><br>\r\n Closed Date: <strong> [DATE]</strong></p>\r\n<p>\r\n Sincerely,</p>\r\n<p>\r\n <strong><br>\r\n [SITENAME]</strong></p>\r\n', '', '2016-08-09 15:50:09', '1', '1', '1', '0', 0, '1'),
(23, 'auction_closed_notification_seller', 'Product Sold Notification', '<p>\r\n Hello <strong>[SELLER_NAME]</strong>,</p>\r\n<p>\r\n One of your product in Auction has been Closed. Product and buyer details are mentioned below.</p>\r\n<p>\r\n <strong>Product Information</strong><br>\r\n Product Category:<strong> [PRODUCT_CATEGORY]  >> [PRODUCT_SUBCATEGORY]</strong><br>\r\n Product Name: <strong>[PRODUCT_NAME]</strong><br>\r\n Product Code: <strong>[AUCTION_ID]</strong></p>\r\n<p>\r\n Won Amount: <strong>[AMOUNT]</strong><br>\r\n Closed Date: <strong> [DATE]</strong></p>\r\n<p>\r\n <strong>Winner Information</strong><br>\r\n Member ID: <strong>[USER_ID]</strong><br>\r\n Member Name: <strong>[USERNAME]</strong></p>\r\n<p>\r\n Sincerely,</p>\r\n<p>\r\n <strong><br>\r\n [SITENAME]</strong></p>\r\n', '', '2016-08-09 15:50:17', '1', '1', '1', '0', 0, '1'),
(25, 'auction_closed_notification_admin', 'Auction Closed Notification', '<p>\r\n Hello <strong>Admin</strong>,</p>\r\n<p>\r\n One of the product in Auction has been Closed. Product, Seller and buyer details are mentioned below.</p>\r\n<p>\r\n <strong>Product Information</strong><br>\r\n Product Category:<strong> [PRODUCT_CATEGORY]  >> [PRODUCT_SUBCATEGORY]</strong><br>\r\n Product Name: <strong>[PRODUCT_NAME]</strong><br>\r\n Product Code: <strong>[AUCTION_ID]</strong></p>\r\n<p>\r\n Won Amount: <strong>[AMOUNT]</strong></p>\r\n<p>\r\n Closed Date: <strong> [DATE]</strong></p>\r\n<p>\r\n <strong>Seller Information</strong><br>\r\n Seller ID: <strong>[SELLER_ID]</strong><br>\r\n Seller Name: <strong>[SELLER_NAME]</strong></p>\r\n<p>\r\n <strong>Winner Information</strong><br>\r\n Member ID: <strong>[USER_ID]</strong><br>\r\n Member Name: <strong>[USERNAME]</strong></p>\r\n<p>\r\n Sincerely,</p>\r\n<p>\r\n <strong><br>\r\n [SITENAME]</strong></p>\r\n', '', '2016-08-09 15:50:25', '1', '1', '1', '0', 0, '1'),
(27, 'communication-from-seller', 'Email from seller', '<p>\r\n Hello <strong>Admin</strong>,</p>\r\n<p>\r\n Email from the seller  <strong>[SELLER_NAME]-[SELLER_ID]</strong></p>\r\n<p>\r\n Subject :<strong> [SUBJECT]</strong></p>\r\n<p>\r\n Message: <strong>[MESSAGE]</strong></p>\r\n<p>\r\n  </p>\r\n<p>\r\n Sincerely,</p>\r\n<p>\r\n <strong><br>\r\n [SITENAME]</strong></p>\r\n', '', '2016-08-09 15:50:32', '1', '1', '1', '0', 0, '1'),
(29, 'communication-from-admin', 'Email from admin', '<p>\r\n Hello<strong> [SELLER_NAME]-[SELLER_ID],</strong></p>\r\n<p>\r\n Email from the admin </p>\r\n<p>\r\n Subject :<strong> [SUBJECT]</strong></p>\r\n<p>\r\n Message: <strong>[MESSAGE]</strong></p>\r\n<p>\r\n Sincerely,</p>\r\n<p>\r\n <strong><br>\r\n [SITENAME]</strong></p>\r\n', '', '2016-08-09 15:50:39', '1', '1', '1', '0', 0, '1'),
(31, 'listing_fee_payment_notification_admin', 'Payment made for Product Listing', '<p>\r\n Hello Admin,</p>\r\n<p>\r\n Payment is made for the Listing product. Product and Seller details are mentioned below.</p>\r\n<p>\r\n <strong>Product Information</strong><br>\r\n Invoice ID: <strong> [INVOICE_ID]</strong><br>\r\n Paid Amount:<strong> [PAID_AMOUNT]</strong><br>\r\n Payment Method:<strong> [PAYMENT_METHOD]</strong><br>\r\n Product Id: <strong> [PRODUCT_ID]</strong><br>\r\n Product Name: <strong> [PRODUCT_NAME]</strong><br>\r\n Payment Date: <strong> [DATE]</strong></p>\r\n<p>\r\n <strong>Seller Information</strong><br>\r\n Seller (Member) ID: <strong>[USER_ID]</strong><br>\r\n Seller (Member) Name: <strong>[USERNAME]</strong></p>\r\n<p>\r\n Sincerely,</p>\r\n<p>\r\n <strong><br>\r\n [SITENAME]</strong></p>\r\n', '', '2016-08-09 15:50:46', '1', '1', '1', '0', 0, '1'),
(33, 'listing_fee_payment_notification_seller', 'successfully Paid for Product Listing', '<p>\r\n Hello <strong>[SELLER]</strong>,</p>\r\n<p>\r\n You have successfully made Payment for Listing product.</p>\r\n<p>\r\n <strong>Product Information</strong><br>\r\n Invoice ID: <strong> [INVOICE_ID]</strong><br>\r\n Paid Amount:<strong> [PAID_AMOUNT]</strong><br>\r\n Payment Method:<strong> [PAYMENT_METHOD]</strong><br>\r\n Product Id: <strong> [PRODUCT_ID]</strong><br>\r\n Product Name: <strong> [PRODUCT_NAME]</strong><br>\r\n Payment Date: <strong> [DATE]</strong></p>\r\n<p>\r\n Sincerely,</p>\r\n<p>\r\n <strong><br>\r\n [SITENAME]</strong></p>\r\n', '', '2016-08-09 15:50:53', '1', '1', '1', '0', 0, '1'),
(35, 'paid_for_auction_notification_winner', 'Payment for Won Auction Completed', '<p>\r\n Hello <strong>[USERNAME]</strong>,</p>\r\n<p>\r\n You have successfully paid for the auction you have won. Payment information is as follows:</p>\r\n<p>\r\n Invoice ID: <strong> [INVOICE_ID]</strong><br>\r\n Product Id: <strong> [PRODUCT_ID]</strong><br>\r\n Product Name: <strong> [PRODUCT_NAME]</strong><br>\r\n Paid Amount:<strong> [PAID_AMOUNT]</strong><br>\r\n Payment Method:<strong> [PAYMENT_METHOD]</strong><br>\r\n Payment Date: <strong> [PAYMENT_DATE]</strong></p>\r\n<p>\r\n Sincerely,</p>\r\n<p>\r\n <strong><br>\r\n [SITENAME]</strong></p>\r\n', '', '2016-08-09 15:51:00', '1', '1', '1', '0', 0, '1'),
(37, 'paid_for_auction_notification_admin', 'Pay for Won Auction Notification - Admin', '<p>\r\n Hello Admin,</p>\r\n<p>\r\n Payment is made for won auction. Product and winner details are mentioned below.</p>\r\n<p>\r\n <strong>Product Information</strong><br>\r\n Invoice ID: <strong> [INVOICE_ID]</strong><br>\r\n Product ID: <strong> [PRODUCT_ID]</strong><br>\r\n Product Name: <strong> [PRODUCT_NAME]</strong><br>\r\n Paid Amount:<strong> [PAID_AMOUNT]</strong><br>\r\n Payment Method:<strong> [PAYMENT_METHOD]</strong><br>\r\n Payment Date: <strong> [DATE]</strong></p>\r\n<p>\r\n <strong>Winner Information</strong><br>\r\n Member ID: <strong>[USER_ID]</strong><br>\r\n Member Name: <strong>[USERNAME]</strong></p>\r\n<p>\r\n Sincerely,</p>\r\n<p>\r\n <strong><br>\r\n [SITENAME]</strong></p>\r\n', '', '2016-08-09 15:51:15', '1', '1', '1', '0', 0, '1'),
(38, 'paid_for_auction_notification_admin', 'Pay for Won Auction Notification - Admin', '<p>\r\n Hello Admin,</p>\r\n<p>\r\n Payment is made for won auction. Product and winner details are mentioned below.</p>\r\n<p>\r\n <strong>Product Information</strong><br>\r\n Invoice ID: <strong> [INVOICE_ID]</strong><br>\r\n Product ID: <strong> [PRODUCT_ID]</strong><br>\r\n Product Name: <strong> [PRODUCT_NAME]</strong><br>\r\n Paid Amount:<strong> [PAID_AMOUNT]</strong><br>\r\n Payment Method:<strong> [PAYMENT_METHOD]</strong><br>\r\n Payment Date: <strong> [DATE]</strong></p>\r\n<p>\r\n <strong>Winner Information</strong><br>\r\n Member ID: <strong>[USER_ID]</strong><br>\r\n Member Name: <strong>[USERNAME]</strong></p>\r\n<p>\r\n Sincerely,</p>\r\n<p>\r\n <strong><br>\r\n [SITENAME]</strong></p>\r\n', '', '2016-08-09 15:51:15', '1', '1', '1', '0', 0, '1'),
(39, 'paid_for_auction_notification_seller', 'Pay for Won Auction Notification - Seller', '<p>\r\n Hello <strong>[SELLER]</strong>,</p>\r\n<p>\r\n Payment is made by winner for one of your product in auction. Product and winner details are mentioned below.</p>\r\n<p>\r\n <strong>Product Information</strong><br>\r\n Product ID: <strong>[PRODUCT_ID]</strong><br>\r\n Product Name: <strong>[PRODUCT_NAME]</strong><br>\r\n Payment Method:<strong> [PAYMENT_METHOD]</strong><br>\r\n Paid Amount: <strong> [PAID_AMOUNT]</strong><br>\r\n Payment Date: <strong> [DATE]</strong></p>\r\n<p>\r\n <strong>Winner Information</strong><br>\r\n Member ID: <strong>[BUYER_ID]</strong><br>\r\n Member Name: <strong>[<strong>BUYER</strong>_NAME]</strong></p>\r\n<p>\r\n Sincerely,</p>\r\n<p>\r\n <strong><br>\r\n [SITENAME]</strong></p>\r\n', '', '2016-08-09 15:52:02', '1', '1', '1', '0', 0, '1'),
(40, 'paid_for_auction_notification_seller', 'Pay for Won Auction Notification - Seller', '<p>\r\n Hello <strong>[SELLER]</strong>,</p>\r\n<p>\r\n Payment is made by winner for one of your product in auction. Product and winner details are mentioned below.</p>\r\n<p>\r\n <strong>Product Information</strong><br>\r\n Product ID: <strong>[PRODUCT_ID]</strong><br>\r\n Product Name: <strong>[PRODUCT_NAME]</strong><br>\r\n Payment Method:<strong> [PAYMENT_METHOD]</strong><br>\r\n Paid Amount: <strong> [PAID_AMOUNT]</strong><br>\r\n Payment Date: <strong> [DATE]</strong></p>\r\n<p>\r\n <strong>Winner Information</strong><br>\r\n Member ID: <strong>[BUYER_ID]</strong><br>\r\n Member Name: <strong>[<strong>BUYER</strong>_NAME]</strong></p>\r\n<p>\r\n Sincerely,</p>\r\n<p>\r\n <strong><br>\r\n [SITENAME]</strong></p>\r\n', '', '2016-08-09 15:52:02', '1', '1', '1', '0', 0, '1'),
(41, 'auction_cancel_notification_user', 'Auction Cancel Notification- User', '<p>\r\n Hello <strong>[USERNAME]</strong>,</p>\r\n<p>\r\n Auction cancel notification:</p>\r\n<p>\r\n Auction Name: <strong><strong>[PRODUCT_NAME]</strong></strong><br>\r\n Return Credits:<strong> [AMOUNT]</strong><br>\r\n Closed Date: <strong> [DATE]</strong></p>\r\n<p>\r\n Sincerely,</p>\r\n<p>\r\n <strong><br>\r\n [SITENAME]</strong></p>\r\n', '', '2016-08-09 15:52:08', '1', '1', '1', '0', 0, '1'),
(42, 'auction_update_notification_user', 'Auction Status Changed Notification- User', '<p>\r\n Hello <strong>[USERNAME]</strong>,</p>\r\n<p>\r\n Your Auction has been  <strong>[</strong><strong>status</strong><strong>] </strong>.</p>\r\n<p>\r\n Auction Name: <strong><strong>[PRODUCT_NAME]</strong></strong><br>\r\n Return Credits:<strong> [AMOUNT]</strong><br>\r\n <strong>[</strong><strong>status</strong><strong>]</strong> Date: <strong> [DATE]</strong></p>\r\n<p>\r\n Sincerely,</p>\r\n<p>\r\n <strong><br>\r\n [SITENAME]</strong></p>\r\n<p>\r\n  </p>\r\n<p>\r\n  </p>\r\n<p>\r\n [status]</p>\r\n', '', '2016-08-09 15:52:16', '1', '1', '1', '0', 0, '1'),
(43, 'auction_cancel_notification_admin', 'Auction Cancel Notification-Admin', '<p>\n Hello <strong>Admin,</strong></p>\n<p>\n One of the auction has been cancelled</p>\n<p>\n Details:</p>\n<p>\n Product Name: <strong> [PRODUCT_NAME]</strong></p>\n<p>\n Won Amount:<strong> [AMOUNT]</strong><br />\n Closed Date: <strong> [DATE]</strong></p>\n<p>\n Sincerely,</p>\n<p>\n <strong>The bidcy.com Support Team<br />\n [SITENAME]</strong></p>\n', '', '2014-08-12 14:50:42', '1', '1', '1', '0', 0, '1'),
(47, 'auction_cancel_notification_seller', 'Auction Cancel Notification-Seller', '<p>\r\n Hello <strong>[USERNAME]</strong>,</p>\r\n<p>\r\n One of your auction has been cancelled.</p>\r\n<p>\r\n Product Details</p>\r\n<p>\r\n Product Name: <strong> [PRODUCT_NAME]</strong><br>\r\n Won Amount:<strong> [AMOUNT]</strong><br>\r\n Closed Date: <strong> [DATE]</strong></p>\r\n<p>\r\n Sincerely,</p>\r\n<p>\r\n <strong><br>\r\n [SITENAME]</strong></p>\r\n', '', '2016-08-09 15:52:22', '1', '1', '1', '0', 0, '1'),
(49, 'verification-notification', 'Verification Notification', '<p>\r\n Hello <strong>[EMAIL]</strong>,</p>\r\n<p>\r\n You are now verified to bid on products</p>\r\n<p>\r\n The reverseauction.com Support Team<br>\r\n <strong>[SITENAME]</strong></p>\r\n', 'Hello Admin\r\n\r\nUser [EMAIL] just registered in your app. Check his/her verification documents\r\n\r\nThe reverse.com Support Team\r\n[SITENAME]', '2016-06-23 10:37:18', '1', '0', '1', '0', 0, '1'),
(50, 'product-post-notification', 'Product Post Notification', '<p>\r\n Hello <strong>[USERNAME]</strong>,</p>\r\n<p>\r\n Admin Just posted new Product <strong>[PRODUCTNAME]</strong>.</p>\r\n<p>\r\n <br>\r\n <strong>[SITENAME]</strong></p>\r\n', '', '2016-08-09 15:52:34', '1', '1', '1', '0', 0, '1'),
(51, 'verification-notification-admin', 'Verification Notification', '<p>\r\n Hello <strong>Admin</strong></p>\r\n<p>\r\n User <strong>[EMAIL] </strong> just registered in your app. Check his/her verification documents</p>\r\n<p>\r\n The reverse.com Support Team<br>\r\n <strong>[SITENAME]</strong></p>\r\n', 'Hello Admin\r\n\r\nUser [EMAIL] just registered in your app. Check his/her verification documents\r\n\r\nThe reverse.com Support Team\r\n[SITENAME]', '2016-06-23 10:40:49', '1', '0', '1', '0', 0, '1'),
(52, 'email_header', 'Email Header', '', '', '0000-00-00 00:00:00', '1', '1', '1', '0', 0, '1'),
(53, 'email_footer', 'Email Footer', '', '', '2016-06-23 12:00:00', '1', '1', '1', '0', 0, '1'),
(54, 'contact', 'Contact us', '<p>\r\n <strong>[message]</strong></p>\r\n<p>\r\n  </p>\r\n<p>\r\n Regards,</p>\r\n<p>\r\n <strong>[name]</strong>,</p>\r\n<p>\r\n <strong>[contact]</strong>,</p>\r\n<p>\r\n <strong>[email]</strong></p>\r\n', '', '2016-07-29 14:16:12', '1', '1', '1', '0', 0, '1'),
(55, 'send_password_reset_link', 'Password Reset link', '<p>\r\n Hello,<br>\r\n <br>\r\n <span xss="removed">You can use the following </span><span class="il" xss="removed">link</span><span xss="removed"> within the next day to </span><span class="il" xss="removed">reset</span><span xss="removed"> your </span><span class="il" xss="removed">password</span><span xss="removed">: [reset_link]</span><br>\r\n <br>\r\n  </p>\r\n<p>\r\n <strong><br>\r\n [SITENAME]</strong></p>\r\n', '', '2016-08-09 15:52:52', '1', '1', '1', '0', 0, '1'),
(56, 'auction_created', 'New Product for category', '<div id="cke_pastebin">\r\n <p>\r\n   </p>\r\n</div>\r\n<div id="cke_pastebin">\r\n  Hello <b>,</b></div>\r\n<div>\r\n  </div>\r\n<div>\r\n This product has been added please view the detail</div>\r\n<div id="cke_pastebin">\r\n <p>\r\n  <strong>[message]</strong></p>\r\n</div>\r\n<div id="cke_pastebin">\r\n  Auction Name: <strong><strong>[product_name]</strong></strong></div>\r\n<div>\r\n <strong>url:[product_url]</strong></div>\r\n<div>\r\n Description:<strong>[description]</strong></div>\r\n<div id="cke_pastebin">\r\n  Return Credits:<strong> [budget]</strong></div>\r\n<div id="cke_pastebin">\r\n  Start Time: <strong> [auc_start_time]</strong></div>\r\n<div>\r\n  End days: <strong> [auc_end_days]</strong>\r\n <p>\r\n   </p>\r\n</div>\r\n<div id="cke_pastebin">\r\n <p>\r\n   Sincerely,</p>\r\n</div>\r\n<div id="cke_pastebin">\r\n <p>\r\n   </p>\r\n</div>\r\n<div id="cke_pastebin">\r\n <strong> [SITENAME]</strong>\r\n <p>\r\n   </p>\r\n</div>\r\n', '1234', '2016-08-09 15:53:02', '1', '1', '1', '0', 0, '1'),
(57, 'remaining_membership', 'Your remaining Membership Package Information', '<p>\r\n Dear <strong>[user],</strong></p>\r\n<p>\r\n Your membership information is given below:</p>\r\n<p>\r\n Free post : <strong>[FreePost]</strong></p>\r\n<p>\r\n Memebership Type: <strong>[MembershipType]</strong></p>\r\n<p>\r\n Validity : <strong>[vaildity]</strong></p>\r\n<p>\r\n  </p>\r\n<p>\r\n <strong>[SITENAME]</strong></p>\r\n', 'asdadad', '2016-09-22 13:18:11', '1', '1', '1', '0', 0, '1'),
(58, 'auction_closed_buyer', 'Auction Closed Notification-buyer', '<p>\r\n Hello <strong>[USERNAME]</strong>,</p>\r\n<p>\r\n The product you added has been closed. The details is given below:</p>\r\n<p>\r\n Product name : <strong>[product_name]</strong>,</p>\r\n<p>\r\n Budget : <strong>[CURRENCY]  [budget]</strong>,</p>\r\n<p>\r\n Auction Start Date: <strong>[auc_start_time],</strong></p>\r\n<p>\r\n Auction Closed Date: <strong>[auc_end_time],</strong></p>\r\n<p>\r\n Number of bidders: <strong>[no_bidder]</strong></p>\r\n<p>\r\n <strong>[SITENAME]</strong></p>\r\n', 'asdasd', '2016-08-25 10:05:48', '1', '1', '1', '0', 0, '1'),
(59, 'auction_closed_seller', 'Auction Closed Notification-supplier', '<p>\r\n Dear <strong>[USERNAME]</strong>,</p>\r\n<p>\r\n The following Auction has been closed. Winner announcement is still in process. You will be Notified if you are selected as winner.</p>\r\n<p>\r\n Find the detail below.</p>\r\n<p>\r\n  </p>\r\n<p>\r\n Auction Name: <strong>[product_name],</strong></p>\r\n<p>\r\n Auction Close Date : <strong>[auc_end_date]</strong>,</p>\r\n<p>\r\n Your bid amount : <strong>[CURRENCY]  [bid_amount]</strong>,</p>\r\n<p>\r\n  </p>\r\n<p>\r\n Thank you,</p>\r\n<p>\r\n <strong>[SITENAME]</strong></p>\r\n', 'asd', '2016-08-25 10:11:44', '1', '1', '1', '0', 0, '1'),
(60, 'membership_expire_notification', 'Alert: Membership Expiring soon', '<p>\r\n Dear <strong>[USER],</strong></p>\r\n<p>\r\n Your membership is about to expire. You have 30 days to expire for the your membership.</p>\r\n<p>\r\n Membership Type : Unlimited</p>\r\n<p>\r\n You can buy a new package or existing from :</p>\r\n<p>\r\n <strong>[URL]</strong></p>\r\n<p>\r\n Thankyou</p>\r\n<p>\r\n <strong>[SITENAME]</strong></p>\r\n', 'asd', '2016-09-22 13:11:14', '1', '1', '1', '0', 0, '1');

-- --------------------------------------------------------

--
-- Table structure for table `emts_help`
--

CREATE TABLE IF NOT EXISTS `emts_help` (
  `id` int(11) NOT NULL,
  `title` varchar(1024) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `last_update` datetime NOT NULL,
  `is_display` enum('Yes','No') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Yes'
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `emts_help`
--

INSERT INTO `emts_help` (`id`, `title`, `description`, `last_update`, `is_display`) VALUES
(1, 'What is High Tree Group?', '<p>\r\n	Mauris pharetra placerat est, ut interdum nibh. Pellentesque sapien dui, ullamcorper non ultricies nec, convallis in ex. Duis rhoncus maximus iaculis. Sed laoreet nisl sodales risus suscipit, quis maximus neque ultrices. Etiam cursus elit id ultrices vestibulum. Suspendisse molestie eros nisi, et vestibulum lectus convallis non. Cras</p>\r\n', '2016-05-09 16:40:15', 'Yes'),
(2, 'How do Reverse Auction Work', '<div class="panel-collapse collapse in" id="collapse-1" style="">\r\n	<div class="panel-body">\r\n		<p>\r\n			Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>\r\n		<p>\r\n			Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>\r\n	</div>\r\n</div>\r\n', '2016-06-06 11:46:36', 'Yes'),
(3, 'What is Hightree Group', '<div class="panel-collapse collapse in" id="collapse-1" style="">\r\n	<div class="panel-body">\r\n		<p>\r\n			Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>\r\n		<p>\r\n			Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>\r\n	</div>\r\n</div>\r\n', '2016-06-06 11:47:06', 'Yes'),
(4, 'This is test help', '<p>\r\n	Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. Mauris placerat eleifend leo</p>\r\n', '2016-12-23 16:51:50', 'No');

-- --------------------------------------------------------

--
-- Table structure for table `emts_log_admin_activity`
--

CREATE TABLE IF NOT EXISTS `emts_log_admin_activity` (
  `log_id` bigint(20) NOT NULL,
  `log_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `log_user_id` int(11) NOT NULL,
  `log_user_type` varchar(10) NOT NULL,
  `module_name` varchar(255) NOT NULL,
  `module_desc` text NOT NULL,
  `log_action` varchar(255) NOT NULL,
  `log_ip` varchar(255) NOT NULL,
  `log_browser` text,
  `log_platform` text,
  `log_agent` text,
  `log_referrer` text,
  `log_extra_info` text
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `emts_log_invalid_logins`
--

CREATE TABLE IF NOT EXISTS `emts_log_invalid_logins` (
  `log_id` bigint(20) NOT NULL,
  `log_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `log_module` varchar(50) NOT NULL,
  `log_username` varchar(255) DEFAULT NULL,
  `log_password` varchar(255) DEFAULT NULL,
  `log_ip` varchar(255) DEFAULT NULL,
  `log_platform` text,
  `log_browser` text,
  `log_agent` text,
  `log_referrer` text,
  `log_desc` text,
  `log_extra_info` text
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `emts_log_invalid_logins`
--

INSERT INTO `emts_log_invalid_logins` (`log_id`, `log_time`, `log_module`, `log_username`, `log_password`, `log_ip`, `log_platform`, `log_browser`, `log_agent`, `log_referrer`, `log_desc`, `log_extra_info`) VALUES
(1, '2016-10-21 10:45:17', 'Admin Login', 'admin', '8tizIQphXmKdKwENpkSg0f3Rkh1377eRLdKVqdwttgfGcnyEH629eZOCIyWmgqEzyMn4sYeH5tFl8tb1UbAM3w==', '202.79.37.78', 'Windows 10', 'Chrome | 54.0.2840.59', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.59 Safari/537.36', 'http://www.thehightreegroup.com/admin', 'invalid password', '');

-- --------------------------------------------------------

--
-- Table structure for table `emts_members`
--

CREATE TABLE IF NOT EXISTS `emts_members` (
  `id` int(11) NOT NULL,
  `email` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `new_email` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `username` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `salt` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `user_type` enum('1','2','3','4') COLLATE utf8_unicode_ci NOT NULL DEFAULT '3' COMMENT '1=Super Admin, 2=Admin, 3=Buyer, 4=Suplier',
  `balance` double(20,2) NOT NULL,
  `reg_date` timestamp NULL DEFAULT NULL,
  `last_login_date` timestamp NULL DEFAULT NULL,
  `last_modify_date` timestamp NULL DEFAULT NULL,
  `reg_ip` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `last_login_ip` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `is_login` enum('0','1') COLLATE utf8_unicode_ci NOT NULL DEFAULT '0' COMMENT '0=No, 1=Yes',
  `status` enum('1','2','3','4') COLLATE utf8_unicode_ci NOT NULL COMMENT '1=Active or Verified, 2=Inactive or unverified, 3=Suspended, 4=Closed',
  `mem_last_activated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `balance_free` int(11) NOT NULL DEFAULT '0',
  `balance_paid` int(11) NOT NULL DEFAULT '0' COMMENT '0, 1',
  `membership_type` varchar(25) COLLATE utf8_unicode_ci NOT NULL COMMENT 'one_post,one_bid,unlimited',
  `member_validity` datetime NOT NULL,
  `activation_code` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `forgot_password_code` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `forgot_password_code_expire` datetime NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=111 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `emts_members`
--

INSERT INTO `emts_members` (`id`, `email`, `new_email`, `username`, `password`, `salt`, `user_type`, `balance`, `reg_date`, `last_login_date`, `last_modify_date`, `reg_ip`, `last_login_ip`, `is_login`, `status`, `mem_last_activated`, `balance_free`, `balance_paid`, `membership_type`, `member_validity`, `activation_code`, `forgot_password_code`, `forgot_password_code_expire`) VALUES
(1, 'sujit@emultitechsolution.com', '', 'admin', '608b6f1f646f7b694d363a62dda1de2c552c650b', '39c2415b70', '1', 0.00, '2014-04-24 12:30:45', '2016-12-23 23:33:16', '2016-07-07 06:13:30', '::1', '179.104.158.135', '1', '1', '2016-12-23 17:33:16', 1, 0, '', '2016-06-13 17:36:35', '', '', '0000-00-00 00:00:00'),
(30, 'test@gmail.com', '', 'asdasd', '04a80ee084a86b07f5bbaa5bc729522bb47775bc', '348e9da553', '3', 0.00, '2016-07-07 05:05:45', NULL, NULL, '::1', '', '0', '2', '2016-07-07 05:05:45', 0, 0, '', '2016-07-07 10:50:45', '71344118', '', '0000-00-00 00:00:00'),
(35, 'sdf@asd.asd', '', 'sdf09', 'cbb55beb8ee159e0a5350d640aedd695ff6c1fec', '4ecbeb7314', '3', 0.00, '2016-07-08 06:06:06', NULL, NULL, '::1', '', '0', '2', '2016-07-08 06:06:06', 0, 0, '', '2016-07-08 11:51:06', '10079399', '', '0000-00-00 00:00:00'),
(36, 'cmanish049@gmail.coma', '', 'cmanish049@gmail.com''', '151a38935f899b5745a61062b963259e97d229f5', 'c7d3da8a89', '3', 0.00, '2016-07-08 06:06:38', NULL, NULL, '::1', '', '0', '2', '2016-07-08 06:06:38', 0, 0, '', '2016-07-08 11:51:38', '97668173', '', '0000-00-00 00:00:00'),
(37, 'asd@adasd.asd', '', 'a12w32_123', '2c890915e7e183477a8b5bb133ea2dfc1df25c7d', 'fcb27f1252', '3', 0.00, '2016-07-08 07:43:20', NULL, NULL, '::1', '', '0', '2', '2016-07-08 07:43:20', 0, 0, '', '2016-07-08 13:28:20', '82511548', '', '0000-00-00 00:00:00'),
(38, 'rete@gmail.coms', '', 'testabc', '53eb4c0aad9eed8d8c11e82433c8e595f699c512', '99908d0355', '3', 0.00, '2016-07-11 10:18:20', NULL, NULL, '::1', '', '0', '2', '2016-07-11 10:18:20', 0, 0, '', '2016-07-11 16:03:20', '86685919', '', '0000-00-00 00:00:00'),
(43, 'cmanish049@gmail.coms', '', 'adminas', 'a89b3f390045179be3fc67c299e87e92c26fb52e', '11ee7f3a26', '3', 0.00, '2016-07-29 20:27:01', NULL, NULL, '202.166.198.151', '', '0', '2', '2016-07-29 08:42:01', 0, 0, '', '0000-00-00 00:00:00', '52167727', '', '0000-00-00 00:00:00'),
(44, 'cmanish049@gmail.comss', '', 'admins', '156a59e54e4ad70c40184fb88a027c50d5f1faad', '95553f5e6a', '3', 0.00, '2016-07-29 20:28:16', NULL, NULL, '202.166.198.151', '', '0', '2', '2016-07-29 08:43:16', 0, 0, '', '0000-00-00 00:00:00', '10578640', '', '0000-00-00 00:00:00'),
(45, 'cmanish049@gmail.comass', '', 'adminsss', '51ca0fb7c89dffdd189e1f72d435f347b0e98266', '76e0ac1e0d', '3', 0.00, '2016-07-29 20:34:05', NULL, NULL, '202.166.198.151', '', '0', '2', '2016-07-29 08:49:05', 0, 0, '', '0000-00-00 00:00:00', '72430114', '', '0000-00-00 00:00:00'),
(46, 'saagarchapagain@gmail.comcar', '', 'sagaradmin', '192a0772d462c2b4a8f5213d2db49ce4ed7c277b', '9895500d33', '3', 0.00, '2016-07-29 20:35:30', NULL, NULL, '202.166.198.151', '', '0', '2', '2016-07-29 08:53:09', 0, 0, '', '0000-00-00 00:00:00', '26133784', '', '0000-00-00 00:00:00'),
(47, 'saagarchapagain@sgmail.com', '', '1234admin', 'c20da8dc1e397653b154a9149ce430a4190462fd', '8dfc01c136', '3', 0.00, '2016-07-29 20:38:32', NULL, NULL, '202.166.198.151', '', '0', '2', '2016-07-29 09:09:58', 0, 0, '', '0000-00-00 00:00:00', '34957140', '', '0000-00-00 00:00:00'),
(48, 'saagarchapagain@gmail.coms', '', '12345admins', '6274627c69d67501df70c764e88fb51af1cb3c4d', '4f7b6ec650', '3', 0.00, '2016-07-29 20:55:29', NULL, NULL, '202.166.198.151', '', '0', '2', '2016-07-29 09:12:54', 0, 0, '', '0000-00-00 00:00:00', '30473344', '', '0000-00-00 00:00:00'),
(49, 'saagarchapagain@gmail.c', '', '222221', '811bc4d6d919052fafc762519b73221392fbf681', 'f0c0dec64a', '3', 0.00, '2016-07-29 20:58:18', NULL, NULL, '202.166.198.151', '', '0', '2', '2016-08-19 08:41:43', 0, 0, '', '0000-00-00 00:00:00', '68971195', '', '0000-00-00 00:00:00'),
(53, 'gjasdh@gmail.com', '', 'sladhfgasjdfasdf', 'aedcc728c17fb52cfe22fcfcecc82dec834439a6', 'd792b5a798', '3', 0.00, '2016-08-05 17:58:34', NULL, NULL, '202.166.198.151', '', '0', '2', '2016-08-05 06:13:34', 0, 0, '', '0000-00-00 00:00:00', '51260768', '', '0000-00-00 00:00:00'),
(56, 'renato.abreu@gmail.com', '', 'renato', 'a88f00fbbb970bbf6c60f9e72d7e3cb4bbefe0f7', 'af2bb932d4', '3', 0.00, '2016-08-09 19:11:18', '2016-12-23 23:08:56', NULL, '105.172.28.16', '179.104.158.135', '0', '1', '2016-12-23 17:17:29', 2500, 0, '', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00'),
(57, 'guilherme.moure@gmail.com', '', 'guilherme', '4e9433fc5210e7d9aec2316781131571320df22d', '7f6898b652', '4', 0.00, '2016-08-09 19:19:35', '2016-12-23 23:32:51', NULL, '105.172.28.16', '179.104.158.135', '0', '1', '2016-12-23 17:32:56', 998, 0, '', '0000-00-00 00:00:00', '', '', '0000-00-00 00:00:00'),
(58, 'bohyvic@hotmail.com', '', 'rootedtext', 'caa4cdfebcef0a9e92666b0db9337801f16a5c78', 'eef6370887', '3', 0.00, '2016-08-10 17:56:58', NULL, NULL, '202.166.198.151', '', '0', '2', '2016-08-10 06:11:58', 0, 0, '', '0000-00-00 00:00:00', '63170291', '', '0000-00-00 00:00:00'),
(59, 'feziloxoz@hotmail.com', '', 'resyqoqo', 'cff517af72f2b8e0d698826f21e345fd6afe8f9d', '5ffb56108c', '3', 0.00, '2016-08-10 17:57:35', NULL, NULL, '202.166.198.151', '', '0', '2', '2016-08-10 06:12:35', 0, 0, '', '0000-00-00 00:00:00', '23559130', '', '0000-00-00 00:00:00'),
(60, 'submergednabin@gmail.com', '', 'thenabin', '049050498f179ca54bd8f555a323b1c8db308f4f', '8f50081e1d', '3', 0.00, '2016-08-10 17:58:22', NULL, NULL, '202.166.198.151', '', '0', '2', '2016-08-10 06:13:22', 0, 0, '', '0000-00-00 00:00:00', '24214629', '', '0000-00-00 00:00:00'),
(65, 'suip.shesta4@gmail.com', '', 'suipshesta', 'fc5130d31d2e4218a40662a893cd7ed91b9912a8', '9cab10fa17', '4', 0.00, '2016-08-15 15:53:10', NULL, NULL, '202.166.198.151', '', '0', '2', '2016-08-16 05:18:17', 0, 0, '', '0000-00-00 00:00:00', '36098832', '', '0000-00-00 00:00:00'),
(66, 'tiger45@gmail.com', '', 'tigerbaba', '6c97f480046b44a5e1c33d8e3747638abdf3f7fa', '8aaaeae1d6', '4', 0.00, '2016-08-15 22:53:21', NULL, NULL, '202.166.198.151', '', '0', '2', '2016-08-15 11:08:21', 0, 0, '', '0000-00-00 00:00:00', '46649639', '', '0000-00-00 00:00:00'),
(68, 'thehightreegroup@gmail.com', '', 'thehightreegroup', '26738a62ddf20e81ea2253b0c1f5a44f4e186376', '9aab80707b', '3', 0.00, '2016-08-17 19:34:58', '2016-08-17 20:54:27', NULL, '79.140.194.224', '79.140.194.224', '0', '1', '2016-08-19 03:12:16', 1, 0, 'one_post', '2016-08-17 13:34:58', '58356743', '', '0000-00-00 00:00:00'),
(106, 'renathaider@gmail.com', '', 'renathaider', 'a14537fad3744eac03c80d53b873faa6f8fe926a', '650affb279', '4', 0.00, '2016-09-06 01:40:23', '2016-12-23 23:31:58', NULL, '79.140.194.224', '179.104.158.135', '0', '1', '2016-12-23 17:32:24', 998, 0, 'one_bid', '2016-09-05 19:40:23', '29972886', '', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `emts_membership_package`
--

CREATE TABLE IF NOT EXISTS `emts_membership_package` (
  `id` int(11) NOT NULL,
  `member_type` enum('1','2') NOT NULL DEFAULT '1' COMMENT '1=Buyer, 2=Seller',
  `package_name` varchar(255) NOT NULL,
  `bids` int(11) NOT NULL,
  `cost` double DEFAULT NULL,
  `valid_time` varchar(50) NOT NULL COMMENT 'DD',
  `is_display` enum('0','1') NOT NULL DEFAULT '1' COMMENT '0=No, 1=Yes',
  `post_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `update_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `package_type` varchar(20) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `emts_membership_package`
--

INSERT INTO `emts_membership_package` (`id`, `member_type`, `package_name`, `bids`, `cost`, `valid_time`, `is_display`, `post_date`, `update_date`, `package_type`) VALUES
(2, '1', 'One Year Unlimited Bids', 0, 20000, '366', '1', '2016-12-23 16:05:09', '2016-12-24 03:50:09', 'unlimited'),
(3, '1', 'One Month Unlimited', 0, 3000, '31', '1', '2016-12-23 16:15:27', '2016-12-24 04:00:27', 'unlimited'),
(6, '2', 'Unlim-test', 0, 0, '65', '1', '2016-12-23 16:22:01', '2016-12-24 04:07:01', 'unlimited'),
(8, '1', 'One Bid Only', 1, 1000, '', '1', '2016-12-23 16:21:38', '2016-12-24 04:06:38', 'one_post'),
(9, '1', 'Customized Package ', 0, 0, '366', '0', '2016-12-23 16:20:06', '2016-12-24 04:05:06', 'one_post');

-- --------------------------------------------------------

--
-- Table structure for table `emts_members_details`
--

CREATE TABLE IF NOT EXISTS `emts_members_details` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `address2` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `state` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `city` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `country` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `post_code` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cover_image` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `about_user` tinytext COLLATE utf8_unicode_ci,
  `mobile` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `company_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `company_info` varchar(1024) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `company_address1` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `company_address2` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `company_city` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `company_state` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `company_zipcode` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `company_country` int(5) NOT NULL,
  `company_phone` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `company_fax` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `company_website` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `expertise` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=108 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `emts_members_details`
--

INSERT INTO `emts_members_details` (`id`, `user_id`, `name`, `last_name`, `image`, `address`, `address2`, `state`, `city`, `country`, `post_code`, `phone`, `cover_image`, `about_user`, `mobile`, `company_name`, `company_info`, `description`, `company_address1`, `company_address2`, `company_city`, `company_state`, `company_zipcode`, `company_country`, `company_phone`, `company_fax`, `company_website`, `expertise`) VALUES
(1, 3, 'Manish', 'Chaudhary', '', 'Dhangadhi,Kailali', 'Shantinagar,Kathmandu', 'Central', 'Ktm', '126', '44601', '0987654321', NULL, 'About user', '0987654321', 'Test Company', 'Test company Info', 'Test company Description', 'Ktm', 'Ktm', 'Ktm', 'Mid', '44601', 126, '0654011', '1654011', 'http://testcompany2.com', ''),
(2, 4, 'Test', 'Member', '', 'Ktm', 'Ktm', 'Central', 'Ktm', '126', '44600', '123456', NULL, 'This is Test Member', '1234567890', 'Test Company', 'Test Company Info', 'Test Company Description', 'Kathmandu', 'Kathmandu', 'Kathmandu', 'Kathmandu', '44601', 126, '1234567890', '123456', 'http://testcompany.com', ''),
(4, 6, 'Manish', 'Chaudhary', '', 'test', 'test', 'sth', 'kt', '126', '00977', '1234567890', NULL, 'this is me', NULL, 'test', '', 'ewsteer', 'test', 'trst', 'rwatr', 'test', '00999', 186, '985545454545', '', 'http://www.asd.asd', ''),
(6, 8, 'Test', 'Supplier', '', 'Baneshwor, Kathmandu', 'Shantinagar, Kathmandu', 'Central', 'Kathmandu', '126', '44600', NULL, NULL, NULL, NULL, 'Test supplier country', '', 'Testhjaf asfasjlsfsa fsasasa   asfas fs', 'Baneshwor, Kathmandu', 'Shantinagar, Kathmandu', 'Kathmandu', 'Central', '44600', 126, '1234554321', '', 'http://google.com', ''),
(7, 9, 'Test', 'Buyer', '', '', NULL, NULL, NULL, NULL, NULL, '1234567891', '015d495062292cf5f0c20c40865daf22.jpg', NULL, NULL, '', '', '', '', '', '', '', '', 0, '', '', '', ''),
(22, 24, 'Testsudip', 'BuyerN', '', 'asdf', 'asdf', 'asdf', 'asdf', '184', '1234', '1234565432', NULL, 'asdf', NULL, 'asdf', '', 'asdf', 'asdf', 'asdf', 'asdf', 'asdf', '1234', 184, '12341234', '', 'https://support.google.com/a/answer/176600?hl=en', ''),
(24, 26, 'Test', 'Suppliern', '', 'New York', 'Los Angeles', 'California', 'Los Angeles', '184', '90001', NULL, NULL, NULL, NULL, 'D Company', '', 'D Company is a A grade company', 'New York', 'Los Angeles', 'Los Angeles', 'California', '90001', 184, '9812345677', '', 'http://dcompany.com', '3,8,11,13,19'),
(25, 27, 'Test', 'buyern', '', '', '', '', '', '', '', '12345643210', NULL, '', '', '', '', '', '', '', '', '', '', 0, '', '', '', ''),
(26, 28, 'Shredhar', 'Acharya', '', '', NULL, NULL, NULL, NULL, NULL, '9876543216', NULL, NULL, NULL, '', '', '', '', '', '', '', '', 0, '', '', '', ''),
(27, 29, 'test', 'test', '', '', NULL, NULL, NULL, NULL, NULL, '9841121522', NULL, NULL, NULL, '', '', '', '', '', '', '', '', 0, '', '', '', ''),
(28, 30, 'test', 'tst', '', '', NULL, NULL, NULL, NULL, NULL, '984141121522', NULL, NULL, NULL, '', '', '', '', '', '', '', '', 0, '', '', '', ''),
(29, 31, 'Rae', 'Higgins', '', 'Et qui aliquip necessitatibus quo incidunt voluptatem', 'Tenetur ut molestiae exercitationem laborum Adipisci', 'Nisi doloremque nostrum porro inventore et dolorem nemo et et', 'Maxime quibusdam quod laboriosam omnis eum maiores temporibus totam est ut doloribus dignissimos sap', '78', 'Eligendi iusto quis ', '+138-54-7328950', NULL, 'Magna error dolor sint, quidem dolor autem recusandae. Aut non sed amet, animi, culpa, quae accusamus.', '', 'Perez and Donovan Traders', '', 'Aspernatur blanditiis a sed molestiae sint, odio asperiores architecto ea in pariatur. Rerum dolore voluptatem ut corrupti, rem.', 'Hull and Boyd Associates', '', 'Horne Copeland Traders', 'Chan and Mcgee Traders', 'Bradford Goodman Co', 42, 'Kirby Mccarthy Trade', '', 'http://www.qetu.cc', ''),
(30, 32, 'test', 'TEST', '', '', '', '', '', '', '', '9841121522', '416241c372a0f6c2f9714c7bca2cfac5.jpg', '', '', '', '', '', '', '', '', '', '', 0, '', '', '', ''),
(31, 33, 'TEST', 'TEST', '', '', '', '', '', '', '', '9841121522', NULL, '', '', '', '', '', '', '', '', '', '', 0, '', '', '', ''),
(32, 35, 'sdf', 'sdf', '', '', NULL, NULL, NULL, NULL, NULL, 'sdf', 'profile.png', NULL, NULL, '', '', '', '', '', '', '', '', 0, '', '', '', ''),
(33, 36, 'asd', 'asd', '', '', NULL, NULL, NULL, NULL, NULL, 'asd', NULL, NULL, NULL, '', '', '', '', '', '', '', '', 0, '', '', '', ''),
(34, 37, 'sagar', 'sada', '', '', NULL, NULL, NULL, NULL, NULL, '984545455', NULL, NULL, NULL, '', '', '', '', '', '', '', '', 0, '', '', '', ''),
(35, 38, 'test', 'test', '', '', NULL, NULL, NULL, NULL, NULL, '9868582838', NULL, NULL, NULL, '', '', '', '', '', '', '', '', 0, '', '', '', ''),
(36, 39, 'Sujit', 'Shah', '', '', NULL, NULL, NULL, NULL, NULL, '465465', NULL, NULL, NULL, '', '', '', '', '', '', '', '', 0, '', '', '', ''),
(37, 40, 'Sujit', 'Shah', '', 'ktm', '', 'ktm', 'ktm', '184', '12345', 'sdfsd', NULL, 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don''t look even slightly believable. If you are going to use a passage of Lorem Ipsum, yo', '', 'EMTS', '', 'TEST', 'KTM', '', 'KTM', 'KTM', '12345', 126, 'sdlfjsdf', '', 'http://www.example.com', ''),
(38, 41, 'Sujit', 'Shah', '', '', NULL, NULL, NULL, NULL, NULL, '98564223', NULL, NULL, NULL, '', '', '', '', '', '', '', '', 0, '', '', '', ''),
(39, 42, 'Sujit', 'Shah', '', '', '', '', '', '', '', '123456789', NULL, '', '', '', '', '', '', '', '', '', '', 0, '', '', '', ''),
(40, 43, 'sa', 's', '', '', NULL, NULL, NULL, NULL, NULL, '9868582838', NULL, NULL, NULL, '', '', '', '', '', '', '', '', 0, '', '', '', ''),
(41, 44, 'asdasd', 'asdad', '', '', NULL, NULL, NULL, NULL, NULL, '345345435', NULL, NULL, NULL, '', '', '', '', '', '', '', '', 0, '', '', '', ''),
(42, 45, 'asd', 'asd', '', '', NULL, NULL, NULL, NULL, NULL, '9868582838', NULL, NULL, NULL, '', '', '', '', '', '', '', '', 0, '', '', '', ''),
(43, 46, 'Manish', 'Chaudhary', '', '', NULL, NULL, NULL, NULL, NULL, '9868582838', NULL, NULL, NULL, '', '', '', '', '', '', '', '', 0, '', '', '', ''),
(44, 47, 'sagar', 'sagar', '', '', NULL, NULL, NULL, NULL, NULL, '234234234', NULL, NULL, NULL, '', '', '', '', '', '', '', '', 0, '', '', '', ''),
(45, 48, 'aasd`', 'asdasd', '', '', NULL, NULL, NULL, NULL, NULL, '9868582838', NULL, NULL, NULL, '', '', '', '', '', '', '', '', 0, '', '', '', ''),
(46, 49, 'aasd`', 'asdasd', '', '', NULL, NULL, NULL, NULL, NULL, '9868582838', NULL, NULL, NULL, '', '', '', '', '', '', '', '', 0, '', '', '', ''),
(47, 50, 'askldjhf aksjdf', 'askldjfh asdkf', '', '', NULL, NULL, NULL, NULL, NULL, '9860186031', NULL, NULL, NULL, '', '', '', '', '', '', '', '', 0, '', '', '', ''),
(48, 51, 'house', 'parko', '', '', NULL, NULL, NULL, NULL, NULL, '8687687687687', NULL, NULL, NULL, '', '', '', '', '', '', '', '', 0, '', '', '', ''),
(49, 52, 'asdfasdf', 'f asdf asdf ', '', '', NULL, NULL, NULL, NULL, NULL, '87658758765', NULL, NULL, NULL, '', '', '', '', '', '', '', '', 0, '', '', '', ''),
(50, 53, 'kajdsfkjadsf', 'akjdhgfkasjgf', '', '', NULL, NULL, NULL, NULL, NULL, '786587658765', NULL, NULL, NULL, '', '', '', '', '', '', '', '', 0, '', '', '', ''),
(51, 54, 'ashdfkjh', 'asdf', '', '', NULL, NULL, NULL, NULL, NULL, '123456789', NULL, NULL, NULL, '', '', '', '', '', '', '', '', 0, '', '', '', ''),
(52, 55, 'asdf', 'asdf', '', '', NULL, NULL, NULL, NULL, NULL, '9860186031', NULL, NULL, NULL, '', '', '', '', '', '', '', '', 0, '', '', '', ''),
(53, 56, 'Renato', 'Renato', '', '', '', '', '', '', '', '1111', '95a6e00b4a01952493b6d389071e35e7.jpg', 'Buyer', '2222', '', '', '', '', '', '', '', '', 0, '', '', '', ''),
(54, 57, 'Guilherme', 'Guilherme', '', '', '', '', '', '', '', '1111', NULL, '', '2222', '', '', '', '', '', '', '', '', 0, '', '', '', ''),
(55, 58, 'Madison', 'Murray', '', '', NULL, NULL, NULL, NULL, NULL, '9848476411', NULL, NULL, NULL, '', '', '', '', '', '', '', '', 0, '', '', '', ''),
(56, 59, 'Ivor', 'Waters', '', '', NULL, NULL, NULL, NULL, NULL, '+118-23-6407447', NULL, NULL, NULL, '', '', '', '', '', '', '', '', 0, '', '', '', ''),
(57, 60, 'Ivor', 'Waters', '', '', NULL, NULL, NULL, NULL, NULL, '+118-23-6407447', NULL, NULL, NULL, '', '', '', '', '', '', '', '', 0, '', '', '', ''),
(58, 61, 'Nabin', 'khatri', '', 'humla', 'humla', 'humla', 'humla', '126', '9024', '9844895673', NULL, 'sdflksdjfsd fda', '', 'emultitech', '', 'test tests teststsetsetset', 'humla', 'humla', 'humla', 'nepal', '977', 126, 'fsdff', '', 'http://www.google.com', ''),
(59, 62, 'saitan', 'singh', '', '', '', '', '', '', '', '9841981466', NULL, '', '', '', '', '', '', '', '', '', '', 0, '', '', '', ''),
(60, 63, 'suip', 'shesta', '', '', NULL, NULL, NULL, NULL, NULL, '9860186031', NULL, NULL, NULL, '', '', '', '', '', '', '', '', 0, '', '', '', ''),
(61, 64, 'asdf', 'asdf', '', '', '', '', '', '', '', '986546545', NULL, '', '', '', '', '', '', '', '', '', '', 0, '', '', '', ''),
(62, 65, 'sudip', 'shrestha', '', '', NULL, NULL, NULL, NULL, NULL, '9868582838', NULL, NULL, NULL, '', '', '', '', '', '', '', '', 0, '', '', '', ''),
(63, 66, 'tiger', 'ram', '', '', NULL, NULL, NULL, NULL, NULL, '987654', NULL, NULL, NULL, '', '', '', '', '', '', '', '', 0, '', '', '', ''),
(64, 67, 'renato', 'renato', '', 'zzzz', 'zzzz', 'zzzz', 'zzzz', '11', 'zzzz', '0000', NULL, 'supplier tester', '0000', 'Renathaider Corp', 'Corp', 'Corp', 'zzzz', 'zzzz', 'zzzz', 'zzzz', 'zzz', 15, 'zzzz', 'zzzz', 'zzzz', ''),
(65, 68, 'renato', 'renato', '', '', NULL, NULL, NULL, NULL, NULL, '0000', NULL, NULL, NULL, '', '', '', '', '', '', '', '', 0, '', '', '', ''),
(66, 69, 'Maite', 'Mays', '', '', NULL, NULL, NULL, NULL, NULL, '+157-16-7154304', NULL, NULL, NULL, '', '', '', '', '', '', '', '', 0, '', '', '', ''),
(67, 70, 'lkjihdflkjshdf', 'kljasdhfljkahsdf', '', '', NULL, NULL, NULL, NULL, NULL, '9860186031', NULL, NULL, NULL, '', '', '', '', '', '', '', '', 0, '', '', '', ''),
(68, 71, 'al;sdkfhj', 'askldf', '', '', NULL, NULL, NULL, NULL, NULL, '98654687498', NULL, NULL, NULL, '', '', '', '', '', '', '', '', 0, '', '', '', ''),
(69, 72, 'Kareem', 'Deleon', '', '', NULL, NULL, NULL, NULL, NULL, '+843-37-6113410', NULL, NULL, NULL, '', '', '', '', '', '', '', '', 0, '', '', '', ''),
(70, 73, 'Sylvester', 'Mejia', '', '', NULL, NULL, NULL, NULL, NULL, '+916-99-3729648', NULL, NULL, NULL, '', '', '', '', '', '', '', '', 0, '', '', '', ''),
(71, 74, 'Manish', 'Chaudhary', '', '', NULL, NULL, NULL, NULL, NULL, '9868582838', NULL, NULL, NULL, '', '', '', '', '', '', '', '', 0, '', '', '', ''),
(72, 75, 'Acton', 'Winters', '', '', NULL, NULL, NULL, NULL, NULL, '+731-12-2298380', NULL, NULL, NULL, '', '', '', '', '', '', '', '', 0, '', '', '', ''),
(73, 76, 'Autumn', 'Jefferson', '', '', NULL, NULL, NULL, NULL, NULL, '+435-56-2580126', NULL, NULL, NULL, '', '', '', '', '', '', '', '', 0, '', '', '', ''),
(74, 77, 'sagar', 'chapagain', '', '', NULL, NULL, NULL, NULL, NULL, '24324234', NULL, NULL, NULL, '', '', '', '', '', '', '', '', 0, '', '', '', ''),
(75, 78, 'Timon', 'Dennis', '', '', NULL, NULL, NULL, NULL, NULL, '+279-21-3339760', NULL, NULL, NULL, '', '', '', '', '', '', '', '', 0, '', '', '', ''),
(76, 79, 'Timon', 'Dennis', '', '', NULL, NULL, NULL, NULL, NULL, '+279-21-3339760', NULL, NULL, NULL, '', '', '', '', '', '', '', '', 0, '', '', '', ''),
(77, 80, 'Kellie', 'Fox', '', '', NULL, NULL, NULL, NULL, NULL, '+571-69-3088393', NULL, NULL, NULL, '', '', '', '', '', '', '', '', 0, '', '', '', ''),
(78, 81, 'Kellie', 'Fox', '', '', NULL, NULL, NULL, NULL, NULL, '+571-69-3088393', NULL, NULL, NULL, '', '', '', '', '', '', '', '', 0, '', '', '', ''),
(79, 82, 'Madaline', 'Cameron', '', '', NULL, NULL, NULL, NULL, NULL, '+289-83-2839841', NULL, NULL, NULL, '', '', '', '', '', '', '', '', 0, '', '', '', ''),
(80, 83, 'Kerry', 'Cervantes', '', '', NULL, NULL, NULL, NULL, NULL, '+692-11-8493262', NULL, NULL, NULL, '', '', '', '', '', '', '', '', 0, '', '', '', ''),
(81, 84, 'Alea', 'Blanchard', '', '', NULL, NULL, NULL, NULL, NULL, '+172-12-7594318', NULL, NULL, NULL, '', '', '', '', '', '', '', '', 0, '', '', '', ''),
(82, 85, 'Maryam', 'Witt', '', '', NULL, NULL, NULL, NULL, NULL, '+884-91-6887227', NULL, NULL, NULL, '', '', '', '', '', '', '', '', 0, '', '', '', ''),
(83, 86, 'Victor', 'Schneider', '', '', NULL, NULL, NULL, NULL, NULL, '+252-89-2743539', NULL, NULL, NULL, '', '', '', '', '', '', '', '', 0, '', '', '', ''),
(84, 87, 'Armando', 'Brown', '', '', NULL, NULL, NULL, NULL, NULL, '+951-49-5399297', NULL, NULL, NULL, '', '', '', '', '', '', '', '', 0, '', '', '', ''),
(85, 88, 'Armando', 'Brown', '', '', NULL, NULL, NULL, NULL, NULL, '+951-49-5399297', NULL, NULL, NULL, '', '', '', '', '', '', '', '', 0, '', '', '', ''),
(86, 89, 'Armando', 'Brown', '', '', NULL, NULL, NULL, NULL, NULL, '+951-49-5399297', NULL, NULL, NULL, '', '', '', '', '', '', '', '', 0, '', '', '', ''),
(87, 90, 'Armando', 'Brown', '', '', NULL, NULL, NULL, NULL, NULL, '+951-49-5399297', NULL, NULL, NULL, '', '', '', '', '', '', '', '', 0, '', '', '', ''),
(88, 91, 'Imani', 'Randall', '', '', NULL, NULL, NULL, NULL, NULL, '+254-21-4434929', NULL, NULL, NULL, '', '', '', '', '', '', '', '', 0, '', '', '', ''),
(89, 92, 'Forrest', 'Nunez', '', '', NULL, NULL, NULL, NULL, NULL, '+114-10-5753721', NULL, NULL, NULL, '', '', '', '', '', '', '', '', 0, '', '', '', ''),
(90, 93, 'sudip', 'shrestha', '', '', NULL, NULL, NULL, NULL, NULL, '98060186031', 'b69ace04fab346dd0093f49fdf53c894.png', NULL, NULL, '', '', '', '', '', '', '', '', 0, '', '', '', ''),
(91, 94, 'sudip_buyer', 'shrestha', '', '', NULL, NULL, NULL, NULL, NULL, '98060186031', NULL, NULL, NULL, '', '', '', '', '', '', '', '', 0, '', '', '', ''),
(92, 95, 'sss_buyer', 'shrestha', '', '', NULL, NULL, NULL, NULL, NULL, '54578547', NULL, NULL, NULL, '', '', '', '', '', '', '', '', 0, '', '', '', ''),
(93, 96, 'sudip_buyer2', 'shrestha', '', '', NULL, NULL, NULL, NULL, NULL, '123456879', NULL, NULL, NULL, '', '', '', '', '', '', '', '', 0, '', '', '', ''),
(94, 97, 'suip_buyer', 'shrestha', '', '', NULL, NULL, NULL, NULL, NULL, '6354684654', 'faf82361f333a965022c41a6220b05d0.jpg', NULL, NULL, '', '', '', '', '', '', '', '', 0, '', '', '', ''),
(95, 98, 'suip_supplier', 'shrestha', '', '', NULL, NULL, NULL, NULL, NULL, '98987987987', NULL, NULL, NULL, '', '', '', '', '', '', '', '', 0, '', '', '', ''),
(96, 99, 'aasdfasdf', 'asdf', '', '', NULL, NULL, NULL, NULL, NULL, '3216548', NULL, NULL, NULL, '', '', '', '', '', '', '', '', 0, '', '', '', ''),
(97, 100, 'sagar', 'asdad', '', '', NULL, NULL, NULL, NULL, NULL, '121212121', NULL, NULL, NULL, '', '', '', '', '', '', '', '', 0, '', '', '', ''),
(98, 101, 'asdsad', 'asdasd', '', '', NULL, NULL, NULL, NULL, NULL, '9868582838', NULL, NULL, NULL, '', '', '', '', '', '', '', '', 0, '', '', '', ''),
(99, 102, 'asdasd', '2134234', '', '', NULL, NULL, NULL, NULL, NULL, '9868582838', NULL, NULL, NULL, '', '', '', '', '', '', '', '', 0, '', '', '', ''),
(100, 103, 'dasda', 'dsdf', '', '', NULL, NULL, NULL, NULL, NULL, '9868582838', NULL, NULL, NULL, '', '', '', '', '', '', '', '', 0, '', '', '', ''),
(101, 104, 'asdasd', 'asd', '', '', NULL, NULL, NULL, NULL, NULL, '9868582838', NULL, NULL, NULL, '', '', '', '', '', '', '', '', 0, '', '', '', ''),
(102, 105, 'Florence', 'Romero', '', '', NULL, NULL, NULL, NULL, NULL, '+567-98-7530714', NULL, NULL, NULL, '', '', '', '', '', '', '', '', 0, '', '', '', ''),
(103, 106, 'renato', 'renato', '', '', NULL, NULL, NULL, NULL, NULL, '0000', NULL, NULL, NULL, '', '', '', '', '', '', '', '', 0, '', '', '', ''),
(104, 107, 'saagarchapagin', 'asdak', '', '', NULL, NULL, NULL, NULL, NULL, '984112155', NULL, NULL, NULL, '', '', '', '', '', '', '', '', 0, '', '', '', ''),
(105, 108, 'test', 'test', '', '', NULL, NULL, NULL, NULL, NULL, '984112152', NULL, NULL, NULL, '', '', '', '', '', '', '', '', 0, '', '', '', ''),
(106, 109, 'teste', 'teste', '', '', NULL, NULL, NULL, NULL, NULL, '132465', NULL, NULL, NULL, '', '', '', '', '', '', '', '', 0, '', '', '', ''),
(107, 110, 'john`', 'lhsd', '', '', NULL, NULL, NULL, NULL, NULL, '0000', NULL, NULL, NULL, '', '', '', '', '', '', '', '', 0, '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `emts_member_expertise`
--

CREATE TABLE IF NOT EXISTS `emts_member_expertise` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `emts_member_expertise`
--

INSERT INTO `emts_member_expertise` (`id`, `user_id`, `category_id`) VALUES
(19, 8, 103),
(20, 8, 36),
(21, 8, 93),
(32, 29, 103),
(33, 29, 34),
(34, 29, 36),
(35, 29, 93),
(40, 32, 11),
(41, 32, 13),
(42, 32, 19),
(43, 32, 103),
(44, 32, 34),
(45, 93, 11),
(46, 93, 13),
(47, 93, 19),
(48, 93, 103),
(49, 93, 34),
(50, 57, 3),
(51, 57, 8),
(52, 57, 11);

-- --------------------------------------------------------

--
-- Table structure for table `emts_member_notification_settings`
--

CREATE TABLE IF NOT EXISTS `emts_member_notification_settings` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `email_template_id` int(11) NOT NULL,
  `is_email_notification_send` enum('0','1') NOT NULL DEFAULT '1' COMMENT '0=disable, 1=enable to send notification',
  `is_sms_notification_send` enum('0','1') NOT NULL DEFAULT '0' COMMENT '0=No,1=Yes'
) ENGINE=InnoDB AUTO_INCREMENT=707 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `emts_member_notification_settings`
--

INSERT INTO `emts_member_notification_settings` (`id`, `user_id`, `email_template_id`, `is_email_notification_send`, `is_sms_notification_send`) VALUES
(680, 3, 1, '1', '0'),
(681, 3, 3, '0', '0'),
(682, 3, 5, '0', '0'),
(683, 3, 7, '0', '0'),
(684, 3, 9, '1', '0'),
(685, 3, 11, '1', '0'),
(686, 3, 13, '1', '0'),
(687, 3, 15, '1', '0'),
(688, 3, 17, '1', '0'),
(689, 3, 19, '1', '0'),
(690, 3, 21, '1', '0'),
(691, 3, 23, '1', '0'),
(692, 3, 25, '1', '0'),
(693, 3, 27, '0', '0'),
(694, 3, 29, '1', '0'),
(695, 3, 31, '0', '0'),
(696, 3, 33, '1', '0'),
(697, 3, 35, '1', '0'),
(698, 3, 37, '1', '0'),
(699, 3, 38, '1', '0'),
(700, 3, 39, '1', '0'),
(701, 3, 40, '1', '0'),
(702, 3, 41, '1', '0'),
(703, 3, 42, '1', '0'),
(704, 3, 43, '1', '0'),
(705, 3, 47, '0', '0'),
(706, 3, 50, '0', '0');

-- --------------------------------------------------------

--
-- Table structure for table `emts_member_rating`
--

CREATE TABLE IF NOT EXISTS `emts_member_rating` (
  `rating_id` int(11) NOT NULL,
  `from_user_id` int(11) NOT NULL,
  `to_user_id` int(11) NOT NULL,
  `overall_rating` double(5,1) NOT NULL DEFAULT '0.0',
  `rating_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment` varchar(200) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `emts_member_rating`
--

INSERT INTO `emts_member_rating` (`rating_id`, `from_user_id`, `to_user_id`, `overall_rating`, `rating_date`, `comment`, `product_id`) VALUES
(1, 9, 32, 4.0, '2016-07-21 11:29:09', 'test ss hello', 17),
(11, 29, 32, 4.0, '2016-07-20 05:56:51', 'hello', 40),
(12, 9, 29, 4.0, '2016-07-21 11:17:52', 'this is awesome', 17),
(13, 29, 9, 3.3, '2016-07-21 11:17:52', 'Thank you for wonderful time', 18),
(14, 29, 9, 1.0, '2016-07-24 01:10:35', 'this is too late...You ruined my business.', 20),
(15, 9, 29, 1.0, '2016-07-24 01:14:51', 'You did not support me.Although I made to win you..I am guilty for my deeds.', 20),
(16, 32, 9, 3.0, '2016-08-22 17:22:31', 'asdf', 17),
(17, 97, 98, 5.0, '2016-08-24 17:16:49', '', 85);

-- --------------------------------------------------------

--
-- Table structure for table `emts_message`
--

CREATE TABLE IF NOT EXISTS `emts_message` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `sender_id` int(11) NOT NULL,
  `reciepient_id` int(11) NOT NULL,
  `subject` varchar(1024) NOT NULL,
  `body` longtext NOT NULL,
  `attachment` varchar(100) NOT NULL,
  `date_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` enum('0','1') NOT NULL DEFAULT '0' COMMENT '0=unread,1=read',
  `seller_del_status` enum('0','1') NOT NULL DEFAULT '0' COMMENT '0=No, 1=Yes',
  `buyer_del_status` enum('0','1') NOT NULL DEFAULT '0' COMMENT '0=No, 1=Yes'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `emts_meta_categories`
--

CREATE TABLE IF NOT EXISTS `emts_meta_categories` (
  `category_id` int(11) NOT NULL,
  `field_id` int(11) unsigned NOT NULL,
  `field_order` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='custom fields categories';

--
-- Dumping data for table `emts_meta_categories`
--

INSERT INTO `emts_meta_categories` (`category_id`, `field_id`, `field_order`) VALUES
(36, 12, 0),
(95, 12, 0),
(32, 11, 0),
(103, 11, 0),
(34, 11, 0),
(3, 14, 0),
(8, 14, 0),
(11, 14, 0),
(13, 14, 0);

-- --------------------------------------------------------

--
-- Table structure for table `emts_meta_fields`
--

CREATE TABLE IF NOT EXISTS `emts_meta_fields` (
  `id` int(11) unsigned NOT NULL COMMENT 'primary key',
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `type` enum('CHECKBOX','DATE','DATETIME','DROPDOWN','EMAIL','FILE','NUMBER','RADIO','TEXT','TEXTAREA','URL') NOT NULL DEFAULT 'TEXT',
  `options` varchar(2048) DEFAULT NULL COMMENT 'if field is select or radio',
  `extensions` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'files extensions if type is file',
  `validation_rules` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'validation rules in json format',
  `added_date` datetime NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `form_field_type` enum('custom','basic') NOT NULL DEFAULT 'custom' COMMENT 'defines whether this field is basic field or custom field',
  `basic_field_order` int(11) NOT NULL COMMENT 'defines the order of field if it is basic fields'
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COMMENT='custom fields';

--
-- Dumping data for table `emts_meta_fields`
--

INSERT INTO `emts_meta_fields` (`id`, `name`, `slug`, `type`, `options`, `extensions`, `validation_rules`, `added_date`, `last_update`, `form_field_type`, `basic_field_order`) VALUES
(1, 'Document Attachment', 'Document Attachment', 'FILE', '', 'doc,xls,pdf', '', '2016-05-18 16:58:09', '2016-08-09 06:37:47', 'basic', 2),
(4, 'Document Information', 'Document Information', 'TEXT', '', '', '', '2016-06-08 18:06:40', '2016-08-09 06:37:47', 'basic', 1),
(5, 'Author', 'Author', 'TEXT', '', '', '', '2016-06-09 10:09:03', '2016-06-09 04:24:03', 'custom', 0),
(6, 'Publication', 'Publication', 'TEXT', '', '', '{"required":"true"}', '2016-06-09 10:15:48', '2016-06-09 04:30:48', 'custom', 0),
(7, 'genre', 'genre', 'TEXT', '', '', '{"required":"true"}', '2016-06-09 10:17:38', '2016-06-09 04:32:38', 'custom', 0),
(8, 'Genre', 'Genre', 'TEXT', '', '', '', '2016-06-09 10:18:17', '2016-06-09 04:33:17', 'custom', 0),
(9, 'Platform', 'Platform', 'TEXT', '', '', '{"required":"true"}', '2016-06-09 11:56:03', '2016-06-09 06:11:03', 'custom', 0),
(10, 'Website', 'Website', 'URL', '', '', '{"url":"true","required":"true"}', '2016-06-09 11:56:35', '2016-06-09 06:11:35', 'custom', 0),
(11, 'Brand', 'Brand', 'TEXT', '', '', '', '2016-06-22 16:16:53', '2016-08-03 20:15:32', 'custom', 0),
(14, 'test', 'test', 'TEXT', '', '', '{"required":"true"}', '2016-08-09 12:26:06', '2016-08-09 18:26:06', 'custom', 0);

-- --------------------------------------------------------

--
-- Table structure for table `emts_meta_products`
--

CREATE TABLE IF NOT EXISTS `emts_meta_products` (
  `product_id` int(11) NOT NULL COMMENT 'id(pk) of product table',
  `meta_fields_id` int(11) NOT NULL COMMENT 'id(pk) of met_fields table',
  `value` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `emts_meta_products`
--

INSERT INTO `emts_meta_products` (`product_id`, `meta_fields_id`, `value`) VALUES
(11, 1, 'f7c00bc2cd347196d100b0132c30e423.docx'),
(14, 4, ''),
(15, 4, ''),
(15, 11, ''),
(16, 1, '76d37761e7e9d16e2c5a3f29358f37bb.docx'),
(16, 4, 'toy user guide'),
(17, 4, ''),
(11, 4, 'test document'),
(11, 11, 'Apple'),
(19, 4, ''),
(20, 4, ''),
(21, 4, ''),
(22, 4, ''),
(23, 4, ''),
(24, 4, ''),
(25, 4, ''),
(27, 4, ''),
(28, 4, ''),
(29, 4, 'sasd'),
(30, 4, 'sasd'),
(31, 4, ''),
(33, 4, ''),
(34, 4, ''),
(35, 4, ''),
(36, 4, ''),
(41, 4, ''),
(35, 4, ''),
(35, 4, ''),
(35, 4, ''),
(42, 4, ''),
(39, 4, ''),
(37, 4, ''),
(44, 4, ''),
(43, 4, ''),
(45, 4, ''),
(38, 4, ''),
(46, 4, ''),
(47, 4, ''),
(48, 4, ''),
(49, 4, ''),
(50, 4, ''),
(51, 4, ''),
(52, 4, ''),
(53, 4, ''),
(53, 11, 'ABC'),
(54, 4, ''),
(55, 4, ''),
(55, 13, '4'),
(55, 11, 'iphone'),
(56, 4, ''),
(56, 14, 'sdf'),
(57, 4, ''),
(57, 14, '1'),
(58, 4, ''),
(58, 11, 'toyota'),
(59, 4, 'Mollitia corporis officia reprehenderit qui tempore ullam necessitatibus excepturi officia qui tempor praesentium quas impedit anim deserunt velit'),
(59, 14, 'Illo autem sed ipsam tempore dolorem perferendis do et perferendis quia quae quisquam voluptatem'),
(60, 4, 'Quibusdam culpa est sed proident'),
(60, 14, 'ffdggggg'),
(61, 4, ''),
(62, 4, ''),
(62, 14, 'test'),
(63, 4, 'Aliquip excepteur est maiores laborum exercitationem ut assumenda ullamco iure labore voluptate ut voluptatem Voluptatem Repellendus Est fugiat voluptatem Totam'),
(64, 4, 'Minus expedita sed ullamco molestiae nisi Nam asperiores ut consequatur deserunt qui in'),
(64, 14, 'Odio accusamus odio molestiae ut in incididunt et sed ducimus molestiae mollit cupiditate ad cupiditate'),
(65, 4, ''),
(65, 14, 'test'),
(66, 4, ''),
(66, 14, 'what is this?'),
(67, 4, ''),
(68, 4, ''),
(68, 11, ''),
(69, 4, ''),
(69, 14, 'er'),
(70, 4, ''),
(70, 11, 'nokia'),
(71, 4, ''),
(72, 4, ''),
(72, 14, 'nbvc'),
(73, 4, ''),
(73, 11, 'asdf'),
(74, 4, ''),
(75, 4, ''),
(76, 4, ''),
(76, 14, 'asdf'),
(77, 4, 'asdf'),
(77, 14, 'asdf'),
(78, 4, ''),
(78, 14, 'asdf'),
(79, 4, ''),
(79, 14, 'asdf'),
(80, 4, ''),
(80, 14, 'asdf'),
(81, 4, ''),
(81, 14, 'asdf'),
(82, 4, ''),
(82, 14, 'asdf'),
(83, 4, ''),
(83, 14, 'asdf'),
(84, 4, ''),
(84, 14, 'fsdfg'),
(85, 4, ''),
(86, 4, ''),
(86, 14, 'why'),
(89, 4, 'Voluptate nihil placeat exercitation anim est dolorem distinctio Consectetur'),
(90, 4, 'Enim praesentium dolor enim velit possimus dolore tenetur do quis veniam quo modi corporis debitis'),
(91, 4, 'Enim praesentium dolor enim velit possimus dolore tenetur do quis veniam quo modi corporis debitis'),
(94, 4, 'Enim praesentium dolor enim velit possimus dolore tenetur do quis veniam quo modi corporis debitis'),
(96, 4, 'In impedit cupiditate in dolorem Nam asperiores ullamco assumenda dolorem maxime voluptate pariatur Occaecat obcaecati vel at'),
(97, 4, 'asdads'),
(98, 4, ''),
(99, 4, ''),
(88, 4, ''),
(87, 4, ''),
(100, 4, 'Doloribus quis anim alias aut iure et ducimus amet laudantium et Nam'),
(101, 4, ''),
(102, 4, ''),
(103, 4, 'Accusantium ullam enim quaerat eligendi quo ex optio pariatur Earum culpa magnam magnam quas sunt ratione non alias quia'),
(104, 4, ''),
(105, 4, 'Sed corrupti sint et corporis natus sint aspernatur omnis excepturi voluptas ab dolor Nam quo'),
(106, 4, 'Repellendus Quidem voluptate voluptatibus consequatur'),
(107, 4, 'Nobis eveniet Nam sequi ducimus sunt nobis quia delectus dolor'),
(108, 4, 'Ut nemo lorem lorem in proident nostrud'),
(109, 4, 'Aliquam eiusmod quod repudiandae eos officiis explicabo Nostrud architecto illum fugit est ut voluptas'),
(110, 4, 'Sapiente in et odit nulla minus expedita ipsa dolore recusandae Vitae quidem beatae aliquam fuga Animi culpa ad enim repudiandae'),
(111, 4, 'Eum maiores nemo est et unde iste consequuntur irure libero magni eligendi minim fugit culpa'),
(112, 4, 'Eum maiores nemo est et unde iste consequuntur irure libero magni eligendi minim fugit culpa'),
(113, 4, 'Facilis beatae itaque quo alias iusto dolore ut voluptatem corrupti'),
(95, 4, 'A nemo duis praesentium quia quisquam officia expedita'),
(114, 4, 'Assumenda molestias commodo tenetur consequatur ut sed ut repudiandae laboris enim aut'),
(115, 4, 'Sapiente officia quae tenetur quaerat ipsum non consequatur Exercitation sint delectus exercitation laborum consequatur velit aute adipisicing excepteur sed dolor'),
(116, 4, 'Nostrud quisquam eos id ut temporibus id ipsam consectetur sunt aliquip atque sed mollitia qui optio'),
(117, 4, 'In nobis velit voluptatem architecto incididunt molestiae ipsum praesentium aute quod duis consequatur ut qui'),
(119, 4, 'Natus consectetur numquam reiciendis consequat Irure voluptate ea consequatur commodo reiciendis lorem'),
(120, 4, ''),
(121, 4, 'Enim ut ipsam sint commodo qui ipsum et iure rerum possimus nisi sit veniam eaque duis consequatur possimus'),
(122, 4, 'Adipisicing eu nostrum dignissimos deserunt ullam molestiae quis sequi excepteur voluptas pariatur Saepe officiis aperiam debitis aspernatur obcaecati reprehenderit Nam'),
(123, 4, 'Adipisci voluptates quis est expedita ex mollitia natus veniam quam molestiae non qui ea et consectetur quasi dolor'),
(124, 4, 'Laborum ipsa quis est fugit magni ab sit est'),
(1, 4, 'Test'),
(1, 1, 'dde91067144950a86cc1b402299511f5.xlsx');

-- --------------------------------------------------------

--
-- Table structure for table `emts_news_letter`
--

CREATE TABLE IF NOT EXISTS `emts_news_letter` (
  `id` int(11) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `message` longtext NOT NULL,
  `send_test_email` enum('Yes','No') NOT NULL,
  `is_display` enum('0','1') NOT NULL DEFAULT '1' COMMENT '0=No, 1=Yes',
  `post_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `update_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `emts_payment_gateway`
--

CREATE TABLE IF NOT EXISTS `emts_payment_gateway` (
  `id` int(11) NOT NULL,
  `payment_gateway` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `payment_logo` varchar(1024) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `status` enum('1','2') COLLATE utf8_unicode_ci NOT NULL DEFAULT '1' COMMENT '1=Test Mode, 2 = Live Mode',
  `is_display` enum('Yes','No') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Yes',
  `last_update` datetime NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `emts_payment_gateway`
--

INSERT INTO `emts_payment_gateway` (`id`, `payment_gateway`, `payment_logo`, `email`, `status`, `is_display`, `last_update`) VALUES
(1, 'Paypal', 'pym1.jpg', 'renato.abreu@gmail.com', '2', 'Yes', '2016-12-23 21:43:09');

-- --------------------------------------------------------

--
-- Table structure for table `emts_products`
--

CREATE TABLE IF NOT EXISTS `emts_products` (
  `id` int(11) NOT NULL,
  `product_code` bigint(20) NOT NULL COMMENT 'unique integer product id to display to user',
  `cat_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sub_cat_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `seller_id` int(11) NOT NULL COMMENT 'seller_id=user_id',
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `auction_type` enum('1','2') COLLATE utf8_unicode_ci NOT NULL DEFAULT '1' COMMENT '1=public, 2=private',
  `bid_decrement` int(11) NOT NULL,
  `auction_time_zone` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `budget` double(20,2) NOT NULL,
  `currency` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `post_date` timestamp NULL DEFAULT NULL,
  `update_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `auc_start_time` datetime NOT NULL,
  `auc_end_days` int(11) NOT NULL DEFAULT '0',
  `auc_end_time` datetime NOT NULL,
  `status` enum('1','2','3','4') COLLATE utf8_unicode_ci NOT NULL DEFAULT '1' COMMENT '1=Pending, 2=Active, 3=Closed, 4=Cancelled',
  `payment_type` enum('free','paid','unlimited') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'paid' COMMENT 'free, paid or unlimited',
  `winner_notified` enum('0','1') COLLATE utf8_unicode_ci NOT NULL DEFAULT '0' COMMENT 'product won notification emailed to winner or not',
  `auc_end_hour` time DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `emts_products`
--

INSERT INTO `emts_products` (`id`, `product_code`, `cat_id`, `sub_cat_id`, `seller_id`, `name`, `description`, `auction_type`, `bid_decrement`, `auction_time_zone`, `budget`, `currency`, `post_date`, `update_date`, `auc_start_time`, `auc_end_days`, `auc_end_time`, `status`, `payment_type`, `winner_notified`, `auc_end_hour`) VALUES
(1, 147704703827, '', '', 27, 'Test Project', 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don''t look even slightly believable. If you are going to us', '1', 10, 'Pacific/Midway', 1000.00, '2', '2016-10-21 21:37:37', '0000-00-00 00:00:00', '2016-10-21 16:45:00', 1, '2016-10-23 00:09:09', '3', 'free', '0', '20:30:00');

-- --------------------------------------------------------

--
-- Table structure for table `emts_product_bids`
--

CREATE TABLE IF NOT EXISTS `emts_product_bids` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `user_bid_amt` double(20,2) NOT NULL,
  `bid_details` text NOT NULL,
  `attachment` varchar(255) NOT NULL,
  `bid_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `payment_type` enum('free','paid','unlimited') NOT NULL DEFAULT 'paid' COMMENT 'free, paid or unlimited'
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `emts_product_bids`
--

INSERT INTO `emts_product_bids` (`id`, `user_id`, `product_id`, `user_bid_amt`, `bid_details`, `attachment`, `bid_date`, `payment_type`) VALUES
(1, 106, 1, 690.00, '', '', '2016-10-22 00:12:45', 'free'),
(2, 57, 1, 600.00, '', '', '2016-10-22 00:16:59', 'free');

-- --------------------------------------------------------

--
-- Table structure for table `emts_product_categories`
--

CREATE TABLE IF NOT EXISTS `emts_product_categories` (
  `id` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL DEFAULT '0' COMMENT 'defined whether it is category or subcategory',
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `short_desc` varchar(1024) COLLATE utf8_unicode_ci DEFAULT NULL,
  `added_date` datetime NOT NULL,
  `is_display` enum('0','1') COLLATE utf8_unicode_ci NOT NULL DEFAULT '1' COMMENT '0=No, 1= Yes',
  `display_menu` enum('No','Yes') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Yes',
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=104 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `emts_product_categories`
--

INSERT INTO `emts_product_categories` (`id`, `parent_id`, `name`, `short_desc`, `added_date`, `is_display`, `display_menu`, `last_update`) VALUES
(3, 0, 'Apparels & Accessories', 'Apparels & Accessories', '2016-06-22 15:37:31', '1', 'No', '2016-06-22 09:52:31'),
(8, 0, 'Automotive', 'Automotive', '2016-06-22 15:37:59', '1', 'No', '2016-06-22 09:52:59'),
(11, 0, 'Chemicals', 'Chemicals', '2016-06-22 15:38:24', '1', 'No', '2016-06-22 09:53:24'),
(13, 0, 'Construction', 'Construction', '2016-06-22 15:38:41', '1', 'No', '2016-06-22 09:53:41'),
(19, 0, 'Electrical Equipment', 'Electrical Equipment', '2016-06-22 15:38:57', '1', 'No', '2016-06-22 09:53:57'),
(32, 0, 'Electronics', 'Electronics', '2016-06-22 15:39:17', '1', 'Yes', '2016-06-22 09:54:17'),
(34, 0, 'Gifts, Sports & Toys', 'Gifts, Sports & Toys', '2016-06-22 15:39:41', '1', 'Yes', '2016-06-22 09:54:41'),
(36, 0, 'Health & Beauty', 'Health & Beauty', '2016-06-22 15:39:58', '1', 'Yes', '2016-06-22 09:54:58'),
(93, 0, 'Agriculture & Food', 'Agriculture & Food\r\n', '2016-06-22 15:37:10', '1', 'Yes', '2016-06-22 09:52:10'),
(94, 0, 'Machinery, Industrial Parts', 'Machinery, Industrial Parts', '2016-06-22 15:40:16', '1', 'Yes', '2016-06-22 09:55:16'),
(95, 0, 'Metallurgy', 'Metallurgy', '2016-06-22 15:40:27', '1', 'Yes', '2016-06-22 09:55:27'),
(96, 0, 'Packaging & Office', 'Packaging & Office', '2016-06-22 15:40:38', '1', 'Yes', '2016-06-22 09:55:38'),
(97, 0, 'Rubber & Plastics', 'Rubber & Plastics', '2016-06-22 15:40:56', '1', 'Yes', '2016-06-22 09:55:56'),
(98, 0, 'Telecom', 'Telecom', '2016-06-22 15:41:10', '1', 'Yes', '2016-06-22 09:56:10'),
(99, 0, 'Textiles', 'Textiles', '2016-06-22 15:41:20', '1', 'Yes', '2016-06-22 09:56:20'),
(100, 0, 'Tools', 'Tools', '2016-06-22 15:41:30', '1', 'Yes', '2016-06-22 09:56:30'),
(101, 0, 'Others', 'Others', '2016-06-22 15:41:40', '1', 'Yes', '2016-06-22 09:56:40'),
(102, 0, 'Service', 'Service', '2016-06-22 15:41:50', '1', 'Yes', '2016-06-22 09:56:50'),
(103, 32, 'Cell Phones', '', '2016-06-28 11:14:57', '1', 'Yes', '2016-06-28 05:29:57');

-- --------------------------------------------------------

--
-- Table structure for table `emts_product_currency`
--

CREATE TABLE IF NOT EXISTS `emts_product_currency` (
  `id` int(11) NOT NULL,
  `currency_sign` varchar(10) NOT NULL,
  `currency_code` varchar(50) NOT NULL,
  `is_display` enum('0','1') NOT NULL DEFAULT '1' COMMENT '0=No, 1=Yes',
  `post_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `update_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `emts_product_currency`
--

INSERT INTO `emts_product_currency` (`id`, `currency_sign`, `currency_code`, `is_display`, `post_date`, `update_date`) VALUES
(1, 'NRS', 'NRS', '1', '2016-07-07 06:24:59', '0000-00-00 00:00:00'),
(2, 'US$', 'USD', '1', '2016-08-19 10:00:40', '0000-00-00 00:00:00'),
(3, '£', 'GBP', '1', '2016-08-17 05:49:33', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `emts_product_images`
--

CREATE TABLE IF NOT EXISTS `emts_product_images` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `emts_product_images_temp`
--

CREATE TABLE IF NOT EXISTS `emts_product_images_temp` (
  `id` bigint(20) NOT NULL,
  `product_code` bigint(20) NOT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `added_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `emts_product_invitation`
--

CREATE TABLE IF NOT EXISTS `emts_product_invitation` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `user_email` varchar(100) NOT NULL,
  `message` text NOT NULL,
  `invite_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `emts_product_post_categories`
--

CREATE TABLE IF NOT EXISTS `emts_product_post_categories` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `emts_product_post_categories`
--

INSERT INTO `emts_product_post_categories` (`id`, `user_id`, `category_id`, `product_id`) VALUES
(2, 27, 3, 1);

-- --------------------------------------------------------

--
-- Table structure for table `emts_product_static_fields`
--

CREATE TABLE IF NOT EXISTS `emts_product_static_fields` (
  `id` int(11) NOT NULL,
  `field_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `field_label` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `options` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT 'options for radio and drodown menus',
  `display` enum('0','1') COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `emts_product_static_fields`
--

INSERT INTO `emts_product_static_fields` (`id`, `field_name`, `field_label`, `options`, `display`) VALUES
(1, 'name', 'Product Name', '0', '1'),
(2, 'description', 'Product Description', '', '1'),
(3, 'auction_type', 'Auction Type', 'Public,Private', '1'),
(18, 'bid_decrement', 'Bid Decrement', '', '1'),
(19, 'auction_time_zone', 'Auction Time Zone', '', '1'),
(20, 'currency', 'Currency', '', '1'),
(21, 'auction_start_time', 'Auction Start Time', '', '1'),
(22, 'auction_end_time', 'Auction End Time', '', '1'),
(24, 'upload_photos', 'Upload Product Images', '', '0'),
(25, 'budget', 'Previous or Prospective Spend', '', '1'),
(26, 'auction_end_days', 'Auction End Days Hour Minute', '', '1');

-- --------------------------------------------------------

--
-- Table structure for table `emts_product_winner`
--

CREATE TABLE IF NOT EXISTS `emts_product_winner` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL DEFAULT '0',
  `bid_id` int(11) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL DEFAULT '0',
  `won_amount` double(20,2) NOT NULL DEFAULT '0.00',
  `product_close_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `payment_status` enum('Incomplete','Completed') CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT 'Incomplete',
  `email_sent` enum('yes','no') CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT 'no'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `emts_seo`
--

CREATE TABLE IF NOT EXISTS `emts_seo` (
  `id` int(11) NOT NULL,
  `seo_page_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `page_title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `meta_key` tinytext COLLATE utf8_unicode_ci NOT NULL,
  `meta_description` tinytext COLLATE utf8_unicode_ci NOT NULL,
  `created_date` datetime NOT NULL,
  `last_update` datetime NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `emts_seo`
--

INSERT INTO `emts_seo` (`id`, `seo_page_name`, `page_title`, `meta_key`, `meta_description`, `created_date`, `last_update`) VALUES
(1, 'home', 'High Tree Group : Home ', 'Home Page', 'Home Page', '2016-05-09 00:00:00', '2016-12-23 16:50:27'),
(2, 'contact-us', ':: The Hightree Contact Us ::', 'Contact-Us', 'Contact Us', '2016-05-09 07:26:28', '2016-12-23 22:15:21'),
(3, 'help', ':: The Hightree Help ::', 'Help', 'Help', '2016-05-09 09:37:30', '2016-06-06 12:12:50');

-- --------------------------------------------------------

--
-- Table structure for table `emts_site_settings`
--

CREATE TABLE IF NOT EXISTS `emts_site_settings` (
  `id` int(11) NOT NULL,
  `site_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `log_admin_activity` enum('N','Y') COLLATE utf8_unicode_ci NOT NULL COMMENT 'keep log of admins activity',
  `log_admin_invalid_login` enum('N','Y') COLLATE utf8_unicode_ci NOT NULL COMMENT 'keep log of admins invalid login ',
  `contact_email` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `contact_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `system_email_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `system_email` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `address1` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `address2` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `city` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `state` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `zip_code` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `country_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `site_status` enum('1','2','3') COLLATE utf8_unicode_ci NOT NULL DEFAULT '1' COMMENT '1=online, 2=offline, 3=maintainance',
  `user_activation` enum('0','1') COLLATE utf8_unicode_ci NOT NULL COMMENT 'need user activation after registration? 0=No, 1=Yes',
  `supplier_category_limit` int(2) NOT NULL COMMENT 'Limit No. of category choose by supplier to display as experience area',
  `facebook` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `facebook_app_id` bigint(20) NOT NULL,
  `twitter` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `rss_url` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `linkedin` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `google_plus` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `currency_sign` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `currency_code` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `google_analytics_code` tinytext COLLATE utf8_unicode_ci NOT NULL,
  `auction_post_activation` enum('0','1') COLLATE utf8_unicode_ci NOT NULL DEFAULT '0' COMMENT '0=No Activation Require, 1= Activation Require by admin',
  `no_auction_post_free` int(11) NOT NULL DEFAULT '99999' COMMENT '0=No Free Post, 99999=Unlimited',
  `is_auction_post_cost` enum('0','1') COLLATE utf8_unicode_ci NOT NULL DEFAULT '0' COMMENT '0=No Buy package Enable, 1=Buy Package Enable',
  `no_bid_place_free` int(11) NOT NULL DEFAULT '999999999' COMMENT '0=No Free Bid, 999999999=Unlimited',
  `is_bid_place_cost` enum('0','1') COLLATE utf8_unicode_ci NOT NULL DEFAULT '0' COMMENT '0=No Buy package Enable, 1=Buy Package Enable',
  `enable_rating` enum('Yes','No') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'No',
  `timezone` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sms_notification` enum('0','1') COLLATE utf8_unicode_ci NOT NULL DEFAULT '0' COMMENT '0=No, 1=Yes',
  `sms_gateway_url` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sms_api_username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sms_api_password` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `emts_site_settings`
--

INSERT INTO `emts_site_settings` (`id`, `site_name`, `log_admin_activity`, `log_admin_invalid_login`, `contact_email`, `contact_name`, `system_email_name`, `system_email`, `address1`, `address2`, `city`, `state`, `zip_code`, `country_name`, `site_status`, `user_activation`, `supplier_category_limit`, `facebook`, `facebook_app_id`, `twitter`, `rss_url`, `linkedin`, `google_plus`, `currency_sign`, `currency_code`, `google_analytics_code`, `auction_post_activation`, `no_auction_post_free`, `is_auction_post_cost`, `no_bid_place_free`, `is_bid_place_cost`, `enable_rating`, `timezone`, `sms_notification`, `sms_gateway_url`, `sms_api_username`, `sms_api_password`) VALUES
(1, 'www.thehightreegroup.com', 'N', 'Y', 'support@thehightreegroup.com', 'The High Tree Group', 'The High Tree Group', 'support@thehightreegroup.com', '', '', '', '', '', '', '1', '0', 5, 'http://www.facebook.com/', 405264519614040, '', 'http://www.rss.com/bidcy', 'http://www.linkedin.com/', '', 'US$', 'USD', '', '1', 5, '0', 5, '1', 'Yes', 'Europe/London', '0', 'http://testapi.comm', 'apiuser', 'apipassword');

-- --------------------------------------------------------

--
-- Table structure for table `emts_time_zone_setting`
--

CREATE TABLE IF NOT EXISTS `emts_time_zone_setting` (
  `id` int(11) NOT NULL,
  `utc_time_zone` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `gmt_time` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `status` enum('on','off') COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=151 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `emts_time_zone_setting`
--

INSERT INTO `emts_time_zone_setting` (`id`, `utc_time_zone`, `gmt_time`, `status`) VALUES
(1, '(GMT-10:00) Hawaii', '-10:00', 'off'),
(2, '(GMT-09:00) Alaska', '-09:00', 'off'),
(3, '(GMT-08:00) Pacific Time (US &amp; Canada)', '-08:00', 'off'),
(4, '(GMT-07:00) Arizona', '-07:00', 'off'),
(5, '(GMT-07:00) Mountain Time (US &amp; Canada)', '-07:00', 'off'),
(6, '(GMT-06:00) Central Time (US &amp; Canada)', '-06:00', 'off'),
(7, '(GMT-05:00) America/Indianapolis', '-05:00', 'off'),
(8, '(GMT-05:00) Eastern Time (US &amp; Canada)', '-05:00', 'off'),
(9, '(GMT-05:00) Indiana (East)', '-05:00', 'off'),
(10, '(GMT-11:00) American Samoa', '-11:00', 'off'),
(11, '(GMT-11:00) International Date Line West', '-11:00', 'off'),
(12, '(GMT-11:00) Midway Island', '-11:00', 'off'),
(13, '(GMT-08:00) Tijuana', '-08:00', 'off'),
(14, '(GMT-07:00) Chihuahua', '-07:00', 'off'),
(15, '(GMT-07:00) Mazatlan', '-07:00', 'off'),
(16, '(GMT-06:00) Central America', '-06:00', 'off'),
(17, '(GMT-06:00) Guadalajara', '-06:00', 'off'),
(18, '(GMT-06:00) Mexico City', '-06:00', 'off'),
(19, '(GMT-06:00) Monterrey', '-06:00', 'off'),
(20, '(GMT-06:00) Saskatchewan', '-06:00', 'off'),
(21, '(GMT-05:00) Bogota', '-05:00', 'off'),
(22, '(GMT-05:00) Lima', '-05:00', 'off'),
(23, '(GMT-05:00) Quito', '-05:00', 'off'),
(24, '(GMT-04:30) Caracas', '-04:30', 'off'),
(25, '(GMT-04:00) Atlantic Time (Canada)', '-04:00', 'off'),
(26, '(GMT-04:00) Georgetown', '-04:00', 'off'),
(27, '(GMT-04:00) La Paz', '-04:00', 'off'),
(28, '(GMT-03:30) Newfoundland', '-03:30', 'off'),
(29, '(GMT-03:00) Brasilia', '-03:00', 'off'),
(30, '(GMT-03:00) Buenos Aires', '-03:00', 'off'),
(31, '(GMT-03:00) Greenland', '-03:00', 'off'),
(32, '(GMT-03:00) Montevideo', '-03:00', 'off'),
(33, '(GMT-03:00) Santiago', '-03:00', 'off'),
(34, '(GMT-02:00) Mid-Atlantic', '-02:00', 'off'),
(35, '(GMT-01:00) Azores', '-01:00', 'off'),
(36, '(GMT-01:00) Cape Verde Is.', '-01:00', 'off'),
(37, '(GMT+00:00) Casablanca', '+00:00', 'off'),
(38, '(GMT+00:00) Dublin', '+00:00', 'off'),
(39, '(GMT+00:00) Edinburgh', '+00:00', 'off'),
(40, '(GMT+00:00) Lisbon', '+00:00', 'off'),
(41, '(GMT+00:00) London', '+00:00', 'off'),
(42, '(GMT+00:00) Monrovia', '+00:00', 'off'),
(43, '(GMT+00:00) UTC', '+00:00', 'off'),
(44, '(GMT+01:00) Amsterdam', '+01:00', 'off'),
(45, '(GMT+01:00) Belgrade', '+01:00', 'off'),
(46, '(GMT+01:00) Berlin', '+01:00', 'off'),
(47, '(GMT+01:00) Bern', '+01:00', 'off'),
(48, '(GMT+01:00) Bratislava', '+01:00', 'off'),
(49, '(GMT+01:00) Brussels', '+01:00', 'off'),
(50, '(GMT+01:00) Budapest', '+01:00', 'off'),
(51, '(GMT+01:00) Copenhagen', '+01:00', 'off'),
(52, '(GMT+01:00) Ljubljana', '+01:00', 'off'),
(53, '(GMT+01:00) Madrid', '+01:00', 'off'),
(54, '(GMT+01:00) Paris', '+01:00', 'off'),
(55, '(GMT+01:00) Prague', '+01:00', 'off'),
(56, '(GMT+01:00) Rome', '+01:00', 'off'),
(57, '(GMT+01:00) Sarajevo', '+01:00', 'off'),
(58, '(GMT+01:00) Skopje', '+01:00', 'off'),
(59, '(GMT+01:00) Stockholm', '+01:00', 'off'),
(60, '(GMT+01:00) Vienna', '+01:00', 'off'),
(61, '(GMT+01:00) Warsaw', '+01:00', 'off'),
(62, '(GMT+01:00) West Central Africa', '+01:00', 'off'),
(63, '(GMT+01:00) Zagreb', '+01:00', 'off'),
(64, '(GMT+02:00) Athens', '+02:00', 'off'),
(65, '(GMT+02:00) Bucharest', '+02:00', 'off'),
(66, '(GMT+02:00) Cairo', '+02:00', 'off'),
(67, '(GMT+02:00) Harare', '+02:00', 'off'),
(68, '(GMT+02:00) Helsinki', '+02:00', 'off'),
(69, '(GMT+02:00) Istanbul', '+02:00', 'off'),
(70, '(GMT+02:00) Jerusalem', '+02:00', 'off'),
(71, '(GMT+02:00) Kaliningrad', '+02:00', 'off'),
(72, '(GMT+02:00) Kyiv', '+02:00', 'off'),
(73, '(GMT+02:00) Pretoria', '+02:00', 'off'),
(74, '(GMT+02:00) Riga', '+02:00', 'off'),
(75, '(GMT+02:00) Sofia', '+02:00', 'off'),
(76, '(GMT+02:00) Tallinn', '+02:00', 'off'),
(77, '(GMT+02:00) Vilnius', '+02:00', 'off'),
(78, '(GMT+03:00) Baghdad', '+03:00', 'off'),
(79, '(GMT+03:00) Kuwait', '+03:00', 'off'),
(80, '(GMT+03:00) Minsk', '+03:00', 'off'),
(81, '(GMT+03:00) Moscow', '+03:00', 'off'),
(82, '(GMT+03:00) Nairobi', '+03:00', 'off'),
(83, '(GMT+03:00) Riyadh', '+03:00', 'off'),
(84, '(GMT+03:00) St. Petersburg', '+03:00', 'off'),
(85, '(GMT+03:00) Volgograd', '+03:00', 'off'),
(86, '(GMT+03:30) Tehran', '+03:30', 'off'),
(87, '(GMT+04:00) Abu Dhabi', '+04:00', 'off'),
(88, '(GMT+04:00) Baku', '+04:00', 'off'),
(89, '(GMT+04:00) Muscat', '+04:00', 'off'),
(90, '(GMT+04:00) Samara', '+04:00', 'off'),
(91, '(GMT+04:00) Tbilisi', '+04:00', 'off'),
(92, '(GMT+04:00) Yerevan', '+04:00', 'off'),
(93, '(GMT+04:30) Kabul', '+04:30', 'off'),
(94, '(GMT+05:00) Ekaterinburg', '+05:00', 'off'),
(95, '(GMT+05:00) Islamabad', '+05:00', 'off'),
(96, '(GMT+05:00) Karachi', '+05:00', 'off'),
(97, '(GMT+05:00) Tashkent', '+05:00', 'off'),
(98, '(GMT+05:30) Chennai', '+05:30', 'off'),
(99, '(GMT+05:30) Kolkata', '+05:30', 'off'),
(100, '(GMT+05:30) Mumbai', '+05:30', 'off'),
(101, '(GMT+05:30) New Delhi', '+05:30', 'off'),
(102, '(GMT+05:30) Sri Jayawardenepura', '+05:30', 'off'),
(103, '(GMT+05:45) Asia/Katmandu', '+05:45', 'on'),
(104, '(GMT+05:45) Kathmandu', '+05:45', 'off'),
(105, '(GMT+06:00) Almaty', '+06:00', 'off'),
(106, '(GMT+06:00) Astana', '+06:00', 'off'),
(107, '(GMT+06:00) Dhaka', '+06:00', 'off'),
(108, '(GMT+06:00) Novosibirsk', '+06:00', 'off'),
(109, '(GMT+06:00) Urumqi', '+06:00', 'off'),
(110, '(GMT+06:30) Rangoon', '+06:30', 'off'),
(111, '(GMT+07:00) Bangkok', '+07:00', 'off'),
(112, '(GMT+07:00) Hanoi', '+07:00', 'off'),
(113, '(GMT+07:00) Jakarta', '+07:00', 'off'),
(114, '(GMT+07:00) Krasnoyarsk', '+07:00', 'off'),
(115, '(GMT+08:00) Beijing', '+08:00', 'off'),
(116, '(GMT+08:00) Chongqing', '+08:00', 'off'),
(117, '(GMT+08:00) Hong Kong', '+08:00', 'off'),
(118, '(GMT+08:00) Irkutsk', '+08:00', 'off'),
(119, '(GMT+08:00) Kuala Lumpur', '+08:00', 'off'),
(120, '(GMT+08:00) Perth', '+08:00', 'off'),
(121, '(GMT+08:00) Singapore', '+08:00', 'off'),
(122, '(GMT+08:00) Taipei', '+08:00', 'off'),
(123, '(GMT+08:00) Ulaanbaatar', '+08:00', 'off'),
(124, '(GMT+09:00) Osaka', '+09:00', 'off'),
(125, '(GMT+09:00) Sapporo', '+09:00', 'off'),
(126, '(GMT+09:00) Seoul', '+09:00', 'off'),
(127, '(GMT+09:00) Tokyo', '+09:00', 'off'),
(128, '(GMT+09:00) Yakutsk', '+09:00', 'off'),
(129, '(GMT+09:30) Adelaide', '+09:30', 'off'),
(130, '(GMT+09:30) Darwin', '+09:30', 'off'),
(131, '(GMT+10:00) Brisbane', '+10:00', 'off'),
(132, '(GMT+10:00) Canberra', '+10:00', 'off'),
(133, '(GMT+10:00) Guam', '+10:00', 'off'),
(134, '(GMT+10:00) Hobart', '+10:00', 'off'),
(135, '(GMT+10:00) Magadan', '+10:00', 'off'),
(136, '(GMT+10:00) Melbourne', '+10:00', 'off'),
(137, '(GMT+10:00) Port Moresby', '+10:00', 'off'),
(138, '(GMT+10:00) Sydney', '+10:00', 'off'),
(139, '(GMT+10:00) Vladivostok', '+10:00', 'off'),
(140, '(GMT+11:00) New Caledonia', '+11:00', 'off'),
(141, '(GMT+11:00) Solomon Is.', '+11:00', 'off'),
(142, '(GMT+11:00) Srednekolymsk', '+11:00', 'off'),
(143, '(GMT+12:00) Auckland', '+12:00', 'off'),
(144, '(GMT+12:00) Fiji', '+12:00', 'off'),
(145, '(GMT+12:00) Kamchatka', '+12:00', 'off'),
(146, '(GMT+12:00) Marshall Is.', '+12:00', 'off'),
(147, '(GMT+12:00) Wellington', '+12:00', 'off'),
(148, '(GMT+12:45) Chatham Is.', '+12:45', 'off'),
(149, '(GMT+13:00) Samoa', '+13:00', 'off'),
(150, '(GMT+13:00) Tokelau Is.', '+13:00', 'off');

-- --------------------------------------------------------

--
-- Table structure for table `emts_transaction`
--

CREATE TABLE IF NOT EXISTS `emts_transaction` (
  `id` int(11) NOT NULL,
  `invoice_id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `order_id` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `product_id` int(11) NOT NULL,
  `bidpackage_id` int(11) NOT NULL,
  `amount` double(20,2) NOT NULL,
  `credit_get` int(10) NOT NULL,
  `credit_debit` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `transaction_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `transaction_date` datetime NOT NULL,
  `transaction_type` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `transaction_status` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `current_balance` int(11) NOT NULL,
  `payment_method` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'direct',
  `txn_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `gross_amount` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `pending_reason` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `payment_date` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `mc_fee` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `mc_gross` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `tax` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `mc_currency` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `txn_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `payer_email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `payer_status` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `payment_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `notify_version` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `verify_sign` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `date_creation` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `received_amount` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `receiver_email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `quantity` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `currency` varchar(20) COLLATE utf8_unicode_ci DEFAULT 'INR',
  `pay_type` enum('free','paid','unlimited') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'paid' COMMENT 'free,paid or unlimited'
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `emts_transaction`
--

INSERT INTO `emts_transaction` (`id`, `invoice_id`, `user_id`, `order_id`, `product_id`, `bidpackage_id`, `amount`, `credit_get`, `credit_debit`, `transaction_name`, `transaction_date`, `transaction_type`, `transaction_status`, `current_balance`, `payment_method`, `txn_id`, `gross_amount`, `pending_reason`, `payment_date`, `mc_fee`, `mc_gross`, `tax`, `mc_currency`, `txn_type`, `payer_email`, `payer_status`, `payment_type`, `notify_version`, `verify_sign`, `date_creation`, `received_amount`, `receiver_email`, `quantity`, `currency`, `pay_type`) VALUES
(1, 1477056410, 106, '', 1, 0, 1000.00, 0, 'DEBIT', 'Bid Fee For auction ID: 1', '2016-10-21 19:11:50', 'bid', 'Completed', 0, 'direct', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'INR', 'free'),
(2, 1477056452, 106, '', 1, 0, 700.00, 0, 'DEBIT', 'Bid Fee For auction ID: 1', '2016-10-21 19:12:32', 'bid', 'Completed', 0, 'direct', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'INR', 'free'),
(3, 1477056465, 106, '', 1, 0, 690.00, 0, 'DEBIT', 'Bid Fee For auction ID: 1', '2016-10-21 19:12:45', 'bid', 'Completed', 0, 'direct', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'INR', 'free'),
(4, 1477056507, 57, '', 1, 0, 990.00, 0, 'DEBIT', 'Bid Fee For auction ID: 1', '2016-10-21 19:13:27', 'bid', 'Completed', 0, 'direct', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'INR', 'free'),
(5, 1477056713, 57, '', 1, 0, 980.00, 0, 'DEBIT', 'Bid Fee For auction ID: 1', '2016-10-21 19:16:53', 'bid', 'Completed', 0, 'direct', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'INR', 'free'),
(6, 1477056719, 57, '', 1, 0, 600.00, 0, 'DEBIT', 'Bid Fee For auction ID: 1', '2016-10-21 19:16:59', 'bid', 'Completed', 0, 'direct', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'INR', 'free'),
(7, 0, 56, '', 0, 2, 500.00, 0, 'CREDIT', 'One Month unlimited', '2016-12-23 21:41:44', 'purchase_credit', 'Processing', 0, 'paypal', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'INR', 'paid'),
(8, 0, 56, '', 0, 9, 0.00, 0, 'CREDIT', 'Customized Package ', '2016-12-23 22:03:51', 'purchase_credit', 'Processing', 0, 'paypal', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'INR', 'paid'),
(9, 0, 56, '', 0, 0, 1000.00, 0, 'Debit', 'free', '2016-12-23 17:10:25', 'added_by_admin', 'Completed', 0, 'free', '', '', '', '', '', '', '', 'US$', '', '', '', '', '', '', '', '', '', '', 'INR', 'paid'),
(10, 0, 56, '', 0, 0, 100.00, 0, 'Debit', 'q', '2016-12-23 17:11:04', 'added_by_admin', 'Completed', 0, 'free', '', '', '', '', '', '', '', 'US$', '', '', '', '', '', '', '', '', '', '', 'INR', 'paid'),
(11, 0, 56, '', 0, 0, 400.00, 0, 'Debit', 'liu', '2016-12-23 17:12:57', 'added_by_admin', 'Completed', 0, 'free', '', '', '', '', '', '', '', 'US$', '', '', '', '', '', '', '', '', '', '', 'INR', 'paid');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `emts_admin_permissions`
--
ALTER TABLE `emts_admin_permissions`
  ADD PRIMARY KEY (`permission_id`), ADD UNIQUE KEY `code` (`code`);

--
-- Indexes for table `emts_admin_roles_permission`
--
ALTER TABLE `emts_admin_roles_permission`
  ADD PRIMARY KEY (`user_type`,`permission_id`), ADD KEY `FK_ROLES_PERMS_PERMS_ID` (`permission_id`);

--
-- Indexes for table `emts_block_ips`
--
ALTER TABLE `emts_block_ips`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `emts_ci_sessions`
--
ALTER TABLE `emts_ci_sessions`
  ADD PRIMARY KEY (`session_id`), ADD KEY `last_activity_idx` (`last_activity`);

--
-- Indexes for table `emts_cms`
--
ALTER TABLE `emts_cms`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `emts_cms_others`
--
ALTER TABLE `emts_cms_others`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `emts_communication`
--
ALTER TABLE `emts_communication`
  ADD PRIMARY KEY (`id`), ADD KEY `product_id` (`product_id`), ADD KEY `user_id` (`user_id`), ADD KEY `bid_id` (`bid_id`);

--
-- Indexes for table `emts_communication_attachment`
--
ALTER TABLE `emts_communication_attachment`
  ADD PRIMARY KEY (`id`), ADD KEY `msg_id` (`msg_id`);

--
-- Indexes for table `emts_communication_earlier`
--
ALTER TABLE `emts_communication_earlier`
  ADD PRIMARY KEY (`id`), ADD KEY `sender` (`sender`), ADD KEY `receiver` (`receiver`);

--
-- Indexes for table `emts_country`
--
ALTER TABLE `emts_country`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `emts_email_settings`
--
ALTER TABLE `emts_email_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `emts_help`
--
ALTER TABLE `emts_help`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `emts_log_admin_activity`
--
ALTER TABLE `emts_log_admin_activity`
  ADD PRIMARY KEY (`log_id`);

--
-- Indexes for table `emts_log_invalid_logins`
--
ALTER TABLE `emts_log_invalid_logins`
  ADD PRIMARY KEY (`log_id`);

--
-- Indexes for table `emts_members`
--
ALTER TABLE `emts_members`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `emts_membership_package`
--
ALTER TABLE `emts_membership_package`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `emts_members_details`
--
ALTER TABLE `emts_members_details`
  ADD PRIMARY KEY (`id`), ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `emts_member_expertise`
--
ALTER TABLE `emts_member_expertise`
  ADD PRIMARY KEY (`id`), ADD KEY `user_id` (`user_id`), ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `emts_member_notification_settings`
--
ALTER TABLE `emts_member_notification_settings`
  ADD PRIMARY KEY (`id`), ADD KEY `email_template_id` (`email_template_id`);

--
-- Indexes for table `emts_member_rating`
--
ALTER TABLE `emts_member_rating`
  ADD PRIMARY KEY (`rating_id`);

--
-- Indexes for table `emts_message`
--
ALTER TABLE `emts_message`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `emts_meta_categories`
--
ALTER TABLE `emts_meta_categories`
  ADD KEY `field_id` (`field_id`), ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `emts_meta_fields`
--
ALTER TABLE `emts_meta_fields`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `emts_meta_products`
--
ALTER TABLE `emts_meta_products`
  ADD KEY `product_id` (`product_id`), ADD KEY `meta_fields_id` (`meta_fields_id`);

--
-- Indexes for table `emts_news_letter`
--
ALTER TABLE `emts_news_letter`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `emts_payment_gateway`
--
ALTER TABLE `emts_payment_gateway`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `emts_products`
--
ALTER TABLE `emts_products`
  ADD PRIMARY KEY (`id`), ADD KEY `seller_id` (`seller_id`), ADD KEY `cat_id` (`cat_id`), ADD KEY `sub_cat_id` (`sub_cat_id`);

--
-- Indexes for table `emts_product_bids`
--
ALTER TABLE `emts_product_bids`
  ADD PRIMARY KEY (`id`), ADD KEY `product_id` (`product_id`), ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `emts_product_categories`
--
ALTER TABLE `emts_product_categories`
  ADD PRIMARY KEY (`id`), ADD KEY `prent_id` (`parent_id`);

--
-- Indexes for table `emts_product_currency`
--
ALTER TABLE `emts_product_currency`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `emts_product_images`
--
ALTER TABLE `emts_product_images`
  ADD PRIMARY KEY (`id`), ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `emts_product_images_temp`
--
ALTER TABLE `emts_product_images_temp`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `emts_product_invitation`
--
ALTER TABLE `emts_product_invitation`
  ADD PRIMARY KEY (`id`), ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `emts_product_post_categories`
--
ALTER TABLE `emts_product_post_categories`
  ADD PRIMARY KEY (`id`), ADD KEY `user_id` (`user_id`), ADD KEY `category_id` (`category_id`), ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `emts_product_static_fields`
--
ALTER TABLE `emts_product_static_fields`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `emts_product_winner`
--
ALTER TABLE `emts_product_winner`
  ADD PRIMARY KEY (`id`), ADD KEY `product_id` (`product_id`), ADD KEY `member_id` (`user_id`);

--
-- Indexes for table `emts_seo`
--
ALTER TABLE `emts_seo`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `emts_site_settings`
--
ALTER TABLE `emts_site_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `emts_time_zone_setting`
--
ALTER TABLE `emts_time_zone_setting`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `emts_transaction`
--
ALTER TABLE `emts_transaction`
  ADD PRIMARY KEY (`id`), ADD KEY `user_id` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `emts_admin_permissions`
--
ALTER TABLE `emts_admin_permissions`
  MODIFY `permission_id` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=91;
--
-- AUTO_INCREMENT for table `emts_block_ips`
--
ALTER TABLE `emts_block_ips`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `emts_cms`
--
ALTER TABLE `emts_cms`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `emts_cms_others`
--
ALTER TABLE `emts_cms_others`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `emts_communication`
--
ALTER TABLE `emts_communication`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `emts_communication_attachment`
--
ALTER TABLE `emts_communication_attachment`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `emts_communication_earlier`
--
ALTER TABLE `emts_communication_earlier`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `emts_country`
--
ALTER TABLE `emts_country`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=199;
--
-- AUTO_INCREMENT for table `emts_email_settings`
--
ALTER TABLE `emts_email_settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=61;
--
-- AUTO_INCREMENT for table `emts_help`
--
ALTER TABLE `emts_help`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `emts_log_admin_activity`
--
ALTER TABLE `emts_log_admin_activity`
  MODIFY `log_id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `emts_log_invalid_logins`
--
ALTER TABLE `emts_log_invalid_logins`
  MODIFY `log_id` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `emts_members`
--
ALTER TABLE `emts_members`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=111;
--
-- AUTO_INCREMENT for table `emts_membership_package`
--
ALTER TABLE `emts_membership_package`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `emts_members_details`
--
ALTER TABLE `emts_members_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=108;
--
-- AUTO_INCREMENT for table `emts_member_expertise`
--
ALTER TABLE `emts_member_expertise`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=53;
--
-- AUTO_INCREMENT for table `emts_member_notification_settings`
--
ALTER TABLE `emts_member_notification_settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=707;
--
-- AUTO_INCREMENT for table `emts_member_rating`
--
ALTER TABLE `emts_member_rating`
  MODIFY `rating_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=18;
--
-- AUTO_INCREMENT for table `emts_message`
--
ALTER TABLE `emts_message`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `emts_meta_fields`
--
ALTER TABLE `emts_meta_fields`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'primary key',AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `emts_news_letter`
--
ALTER TABLE `emts_news_letter`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `emts_payment_gateway`
--
ALTER TABLE `emts_payment_gateway`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `emts_products`
--
ALTER TABLE `emts_products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `emts_product_bids`
--
ALTER TABLE `emts_product_bids`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `emts_product_categories`
--
ALTER TABLE `emts_product_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=104;
--
-- AUTO_INCREMENT for table `emts_product_currency`
--
ALTER TABLE `emts_product_currency`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `emts_product_images`
--
ALTER TABLE `emts_product_images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `emts_product_images_temp`
--
ALTER TABLE `emts_product_images_temp`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `emts_product_invitation`
--
ALTER TABLE `emts_product_invitation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `emts_product_post_categories`
--
ALTER TABLE `emts_product_post_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `emts_product_static_fields`
--
ALTER TABLE `emts_product_static_fields`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=29;
--
-- AUTO_INCREMENT for table `emts_product_winner`
--
ALTER TABLE `emts_product_winner`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `emts_seo`
--
ALTER TABLE `emts_seo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `emts_site_settings`
--
ALTER TABLE `emts_site_settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `emts_time_zone_setting`
--
ALTER TABLE `emts_time_zone_setting`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=151;
--
-- AUTO_INCREMENT for table `emts_transaction`
--
ALTER TABLE `emts_transaction`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=12;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
