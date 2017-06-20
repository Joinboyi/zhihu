/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50087
Source Host           : 127.0.0.1:3306
Source Database       : zh

Target Server Type    : MYSQL
Target Server Version : 50087
File Encoding         : 65001

Date: 2017-06-07 10:18:27
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `comment_id` int(11) NOT NULL auto_increment,
  `comment_content` varchar(255) default NULL,
  `comment_time` datetime default NULL,
  `reply_id` int(11) default NULL,
  `hf_user_id` int(11) default NULL,
  `bhf_user_id` int(11) default NULL,
  PRIMARY KEY  (`comment_id`),
  KEY `FK9BDE863FC84B6CF1` (`hf_user_id`),
  KEY `FK9BDE863F5FA27F22` (`reply_id`),
  KEY `FK9BDE863FC7D7DAD3` (`bhf_user_id`),
  CONSTRAINT `FK9BDE863FC7D7DAD3` FOREIGN KEY (`bhf_user_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `FK9BDE863F5FA27F22` FOREIGN KEY (`reply_id`) REFERENCES `reply` (`reply_id`),
  CONSTRAINT `FK9BDE863FC84B6CF1` FOREIGN KEY (`hf_user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES ('1', '自己手里有“枪”肯定要好好利用了', '2017-06-06 10:09:11', '1', '2', '1');
INSERT INTO `comment` VALUES ('2', '这也是哥哥自愿而且是哥哥想的办法啊', '2017-06-01 10:10:13', '1', '1', '2');
INSERT INTO `comment` VALUES ('3', '还有各种过程略，易得知，易证明，', '2017-06-07 10:13:17', '2', '3', '1');

-- ----------------------------
-- Table structure for like
-- ----------------------------
DROP TABLE IF EXISTS `like`;
CREATE TABLE `like` (
  `like_id` int(11) NOT NULL auto_increment,
  `like_time` datetime default NULL,
  `reply_id` int(11) default NULL,
  `user_id` int(11) default NULL,
  PRIMARY KEY  (`like_id`),
  KEY `FK2423B75FA27F22` (`reply_id`),
  KEY `FK2423B7EAA19732` (`user_id`),
  CONSTRAINT `FK2423B7EAA19732` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `FK2423B75FA27F22` FOREIGN KEY (`reply_id`) REFERENCES `reply` (`reply_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of like
-- ----------------------------
INSERT INTO `like` VALUES ('1', '2017-06-07 10:08:41', '1', '2');
INSERT INTO `like` VALUES ('2', '2017-06-07 10:12:30', '2', '3');
INSERT INTO `like` VALUES ('3', '2017-06-07 10:12:34', '1', '3');

-- ----------------------------
-- Table structure for reply
-- ----------------------------
DROP TABLE IF EXISTS `reply`;
CREATE TABLE `reply` (
  `reply_id` int(11) NOT NULL auto_increment,
  `reply_content` varchar(2000) default NULL,
  `reply_time` datetime default NULL,
  `topic_id` int(11) default NULL,
  `user_id` int(11) default NULL,
  PRIMARY KEY  (`reply_id`),
  KEY `FK4B322CAEAA19732` (`user_id`),
  KEY `FK4B322CA404F9D02` (`topic_id`),
  CONSTRAINT `FK4B322CA404F9D02` FOREIGN KEY (`topic_id`) REFERENCES `topic` (`topic_id`),
  CONSTRAINT `FK4B322CAEAA19732` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of reply
-- ----------------------------
INSERT INTO `reply` VALUES ('1', '<p>初中学校的一个老师，这个老师有一对双胞胎儿子，大概大我三四届的样子，所以我还在初中的时候，他两个儿子已经上高中了。</p><p>两个儿子中哥哥学习比较好，能上重点一本的那种，弟弟比较差，发挥的好能够着二本的分数线，发挥的一般弄不好只能上三本了。（我们这边是高考大省，重点一本和普通二本之间的分数差距还是很大的。）</p><p>到了高考的时候，因为两个人是一起上学的，所以都要高考了。但是如果就这样去考，弟弟可能就要走一个三本或者普通二本了。</p><p>后来哥哥想了一个办法，在高考的时候，两个人互换，哥哥去替弟弟考，弟弟给哥哥考。</p><p>结果最后查分数出来，弟弟的分数果然上了一本，而哥哥只是三本的分数，然后弟弟就去上大学了。</p><p>哥哥回来复读了一年，（我们那时候是可以复读的，但现在好像有规定不可以了）第二年再次考上重点一本。</p><p>兄弟俩都上了很好的学校，（不是同一所学校）就是哥哥比弟弟晚了一届。</p>', '2017-06-07 10:08:23', '1', '2');
INSERT INTO `reply` VALUES ('2', '<p>上小学时候吧，我和我爸窝在家里看《英雄本色》，电视上发哥正笑眯眯地用美元点一支烟，当时看得我...我的天哪！我要是个姑娘我早湿一裤裆了！我爸瞅了瞅我，问：＂酷不酷？想不想学？＂好吧不是这么说的，反正是那么个意思。我：“不太好吧？”我爸：“没事，别让你妈知道就行。”</p><p>到饭点我爸被我妈轰下去买盐，我爸给了我一个眼神，我立马屁颠屁颠跟出去了，到了小卖部我爸让我在外面等着，等了好一会我爸才偷偷摸摸出来塞给我一颗烟，我小心肝扑通扑通的，两只手颤颤巍巍像电视里捧圣旨那样捧着那颗烟，努力像发哥那样斜着脑壳露出蜜汁微笑，然后凑到嘴前吸了一大口。然后我就开始咳嗽、剧烈的咳嗽，鼻腔里像被火烧过，从喉咙到肺都像有人用针刺那种感觉，我爸给我拍了拍背，递给我一瓶水，安慰我：“没事，第一次都这样，明天我再给你一根就好多了。”</p><p>第二天我爸偷偷摸摸问我：“还想不想试试？” 我咬着牙说：“试试就试试” 还是咳嗽、剧烈的咳嗽，鼻腔里像被火烧过，从喉咙到肺都像有人用针刺......我爸很疑惑的样子：“哎呀，你这都第二次了不应该这样啊？”突然他一拍头：“我知道了，有的人嗓子对烟过敏，抽不来烟的。别人抽烟没事，有的人一抽烟嗓子就烧得特别难受。”我一边咳嗽一边拼命点头：“我就是这样....咳.....”</p><p>这么多年来我一直觉得自己体质特殊，直到我爸有一次喝多了告诉我，我第一次抽的烟里加了辣椒面。</p>', '2017-06-07 10:12:21', '1', '3');
INSERT INTO `reply` VALUES ('3', '<p><span style=\"color: rgb(38, 38, 38); font-size: 15px;\">这种故事发生在每次写完数学题翻答案的时候</span><br></p>', '2017-06-07 10:15:10', '1', '4');
INSERT INTO `reply` VALUES ('4', '<p>以下手工翻译自stackoverflow，由于只是大学学过C#，大部分时间都是写Java，所以只翻译部分能看懂的回答。</p><ul><li>泛型不一样，Java泛型只是编译时的，但C#的泛型在运行时也被维持，而且适用于value types 和 reference types</li><li>C# 没有 checked exceptions</li><li>Java 不允许建立user-defined 的value types</li><li>Java 不允许运算符重载</li><li>Java 没有类似LINQ的特性</li><li>Java 不支持委托</li><li>C# 没有匿名内部类</li><li>C#没有像java 那样的内部类，所有的nested classes 其实都像Java 的静态nested classses</li><li>Java 没有静态类</li><li>Java 没有 扩展方法（extension methods）</li><li>两者的访问修饰符有一定区别 </li><li>两者初始化（initialization）的顺序有一定不同。C#初始化变量后才调用父类的构造方法</li><li>Java 没有类似“properties”的东西，而是约定俗成为getter 和setter</li><li>Java 没有类似与\"unsafe\"的特性</li><li>两者的枚举（enums）有一定的不同，Java的更加面向对象</li><li>Java的参数只能传值，没有类似于C#的ref 和out 传递引用。（注：Java 传递对象只是传递对象引用的copy）</li><li>Java 没有partial types</li><li>C# 的interface 不能定义字段</li><li>Java 没有unsigned 的整形</li><li>Java 没有类型与nullable 的value types</li></ul>', '2017-06-07 10:16:24', '2', '4');
INSERT INTO `reply` VALUES ('5', '<p>微软的c#设计者更注重一线开发人员的感受，为方便开发提高效率，他们愿意大费周章改善语言本身各方特性，不断加入语法糖，从泛型，nullable，隐式类型到lamada再到dynamic，awaitasyc等等都可看到其一直在围绕代码整洁，减少bug等实际的开发过程中问题来进行的改进，同时越来越智能的IDE也说明了这点。</p><p>而java设计者则不同，他们的关注点在于java应用系统本身，更好的降低耦合，保持OOP是其始终坚持的。同时也应该不难发现，社区对java应用架构师提出的各类尖锐问题反馈总是较为及时，而对java应用开发者则相对冷淡些。正因此，使用java开发的大型应用系统相比同等代码量c#开发出的系统至少在系统结构上要比c#更加美观，易维护，代码变腐烂的速度也更慢。加上java及linux均为开源产品，许多大型公司又在基于成本的考虑上最终还是选择使用java进行应用系统开发。<br>最后拿泛型举例看看c#和java对待同一问题时各方的区别:c#在2.0中为推出泛型特性是对预编译，编译及运行时做了根本性改变的，而java设计者则显然不够\"诚意\"，他们在预编译期直接将泛型\"处理\"掉了，你在运行时根本看不到泛型这一特性。我臆测java设计者可能认为即使没有泛型，应用系统设计师通过优秀的程序设计是可以解决list类型不一致问题的，这种通过添加语法规则规避问题的做法实际是懒惰思维，添加了泛型支持也只是向社区的呼声做了一次妥协。<br>面对同一问题采用不同处理方法的结果是，c#基于泛型后续衍生出了lamada，linq等一系列更能提高开发效率的语法利器，而java因有了泛型的强制约束使得java开源中间件变得更加稳定，同时可以看到后续的许多开源中间件产品体量也变得更大，功能也开始更加大胆。这也算是通过泛型确保类型一致带来的好处之一吧。<br>所以，虽语法非常相似，但关注方向并不相同的两种语言至少目前来说区分优劣为时尚早了些，但就趋势来说，c#的发展势头要更为强劲，不去关注两种语言本身，就平台而言，微软对c#的掌控力要绝对优于java社区对java平台的掌控力，c#设计者在改造c#语言时不需要做出太多妥协，他们考虑最多的只是5.0如何向4.5兼容，4.5如何向4.0兼容，而java在发展的过程中每一步跨越需要考虑的则更多。同时，最要命的，java的一切设计都是牢牢基于面向对象的，然而从实际的开发经验来看，现实世界中的许多问题并不能单纯依靠面向对象来解决，牵强使用OOP给实际系统开发已经带来不少的负面影响，例如，红苹果到底是苹果的子类还是红色是苹果的一个属性?有人会觉得这要联系上下文才能知道究竟应该如何定义这颗苹果，然而联系上下文的过程本身就是一个寻找妥协的过程，可以符合当前系统设计要求，但，不代表系统需求不会改变，而在敏捷开发中，我们首先要树立的思想便是\"需求是迟早会变的\"，这种矛盾在面向对象的开发过程中会长期相伴。回头再看c#，虽然其出身也是彻头彻尾的面向对象，然而在其后续的演进过程中似乎并未把OOP放在眼里，到c# 3时干脆加入了具有函数式编程特性的linq，而当其与原先就支持的委托特性结合时，其强大之处就可见一斑了，原先需要使用OOP思想编写的大量\"难看\"代码linq居然只要几行就能搞定，且更加符合自然语言表达。而java支持lamda似乎是linq推出整整6年(也许还不止)后的最近了。</p><p>回到问题本身回答题主，综上，C#和JAVA的区别有很多，而最大的区别在于他们的语言(平台)设计者的关注点并不相同。</p><p>手机打字，部分语句不通顺望见谅。</p>', '2017-06-07 10:17:53', '2', '5');

-- ----------------------------
-- Table structure for section
-- ----------------------------
DROP TABLE IF EXISTS `section`;
CREATE TABLE `section` (
  `section_id` int(11) NOT NULL auto_increment,
  `section_name` varchar(255) default NULL,
  `section_summary` varchar(255) default NULL,
  PRIMARY KEY  (`section_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of section
-- ----------------------------
INSERT INTO `section` VALUES ('1', '脑洞', null);
INSERT INTO `section` VALUES ('2', 'JAVA', null);

-- ----------------------------
-- Table structure for topic
-- ----------------------------
DROP TABLE IF EXISTS `topic`;
CREATE TABLE `topic` (
  `topic_id` int(11) NOT NULL auto_increment,
  `topic_name` varchar(255) default NULL,
  `topic_summary` varchar(255) default NULL,
  `topic_time` datetime default NULL,
  `topic_pageviews` int(11) default NULL,
  `section_id` int(11) default NULL,
  `user_id` int(11) default NULL,
  PRIMARY KEY  (`topic_id`),
  KEY `FK4D3DD0FEAA19732` (`user_id`),
  KEY `FK4D3DD0F6FD3EF42` (`section_id`),
  CONSTRAINT `FK4D3DD0F6FD3EF42` FOREIGN KEY (`section_id`) REFERENCES `section` (`section_id`),
  CONSTRAINT `FK4D3DD0FEAA19732` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of topic
-- ----------------------------
INSERT INTO `topic` VALUES ('1', '有哪些「还有这种操作？」的故事？', '<p><span style=\"color: rgb(38, 38, 38); font-size: 15px;\">相关问题：</span><a href=\"https://www.zhihu.com/question/59902130\">你在游戏中遇到过哪些“居然还有这种操作”的故事？ - 知乎</a><br></p>', '2017-06-07 10:06:06', '0', '1', '1');
INSERT INTO `topic` VALUES ('2', 'Java 和 C# 最大的不同是什么？', '', '2017-06-07 10:16:06', '0', '2', '4');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `user_id` int(11) NOT NULL auto_increment,
  `user_account` varchar(255) default NULL,
  `user_name` varchar(255) default NULL,
  `user_password` varchar(255) default NULL,
  `user_head_image` varchar(255) default NULL,
  `user_summary` varchar(255) default NULL,
  PRIMARY KEY  (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', '110', '张三', '123', 'images/tx1.jpg', '腹中贮书一万卷，不肯低头在草莽');
INSERT INTO `user` VALUES ('2', '120', '夜逸晨', '123', 'images/tx4.jpg', '倒霉孩子');
INSERT INTO `user` VALUES ('3', '130', '王喇嘛', '123', 'images/tx5.jpg', '中二少年');
INSERT INTO `user` VALUES ('4', '140', '有礼貌的霹雳火', '123', 'images/tx6.jpg', '我爹是木匠，我也是');
INSERT INTO `user` VALUES ('5', '150', '匿名用户', '123', 'images/tx3.jpg', '这个人很懒，什么都没留下');

-- ----------------------------
-- Table structure for user_section
-- ----------------------------
DROP TABLE IF EXISTS `user_section`;
CREATE TABLE `user_section` (
  `section_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY  (`user_id`,`section_id`),
  KEY `FKD05F1671EAA19732` (`user_id`),
  KEY `FKD05F16716FD3EF42` (`section_id`),
  CONSTRAINT `FKD05F16716FD3EF42` FOREIGN KEY (`section_id`) REFERENCES `section` (`section_id`),
  CONSTRAINT `FKD05F1671EAA19732` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_section
-- ----------------------------
