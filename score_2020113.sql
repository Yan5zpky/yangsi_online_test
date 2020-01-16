/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : score

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2020-01-13 22:30:45
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for exercise
-- ----------------------------
DROP TABLE IF EXISTS `exercise`;
CREATE TABLE `exercise` (
  `e_id` int(11) NOT NULL AUTO_INCREMENT,
  `first_pid` int(11) DEFAULT NULL COMMENT '这套题第一道题的序号',
  `name` varchar(255) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `is_active` int(2) DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT current_timestamp(),
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  PRIMARY KEY (`e_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of exercise
-- ----------------------------
INSERT INTO `exercise` VALUES ('1', '1', '信息科技练习1', '2018学年上海市信息学业水平考试，模拟上机考第一套', '1', '2020-01-03 12:30:23', '2020-01-03 14:25:06');
INSERT INTO `exercise` VALUES ('2', null, '信息科技练习2', '2018学年上海市信息学业水平考试，模拟上机考第二套', '1', '2020-01-03 13:51:09', '2020-01-03 14:25:10');

-- ----------------------------
-- Table structure for migration
-- ----------------------------
DROP TABLE IF EXISTS `migration`;
CREATE TABLE `migration` (
  `version` varchar(180) NOT NULL,
  `apply_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of migration
-- ----------------------------
INSERT INTO `migration` VALUES ('m000000_000000_base', '1578371162');

-- ----------------------------
-- Table structure for problem
-- ----------------------------
DROP TABLE IF EXISTS `problem`;
CREATE TABLE `problem` (
  `p_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '题目id',
  `e_id` int(11) DEFAULT NULL COMMENT '练习id',
  `xuhao` varchar(255) DEFAULT NULL COMMENT '题目在练习中的序号',
  `content` varchar(255) DEFAULT '' COMMENT '题目内容',
  `A_option` varchar(255) DEFAULT NULL,
  `B_option` varchar(255) DEFAULT NULL,
  `C_option` varchar(255) DEFAULT NULL,
  `D_option` varchar(255) DEFAULT NULL,
  `fill_blank` varchar(255) DEFAULT NULL,
  `answer` varchar(255) DEFAULT NULL,
  `analysis` varchar(255) DEFAULT NULL COMMENT '解析',
  `create_time` timestamp NULL DEFAULT current_timestamp(),
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  PRIMARY KEY (`p_id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of problem
-- ----------------------------
INSERT INTO `problem` VALUES ('1', '1', '1', '以下关于十六进制位权的描述，正确的是（）。\r\n', '右起第二位码对应的位权是16的1次方', '左起第二位码对应的位权是16的2次方', '左起第二位码对应的位权是16的1次方', '右起第二位码对应的位权是16的2次方', null, 'A', '十六进制从右往左起，第一位的位权为16的0次方，以此类推', '2020-01-03 12:32:13', '2020-01-03 14:14:27');
INSERT INTO `problem` VALUES ('2', '1', '2', '计算机网络具有强大的功能，以下应用能够体现网络分布式处理的功能是（）。\r\n', '广播教学', '共享学习资料', '火车票代售', '发送电子邮件', null, 'C', null, '2020-01-08 09:08:08', '2020-01-08 09:09:00');
INSERT INTO `problem` VALUES ('3', '1', '3', '以下关于信息传输系统的描述．正确的是（）。', '信息传输无需遵守统一的约定和标准', '信息传输的主题通常只有发送方', '信息传输系统一般由传输主题、传输媒介和传输规则三个部分组成', '信息传输的过程不需要建立通道', null, 'C', null, '2020-01-08 09:09:41', '2020-01-08 09:11:20');
INSERT INTO `problem` VALUES ('4', '1', '4', '以下关于网络协议的描述，正确的是（）。\r\n', '网络协议的主要作用就是修正被传输信息中的数据错误', '用网线完成两台计算机直连进行数据传输，则不需要安装网络协议', '网络中的计算机只能安装一种网络协议', '网络协议不仅可以在广域网中使用，也能用于局域网', null, 'D', null, '2020-01-08 09:12:22', '2020-01-08 09:16:49');
INSERT INTO `problem` VALUES ('5', '1', '5', '一台己经物理接入网络的计算机经过下列选项中的配置后，能够正常使用域名访问网站的是（）。', 'A', 'B', 'C', 'D', null, 'A', null, '2020-01-08 09:19:03', '2020-01-13 19:04:17');
INSERT INTO `problem` VALUES ('6', '1', '6', '小明在录制一字音频前，仔细查看了电脑的声卡设置，发现有下图所示的参数组合可供选择。若小明选用录音效果最好的参数组合录制一段10秒的wav格式立体声音频，所得音频的数据量为（）。', '11250KB', '1125KB', '5625KB', '2825KB', null, 'A', null, '2020-01-08 09:14:07', '2020-01-08 09:16:53');
INSERT INTO `problem` VALUES ('7', '1', '7', '小明在摸索一种新的編程语言时发现，代码chr(65)得到的反愦结果是\'A\'。他推断在该语言中chr()函数的作用是以ASCII码对应的十进制数作为参数,求参数在ASCII码表中对应的字符。沿看这一思路推\r\n测，执行chr(99)得到的结果可能是（）。', '控制字符', '大写英文字符', '小写英文字符', '阿拉伯数字', null, 'B', null, '2020-01-08 09:14:44', '2020-01-08 09:16:55');
INSERT INTO `problem` VALUES ('8', '1', '8', 'A、B两栋大楼都有各自独立的计算机网络系统，两栋大楼之间的直线距离超过100米。如果想要把这两栋楼的网络连接起来，下列通信介质中最合适的是（）。', 'A', 'B', 'C', 'D', null, 'A', null, '2020-01-08 09:18:09', '2020-01-13 19:26:52');
INSERT INTO `problem` VALUES ('9', '1', '9', '某公司规定产品编号的固定长度为12个字符。在遵循唯一性的原则下，可以编出更多产品编码的方案是（）。', '用十进制和大写英文字作为编码字符', '用二进制数作为编码字符', '用大小写英文字母作为编码字符', '用十进制数作为編码字符', null, 'C', null, '2020-01-03 13:05:14', '2020-01-13 19:40:40');
INSERT INTO `problem` VALUES ('10', '1', '10', '小明希望将一段据量为7.7G、mpeg格式的珍贵历史影像上传至某网盘备份，但是该网盘对非会员上传的单个文件数据量限制为4GB。为了让这段视频在不损失质量的前提下成功上传，下列操作方案中最合理的是（）。', '使用Winrar软件，在默认设置状态下，即可得到一个小于4GB的压缩包', '使用某视频编辑软件，截去视频的片头和片尾，寻出分辨率较小的视频文件', '在Winrar软件中设置切分分卷的据量上限为3.5GB，再将生成的多个压缩分卷分别上传', '使用某视频编辑软件，将视频的播放速率调为原来的2倍，导出视频文件', null, 'C', null, '2020-01-08 09:18:48', '2020-01-13 19:39:51');
INSERT INTO `problem` VALUES ('11', '1', '11', '关于汉字的字形码，下列说法错误的是（）。\r\n', '用16×16的点阵表示一个汉字，其字形码占32字节', '用点阵方式表示汉字字形时可随意放大，效果不失真', '汉字字形码可以用点阵的方式表示，也可用矢量的方式表示', '只要知道汉字点阵的大小，就可以算出存储该点阵所需占用的空间', null, 'B', '只有矢量图放大缩小不会失真', '2020-01-03 13:13:10', '2020-01-08 09:18:22');
INSERT INTO `problem` VALUES ('12', '1', '12', '小明刷卡时意外地发现，机器上显示的余额为11111010元。后经了解，原来是刷卡机错将十进制数显示为了二进制数。那么，小明卡里的余额用十进制数表示为（）。\r\n', '252元', '250元', '500元', '25元', null, 'B', null, '2020-01-08 09:17:32', '2020-01-08 09:18:37');
INSERT INTO `problem` VALUES ('13', '1', '13', '下列关于压缩方式的叙述，错误的是（）。', '对程序适含选用无损压缩的方式', '将aaaaabbcccccc表示为a5 b2 c6是无损压缩', '将40位学生提交的文档作业打成一个压缩包是无损压缩', '将wav格式的数字音频转为wma格式是无损压缩', null, 'D', null, '2020-01-08 09:20:20', null);
INSERT INTO `problem` VALUES ('14', '1', '14', '以下地铁闸机系统的信息处理过程中，输入信息的是（）。\r\n', '显示余额', '读交通卡', '打开闸门', '计算票价', null, 'B', null, '2020-01-08 09:21:04', null);
INSERT INTO `problem` VALUES ('15', '1', '15', '以下关于TCP/IP协议的描述，正确的是（）。', '发送方可根据TCP协议为每个分组选择最佳的传输路径', 'TCP协议能够按照每个分组的编号将分组重新组合成原始数据', 'IP协议提供一种可靠的传输', 'TCP/IP协议只包括HTTP和POP3,不包括IMAP', null, 'C', null, '2020-01-08 09:21:35', '2020-01-08 09:23:17');
INSERT INTO `problem` VALUES ('16', '1', '16', '人工智能是计算机科学的一个分支。人工智能领域的研究包括祖器人、语言识别、图像识别、自然语言处理和专家系统等。以下不属于人工智能技术应用范畴的是（）。', '扫二维码付款', '水下探测机器人', '人机围棋对弈', '输入语音自动转换为文字', null, 'A', null, '2020-01-08 09:24:12', null);
INSERT INTO `problem` VALUES ('17', '1', '17', '以下关于计算机结构的描述，错误的是（）。\r\n', '输入设备的工作是将操作命令和数据传输到运算器中，并通过控制器发出命令，完成数据处理的工作', '在微型计算机中，通常把运算器与控制器集成在一个芯片上，称为中央处理器', '计算机的石大逻辑部件包括运算器、控制器、存储器、输入设备和输出设备', '存储器可以分为内存储器和外存储器', null, 'A', null, '2020-01-08 09:25:07', null);
INSERT INTO `problem` VALUES ('18', '1', '18', '为实现输入一个四位整数，输出各个数位上的数的平方和，小明編写了一段程序如图1所示。当他运行程序，输入1234时，弹出的对话框如图2所示。为进一步调试程序，得到正确的运行结果，可选用下列做法中的（）。', '仅修改第1行，将变量a，b，c，d的类型都改为double', '仅修改第2行，将变量s的类型改为double', '仅修改第6行，改为c=n\\10 mod 10', '仅修改第5行，为b=n\\100 - a*10', null, 'C', null, '2020-01-08 09:25:43', '2020-01-13 19:57:25');
INSERT INTO `problem` VALUES ('19', '1', '19', '数组a中存放的数据如图所示，现要在数组a中查找数据\"Zhang\"，下列说法正确的是（）。', '若进行对分查找，依次被比较的数据是\"huang\"，\"ni\"，\"song\"，\"zhang\"', '因为这批数据是无序的，故只能用顺序查找的方式。', '对分查找的效率总是优于顺序查找', '若进行对分查找，依次被比较的数据是\"fan\",\"ni\",\"song\",\"zhang\"', null, 'D', null, '2020-01-08 09:27:51', '2020-01-13 19:55:11');
INSERT INTO `problem` VALUES ('20', '1', '21', '小明编写了一道程序用来计算1+2+3+··· ···+∞的值，但是他程序编不出来，因为这不符合算法的特点（）。\r\n', '可行性', '必须有输入', '有穷性', '必须有输出', null, 'C', null, '2020-01-08 09:28:36', '2020-01-13 20:03:37');
INSERT INTO `problem` VALUES ('21', '1', '22', '如图所示，用“选择排序”的方法，对数组a中的数据进行非递减序列排序。第三遍加工时，与a[3]交换的数组元素是（）。\r\n', 'a[4]', 'a[6]', 'a[5]', 'a[7]', null, 'C', '题目有问题', '2020-01-08 09:28:49', '2020-01-13 20:10:51');
INSERT INTO `problem` VALUES ('23', '1', '23', '如图所示，下列语句中属于输出常量的是（）。', '2 3 ', '1 2 3 4', '1 2 3 4 5', '2 3 4 5', null, 'B', null, '2020-01-08 09:29:17', '2020-01-13 20:12:11');
INSERT INTO `problem` VALUES ('24', '1', '24', '以下流程图符号与其表达的含义匹配的是（）。', 'A', 'B', 'C', 'D', null, 'B', null, '2020-01-08 09:29:36', '2020-01-13 20:14:39');
INSERT INTO `problem` VALUES ('25', '1', '25', '如图所示，这种描述解决问题先后步骤的方式属于（）。', '自然语言', '程序语言', '汇编语言', '伪代码', null, 'D', null, '2020-01-08 09:29:51', '2020-01-13 20:16:50');
INSERT INTO `problem` VALUES ('26', '1', '26', '根据流程图给出的信息，请完善算法功能。横线处正确的选项是（）。', 'b < c', 'a < c ', 'b>c', 'a>c', null, 'D', null, '2020-01-08 09:30:04', '2020-01-13 20:19:19');
INSERT INTO `problem` VALUES ('27', '1', '27', '若x=95.0， 则x的据类型应为（）。\r\n', 'Long', 'String', 'Integer', 'Single', null, 'D', null, '2020-01-08 09:30:33', '2020-01-13 20:19:52');
INSERT INTO `problem` VALUES ('28', '1', '28', '以下流程图的算法输出的结果是（）。', '40', '10', '20', '30', null, 'A', null, '2020-01-08 09:30:41', '2020-01-13 20:22:43');
INSERT INTO `problem` VALUES ('29', '1', '29', '关于顺序查找，下列说法正确的是（）。\r\n', '顺序查找是依据数组元素值从小到大依次查找', '若查找的对象不在数组中，不能使用顺序查找', '对于有序排列的数组，顺序查找的效率总是低于对分查找', '对于无序排列的数组，一般运用顺序查找而不用对分查找', null, 'D', '答案不确定', '2020-01-08 09:31:15', '2020-01-13 20:25:54');
INSERT INTO `problem` VALUES ('30', '1', '30', '如图所示，图2是图1的部分参数，由此可计算图1的文件大小是________MB。\r\n（宽度：1024像素 高度：512像素 位深度：24）', null, null, null, null, '1', '1.5', null, '2020-01-08 09:32:05', '2020-01-13 20:36:26');
INSERT INTO `problem` VALUES ('31', '1', '31', '早在二十世纪五十年代，图灵提出了图灵测试的理论，旨在研究“机器能够像人一样学习和思考”。2016年3月，AlphaGo挑战围棋九段棋手。在人机对弈过程中，AlphaGo通过深度学习和大数据分忻，给每一个落子的后续发展打分，并采用直接排除明显拖累局面的“烂棋”等方式以4：1战胜了李世石。像这种研究使计算机来模拟人的某些思维过程和智能行为的学科，被称为', null, null, null, null, '1', '人工智能', null, '2020-01-08 09:32:18', '2020-01-13 20:37:07');
INSERT INTO `problem` VALUES ('32', '1', '32', '以下流程图描述的算法执行结果是________。', null, null, null, null, '1', 'ab', null, '2020-01-08 09:32:25', '2020-01-13 21:03:49');
INSERT INTO `problem` VALUES ('33', '1', '33', '若输入n的值为4，则以下流程图描述的算法执行结果是________。', null, null, null, null, '1', '16', null, '2020-01-08 09:32:45', '2020-01-13 21:06:22');
INSERT INTO `problem` VALUES ('34', '1', '34', '若输入x的值是789，则以下流程图描述的算法执行结果是________。', null, null, null, null, '1', '96', null, '2020-01-08 09:33:10', '2020-01-13 21:09:31');
INSERT INTO `problem` VALUES ('35', '1', '35', '写出以下表达式的值\r\nInt(-3.5)>Int(-3.1) AND “1”>“01”', null, null, null, null, '1', 'F', null, '2020-01-08 09:33:26', '2020-01-13 21:10:18');
INSERT INTO `problem` VALUES ('36', '1', '20', '数组a中存放的数据如图所示，下列关于数组的说法中正确的是（）。', '数组a的规模为6', '在一个数组中，数组元素可以具有不同的数据类型', '在一个数组中，数组元素的值不能重复', '在vb中，数组a可以定义为dim a(6) as integer', null, 'D', null, '2020-01-13 19:55:09', '2020-01-13 20:02:39');

-- ----------------------------
-- Table structure for problem_img
-- ----------------------------
DROP TABLE IF EXISTS `problem_img`;
CREATE TABLE `problem_img` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `p_id` int(11) DEFAULT NULL COMMENT '题目编号',
  `img_url` varchar(255) DEFAULT NULL,
  `img_des` varchar(255) DEFAULT NULL,
  `is_active` varchar(255) DEFAULT '1',
  `create_time` timestamp NULL DEFAULT current_timestamp(),
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of problem_img
-- ----------------------------
INSERT INTO `problem_img` VALUES ('1', '5', '/images/problems/5b332a5170d314d3a6a0b138274678ee.png', null, '1', '2020-01-13 14:55:25', '2020-01-13 19:08:04');
INSERT INTO `problem_img` VALUES ('2', '5', '/images/problems/8372fe70c3bea81fedc2b4a38758f3df.png', null, '1', '2020-01-13 14:55:54', '2020-01-13 19:08:10');
INSERT INTO `problem_img` VALUES ('3', '6', '/images/problems/e569ff124683e8fb40fe06c7c1ffc25f.png', '参数组合', '1', '2020-01-13 19:21:09', '2020-01-13 19:24:31');
INSERT INTO `problem_img` VALUES ('4', '8', '/images/problems/5ebe1e1ad3873ebae5f264eec99025a1.png', '选项A', '1', '2020-01-13 19:29:42', '2020-01-13 19:43:50');
INSERT INTO `problem_img` VALUES ('5', '8', '/images/problems/5065349f27b4c7a6db0e8ebea7097e59.png', '选项B', '1', '2020-01-13 19:29:58', '2020-01-13 19:43:54');
INSERT INTO `problem_img` VALUES ('6', '8', '/images/problems/2de95a6c840f67104268ba5d32826d8e.png', '选项C', '1', '2020-01-13 19:30:13', '2020-01-13 19:44:00');
INSERT INTO `problem_img` VALUES ('7', '8', '/images/problems/619c910db2100c8a4240ee8c269c989f.png', '选项D', '1', '2020-01-13 19:30:27', '2020-01-13 19:44:26');
INSERT INTO `problem_img` VALUES ('8', '19', '/images/problems/055cd06de4cfd72167351c315f821004.png', '数组', '1', '2020-01-13 19:43:45', '2020-01-13 19:57:07');
INSERT INTO `problem_img` VALUES ('9', '18', '/images/problems/bb441f70834e9b3014bd043410ce6b4d.png', '代码', '1', '2020-01-13 19:46:04', '2020-01-13 19:57:05');
INSERT INTO `problem_img` VALUES ('10', '36', '/images/problems/1842ca56c4c5f92062c81088d85ad97f.png', null, '1', '2020-01-13 20:00:33', null);
INSERT INTO `problem_img` VALUES ('11', '21', '/images/problems/7e17843c87ffb5ebf3ba11728d474f77.png', null, '1', '2020-01-13 20:06:19', null);
INSERT INTO `problem_img` VALUES ('12', '23', '/images/problems/afe3f484f5103c94ce9ad8c8c111d4f7.png', null, '1', '2020-01-13 20:12:54', null);
INSERT INTO `problem_img` VALUES ('13', '24', '/images/problems/1a8c8d18609e693fe312174fe8dc8b39.png', null, '1', '2020-01-13 20:14:09', null);
INSERT INTO `problem_img` VALUES ('14', '25', '/images/problems/743355f4a74da2f86c7bbc0d26bf17ec.png', null, '1', '2020-01-13 20:15:52', null);
INSERT INTO `problem_img` VALUES ('15', '26', '/images/problems/58ce16d96b7f8f38690dc4885fc05346.png', null, '1', '2020-01-13 20:18:39', null);
INSERT INTO `problem_img` VALUES ('16', '28', '/images/problems/a1efd21c8faa8cd34c4c2d3240f12ca0.png', null, '1', '2020-01-13 20:21:35', null);
INSERT INTO `problem_img` VALUES ('17', '30', '/images/problems/d326033d792fa21089be767ada7027e0.png', null, '1', '2020-01-13 20:33:49', null);
INSERT INTO `problem_img` VALUES ('18', '32', '/images/problems/6fb91cd9c25ab79a6b5cf592b3f50da3.png', null, '1', '2020-01-13 20:54:55', null);
INSERT INTO `problem_img` VALUES ('19', '33', '/images/problems/527da607293081b5df7d814712ecea70.png', null, '1', '2020-01-13 21:05:59', null);
INSERT INTO `problem_img` VALUES ('20', '34', '/images/problems/a7de93b808be060522697905e1cdada7.png', null, '1', '2020-01-13 21:09:00', null);

-- ----------------------------
-- Table structure for stu_answer_log
-- ----------------------------
DROP TABLE IF EXISTS `stu_answer_log`;
CREATE TABLE `stu_answer_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stu_id` int(11) DEFAULT NULL COMMENT '学生id',
  `stu_answer` varchar(255) DEFAULT '' COMMENT '学生第一次的答案',
  `p_id` int(11) DEFAULT NULL COMMENT '回答了哪个问题',
  `create_time` timestamp NULL DEFAULT current_timestamp(),
  `update_time` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `is_active` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=114 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of stu_answer_log
-- ----------------------------
INSERT INTO `stu_answer_log` VALUES ('1', '1', 'A', '1', '2020-01-07 21:38:03', '2020-01-07 21:38:03', '1');
INSERT INTO `stu_answer_log` VALUES ('5', '1', 'A', '1', '2020-01-08 09:44:09', '2020-01-08 09:44:09', '1');
INSERT INTO `stu_answer_log` VALUES ('6', '1', 'C', '2', '2020-01-08 09:44:14', '2020-01-08 09:44:14', '1');
INSERT INTO `stu_answer_log` VALUES ('7', '1', 'C', '3', '2020-01-08 09:44:17', '2020-01-08 09:44:17', '1');
INSERT INTO `stu_answer_log` VALUES ('8', '1', 'D', '4', '2020-01-08 09:44:55', '2020-01-08 09:44:55', '1');
INSERT INTO `stu_answer_log` VALUES ('9', '1', 'B', '5', '2020-01-08 09:45:01', '2020-01-08 09:45:01', '1');
INSERT INTO `stu_answer_log` VALUES ('10', '1', 'A', '1', '2020-01-13 14:39:15', '2020-01-13 14:39:15', '1');
INSERT INTO `stu_answer_log` VALUES ('11', '1', 'A', '2', '2020-01-13 14:39:21', '2020-01-13 14:39:21', '1');
INSERT INTO `stu_answer_log` VALUES ('12', '1', 'C', '3', '2020-01-13 14:39:28', '2020-01-13 14:39:28', '1');
INSERT INTO `stu_answer_log` VALUES ('13', '1', 'D', '4', '2020-01-13 14:39:32', '2020-01-13 14:39:32', '1');
INSERT INTO `stu_answer_log` VALUES ('14', '1', 'A', '5', '2020-01-13 15:07:54', '2020-01-13 15:07:54', '1');
INSERT INTO `stu_answer_log` VALUES ('15', '1', 'A', '5', '2020-01-13 15:10:26', '2020-01-13 15:10:26', '1');
INSERT INTO `stu_answer_log` VALUES ('16', '1', 'C', '3', '2020-01-13 19:17:26', '2020-01-13 19:17:26', '1');
INSERT INTO `stu_answer_log` VALUES ('17', '1', 'D', '4', '2020-01-13 19:17:32', '2020-01-13 19:17:32', '1');
INSERT INTO `stu_answer_log` VALUES ('18', '1', 'A', '5', '2020-01-13 19:17:43', '2020-01-13 19:17:43', '1');
INSERT INTO `stu_answer_log` VALUES ('19', '1', 'A', '5', '2020-01-13 19:21:48', '2020-01-13 19:21:48', '1');
INSERT INTO `stu_answer_log` VALUES ('20', '1', 'A', '6', '2020-01-13 19:25:38', '2020-01-13 19:25:38', '1');
INSERT INTO `stu_answer_log` VALUES ('21', '1', 'B', '7', '2020-01-13 19:25:52', '2020-01-13 19:25:52', '1');
INSERT INTO `stu_answer_log` VALUES ('22', '1', 'B', '8', '2020-01-13 19:35:47', '2020-01-13 19:35:47', '1');
INSERT INTO `stu_answer_log` VALUES ('23', '1', 'A', '8', '2020-01-13 19:35:49', '2020-01-13 19:35:49', '1');
INSERT INTO `stu_answer_log` VALUES ('24', '1', 'A', '8', '2020-01-13 19:38:45', '2020-01-13 19:38:45', '1');
INSERT INTO `stu_answer_log` VALUES ('25', '1', 'C', '9', '2020-01-13 19:38:49', '2020-01-13 19:38:49', '1');
INSERT INTO `stu_answer_log` VALUES ('26', '1', 'C', '10', '2020-01-13 19:41:05', '2020-01-13 19:41:05', '1');
INSERT INTO `stu_answer_log` VALUES ('27', '1', 'B', '11', '2020-01-13 19:41:14', '2020-01-13 19:41:14', '1');
INSERT INTO `stu_answer_log` VALUES ('28', '1', 'B', '12', '2020-01-13 19:41:22', '2020-01-13 19:41:22', '1');
INSERT INTO `stu_answer_log` VALUES ('29', '1', 'D', '13', '2020-01-13 19:41:30', '2020-01-13 19:41:30', '1');
INSERT INTO `stu_answer_log` VALUES ('30', '1', 'B', '14', '2020-01-13 19:41:35', '2020-01-13 19:41:35', '1');
INSERT INTO `stu_answer_log` VALUES ('31', '1', 'C', '15', '2020-01-13 19:41:44', '2020-01-13 19:41:44', '1');
INSERT INTO `stu_answer_log` VALUES ('32', '1', 'B', '19', '2020-01-13 19:48:50', '2020-01-13 19:48:50', '1');
INSERT INTO `stu_answer_log` VALUES ('33', '1', 'A', '16', '2020-01-13 19:56:49', '2020-01-13 19:56:49', '1');
INSERT INTO `stu_answer_log` VALUES ('34', '1', 'C', '17', '2020-01-13 19:56:55', '2020-01-13 19:56:55', '1');
INSERT INTO `stu_answer_log` VALUES ('35', '1', 'C', '18', '2020-01-13 19:57:14', '2020-01-13 19:57:14', '1');
INSERT INTO `stu_answer_log` VALUES ('36', '1', 'C', '18', '2020-01-13 19:57:28', '2020-01-13 19:57:28', '1');
INSERT INTO `stu_answer_log` VALUES ('37', '1', 'C', '18', '2020-01-13 19:57:34', '2020-01-13 19:57:34', '1');
INSERT INTO `stu_answer_log` VALUES ('38', '1', 'D', '19', '2020-01-13 19:59:43', '2020-01-13 19:59:43', '1');
INSERT INTO `stu_answer_log` VALUES ('39', '1', 'D', '36', '2020-01-13 20:02:44', '2020-01-13 20:02:44', '1');
INSERT INTO `stu_answer_log` VALUES ('40', '1', 'C', '20', '2020-01-13 20:02:48', '2020-01-13 20:02:48', '1');
INSERT INTO `stu_answer_log` VALUES ('41', '1', 'D', '36', '2020-01-13 20:04:40', '2020-01-13 20:04:40', '1');
INSERT INTO `stu_answer_log` VALUES ('42', '1', 'D', '36', '2020-01-13 20:04:44', '2020-01-13 20:04:44', '1');
INSERT INTO `stu_answer_log` VALUES ('43', '1', 'C', '20', '2020-01-13 20:05:11', '2020-01-13 20:05:11', '1');
INSERT INTO `stu_answer_log` VALUES ('44', '1', 'C', '21', '2020-01-13 20:10:53', '2020-01-13 20:10:53', '1');
INSERT INTO `stu_answer_log` VALUES ('45', '1', 'C', '21', '2020-01-13 20:10:58', '2020-01-13 20:10:58', '1');
INSERT INTO `stu_answer_log` VALUES ('46', '1', 'B', '23', '2020-01-13 20:13:08', '2020-01-13 20:13:08', '1');
INSERT INTO `stu_answer_log` VALUES ('47', '1', 'B', '24', '2020-01-13 20:15:57', '2020-01-13 20:15:57', '1');
INSERT INTO `stu_answer_log` VALUES ('48', '1', 'D', '25', '2020-01-13 20:16:59', '2020-01-13 20:16:59', '1');
INSERT INTO `stu_answer_log` VALUES ('49', '1', 'A', '26', '2020-01-13 20:18:50', '2020-01-13 20:18:50', '1');
INSERT INTO `stu_answer_log` VALUES ('50', '1', 'D', '26', '2020-01-13 20:19:29', '2020-01-13 20:19:29', '1');
INSERT INTO `stu_answer_log` VALUES ('51', '1', 'D', '27', '2020-01-13 20:19:55', '2020-01-13 20:19:55', '1');
INSERT INTO `stu_answer_log` VALUES ('52', '1', 'D', '27', '2020-01-13 20:19:58', '2020-01-13 20:19:58', '1');
INSERT INTO `stu_answer_log` VALUES ('53', '1', 'D', '27', '2020-01-13 20:20:01', '2020-01-13 20:20:01', '1');
INSERT INTO `stu_answer_log` VALUES ('54', '1', 'A', '28', '2020-01-13 20:23:27', '2020-01-13 20:23:27', '1');
INSERT INTO `stu_answer_log` VALUES ('55', '1', 'D', '29', '2020-01-13 20:26:47', '2020-01-13 20:26:47', '1');
INSERT INTO `stu_answer_log` VALUES ('56', '1', '1.5', '30', '2020-01-13 20:36:33', '2020-01-13 20:36:33', '1');
INSERT INTO `stu_answer_log` VALUES ('57', '1', '人工智能', '31', '2020-01-13 20:37:15', '2020-01-13 20:37:15', '1');
INSERT INTO `stu_answer_log` VALUES ('58', '1', '\"ab\"', '32', '2020-01-13 20:55:18', '2020-01-13 20:55:18', '1');
INSERT INTO `stu_answer_log` VALUES ('59', '1', '\"ab\"', '32', '2020-01-13 20:55:28', '2020-01-13 20:55:28', '1');
INSERT INTO `stu_answer_log` VALUES ('60', '1', '\"ab\"', '32', '2020-01-13 21:03:15', '2020-01-13 21:03:15', '1');
INSERT INTO `stu_answer_log` VALUES ('61', '1', 'ab', '32', '2020-01-13 21:03:29', '2020-01-13 21:03:29', '1');
INSERT INTO `stu_answer_log` VALUES ('62', '1', 'ab', '32', '2020-01-13 21:03:55', '2020-01-13 21:03:55', '1');
INSERT INTO `stu_answer_log` VALUES ('63', '1', '16', '33', '2020-01-13 21:07:48', '2020-01-13 21:07:48', '1');
INSERT INTO `stu_answer_log` VALUES ('64', '1', '96', '34', '2020-01-13 21:09:41', '2020-01-13 21:09:41', '1');
INSERT INTO `stu_answer_log` VALUES ('65', '1', 'F', '35', '2020-01-13 21:10:26', '2020-01-13 21:10:26', '1');
INSERT INTO `stu_answer_log` VALUES ('66', '1', 'B', '1', '2020-01-13 21:26:41', '2020-01-13 21:26:41', '1');
INSERT INTO `stu_answer_log` VALUES ('67', '1', 'C', '2', '2020-01-13 21:28:54', '2020-01-13 21:28:54', '1');
INSERT INTO `stu_answer_log` VALUES ('68', '1', 'C', '3', '2020-01-13 21:28:59', '2020-01-13 21:28:59', '1');
INSERT INTO `stu_answer_log` VALUES ('69', '1', 'A', '1', '2020-01-13 21:30:21', '2020-01-13 21:30:21', '1');
INSERT INTO `stu_answer_log` VALUES ('70', '1', 'C', '2', '2020-01-13 21:30:25', '2020-01-13 21:30:25', '1');
INSERT INTO `stu_answer_log` VALUES ('71', '1', 'C', '3', '2020-01-13 21:30:28', '2020-01-13 21:30:28', '1');
INSERT INTO `stu_answer_log` VALUES ('72', '1', 'D', '4', '2020-01-13 21:30:31', '2020-01-13 21:30:31', '1');
INSERT INTO `stu_answer_log` VALUES ('73', '1', 'A', '5', '2020-01-13 21:30:38', '2020-01-13 21:30:38', '1');
INSERT INTO `stu_answer_log` VALUES ('74', '1', 'A', '6', '2020-01-13 21:30:43', '2020-01-13 21:30:43', '1');
INSERT INTO `stu_answer_log` VALUES ('75', '1', 'B', '6', '2020-01-13 21:30:45', '2020-01-13 21:30:45', '1');
INSERT INTO `stu_answer_log` VALUES ('76', '1', 'A', '6', '2020-01-13 21:30:46', '2020-01-13 21:30:46', '1');
INSERT INTO `stu_answer_log` VALUES ('77', '1', 'B', '7', '2020-01-13 21:30:49', '2020-01-13 21:30:49', '1');
INSERT INTO `stu_answer_log` VALUES ('78', '1', 'A', '8', '2020-01-13 21:31:00', '2020-01-13 21:31:00', '1');
INSERT INTO `stu_answer_log` VALUES ('79', '1', 'C', '9', '2020-01-13 21:31:04', '2020-01-13 21:31:04', '1');
INSERT INTO `stu_answer_log` VALUES ('80', '1', 'C', '10', '2020-01-13 21:31:09', '2020-01-13 21:31:09', '1');
INSERT INTO `stu_answer_log` VALUES ('81', '1', 'C', '11', '2020-01-13 21:31:14', '2020-01-13 21:31:14', '1');
INSERT INTO `stu_answer_log` VALUES ('82', '1', 'C', '12', '2020-01-13 21:31:18', '2020-01-13 21:31:18', '1');
INSERT INTO `stu_answer_log` VALUES ('83', '1', 'D', '13', '2020-01-13 21:31:21', '2020-01-13 21:31:21', '1');
INSERT INTO `stu_answer_log` VALUES ('84', '1', 'B', '14', '2020-01-13 21:31:24', '2020-01-13 21:31:24', '1');
INSERT INTO `stu_answer_log` VALUES ('85', '1', 'B', '15', '2020-01-13 21:31:26', '2020-01-13 21:31:26', '1');
INSERT INTO `stu_answer_log` VALUES ('86', '1', 'B', '16', '2020-01-13 21:31:28', '2020-01-13 21:31:28', '1');
INSERT INTO `stu_answer_log` VALUES ('87', '1', 'C', '17', '2020-01-13 21:31:30', '2020-01-13 21:31:30', '1');
INSERT INTO `stu_answer_log` VALUES ('88', '1', 'C', '18', '2020-01-13 21:31:33', '2020-01-13 21:31:33', '1');
INSERT INTO `stu_answer_log` VALUES ('89', '1', 'B', '18', '2020-01-13 21:31:37', '2020-01-13 21:31:37', '1');
INSERT INTO `stu_answer_log` VALUES ('90', '1', 'B', '18', '2020-01-13 21:31:41', '2020-01-13 21:31:41', '1');
INSERT INTO `stu_answer_log` VALUES ('91', '1', 'C', '18', '2020-01-13 21:31:48', '2020-01-13 21:31:48', '1');
INSERT INTO `stu_answer_log` VALUES ('92', '1', 'B', '19', '2020-01-13 21:31:50', '2020-01-13 21:31:50', '1');
INSERT INTO `stu_answer_log` VALUES ('93', '1', 'C', '36', '2020-01-13 21:31:54', '2020-01-13 21:31:54', '1');
INSERT INTO `stu_answer_log` VALUES ('94', '1', 'C', '20', '2020-01-13 21:31:57', '2020-01-13 21:31:57', '1');
INSERT INTO `stu_answer_log` VALUES ('95', '1', 'B', '21', '2020-01-13 21:32:03', '2020-01-13 21:32:03', '1');
INSERT INTO `stu_answer_log` VALUES ('96', '1', 'C', '23', '2020-01-13 21:32:05', '2020-01-13 21:32:05', '1');
INSERT INTO `stu_answer_log` VALUES ('97', '1', 'B', '23', '2020-01-13 21:32:09', '2020-01-13 21:32:09', '1');
INSERT INTO `stu_answer_log` VALUES ('98', '1', 'B', '24', '2020-01-13 21:32:12', '2020-01-13 21:32:12', '1');
INSERT INTO `stu_answer_log` VALUES ('99', '1', 'C', '24', '2020-01-13 21:32:16', '2020-01-13 21:32:16', '1');
INSERT INTO `stu_answer_log` VALUES ('100', '1', 'B', '24', '2020-01-13 21:32:18', '2020-01-13 21:32:18', '1');
INSERT INTO `stu_answer_log` VALUES ('101', '1', 'B', '25', '2020-01-13 21:32:23', '2020-01-13 21:32:23', '1');
INSERT INTO `stu_answer_log` VALUES ('102', '1', 'A', '25', '2020-01-13 21:32:24', '2020-01-13 21:32:24', '1');
INSERT INTO `stu_answer_log` VALUES ('103', '1', 'C', '25', '2020-01-13 21:32:25', '2020-01-13 21:32:25', '1');
INSERT INTO `stu_answer_log` VALUES ('104', '1', 'D', '26', '2020-01-13 21:32:31', '2020-01-13 21:32:31', '1');
INSERT INTO `stu_answer_log` VALUES ('105', '1', 'D', '27', '2020-01-13 21:32:34', '2020-01-13 21:32:34', '1');
INSERT INTO `stu_answer_log` VALUES ('106', '1', 'D', '28', '2020-01-13 21:32:37', '2020-01-13 21:32:37', '1');
INSERT INTO `stu_answer_log` VALUES ('107', '1', 'B', '29', '2020-01-13 21:32:40', '2020-01-13 21:32:40', '1');
INSERT INTO `stu_answer_log` VALUES ('108', '1', '1.5', '30', '2020-01-13 21:32:48', '2020-01-13 21:32:48', '1');
INSERT INTO `stu_answer_log` VALUES ('109', '1', '人工智能', '31', '2020-01-13 21:32:55', '2020-01-13 21:32:55', '1');
INSERT INTO `stu_answer_log` VALUES ('110', '1', 'ab', '32', '2020-01-13 21:33:03', '2020-01-13 21:33:03', '1');
INSERT INTO `stu_answer_log` VALUES ('111', '1', '16', '33', '2020-01-13 21:33:21', '2020-01-13 21:33:21', '1');
INSERT INTO `stu_answer_log` VALUES ('112', '1', '96', '34', '2020-01-13 21:33:27', '2020-01-13 21:33:27', '1');
INSERT INTO `stu_answer_log` VALUES ('113', '1', 'F', '35', '2020-01-13 21:33:31', '2020-01-13 21:33:31', '1');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(32) NOT NULL,
  `authKey` varchar(100) NOT NULL DEFAULT '',
  `class` varchar(255) DEFAULT NULL COMMENT '班级',
  `role` varchar(255) DEFAULT NULL COMMENT '0 管理员 1 老师 2 学生',
  `accessToken` varchar(100) NOT NULL DEFAULT '',
  `create_time` timestamp NULL DEFAULT current_timestamp(),
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=318 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', '严俊凡', '96b8a495990bf22e434c5c7482b7abfd', '1234', null, '0', '1234', '2020-01-07 12:30:58', '2020-01-07 12:32:22');
INSERT INTO `user` VALUES ('2', '祁翌晟', '30351c0def80d8e4aa969904ad8cd614', '1234', null, '2', '1234', '2020-01-07 13:01:18', null);
INSERT INTO `user` VALUES ('3', '王增阳', '0770976178b18043ffb2eebaeed08109', '1234', null, '2', '1234', '2020-01-07 13:01:18', null);
INSERT INTO `user` VALUES ('4', '朱炳文', '17b65c4474c7e34cd9a596ed4547bca2', '1234', null, '2', '1234', '2020-01-07 13:01:18', null);
INSERT INTO `user` VALUES ('5', '杨逸', 'c9e67ddf92aa6e1578e06576eb9d4fbf', '1234', null, '2', '1234', '2020-01-07 13:01:18', null);
INSERT INTO `user` VALUES ('6', '陈沈斐', '86624a75d56147f1120ad34f8f6d3677', '1234', null, '2', '1234', '2020-01-07 13:01:18', null);
INSERT INTO `user` VALUES ('7', '许亨泽', '579308c279a263bf1c64e4513481f8ff', '1234', null, '2', '1234', '2020-01-07 13:01:18', null);
INSERT INTO `user` VALUES ('8', '张奕辰', '0e19e95ead85cdf52a70d81a1553317c', '1234', null, '2', '1234', '2020-01-07 13:01:18', null);
INSERT INTO `user` VALUES ('9', '叶祎凡', '630fe73129b4b0e9a7f2daa5cadab783', '1234', null, '2', '1234', '2020-01-07 13:01:18', null);
INSERT INTO `user` VALUES ('10', '顾计涛', 'c2c60a5dc63e575ae96b11504b18c07a', '1234', null, '2', '1234', '2020-01-07 13:01:18', null);
INSERT INTO `user` VALUES ('11', '顾奕扬', '1141b61beca0a1cc76c1af6b6c2ac4fd', '1234', null, '2', '1234', '2020-01-07 13:01:18', null);
INSERT INTO `user` VALUES ('12', '黄梓晨', 'e077a7b51dd4e2bb209d08721827aaa5', '1234', null, '2', '1234', '2020-01-07 13:01:18', null);
INSERT INTO `user` VALUES ('13', '严铮', '289ee506583f270a25fd289761af413b', '1234', null, '2', '1234', '2020-01-07 13:01:18', null);
INSERT INTO `user` VALUES ('14', '印浩冉', '6852086c894c6c19df3073016dd808cb', '1234', null, '2', '1234', '2020-01-07 13:01:18', null);
INSERT INTO `user` VALUES ('15', '向亦凡', 'e10df082e702a9600c65f430a8bf8fed', '1234', null, '2', '1234', '2020-01-07 13:01:18', null);
INSERT INTO `user` VALUES ('16', '吴俊杰', '32efa4d75176956d626bbd01af76448e', '1234', null, '2', '1234', '2020-01-07 13:01:18', null);
INSERT INTO `user` VALUES ('17', '周骏玮', 'f7f8a4710bf546c37d2c81460640d2a6', '1234', null, '2', '1234', '2020-01-07 13:01:18', null);
INSERT INTO `user` VALUES ('18', '张思远', '5672fe350a38fb2f85fd592143b9eb88', '1234', null, '2', '1234', '2020-01-07 13:01:18', null);
INSERT INTO `user` VALUES ('19', '蔡康明', '462087f2e233114b573c754581829c8f', '1234', null, '2', '1234', '2020-01-07 13:01:18', null);
INSERT INTO `user` VALUES ('20', '周博', '7bbea895cb19b880cd76fa561edf1ea2', '1234', null, '2', '1234', '2020-01-07 13:01:18', null);
INSERT INTO `user` VALUES ('21', '王锦鹏', 'c5f8c67fe5ef329be6b5571633c567cb', '1234', null, '2', '1234', '2020-01-07 13:01:18', null);
INSERT INTO `user` VALUES ('22', '陈沁怡', 'c459e529a6278273eb539d0e0a2f75d8', '1234', null, '2', '1234', '2020-01-07 13:01:18', null);
INSERT INTO `user` VALUES ('23', '李欣然', '6897e4157dde77929312b132692cd61f', '1234', null, '2', '1234', '2020-01-07 13:01:18', null);
INSERT INTO `user` VALUES ('24', '羌迪', '29c30a83971f1fb46713432853dc433e', '1234', null, '2', '1234', '2020-01-07 13:01:18', null);
INSERT INTO `user` VALUES ('25', '王佳乐', 'f1e52bb0e6e379d83cff794a83675f31', '1234', null, '2', '1234', '2020-01-07 13:01:18', null);
INSERT INTO `user` VALUES ('26', '顾辰琳', '9ccaaac0c5bd61754179f18e1ba9e277', '1234', null, '2', '1234', '2020-01-07 13:01:18', null);
INSERT INTO `user` VALUES ('27', '赵思雨', '8921db11a17cdc45015acfb27388972f', '1234', null, '2', '1234', '2020-01-07 13:01:18', null);
INSERT INTO `user` VALUES ('28', '张芯怡', '008015c6511c65968fd3fecea0cd3cce', '1234', null, '2', '1234', '2020-01-07 13:01:18', null);
INSERT INTO `user` VALUES ('29', '张瑾莹', 'e683e84c5e3ae157884ebe1570134896', '1234', null, '2', '1234', '2020-01-07 13:01:18', null);
INSERT INTO `user` VALUES ('30', '宋琦雯', '22c9fb3c8efd34dfb32c8cbf21ffb3d5', '1234', null, '2', '1234', '2020-01-07 13:01:18', null);
INSERT INTO `user` VALUES ('31', '屠畅玮', 'b038f25ecfc7a5ce3f3088f768e54644', '1234', null, '2', '1234', '2020-01-07 13:01:18', null);
INSERT INTO `user` VALUES ('32', '刘玉婷', '75aeafa43635324ef214703820d96089', '1234', null, '2', '1234', '2020-01-07 13:01:18', null);
INSERT INTO `user` VALUES ('33', '陈怡琳', '490c0f26502897e31fb7c56732b63340', '1234', null, '2', '1234', '2020-01-07 13:01:18', null);
INSERT INTO `user` VALUES ('34', '任滢颖', '10fe0164c950524df04f23e416aff025', '1234', null, '2', '1234', '2020-01-07 13:01:18', null);
INSERT INTO `user` VALUES ('35', '陶运来', '8d210e4382f2eff07b79d37cd480c4e3', '1234', null, '2', '1234', '2020-01-07 13:01:18', null);
INSERT INTO `user` VALUES ('36', '张晴雯', '7069132246927f70e47e71bfe85961e2', '1234', null, '2', '1234', '2020-01-07 13:01:18', null);
INSERT INTO `user` VALUES ('37', '赵芮轩', '235331d85fd5519b69eeb0e495c8cd02', '1234', null, '2', '1234', '2020-01-07 13:01:18', null);
INSERT INTO `user` VALUES ('38', '赵蓓', '1e761436089e40dab7c9cadad2569831', '1234', null, '2', '1234', '2020-01-07 13:01:18', null);
INSERT INTO `user` VALUES ('39', '张乐韵', 'ade9ac297eceb1898de4c9f77b998ada', '1234', null, '2', '1234', '2020-01-07 13:01:18', null);
INSERT INTO `user` VALUES ('40', '曹嘉雯', '71a53b8e5b9f3aede88e234f09faf80e', '1234', null, '2', '1234', '2020-01-07 13:01:18', null);
INSERT INTO `user` VALUES ('41', '花天禹', 'a800f3e3ad747367679ff2d58f62f307', '1234', null, '2', '1234', '2020-01-07 13:01:18', null);
INSERT INTO `user` VALUES ('42', '顾翊扬', 'ca8dfe68e3c676ddbd6664eabbf3d950', '1234', null, '2', '1234', '2020-01-07 13:01:18', null);
INSERT INTO `user` VALUES ('43', '蓝晨旭', '76fca25a0ee851a6d5e7b218289bac7a', '1234', null, '2', '1234', '2020-01-07 13:01:18', null);
INSERT INTO `user` VALUES ('44', '陆精文', '7fee41c739399884b2e0d8e12b230d5d', '1234', null, '2', '1234', '2020-01-07 13:01:18', null);
INSERT INTO `user` VALUES ('45', '顾佳俊', 'f79db29772d0e8c625273ad3c0f8b4dd', '1234', null, '2', '1234', '2020-01-07 13:01:18', null);
INSERT INTO `user` VALUES ('46', '金嘉宇', '94896a9c2714cb787e9ca89ac3df6730', '1234', null, '2', '1234', '2020-01-07 13:01:18', null);
INSERT INTO `user` VALUES ('47', '奚昊洋', 'b13195ca23600a8f612ef93c466cce9b', '1234', null, '2', '1234', '2020-01-07 13:01:18', null);
INSERT INTO `user` VALUES ('48', '沈凌云', 'b231ff03f3d3e6a06b918684382d930b', '1234', null, '2', '1234', '2020-01-07 13:01:18', null);
INSERT INTO `user` VALUES ('49', '俞瑞琪', 'd1e6c9ec88b2120a3eda5db3f00ae51d', '1234', null, '2', '1234', '2020-01-07 13:01:18', null);
INSERT INTO `user` VALUES ('50', '胡赵润', '27471d8d28d6b0b596f36527b305f34b', '1234', null, '2', '1234', '2020-01-07 13:01:18', null);
INSERT INTO `user` VALUES ('51', '唐嘉斌', 'b927ee50a350b30217838610214a3bbb', '1234', null, '2', '1234', '2020-01-07 13:01:18', null);
INSERT INTO `user` VALUES ('52', '张天宏', 'c400adf31628ff8ce57b43b0ecb664b8', '1234', null, '2', '1234', '2020-01-07 13:01:18', null);
INSERT INTO `user` VALUES ('53', '王臻', '0af8f691e5214377e5b175fa1c6ba217', '1234', null, '2', '1234', '2020-01-07 13:01:18', null);
INSERT INTO `user` VALUES ('54', '赵衡轩', '30f6704a104e843a0ea03c0f2c361577', '1234', null, '2', '1234', '2020-01-07 13:01:18', null);
INSERT INTO `user` VALUES ('55', '肖俊杰', '19595ce0b74e256e58ab955949330ce5', '1234', null, '2', '1234', '2020-01-07 13:01:18', null);
INSERT INTO `user` VALUES ('56', '胥杰', '04b0d85deec60706416cf2db4906d068', '1234', null, '2', '1234', '2020-01-07 13:01:18', null);
INSERT INTO `user` VALUES ('57', '宋志豪', 'f8a9b9d7075d736f3bfa69b43df9e216', '1234', null, '2', '1234', '2020-01-07 13:01:18', null);
INSERT INTO `user` VALUES ('58', '杨若晨', '61757fd4e1e8c9e2a4531263eb0e9e3f', '1234', null, '2', '1234', '2020-01-07 13:01:18', null);
INSERT INTO `user` VALUES ('59', '陆陈', '49ea8a969c538e81f0850fdafa26bde1', '1234', null, '2', '1234', '2020-01-07 13:01:18', null);
INSERT INTO `user` VALUES ('60', '熊玉伦', 'bd8bbcab20967e9140c1cf7e7f0cebf2', '1234', null, '2', '1234', '2020-01-07 13:01:18', null);
INSERT INTO `user` VALUES ('61', '孙楚涵', '6441f801c4c0dee46cb17f3f8ea117ae', '1234', null, '2', '1234', '2020-01-07 13:01:18', null);
INSERT INTO `user` VALUES ('62', '王昕怡', 'f8ca1f425418cd555ddbefb585e97c42', '1234', null, '2', '1234', '2020-01-07 13:01:18', null);
INSERT INTO `user` VALUES ('63', '陶乐怡', '520ee36af094a898d9756edaf00163cc', '1234', null, '2', '1234', '2020-01-07 13:01:18', null);
INSERT INTO `user` VALUES ('64', '郁诗檬', '1cbeadf228919eee97b1117982112a63', '1234', null, '2', '1234', '2020-01-07 13:01:18', null);
INSERT INTO `user` VALUES ('65', '沈君怡', '01f73eba81d5a82e4af5757494f2c963', '1234', null, '2', '1234', '2020-01-07 13:01:18', null);
INSERT INTO `user` VALUES ('66', '林诗淇', '64af0b65bb3371cf1f19d5607adca704', '1234', null, '2', '1234', '2020-01-07 13:01:18', null);
INSERT INTO `user` VALUES ('67', '陆怡沁', '07cee7d7142e06a84f14a14747296f4d', '1234', null, '2', '1234', '2020-01-07 13:01:18', null);
INSERT INTO `user` VALUES ('68', '刘雯萱', '85dc7e2e91fa5180ec7c9eb7c442fe4c', '1234', null, '2', '1234', '2020-01-07 13:01:18', null);
INSERT INTO `user` VALUES ('69', '庄幼仪', '0b18cb015fb8b7faac6592e959440a3a', '1234', null, '2', '1234', '2020-01-07 13:01:18', null);
INSERT INTO `user` VALUES ('70', '姜慧君', '16256f971a2f20a33d76684090d7e87e', '1234', null, '2', '1234', '2020-01-07 13:01:18', null);
INSERT INTO `user` VALUES ('71', '周祎卿', '0490cb89f1ceda364c642e30d55879bc', '1234', null, '2', '1234', '2020-01-07 13:01:18', null);
INSERT INTO `user` VALUES ('72', '韩雨欣', 'b6b28486cb0a1675344ad86a6f7158ed', '1234', null, '2', '1234', '2020-01-07 13:01:18', null);
INSERT INTO `user` VALUES ('73', '董心莹', 'd48146e02f7ac54c44f0a2cf747156ee', '1234', null, '2', '1234', '2020-01-07 13:01:18', null);
INSERT INTO `user` VALUES ('74', '黄逸欣', '7c75c31003b9894b7be7ea23015e4d4d', '1234', null, '2', '1234', '2020-01-07 13:01:18', null);
INSERT INTO `user` VALUES ('75', '赵依婷', 'a44875d243a92b128e0cf83c67bcbfda', '1234', null, '2', '1234', '2020-01-07 13:01:18', null);
INSERT INTO `user` VALUES ('76', '李亦婷', 'c45048f28734112439b81f41787fa5bb', '1234', null, '2', '1234', '2020-01-07 13:01:19', null);
INSERT INTO `user` VALUES ('77', '蔡英姿', 'fdbb3c5f767193e1e97d688049032af8', '1234', null, '2', '1234', '2020-01-07 13:01:19', null);
INSERT INTO `user` VALUES ('78', '郭耔溪', '48411f43bd214e3c70a76591960ccc0b', '1234', null, '2', '1234', '2020-01-07 13:01:19', null);
INSERT INTO `user` VALUES ('79', '查玉捷', 'aaf75d44bcd0e0230c24add4fc881bd0', '1234', null, '2', '1234', '2020-01-07 13:01:19', null);
INSERT INTO `user` VALUES ('80', '陈佳妮', 'b5f3c1feba2253924c0b1ae566f8ad22', '1234', null, '2', '1234', '2020-01-07 13:01:19', null);
INSERT INTO `user` VALUES ('81', '吴宇晖', 'd7a69d27eb95f534158b29c56a181be1', '1234', null, '2', '1234', '2020-01-07 13:01:19', null);
INSERT INTO `user` VALUES ('82', '吴耀和', 'a1f2e295786a1bf9e0b60c67e41aa34e', '1234', null, '2', '1234', '2020-01-07 13:01:19', null);
INSERT INTO `user` VALUES ('83', '唐文杰', 'bf9eeb6625b113b0151fb3713e7d40b5', '1234', null, '2', '1234', '2020-01-07 13:01:19', null);
INSERT INTO `user` VALUES ('84', '曹海天', 'dd35ead974250c14b9c9760460a52584', '1234', null, '2', '1234', '2020-01-07 13:01:19', null);
INSERT INTO `user` VALUES ('85', '白天宇', 'a27e7a831553d5c182179b8154a20f60', '1234', null, '2', '1234', '2020-01-07 13:01:19', null);
INSERT INTO `user` VALUES ('86', '张瞿杰', '7abf2ff67d242208bf49158c6dbc2845', '1234', null, '2', '1234', '2020-01-07 13:01:19', null);
INSERT INTO `user` VALUES ('87', '赵梓衡', '7ebe6d2cfc2fd4ce9a02b36cbe9cb0c7', '1234', null, '2', '1234', '2020-01-07 13:01:19', null);
INSERT INTO `user` VALUES ('88', '许智云', 'c36261dc262481d3118856fac221cdbe', '1234', null, '2', '1234', '2020-01-07 13:01:19', null);
INSERT INTO `user` VALUES ('89', '张文龙', '46eab8c9a58d3d77ef710e999c268b64', '1234', null, '2', '1234', '2020-01-07 13:01:19', null);
INSERT INTO `user` VALUES ('90', '宋卓洋', 'ff359283d779d70951f6becf09c0bea2', '1234', null, '2', '1234', '2020-01-07 13:01:19', null);
INSERT INTO `user` VALUES ('91', '马越', 'f5ba1d31e807c72411a712950cdcc1d0', '1234', null, '2', '1234', '2020-01-07 13:01:19', null);
INSERT INTO `user` VALUES ('92', '张文泉', '1346c100e2a2e38dee89dc8ee1a00b60', '1234', null, '2', '1234', '2020-01-07 13:01:19', null);
INSERT INTO `user` VALUES ('93', '顾洋', 'f7767f924651dd9ccc3766e99e6196bb', '1234', null, '2', '1234', '2020-01-07 13:01:19', null);
INSERT INTO `user` VALUES ('94', '王琦', '20a12ddf84080ea352843dfbaedacfd3', '1234', null, '2', '1234', '2020-01-07 13:01:19', null);
INSERT INTO `user` VALUES ('95', '黄嘉航', 'b7fbe1dad3550e5153288ceb98858f3d', '1234', null, '2', '1234', '2020-01-07 13:01:19', null);
INSERT INTO `user` VALUES ('96', '徐新智', 'f6f029a4567d175b5a1fac35dba920f2', '1234', null, '2', '1234', '2020-01-07 13:01:19', null);
INSERT INTO `user` VALUES ('97', '罗陈杰', '016a92fa863b902515d43833006bdc85', '1234', null, '2', '1234', '2020-01-07 13:01:19', null);
INSERT INTO `user` VALUES ('98', '段亦轩', 'be3ff6b55b86a12664c34d08634ea99a', '1234', null, '2', '1234', '2020-01-07 13:01:19', null);
INSERT INTO `user` VALUES ('99', '朱未', '6578944c24127542fa57a2bfa4d9cc7d', '1234', null, '2', '1234', '2020-01-07 13:01:19', null);
INSERT INTO `user` VALUES ('100', '郑天羽', '2d03807af50625df054b2fb479c0ad6a', '1234', null, '2', '1234', '2020-01-07 13:01:19', null);
INSERT INTO `user` VALUES ('101', '余品瑶', '2bdbfb28fd3586dff57b20e5acf49ef1', '1234', null, '2', '1234', '2020-01-07 13:01:19', null);
INSERT INTO `user` VALUES ('102', '朱思睿', '24f861dfa0d182b98a9af2d8d49cead3', '1234', null, '2', '1234', '2020-01-07 13:01:19', null);
INSERT INTO `user` VALUES ('103', '周喜盈', 'f71a98eed145953537a550f3f4986935', '1234', null, '2', '1234', '2020-01-07 13:01:19', null);
INSERT INTO `user` VALUES ('104', '周安妮', 'eb522919f67d66b147702dc80a81f2c2', '1234', null, '2', '1234', '2020-01-07 13:01:19', null);
INSERT INTO `user` VALUES ('105', '戴晨', 'ea702ad99fa32dbdfc7769cf518867e3', '1234', null, '2', '1234', '2020-01-07 13:01:19', null);
INSERT INTO `user` VALUES ('106', '孟亦凝', 'd49af2320ef6bc376b0e289a6f9b1cd1', '1234', null, '2', '1234', '2020-01-07 13:01:19', null);
INSERT INTO `user` VALUES ('107', '李玉琦', 'fb481b16e2394b1abb4881f2aca9b1d6', '1234', null, '2', '1234', '2020-01-07 13:01:19', null);
INSERT INTO `user` VALUES ('108', '周晶晶', 'f1421d399f63520c789e1fe3ab35560c', '1234', null, '2', '1234', '2020-01-07 13:01:19', null);
INSERT INTO `user` VALUES ('109', '徐金涵', '39d7399d54209f57618dd2637a10db19', '1234', null, '2', '1234', '2020-01-07 13:01:19', null);
INSERT INTO `user` VALUES ('110', '王芷健', '82b5abc2579bf1e7c1a85b311525a76b', '1234', null, '2', '1234', '2020-01-07 13:01:19', null);
INSERT INTO `user` VALUES ('111', '何依锦', '0ede2b430f8046b300eefcd062db2c84', '1234', null, '2', '1234', '2020-01-07 13:01:19', null);
INSERT INTO `user` VALUES ('112', '顾子行', '5b5649dd9cf25734caebb147c67e2ed3', '1234', null, '2', '1234', '2020-01-07 13:01:19', null);
INSERT INTO `user` VALUES ('113', '谢心妍', '41fa125b1c758503152dc825456f9e89', '1234', null, '2', '1234', '2020-01-07 13:01:19', null);
INSERT INTO `user` VALUES ('114', '马彦珺', '6f5a47edcdd3bf9c667aecd1a17a25bf', '1234', null, '2', '1234', '2020-01-07 13:01:19', null);
INSERT INTO `user` VALUES ('115', '顾佳琪', 'ea759dd518f61d8337617fa21422ce55', '1234', null, '2', '1234', '2020-01-07 13:01:19', null);
INSERT INTO `user` VALUES ('116', '杨帆', '5c857fa8d4c9bf9f7b9c9be169445a7f', '1234', null, '2', '1234', '2020-01-07 13:01:19', null);
INSERT INTO `user` VALUES ('117', '宋思颖', '9535c3086cb5c5d8de9c71eaef9fdcae', '1234', null, '2', '1234', '2020-01-07 13:01:19', null);
INSERT INTO `user` VALUES ('118', '殷汪忻', '44cd5510d64ad4613b6446333d8d63e9', '1234', null, '2', '1234', '2020-01-07 13:01:19', null);
INSERT INTO `user` VALUES ('119', '顾祥怡', '59d8e2083936d6c385d3d18bb656ef46', '1234', null, '2', '1234', '2020-01-07 13:01:19', null);
INSERT INTO `user` VALUES ('120', '张赫扬', 'e800ecc9c98f58b9c1430e17630c4eac', '1234', null, '2', '1234', '2020-01-07 13:01:19', null);
INSERT INTO `user` VALUES ('121', '田海川', 'bc466119e5b8c1525e62ba7105fe2dc0', '1234', null, '2', '1234', '2020-01-07 13:01:19', null);
INSERT INTO `user` VALUES ('122', '施孝杰', 'e8d00a686d6e841435d7e4204a605cce', '1234', null, '2', '1234', '2020-01-07 13:01:19', null);
INSERT INTO `user` VALUES ('123', '张皓禛', '35b5bbdab1b33e68f2a1e1ecda717cc4', '1234', null, '2', '1234', '2020-01-07 13:01:19', null);
INSERT INTO `user` VALUES ('124', '陶炜', '23495c8f62fc5a7823c3b2cf2983d14e', '1234', null, '2', '1234', '2020-01-07 13:01:19', null);
INSERT INTO `user` VALUES ('125', '孔圣', '5778f679fbcee8feb6d959148520d0f5', '1234', null, '2', '1234', '2020-01-07 13:01:19', null);
INSERT INTO `user` VALUES ('126', '陈天圣', 'e0e4eac3557a54ecc1a61dfe0107722a', '1234', null, '2', '1234', '2020-01-07 13:01:19', null);
INSERT INTO `user` VALUES ('127', '单俊杰', '92ec50cdbe1c5f6e8265a7e15026c9fa', '1234', null, '2', '1234', '2020-01-07 13:01:19', null);
INSERT INTO `user` VALUES ('128', '王赢超', '16f9ff19f54ad6187dfe7e42a72da4fc', '1234', null, '2', '1234', '2020-01-07 13:01:19', null);
INSERT INTO `user` VALUES ('129', '姚俊天', '3243f5a5bf5ace0d05d411c3c60162c0', '1234', null, '2', '1234', '2020-01-07 13:01:19', null);
INSERT INTO `user` VALUES ('130', '顾宇捷', 'cbcfdad3c2ea242be4e86369a69b2687', '1234', null, '2', '1234', '2020-01-07 13:01:19', null);
INSERT INTO `user` VALUES ('131', '陈予博', '54822825edd3264d1ab9a80fac28018d', '1234', null, '2', '1234', '2020-01-07 13:01:19', null);
INSERT INTO `user` VALUES ('132', '陈俊豪', '5cc06278246fb324f78717796a3d0952', '1234', null, '2', '1234', '2020-01-07 13:01:19', null);
INSERT INTO `user` VALUES ('133', '赵悦辰', '83ac5850868bb4c3000751b831222445', '1234', null, '2', '1234', '2020-01-07 13:01:19', null);
INSERT INTO `user` VALUES ('134', '张超', 'd7a20fa018871664b94e3a69a9707ac6', '1234', null, '2', '1234', '2020-01-07 13:01:19', null);
INSERT INTO `user` VALUES ('135', '胡晓强', '112aa545dc0a0adabed97589e1a7f577', '1234', null, '2', '1234', '2020-01-07 13:01:19', null);
INSERT INTO `user` VALUES ('136', '余思源', '3300df032d27a2db66d4537938b3df5b', '1234', null, '2', '1234', '2020-01-07 13:01:19', null);
INSERT INTO `user` VALUES ('137', '杨屹', '86fab7a53f5e8d534f580054a7a57584', '1234', null, '2', '1234', '2020-01-07 13:01:19', null);
INSERT INTO `user` VALUES ('138', '张佳忆', 'a187fbb767bafeccc9426fd3d4bc7aaa', '1234', null, '2', '1234', '2020-01-07 13:01:19', null);
INSERT INTO `user` VALUES ('139', '阮肇羽', '583aa49aef2fca92cf312dfbbe6fa556', '1234', null, '2', '1234', '2020-01-07 13:01:19', null);
INSERT INTO `user` VALUES ('140', '任佳彦', 'e273b3f441a7b9b53fdbbe54e0848c08', '1234', null, '2', '1234', '2020-01-07 13:01:19', null);
INSERT INTO `user` VALUES ('141', '陈璐', 'a8226139ce1500cfdf8df61031f48dd4', '1234', null, '2', '1234', '2020-01-07 13:01:19', null);
INSERT INTO `user` VALUES ('142', '过亦乐', '34ef4ee50361c39d5936cfc36c3fbdd5', '1234', null, '2', '1234', '2020-01-07 13:01:19', null);
INSERT INTO `user` VALUES ('143', '吴佳怡', '8fa2c0238f7ea5a14936459328c5d5f3', '1234', null, '2', '1234', '2020-01-07 13:01:19', null);
INSERT INTO `user` VALUES ('144', '钱嘉文', '525149bd1efc77df6e2c274472552ad8', '1234', null, '2', '1234', '2020-01-07 13:01:19', null);
INSERT INTO `user` VALUES ('145', '王向琼', 'cd2c87ad61b3c808e1c0d0004b3c90af', '1234', null, '2', '1234', '2020-01-07 13:01:19', null);
INSERT INTO `user` VALUES ('146', '沈恺闻', '3d93b8cf8ac71c14207cc5413215a3f8', '1234', null, '2', '1234', '2020-01-07 13:01:19', null);
INSERT INTO `user` VALUES ('147', '韩思雨', 'beb41d2e64e74ccff1bd4243d57c4b32', '1234', null, '2', '1234', '2020-01-07 13:01:19', null);
INSERT INTO `user` VALUES ('148', '周妍妍', '68f93af7cc42f7403e513f5d4b9de8f9', '1234', null, '2', '1234', '2020-01-07 13:01:19', null);
INSERT INTO `user` VALUES ('149', '龚静怡', '5d452ee0dda601775bd02061f9c734af', '1234', null, '2', '1234', '2020-01-07 13:01:19', null);
INSERT INTO `user` VALUES ('150', '杨曦', '8fc6ccbd58205925ca4c15d623a002fe', '1234', null, '2', '1234', '2020-01-07 13:01:19', null);
INSERT INTO `user` VALUES ('151', '顾晴雨', '527b7d747d01c74fa93345b9beae1503', '1234', null, '2', '1234', '2020-01-07 13:01:19', null);
INSERT INTO `user` VALUES ('152', '徐婉萍', 'e2e8d5440e3cc6ea2944f0e44c0b2def', '1234', null, '2', '1234', '2020-01-07 13:01:19', null);
INSERT INTO `user` VALUES ('153', '胡悦翀', '41f9e4d3cb35318ba5116b9a3d79a74a', '1234', null, '2', '1234', '2020-01-07 13:01:19', null);
INSERT INTO `user` VALUES ('154', '唐玮蔚', 'eba75724418866a89d5ce8023184763f', '1234', null, '2', '1234', '2020-01-07 13:01:19', null);
INSERT INTO `user` VALUES ('155', '颜语婕', 'da6d05277960449ad4d6577a2764aeb4', '1234', null, '2', '1234', '2020-01-07 13:01:19', null);
INSERT INTO `user` VALUES ('156', '戴嘉璐', '928122bf82a84a3dd597e7046eb82da8', '1234', null, '2', '1234', '2020-01-07 13:01:19', null);
INSERT INTO `user` VALUES ('157', '苟琰', 'd8fd8f75f175c594025fde43593448b2', '1234', null, '2', '1234', '2020-01-07 13:01:19', null);
INSERT INTO `user` VALUES ('158', '郑佳颖', 'e1a3a6f38219e9a9689dc1d029efa285', '1234', null, '2', '1234', '2020-01-07 13:01:19', null);
INSERT INTO `user` VALUES ('159', '沈暐杰', 'd8ecfedda51682d9ec9fd859d4c433b0', '1234', null, '2', '1234', '2020-01-07 13:01:19', null);
INSERT INTO `user` VALUES ('160', '唐啸吟', 'ff48e928b016aeec28ae00a8e510b222', '1234', null, '2', '1234', '2020-01-07 13:01:19', null);
INSERT INTO `user` VALUES ('161', '殷立伟', '0e87f5c621f7641dfe284d181cd36002', '1234', null, '2', '1234', '2020-01-07 13:01:19', null);
INSERT INTO `user` VALUES ('162', '全靖涵', '04d71c570c29b9e2c8f6d84390589424', '1234', null, '2', '1234', '2020-01-07 13:01:19', null);
INSERT INTO `user` VALUES ('163', '范瑞轩', 'd89ffeab2670243c70ebd9b7387ac197', '1234', null, '2', '1234', '2020-01-07 13:01:20', null);
INSERT INTO `user` VALUES ('164', '吴杨毅', 'f2fab922acccae9a6699ac961f4d687c', '1234', null, '2', '1234', '2020-01-07 13:01:20', null);
INSERT INTO `user` VALUES ('165', '曹立', '299f7bfd4c87eba7a8cd96904d99897a', '1234', null, '2', '1234', '2020-01-07 13:01:20', null);
INSERT INTO `user` VALUES ('166', '黄悦', '0e5e4c1a3f53ac6fc541d5b79f436001', '1234', null, '2', '1234', '2020-01-07 13:01:20', null);
INSERT INTO `user` VALUES ('167', '康宇皓', '0f31df3882b5616988bded74e8ea5778', '1234', null, '2', '1234', '2020-01-07 13:01:20', null);
INSERT INTO `user` VALUES ('168', '徐智恒', 'b49bec546c537490ef56872dc23aa590', '1234', null, '2', '1234', '2020-01-07 13:01:20', null);
INSERT INTO `user` VALUES ('169', '毛世杰', '73c91bcc0d7c705ea1a20969d38d5609', '1234', null, '2', '1234', '2020-01-07 13:01:20', null);
INSERT INTO `user` VALUES ('170', '张浩哲', 'e6414bcf81a466ceacf5a9405ddef060', '1234', null, '2', '1234', '2020-01-07 13:01:20', null);
INSERT INTO `user` VALUES ('171', '朱君侯', '760fb6f44da62a6afaf80856ee213a2a', '1234', null, '2', '1234', '2020-01-07 13:01:20', null);
INSERT INTO `user` VALUES ('172', '戴吉洋', '55175c29d1e9d508762b1e2ea17988f9', '1234', null, '2', '1234', '2020-01-07 13:01:20', null);
INSERT INTO `user` VALUES ('173', '汪芃燚', 'ad2aacc89a6add438597b941ec25c3fa', '1234', null, '2', '1234', '2020-01-07 13:01:20', null);
INSERT INTO `user` VALUES ('174', '顾凌枫', 'bd8eeb3bfa801206a26ac2dcd35aa49f', '1234', null, '2', '1234', '2020-01-07 13:01:20', null);
INSERT INTO `user` VALUES ('175', '缪晨峰', '900b3f3a10b42acb4fe84a48e04d22fa', '1234', null, '2', '1234', '2020-01-07 13:01:20', null);
INSERT INTO `user` VALUES ('176', '潘思越', 'ec0b830920c0efad2469c960b5dfae61', '1234', null, '2', '1234', '2020-01-07 13:01:20', null);
INSERT INTO `user` VALUES ('177', '邵振岳', 'c971e4fb80e5622de361c086208f684d', '1234', null, '2', '1234', '2020-01-07 13:01:20', null);
INSERT INTO `user` VALUES ('178', '梁乐贤', 'e72cd6e88e3f54b0975c06724640bdab', '1234', null, '2', '1234', '2020-01-07 13:01:20', null);
INSERT INTO `user` VALUES ('179', '陈譞玥', '39ca5cd3fbf99cd857fbf74238ecffe1', '1234', null, '2', '1234', '2020-01-07 13:01:20', null);
INSERT INTO `user` VALUES ('180', '郁亦菲', '0cd82001c3170c0818054f2b9c618110', '1234', null, '2', '1234', '2020-01-07 13:01:20', null);
INSERT INTO `user` VALUES ('181', '张婧怡', '2e947b9f3ba7e73ffc212d40756dae82', '1234', null, '2', '1234', '2020-01-07 13:01:20', null);
INSERT INTO `user` VALUES ('182', '毛一然', '47f2ec605d24481a5efe0b48b815140a', '1234', null, '2', '1234', '2020-01-07 13:01:20', null);
INSERT INTO `user` VALUES ('183', '陆诗贇', 'b0007ab84f6c3eb7a7b327f0fdf81596', '1234', null, '2', '1234', '2020-01-07 13:01:20', null);
INSERT INTO `user` VALUES ('184', '周祯妍', '8eb05417ba11ddea0914de4b53a89940', '1234', null, '2', '1234', '2020-01-07 13:01:20', null);
INSERT INTO `user` VALUES ('185', '束雨阳', '8484e0e527036e85dafee49a0c0313b8', '1234', null, '2', '1234', '2020-01-07 13:01:20', null);
INSERT INTO `user` VALUES ('186', '许小雨', '662f8e206125cb8c2b2192b976d206f5', '1234', null, '2', '1234', '2020-01-07 13:01:20', null);
INSERT INTO `user` VALUES ('187', '沈轶炀', 'fe5aab6ac3c73ac01e323831aefc3351', '1234', null, '2', '1234', '2020-01-07 13:01:20', null);
INSERT INTO `user` VALUES ('188', '方蓓琳', 'b78cf0cd98bc85f103a2f3fba0d45e98', '1234', null, '2', '1234', '2020-01-07 13:01:20', null);
INSERT INTO `user` VALUES ('189', '李佳翎', '880e88bf5c86c1b11a2ac7072ebfb932', '1234', null, '2', '1234', '2020-01-07 13:01:20', null);
INSERT INTO `user` VALUES ('190', '张陈琳', '36c3babe29f07d6a7f8b4a55aca2de85', '1234', null, '2', '1234', '2020-01-07 13:01:20', null);
INSERT INTO `user` VALUES ('191', '唐汝蕙', 'c7287493abfe02f63ab225fc70e74bf8', '1234', null, '2', '1234', '2020-01-07 13:01:20', null);
INSERT INTO `user` VALUES ('192', '李梦桐', '0294fdb68492248b20f543398f856e75', '1234', null, '2', '1234', '2020-01-07 13:01:20', null);
INSERT INTO `user` VALUES ('193', '汪甜甜', '726d1a6584a3dbdda1a7a128daea7e5c', '1234', null, '2', '1234', '2020-01-07 13:01:20', null);
INSERT INTO `user` VALUES ('194', '张琰', '92118ea002ef387e0369031485918102', '1234', null, '2', '1234', '2020-01-07 13:01:20', null);
INSERT INTO `user` VALUES ('195', '唐元元', '10a9e10d9a6e08044f301c88cfa67cbf', '1234', null, '2', '1234', '2020-01-07 13:01:20', null);
INSERT INTO `user` VALUES ('196', '奚佳凝', '4a1f9388ead120d910b1cf89b20c4da0', '1234', null, '2', '1234', '2020-01-07 13:01:20', null);
INSERT INTO `user` VALUES ('197', '叶佳怡', 'e187adcf45f2fc1985d2f9d7d73f15d2', '1234', null, '2', '1234', '2020-01-07 13:01:20', null);
INSERT INTO `user` VALUES ('198', '陆豆豆', '148c3763091e3679729e05cba22cb5ee', '1234', null, '2', '1234', '2020-01-07 13:01:20', null);
INSERT INTO `user` VALUES ('199', '刘卓彦', '2101ba880cdea42356404700b5ace895', '1234', null, '2', '1234', '2020-01-07 13:01:20', null);
INSERT INTO `user` VALUES ('200', '陆云轩', 'ae63c4f48cb244558db29f2791f5ff89', '1234', null, '2', '1234', '2020-01-07 13:01:20', null);
INSERT INTO `user` VALUES ('201', '赵志豪', 'bf0dbce5e0d3cea97d0588a52c8eef54', '1234', null, '2', '1234', '2020-01-07 13:01:20', null);
INSERT INTO `user` VALUES ('202', '沈施圆', '68ec4ec97e8b53d001c9e8f744289a9f', '1234', null, '2', '1234', '2020-01-07 13:01:20', null);
INSERT INTO `user` VALUES ('203', '奚嘉昊', 'ce6c04a149558640279bc4e57d86acaa', '1234', null, '2', '1234', '2020-01-07 13:01:20', null);
INSERT INTO `user` VALUES ('204', '吴忞昊', 'bc5c10ca31ffc2cfbbc9a6b9eb13a4d1', '1234', null, '2', '1234', '2020-01-07 13:01:20', null);
INSERT INTO `user` VALUES ('205', '吴健豪', 'f530088bfd4a1c1b79546cd24038b712', '1234', null, '2', '1234', '2020-01-07 13:01:20', null);
INSERT INTO `user` VALUES ('206', '张玮劼', '5522203cbbaeed22bb5cba17f29f0f6f', '1234', null, '2', '1234', '2020-01-07 13:01:20', null);
INSERT INTO `user` VALUES ('207', '莫家骏', 'b6782eed943d909678c7ef2fe2db7a07', '1234', null, '2', '1234', '2020-01-07 13:01:20', null);
INSERT INTO `user` VALUES ('208', '蔡玙宸', '7963688ec285d230a68f546d6db39e0c', '1234', null, '2', '1234', '2020-01-07 13:01:20', null);
INSERT INTO `user` VALUES ('209', '王俊皓', '73c514129dcb2329821a008ba9df8bad', '1234', null, '2', '1234', '2020-01-07 13:01:20', null);
INSERT INTO `user` VALUES ('210', '祝嘉淳', '68307d3cbc42da6960acdd25f4d4cb6c', '1234', null, '2', '1234', '2020-01-07 13:01:20', null);
INSERT INTO `user` VALUES ('211', '庄懿扬', '82dffac495ebfe1a87386fc5da2792fc', '1234', null, '2', '1234', '2020-01-07 13:01:20', null);
INSERT INTO `user` VALUES ('212', '丁佳成', '1c946942ec436ff7496b9aecad17d0a8', '1234', null, '2', '1234', '2020-01-07 13:01:20', null);
INSERT INTO `user` VALUES ('213', '凌佳皓', 'b09ad9ce072868fe2af20fad135c7bc7', '1234', null, '2', '1234', '2020-01-07 13:01:20', null);
INSERT INTO `user` VALUES ('214', '于相晟', '65f5862e9f0ce5391ca18d7ca4658ff4', '1234', null, '2', '1234', '2020-01-07 13:01:20', null);
INSERT INTO `user` VALUES ('215', '谈昀承', '36ecd046afa0210a2c50bbd3db6b0cd7', '1234', null, '2', '1234', '2020-01-07 13:01:20', null);
INSERT INTO `user` VALUES ('216', '朱郢昊', 'be053a8eb32b590938a5bcb50457134b', '1234', null, '2', '1234', '2020-01-07 13:01:20', null);
INSERT INTO `user` VALUES ('217', '王彦恺', '18e53190c184ed3623d9809dd087ccc3', '1234', null, '2', '1234', '2020-01-07 13:01:20', null);
INSERT INTO `user` VALUES ('218', '施彦彬', '5d90005a8fa8f34a4cea38dd1f5a324f', '1234', null, '2', '1234', '2020-01-07 13:01:20', null);
INSERT INTO `user` VALUES ('219', '陈梓婕', 'ebd018f4d0dd17a75e5379721657276d', '1234', null, '2', '1234', '2020-01-07 13:01:20', null);
INSERT INTO `user` VALUES ('220', '冯洁', '4faa258a6d5d2bf3b18c95cf680736b5', '1234', null, '2', '1234', '2020-01-07 13:01:20', null);
INSERT INTO `user` VALUES ('221', '陆念慈', '6c62a0bafe61c9279895b5b8a9d9c1a8', '1234', null, '2', '1234', '2020-01-07 13:01:20', null);
INSERT INTO `user` VALUES ('222', '李婷瑞', '72d918c5a12def78251b2cab001f0b4d', '1234', null, '2', '1234', '2020-01-07 13:01:20', null);
INSERT INTO `user` VALUES ('223', '黄亦雯', 'd3cba4b5610c19301919c79cf17a9db7', '1234', null, '2', '1234', '2020-01-07 13:01:20', null);
INSERT INTO `user` VALUES ('224', '张琦晖', 'cc0f054bf2510a707a16c3053678edbf', '1234', null, '2', '1234', '2020-01-07 13:01:20', null);
INSERT INTO `user` VALUES ('225', '顾嫣婷', 'a4bfbe0b99541c6b4f23890a445384ea', '1234', null, '2', '1234', '2020-01-07 13:01:20', null);
INSERT INTO `user` VALUES ('226', '赵依辰', '041e8a1ecbf0abf46183f77c3d76d8cf', '1234', null, '2', '1234', '2020-01-07 13:01:20', null);
INSERT INTO `user` VALUES ('227', '黄媛', '5d2210af1d5b22bee593ebc53d9a37c4', '1234', null, '2', '1234', '2020-01-07 13:01:20', null);
INSERT INTO `user` VALUES ('228', '马馨悦', 'ed92b6c225af2cc8e74b05f3429870a6', '1234', null, '2', '1234', '2020-01-07 13:01:20', null);
INSERT INTO `user` VALUES ('229', '瞿慧', '0c14127572ff76cd6725f4db6ecc40e7', '1234', null, '2', '1234', '2020-01-07 13:01:20', null);
INSERT INTO `user` VALUES ('230', '朱婷婷', '4503062b788cc34eae85d60e6f3edea9', '1234', null, '2', '1234', '2020-01-07 13:01:20', null);
INSERT INTO `user` VALUES ('231', '丁诗韵', 'ff58785eb0fae8529aa6b5a3f152ca37', '1234', null, '2', '1234', '2020-01-07 13:01:20', null);
INSERT INTO `user` VALUES ('232', '奚伊雯', 'efddd20a5ef7f790b2a936f9400a40db', '1234', null, '2', '1234', '2020-01-07 13:01:20', null);
INSERT INTO `user` VALUES ('233', '余果', '507cf58a659e74bc7900e70debc30ea8', '1234', null, '2', '1234', '2020-01-07 13:01:20', null);
INSERT INTO `user` VALUES ('234', '陶洁', '5894c336a877bbde6ac36da50d020eb5', '1234', null, '2', '1234', '2020-01-07 13:01:20', null);
INSERT INTO `user` VALUES ('235', '奚晓怡', 'ec54e8523467204cbf0cf85c72bc6b0d', '1234', null, '2', '1234', '2020-01-07 13:01:20', null);
INSERT INTO `user` VALUES ('236', '陆雨婷', 'ab0745f2105fc4c77cae65b6e6f9f5be', '1234', null, '2', '1234', '2020-01-07 13:01:20', null);
INSERT INTO `user` VALUES ('237', '周雨轩', '51a49b8fac78237f8f7be8150c4062bf', '1234', null, '2', '1234', '2020-01-07 13:01:20', null);
INSERT INTO `user` VALUES ('238', '王祎之', '634c18b59647679d050e9cd7f1be0bf9', '1234', null, '2', '1234', '2020-01-07 13:01:20', null);
INSERT INTO `user` VALUES ('239', '尚奕成', 'd41adb1e75673add149487a3243cc1e6', '1234', null, '2', '1234', '2020-01-07 13:01:20', null);
INSERT INTO `user` VALUES ('240', '任宝申', '3b1ffa502d2fc926a9fc7029db147185', '1234', null, '2', '1234', '2020-01-07 13:01:20', null);
INSERT INTO `user` VALUES ('241', '王宇煊', '8bdfe46d14287b90529c9ecf97a19432', '1234', null, '2', '1234', '2020-01-07 13:01:20', null);
INSERT INTO `user` VALUES ('242', '汪杰', '83017a623ffacfb47e3698cf7d47616e', '1234', null, '2', '1234', '2020-01-07 13:01:20', null);
INSERT INTO `user` VALUES ('243', '李瀚明', 'f09d0a0c873cced9cc32d679dcee3467', '1234', null, '2', '1234', '2020-01-07 13:01:20', null);
INSERT INTO `user` VALUES ('244', '葛思维', 'a3e41a2a5c940b708ca9e7e517493ab2', '1234', null, '2', '1234', '2020-01-07 13:01:21', null);
INSERT INTO `user` VALUES ('245', '丁兆峰', '800a1bbd1d1c072a486f4af4a477a76e', '1234', null, '2', '1234', '2020-01-07 13:01:21', null);
INSERT INTO `user` VALUES ('246', '王孜皓', '016707749ceb2c7104d597710e34b85f', '1234', null, '2', '1234', '2020-01-07 13:01:21', null);
INSERT INTO `user` VALUES ('247', '张弘', 'd69e1f04c337abcd9061bbbc5dfd271e', '1234', null, '2', '1234', '2020-01-07 13:01:21', null);
INSERT INTO `user` VALUES ('248', '施懿鸣', 'ef957c72d8a2c4e24127e50a5a351b80', '1234', null, '2', '1234', '2020-01-07 13:01:21', null);
INSERT INTO `user` VALUES ('249', '苏治杰', 'bf1ad7fa9260d98f9f9ea25f11232682', '1234', null, '2', '1234', '2020-01-07 13:01:21', null);
INSERT INTO `user` VALUES ('250', '邱军', '27f438893b9248e6d91435f50fbce67e', '1234', null, '2', '1234', '2020-01-07 13:01:21', null);
INSERT INTO `user` VALUES ('251', '潘文涛', 'e33c67b79daa8b47e77f87358a2c7c10', '1234', null, '2', '1234', '2020-01-07 13:01:21', null);
INSERT INTO `user` VALUES ('252', '陈嘉伟', '40c04d1974005c4a87196f9cd70577fd', '1234', null, '2', '1234', '2020-01-07 13:01:21', null);
INSERT INTO `user` VALUES ('253', '陆屹春', 'de0e65aa11dfd42eb9bd56b2c51e0c75', '1234', null, '2', '1234', '2020-01-07 13:01:21', null);
INSERT INTO `user` VALUES ('254', '顾钦松', '4aecb6e9ce33d05dbc1861e0e3e83650', '1234', null, '2', '1234', '2020-01-07 13:01:21', null);
INSERT INTO `user` VALUES ('255', '方宇', '714fc9292415205fcf0b36c6038ead0f', '1234', null, '2', '1234', '2020-01-07 13:01:21', null);
INSERT INTO `user` VALUES ('256', '赵俊磊', '54ec34fe9d0f310f0775261a5fd517e9', '1234', null, '2', '1234', '2020-01-07 13:01:21', null);
INSERT INTO `user` VALUES ('257', '黄子恒', 'c921a90beabbe7f2cde4bb82382dc809', '1234', null, '2', '1234', '2020-01-07 13:01:21', null);
INSERT INTO `user` VALUES ('258', '金天', 'f6fcb5c430672997ca8aec2bce989a59', '1234', null, '2', '1234', '2020-01-07 13:01:21', null);
INSERT INTO `user` VALUES ('259', '赵度', '8f4fd9bde33b0a0a07232f9dbe546fc4', '1234', null, '2', '1234', '2020-01-07 13:01:21', null);
INSERT INTO `user` VALUES ('260', '王嘉莹', '94cee7069ca5c0d4c45ac091b4f7ea23', '1234', null, '2', '1234', '2020-01-07 13:01:21', null);
INSERT INTO `user` VALUES ('261', '王睿娴', 'bbcd4c0a87267172feda46470a3866c3', '1234', null, '2', '1234', '2020-01-07 13:01:21', null);
INSERT INTO `user` VALUES ('262', '刘嘉乐', '8e58ab5299dcdd06714e07e39614eef7', '1234', null, '2', '1234', '2020-01-07 13:01:21', null);
INSERT INTO `user` VALUES ('263', '虞玮琪', '770576deaecccc98938228d5f98c67ea', '1234', null, '2', '1234', '2020-01-07 13:01:21', null);
INSERT INTO `user` VALUES ('264', '陈伊雯', '16b1afd380908553f25a7afa56c82f7e', '1234', null, '2', '1234', '2020-01-07 13:01:21', null);
INSERT INTO `user` VALUES ('265', '包佳怡', 'facae3a3bb0a5db1f454941d1b900eee', '1234', null, '2', '1234', '2020-01-07 13:01:21', null);
INSERT INTO `user` VALUES ('266', '朱慧婷', 'f5176edd6527d7392f3b7da27a678904', '1234', null, '2', '1234', '2020-01-07 13:01:21', null);
INSERT INTO `user` VALUES ('267', '乐诗妤', '8924716934e687835d7a56c12ab89eab', '1234', null, '2', '1234', '2020-01-07 13:01:21', null);
INSERT INTO `user` VALUES ('268', '熊晶莹', 'f165024f816bd38891e7380201cdf7e4', '1234', null, '2', '1234', '2020-01-07 13:01:21', null);
INSERT INTO `user` VALUES ('269', '王佳宇', 'e63e67d1137d1af5c8f2967ffc339906', '1234', null, '2', '1234', '2020-01-07 13:01:21', null);
INSERT INTO `user` VALUES ('270', '姚雨菡', '46cfe0a5e65d476f9e426b6d09dec97d', '1234', null, '2', '1234', '2020-01-07 13:01:21', null);
INSERT INTO `user` VALUES ('271', '李雯琦', 'd3ec23ab2a9e02036f19e2f638f69a56', '1234', null, '2', '1234', '2020-01-07 13:01:21', null);
INSERT INTO `user` VALUES ('272', '洪奕蕾', 'c6d4d0bcd9e900605dede2e0318e074a', '1234', null, '2', '1234', '2020-01-07 13:01:21', null);
INSERT INTO `user` VALUES ('273', '林佳敏', '9574f724308d0d75890927aa24bfa0f4', '1234', null, '2', '1234', '2020-01-07 13:01:21', null);
INSERT INTO `user` VALUES ('274', '茅贝伊', '99fb27c64e9ebb348324f1aeb0f6f9f6', '1234', null, '2', '1234', '2020-01-07 13:01:21', null);
INSERT INTO `user` VALUES ('275', '俞昕彤', '69c1f9257f7750d345d07ce63bbcd418', '1234', null, '2', '1234', '2020-01-07 13:01:21', null);
INSERT INTO `user` VALUES ('276', '汪于惠', '81cd541d8797c967f1085025c2f63405', '1234', null, '2', '1234', '2020-01-07 13:01:21', null);
INSERT INTO `user` VALUES ('277', '王泽航', 'b09f7e5e51bfab30d406fb86255aa5e8', '1234', null, '2', '1234', '2020-01-07 13:01:21', null);
INSERT INTO `user` VALUES ('278', '李锐', '65824241fbf1e544814bef0a65f9d27d', '1234', null, '2', '1234', '2020-01-07 13:01:21', null);
INSERT INTO `user` VALUES ('279', '杜承伟', 'a1403818993f73206cc3a6234f3f5582', '1234', null, '2', '1234', '2020-01-07 13:01:21', null);
INSERT INTO `user` VALUES ('280', '程裕维', '368ea67655c87f2513b5047a1192731e', '1234', null, '2', '1234', '2020-01-07 13:01:21', null);
INSERT INTO `user` VALUES ('281', '黄天乐', '6448416946e193980a7efac71fbb7e3a', '1234', null, '2', '1234', '2020-01-07 13:01:21', null);
INSERT INTO `user` VALUES ('282', '章健', 'bd14bb263c1605f83d4cd9f22a9b3ea3', '1234', null, '2', '1234', '2020-01-07 13:01:21', null);
INSERT INTO `user` VALUES ('283', '赵奕磊', '40ddb8e48c7e7df48dc7788afc3dc725', '1234', null, '2', '1234', '2020-01-07 13:01:21', null);
INSERT INTO `user` VALUES ('284', '姚瞿晟', 'd4e00e98e147d567bba48f4ada932d48', '1234', null, '2', '1234', '2020-01-07 13:01:21', null);
INSERT INTO `user` VALUES ('285', '钱宸茗', '6780990da4a90a79bcd69e90c6a26a9f', '1234', null, '2', '1234', '2020-01-07 13:01:21', null);
INSERT INTO `user` VALUES ('286', '金泽阳', '7f56579b96866e4d70f338e210b0c8f0', '1234', null, '2', '1234', '2020-01-07 13:01:21', null);
INSERT INTO `user` VALUES ('287', '李雨轩', '1592d7eed60c6658dc730187a6435329', '1234', null, '2', '1234', '2020-01-07 13:01:21', null);
INSERT INTO `user` VALUES ('288', '王亿文', '3c7420c7043193eb3abf53e776ca40ab', '1234', null, '2', '1234', '2020-01-07 13:01:21', null);
INSERT INTO `user` VALUES ('289', '蒋俊彦', '6ee7f134a47556fb8d45a3a539e939c2', '1234', null, '2', '1234', '2020-01-07 13:01:21', null);
INSERT INTO `user` VALUES ('290', '朱子豪', 'ebd7211a4931e5129111f58b4b4b00b4', '1234', null, '2', '1234', '2020-01-07 13:01:21', null);
INSERT INTO `user` VALUES ('291', '孙奕帆', '37a20617c574159dbc4c620521dba6d9', '1234', null, '2', '1234', '2020-01-07 13:01:21', null);
INSERT INTO `user` VALUES ('292', '秦嘉仁', 'e157b62e66cf037dbaf849873f0b9335', '1234', null, '2', '1234', '2020-01-07 13:01:21', null);
INSERT INTO `user` VALUES ('293', '汤智豪', 'b8b56635cf5375f3840bbcf7c40f6fa5', '1234', null, '2', '1234', '2020-01-07 13:01:21', null);
INSERT INTO `user` VALUES ('294', '沈嘉文', 'a647df7fa2191b0a0de26f91b02b35c4', '1234', null, '2', '1234', '2020-01-07 13:01:21', null);
INSERT INTO `user` VALUES ('295', '朱嘉捷', '77d570f78f6c228ea56fb529a4cd703f', '1234', null, '2', '1234', '2020-01-07 13:01:21', null);
INSERT INTO `user` VALUES ('296', '唐无畏', '09187e2cdef352f895845e7ceb758ab3', '1234', null, '2', '1234', '2020-01-07 13:01:21', null);
INSERT INTO `user` VALUES ('297', '邵汶峻', '59c172ba58c92338c61a404570320e75', '1234', null, '2', '1234', '2020-01-07 13:01:21', null);
INSERT INTO `user` VALUES ('298', '林晓琪', 'c55041e28dc204d4778deb4e7902e4ff', '1234', null, '2', '1234', '2020-01-07 13:01:21', null);
INSERT INTO `user` VALUES ('299', '王文君', 'e23da78b07a41e65ba2460ee2bd4ae8a', '1234', null, '2', '1234', '2020-01-07 13:01:21', null);
INSERT INTO `user` VALUES ('300', '钟哲婷', '6e149124e6c8c0820b409eff8d954dfa', '1234', null, '2', '1234', '2020-01-07 13:01:21', null);
INSERT INTO `user` VALUES ('301', '张芷瑛', 'e62f74693388cd96730d93ef7b34f81e', '1234', null, '2', '1234', '2020-01-07 13:01:21', null);
INSERT INTO `user` VALUES ('302', '毛诗琪', 'a141581f2be61888780cc97a99ab8b79', '1234', null, '2', '1234', '2020-01-07 13:01:21', null);
INSERT INTO `user` VALUES ('303', '陆佳颖', '2f37aafe96cdb9161662f4622d4a4e44', '1234', null, '2', '1234', '2020-01-07 13:01:21', null);
INSERT INTO `user` VALUES ('304', '庄洁', 'b9db61aebbdd324ad9858914851396a2', '1234', null, '2', '1234', '2020-01-07 13:01:21', null);
INSERT INTO `user` VALUES ('305', '徐佳颖', '339401970fa6f75962a60e018263975a', '1234', null, '2', '1234', '2020-01-07 13:01:21', null);
INSERT INTO `user` VALUES ('306', '周欣怡', '9b5b7c1f7dd9f08e2c3a3314a2f9fe72', '1234', null, '2', '1234', '2020-01-07 13:01:21', null);
INSERT INTO `user` VALUES ('307', '付卓琳', 'dce220ddcdbf59d079dcb88f43cfcb53', '1234', null, '2', '1234', '2020-01-07 13:01:21', null);
INSERT INTO `user` VALUES ('308', '胡锦倩', '45bfa8840f61ea756403ae494dc74de6', '1234', null, '2', '1234', '2020-01-07 13:01:21', null);
INSERT INTO `user` VALUES ('309', '朱洪雯', '7e9c6f0cc3cf16de88e3fea30d8e1c79', '1234', null, '2', '1234', '2020-01-07 13:01:21', null);
INSERT INTO `user` VALUES ('310', '阎嘉仪', '2af3f87fc39e5cc8cef5db786e067d9d', '1234', null, '2', '1234', '2020-01-07 13:01:21', null);
INSERT INTO `user` VALUES ('311', '蔡瑷文', 'd1191a282bae3a32e24a17a80f30a671', '1234', null, '2', '1234', '2020-01-07 13:01:21', null);
INSERT INTO `user` VALUES ('312', '陈佳妮', 'a060139da7660646eb825bfe8683a397', '1234', null, '2', '1234', '2020-01-07 13:01:21', null);
INSERT INTO `user` VALUES ('313', '戈佳超', '67cf1beac7bb5c37f242cde432a0846e', '1234', null, '2', '1234', '2020-01-07 13:01:21', null);
INSERT INTO `user` VALUES ('314', '曹坤', 'bfa1e63f6662b1c8a5f19f3f1fb5823a', '1234', null, '2', '1234', '2020-01-07 13:01:21', null);
INSERT INTO `user` VALUES ('315', '王璐瑶', '7780d14460d8955621aaa37a8cf79131', '1234', null, '2', '1234', '2020-01-07 13:01:21', null);
INSERT INTO `user` VALUES ('316', '吴梦涵', '6f3e83db1b49232396da1ee7f3340643', '1234', null, '2', '1234', '2020-01-07 13:01:21', null);
INSERT INTO `user` VALUES ('317', '石鑫宇', '93ddec78b1352c549eced92d6ff636e6', '1234', null, '2', '1234', '2020-01-07 13:01:21', null);
