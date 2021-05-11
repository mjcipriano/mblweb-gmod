-- MySQL dump 10.7
--
-- Server version	4.1.7-log
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE="NO_AUTO_VALUE_ON_ZERO" */;

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL auto_increment,
  `user_name` varchar(25) default NULL,
  `first_name` varchar(25) default NULL,
  `last_name` varchar(25) default NULL,
  `active_fg` char(1) default NULL,
  `password` varbinary(41) default NULL,
  `email` varchar(255) default NULL,
  `institution` varchar(255) default NULL,
  PRIMARY KEY  (`id`),
  KEY `user_user_name` (`user_name`)
);

--
-- Dumping data for table `user`
--

INSERT IGNORE INTO `user` VALUES (1,'Admin','Site','Administrator','Y','1428ca566cc924cb','admin@nowhere.com',NULL);
INSERT IGNORE INTO `user` VALUES (2,'BLAST','Automated','Blast','Y',NULL,'admin@nowhere.com',NULL);
--
-- Table structure for table `user_rights`
--

CREATE TABLE IF NOT EXISTS `user_rights` (
  `id` int(11) NOT NULL auto_increment,
  `userid` int(11) default NULL,
  `rights` varchar(40) default NULL,
  `type` varchar(30) default NULL,
  PRIMARY KEY  (`id`),
  KEY `user_rights_userid_idx` (`userid`)
);

--
-- Dumping data for table `user_rights`
--

INSERT IGNORE INTO `user_rights` VALUES (1396,1,'Annotation Admin','annotation');

--
-- Table structure for table `templates`
--

CREATE TABLE IF NOT EXISTS `templates` (
  `template_file` varchar(25) default NULL,
  `page_name` varchar(30) default NULL,
  `id` int(11) NOT NULL auto_increment,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `page_name` (`page_name`)
);

--
-- Dumping data for table `templates`
--

INSERT IGNORE INTO `templates` VALUES ('intro.tt','intro',1);
INSERT IGNORE INTO `templates` VALUES (NULL, 'default',2);
INSERT IGNORE INTO `templates` VALUES ('sage.tt','sage',3);
INSERT IGNORE INTO `templates` VALUES ('blast.tt','blast',4);
INSERT IGNORE INTO `templates` VALUES ('sageresults.tt','sageresults',5);
INSERT IGNORE INTO `templates` VALUES ('blastresults.tt','blastresults',6);
INSERT IGNORE INTO `templates` VALUES ('download.tt','download',7);
INSERT IGNORE INTO `templates` VALUES ('showorf.tt','showorf',8);
INSERT IGNORE INTO `templates` VALUES ('header.tt','header',9);
INSERT IGNORE INTO `templates` VALUES ('footer.tt','footer',10);
INSERT IGNORE INTO `templates` VALUES ('orf.tt','orfs',11);
INSERT IGNORE INTO `templates` VALUES ('assembly.tt','assembly',12);
INSERT IGNORE INTO `templates` VALUES ('showsagetag.tt','showsagetag',13);
INSERT IGNORE INTO `templates` VALUES ('onecolumn.tt','general_help',22);
INSERT IGNORE INTO `templates` VALUES ('orfresults.tt','orfresults',15);
INSERT IGNORE INTO `templates` VALUES ('onecolumn.tt','SAGEhelp',16);
INSERT IGNORE INTO `templates` VALUES ('annotation.tt','annotation',17);
INSERT IGNORE INTO `templates` VALUES ('login.tt','login',18);
INSERT IGNORE INTO `templates` VALUES ('bulkannotation.tt','bulkannotation',19);
INSERT IGNORE INTO `templates` VALUES ('assembly_overview.tt','assembly_overview',20);
INSERT IGNORE INTO `templates` VALUES ('multiple_alignment.tt','multiple_alignment',21);
INSERT IGNORE INTO `templates` VALUES ('gblastresults.tt','gblastresults',23);
INSERT IGNORE INTO `templates` VALUES ('gblast.tt','gblast',24);
INSERT IGNORE INTO `templates` VALUES ('showread.tt','showread',25);
INSERT IGNORE INTO `templates` VALUES ('showreadfasta.tt','showreadfasta',26);
INSERT IGNORE INTO `templates` VALUES ('showcontig.tt','showcontig',27);
INSERT IGNORE INTO `templates` VALUES ('showcontiglinking.tt','showcontiglinking',28);
INSERT IGNORE INTO `templates` VALUES ('blastfull.tt','blastfull',29);
INSERT IGNORE INTO `templates` VALUES ('ma.tt','ma',30);
INSERT IGNORE INTO `templates` VALUES ('tree.tt','tree',31);
INSERT IGNORE INTO `templates` VALUES ('atv.tt','atv',32);
INSERT IGNORE INTO `templates` VALUES ('sageanalysis.tt','sageanalysis',33);
INSERT IGNORE INTO `templates` VALUES ('orfanalysis.tt','orfanalysis',34);
INSERT IGNORE INTO `templates` VALUES ('sagesearchresults.tt','sagesearch',35);
INSERT IGNORE INTO `templates` VALUES ('sagematch.tt','sagematch',36);
INSERT IGNORE INTO `templates` VALUES ('orftable.tt','orftable',37);
INSERT IGNORE INTO `templates` VALUES ('download_tool.tt','download_tool',38);
INSERT IGNORE INTO `templates` VALUES ('showorfnew.tt','orfnew',39);
INSERT IGNORE INTO `templates` VALUES ('orfma.tt','orfma',40);
INSERT IGNORE INTO `templates` VALUES ('news.tt','news',41);
INSERT IGNORE INTO `templates` VALUES ('orfsearchresults.tt','orfsearch',43);
INSERT IGNORE INTO `templates` VALUES ('showcontigfasta.tt','showcontigfasta',44);
INSERT IGNORE INTO `templates` VALUES ('editorf.tt','edit_orf',45);
INSERT IGNORE INTO `templates` VALUES ('domains.tt','domains',46);
INSERT IGNORE INTO `templates` VALUES ('admin_page.tt','admin_page',47);

--
-- Table structure for table `algorithms`
--

CREATE TABLE IF NOT EXISTS `algorithms` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(20) default NULL,
  PRIMARY KEY  (`id`),
  KEY `algorithms_name_id` (`name`,`id`)
);

--
-- Dumping data for table `algorithms`
--

INSERT IGNORE INTO `algorithms` VALUES (1,'blastn');
INSERT IGNORE INTO `algorithms` VALUES (3,'blastp');
INSERT IGNORE INTO `algorithms` VALUES (12,'blastprodom');
INSERT IGNORE INTO `algorithms` VALUES (2,'blastx');
INSERT IGNORE INTO `algorithms` VALUES (11,'coil');
INSERT IGNORE INTO `algorithms` VALUES (9,'fprintscan');
INSERT IGNORE INTO `algorithms` VALUES (6,'hmmcath');
INSERT IGNORE INTO `algorithms` VALUES (4,'hmmpfam');
INSERT IGNORE INTO `algorithms` VALUES (10,'hmmsmart');
INSERT IGNORE INTO `algorithms` VALUES (7,'hmmtigr');
INSERT IGNORE INTO `algorithms` VALUES (14,'profilescan');
INSERT IGNORE INTO `algorithms` VALUES (15,'protfun');
INSERT IGNORE INTO `algorithms` VALUES (13,'scanregexp');
INSERT IGNORE INTO `algorithms` VALUES (8,'seg');
INSERT IGNORE INTO `algorithms` VALUES (17,'signalp');
INSERT IGNORE INTO `algorithms` VALUES (18,'targetp');
INSERT IGNORE INTO `algorithms` VALUES (5,'tblastx');
INSERT IGNORE INTO `algorithms` VALUES (16,'tmhmm');

--
-- Table structure for table `current_search`
--

CREATE TABLE IF NOT EXISTS `current_search` (
  `idname` varchar(30) default NULL,
  `sequence_type_id` int(11) default NULL,
  `db_id` int(11) default NULL,
  `algorithm_id` int(11) default NULL,
  UNIQUE KEY `idname` (`idname`,`sequence_type_id`,`db_id`,`algorithm_id`)
);

--
-- Dumping data for table `current_search`
--


--
-- Table structure for table `evidence_codes`
--

CREATE TABLE IF NOT EXISTS `evidence_codes` (
  `id` int(11) NOT NULL auto_increment,
  `code` varchar(5) default NULL,
  `description` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
);

--
-- Dumping data for table `evidence_codes`
--

INSERT IGNORE INTO `evidence_codes` VALUES (1,'IMP','inferred from mutant phenotype');
INSERT IGNORE INTO `evidence_codes` VALUES (2,'IGI','inferred from genetic interaction');
INSERT IGNORE INTO `evidence_codes` VALUES (3,'IPI','inferred from physical interaction');
INSERT IGNORE INTO `evidence_codes` VALUES (4,'ISS','inferred from sequence similarity');
INSERT IGNORE INTO `evidence_codes` VALUES (5,'IDA','inferred from direct assay');
INSERT IGNORE INTO `evidence_codes` VALUES (6,'IEP','inferred from expression pattern');
INSERT IGNORE INTO `evidence_codes` VALUES (7,'IEA','inferred from electronic annotation');
INSERT IGNORE INTO `evidence_codes` VALUES (8,'TAS','traceable author statement');
INSERT IGNORE INTO `evidence_codes` VALUES (9,'NAS','non-traceable author statement');
INSERT IGNORE INTO `evidence_codes` VALUES (10,'ND','no biological data available');
INSERT IGNORE INTO `evidence_codes` VALUES (11,'IC','inferred by curator');

--
-- Table structure for table `files`
--

CREATE TABLE IF NOT EXISTS `files` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(55) default NULL,
  `data` longblob,
  `type` varchar(55) default NULL,
  `location` varchar(255) default NULL,
  `filename` varchar(255) default NULL,
  PRIMARY KEY  (`id`),
  KEY `files_name_type` (`name`,`type`),
  KEY `files_type` (`type`)
);

--
-- Dumping data for table `files`
--


--
-- Table structure for table `html`
--

CREATE TABLE IF NOT EXISTS `html` (
  `template` varchar(20) default NULL,
  `variable` varchar(40) default NULL,
  `value` text,
  UNIQUE KEY `template` (`template`,`variable`)
);

--
-- Dumping data for table `html`
--

INSERT IGNORE INTO `html` VALUES ('intro','html_leftcolumn','<h3><i>My Organism</i></h3>\r\n<p>Place information here');
INSERT IGNORE INTO `html` VALUES ('default','html_title_text','OrganismDB');
INSERT IGNORE INTO `html` VALUES ('default','html_funding','<p>Funding provided by:Place Funding here');
INSERT IGNORE INTO `html` VALUES ('intro','html_rightcolumn','Place Right Column Text Here');
INSERT IGNORE INTO `html` VALUES ('assembly','html_leftcolumn','Place Assembly Left Column Here');
INSERT IGNORE INTO `html` VALUES ('assembly','html_bottom','Assembly Bottom of the Page Info here');
INSERT IGNORE INTO `html` VALUES ('assembly','html_rightcolumn','');
INSERT IGNORE INTO `html` VALUES ('default','perl_searchtool','<form method=\"post\" action=\"/gb/gbrowse/mydatabase\" enctype=\"application/x-www-form-urlencoded\" name=\"mainform\">\r\n<input type=\"text\" name=\"name\"  size=\"40\" /><input type=\"submit\" name=\"Search\" value=\"Search\" />\r\n</form>');
INSERT IGNORE INTO `html` VALUES ('default','html_header','<center>\r\n\r\n<table width=\"100%\">\r\n\r\n<tr>\r\n\r\n<td width=\"10%\">\r\n	<center>\r\n	<small><i></a></i></small>\r\n	</center>\r\n</td>\r\n\r\n<td width=\"1%\"></td>\r\n\r\n<td>\r\n\r\n	<center>\r\n\r\n	<p><font size=\"+4\" color=\"red\"><b><i>Organism</i>DB</b></font></p>\r\n	\r\n</center>\r\n</td>\r\n\r\n</tr>\r\n\r\n</table>\r\n\r\n</center>');
INSERT IGNORE INTO `html` VALUES ('default','html_projectenquiries','			<center>\r\n			<p><i>Scientific enquiries should be sent to <a href=\"mailto:nobody@nowhere.com\">nobody</a></i></p>\r\n\r\n			</center>');
INSERT IGNORE INTO `html` VALUES ('default','html_gmodenquiries','			<center>\r\n			<p><i>This database is hosted by us <a href=\"http://www.here.com\">HERE</a>.  Bug reports and technical problems should be reported to <a href=\"mailto:nobody@nowhere\">nobody</a>.</i></p>\r\n\r\n			</center>');
INSERT IGNORE INTO `html` VALUES ('default','database_name','defaultdb');
INSERT IGNORE INTO `html` VALUES ('default','html_menu','Home | GBrowse | Blast | Assembly | ORFs | SAGE | Download | Pfam | Rfam | Repeats | Help');
INSERT IGNORE INTO `html` VALUES ('sage','html_leftcolumn','<h3><center>SAGE Overview</center></h3>\n\n');
INSERT IGNORE INTO `html` VALUES ('sage','html_rightcolumn','');
INSERT IGNORE INTO `html` VALUES ('sageanalysis','html_top','<center>\n<p><font size=\"+4\" color=\"red\"><b>SAGE Analysis</b></font></p>\r\n</center>\n<hr>');
INSERT IGNORE INTO `html` VALUES ('assembly','html_header','<center>\r\n\r\n<p><font size=\"+4\" color=\"red\"><b>Genome Assembly</b></font></p>\r\n\r\n<h3>Whole Genome Shotgun Sequence Assembly </h3>\r\n\r\n</center>	\r\n\r\n<br>');
INSERT IGNORE INTO `html` VALUES ('default','html_site_cgi','/perl/site');
INSERT IGNORE INTO `html` VALUES ('download','html_top','<p>Place Download Text Here');
INSERT IGNORE INTO `html` VALUES ('download','html_header','<center>\r\n\r\n<p><font size=\"+4\" color=\"red\"><b>Downloads</b></font></p>\r\n\r\n<h3> Genome Sequence Information</h3>\r\n\r\n</center>	<hr>');
INSERT IGNORE INTO `html` VALUES ('blast','html_header','<center>\r\n\r\n<p><font size=\"+4\" color=\"red\"><b>BLAST</b></font></p>\r\n\n<h3><b>Searching the Genome</b></h3>\n\r\n</center>	\r\n\n<hr>');
INSERT IGNORE INTO `html` VALUES ('general_help','html_column','<h2><a name=\"selecting\">Selecting a Region of the Genome</a></h2>\r\n\r\n<p>\r\n\r\n<img src=\"/img/help/genhelp1.jpg\" align=\"RIGHT\">\r\n\r\nTo select a region of the genome to view, enter its name in the text\r\nfield labeled \"Landmark or Region\".  Here are some examples:\r\n\r\n<dl>\r\n  <dt><b>a chromosome name</b>\r\n  <dd>Chromosome assignments are not currently available.</i>\r\n      <p>\r\n  <dt><b>keywords</b>\r\n\r\n  <dd>You can enter keywords to search the databases of annotations, BLASTP hits to GenBank and SwissProt protein entries, and HMMER hits to the <a href=\"http://pfam.wustl.edu\">PFam protein domains</a>.  This will produce a listing of Open Reading Frames with annotations or BLAST/HMMER hits containing these keywords, with measures of the significance of the match.  Examples: <i>histone, thioredoxin, Entamoeba</i>.  \r\n      <p>\r\n  <dt><b>a contig or clone name</b>\r\n  <dd>You can enter the name of a assembly landmark such as a\r\n      sequence read, clone, contig, or supercontig.  Examples: <i>contig_2325, read:GLL0088D06, supercontig_2758</i>.\r\n      <p>\r\n  <dt><b>an accession number</b>\r\n\r\n  <dd>You can enter a GenBank or SwissProt accession number (proteins only) as all Open Reading Frames are associated with a database of BLASTP hits.\r\n      <p>\r\n  <dt><b>ORF and SAGE tag IDs</b>\r\n  <dd>You can jump to specific ORFs or SAGE tags using their identifiers.  These identifiers are immortal - they will not change as the assembly changes.  Examples: <i>orf:14753, sagetag:1000</i>.\r\n		<p>\r\n  <dt><b>tRNAs</b>\r\n  <dd>You can jump to specific tRNA using their identifiers.  Example: <i>trna:leu</i>.\r\n\r\n</dl>\r\n\r\n<h3>The Overview and Detail Panels</h3>\r\n\r\n<p>\r\n\r\nIf the landmark is found in the database, the browser will display the\r\nregion of the genome it occupies.  The region is displayed in two\r\ngraphical panels:\r\n\r\n<p>\r\n\r\n<center>\r\n<table>\r\n<tr>\r\n<td><b>Overview Panel</b></td><td width=\"100%\"><center><img src=\"/img/help/genhelp2.jpg\" align=\"CENTER\"></center></td>\r\n</tr>\r\n<tr>\r\n\r\n<td><b>Detail Panel</b></td><td width=\"100%\"><center><img src=\"/img/help/genhelp3.jpg\" align=\"CENTER\"></center></td>\r\n</tr>\r\n</table>\r\n</center>\r\n\r\n<p>\r\n\r\n<dl>\r\n  <dt><b>overview panel</b>\r\n  <dd>This panel displays the genomic context, typically a large portion of the sequence\r\n      assembly such as a supercontig (scaffold) or contig.  A red rectangle indicates the region of the genome that is\r\n      displayed in the detail panel.  This rectangle may appear as\r\n      a single line if the detailed region is relatively small.\r\n      <p>\r\n  <dt><b>detail panel</b>\r\n\r\n  <dd>This panel displays a zoomed-in view of the genome corresponding\r\n      to the overview\'s red rectangle.  The detail panel consists of\r\n      one or more tracks showing annotations and other features that\r\n      have been placed on the genome.  The detail panel is described\r\n      at length later.      \r\n</dl>\r\n\r\n<p>\r\n\r\nIf the requested landmark is not found, the browser will display a\r\nmessage to this effect.\r\n\r\n<h3>Specifying the Landmark Type</h3>\r\n\r\n<p>\r\n\r\nSome kinds of landmarks have been qualified with their type using the format <i>type:landmark</i>.  For\r\nexample, to look up the SAGE tag 1000 in the\r\n DB, you would search for\r\n\r\n<i>sagetag:1000</i>.\r\n\r\n<p>\r\n\r\nIn the case of clashes between names, such as an ORF and a SAGE tag both\r\nnumbered 1000, you can use the name type to choose which landmark you\r\nmean.\r\n\r\n<p>\r\n\r\n<ul><li>read:</li> <li>contig_</li> <li>supercontig_</li> <li>orf:</li> <li>sagetag:</li> <li>trna:</li>\r\n\r\n</ul>\r\n\r\n<h3>Viewing a Precise Region around a Landmark</h3>\r\n\r\n<p>\r\n\r\nYou can view a precise region around a landmark using the notation\r\n<i>landmark:start..stop</i>, where <i>start</i> and <i>stop</i> are\r\nthe start and stop positions of the sequence relative to the landmark.\r\nThe beginning of the feature is position 1. To view position 1000 to 5000 of contig_2325, you would search for <i>contig_2325:1000..5000</i>.</p>\r\n\r\n<p>In the case of complex\r\nfeatures, such as genes, the \"beginning\" is defined by the database\r\nadministrator.  For example, in the  data set,\r\nposition 1 of a predicted gene is the AUG at the beginning of the CDS.  To view the region that begins 100 base pairs upstream of the AUG of ORF 1000 and\r\nends 500 bases downstream of it, you would search for\r\n<i>orf:1000:-99..500</i>.</p>\r\n\r\n<p>This offset notation will work correctly for negative strand features\r\nas well as positive strand features.  The coordinates are always\r\nrelative to the feature itself.  For example, to view the <b>reverse compliment</b> of position 1000 to 5000 of contig_2325, you would search for <i>contig_2325:5000..1000</i>.</p>\r\n\r\n<h3>Searching for Keywords</h3>\r\n\r\n<p>\r\n\r\nAnything that you type into the \"Landmark or Region\" textbox that\r\nisn\'t recognized as a landmark will be treated as a full text search\r\nacross the feature database.  This will find comments or other feature\r\nnotations that match the typed text.  These include annotations, blast hits, and PFam hits.\r\n\r\n<p>\r\n\r\nIf successfull, the browser will present you with a list of possible\r\nmatching landmarks and their comments.  You will then be asked to\r\nselect one to view.  To see this in action, try typing \"kinase\" into\r\nthe \"Landmark or Region\" box.\r\n\r\n<hr>\r\n\r\n<h2><a name=\"navigation\">Navigation</a></h2>\r\n\r\n<img src=\"/img/help/genhelp4.jpg\" align=\"RIGHT\">\r\n\r\n<p>\r\n\r\nOnce a region is displayed, you can navigate through it in a number of\r\nways:\r\n\r\n<dl>\r\n  <dt><b>Scroll left or right with the &lt;&lt;, &lt;,\r\n      &gt; and &gt;&gt; buttons</b>\r\n  <dd>These buttons, which appear in the \"Scroll/Zoom\" section of the\r\n      screen, will scroll the detail panel to the left or right.  The\r\n      <b>&lt;&lt;</b> and <b>&gt;&gt;</b> buttons scroll an entire\r\n      screen\'s worth, while <b>&lt;</b> and <b>&gt;&gt;</b> scroll a\r\n      half screen.\r\n      <p>\r\n\r\n  <dt><b>Zoom in or out using the \"Show XXX Kbp\" menu.</b>\r\n  <dd>Use menu that appears in the center of the \"Scroll/Zoom\" section\r\n      to change the zoom level.  The menu item name indicates the\r\n      number of base pairs to show in the detail panel.  For example,\r\n      selecting the item \"100 Kbp\" will zoom the detail panel so as\r\n      to show a region 100 Kbp wide.\r\n      <p>\r\n  <dt><b>Make fine adjustments on the zoom level using the \"-\" and\r\n      \"+\" buttons.</b>\r\n  <dd>Press the <b>-</b> and <b>+</b> buttons to change the zoom level\r\n      by small increments.\r\n      <p>\r\n\r\n  <dt><img src=\"/img/help/genhelp5.gif\" align=\"RIGHT\">\r\n      <b>Recenter the detail panel by clicking on its scale</b>\r\n  <dd>The scale at the top of the detail panel is live.  Clicking on\r\n      it will recenter the detail panel around the location you\r\n      clicked.  This is a fast and easy way to make fine adjustments\r\n      in the displayed region.\r\n      <p>\r\n  <dt><b>Get information on a feature by clicking on it</b>\r\n  <dd>Clicking on a feature in the detail view will link to a page\r\n      that displays more information about it. \r\n      <p>\r\n  <dt><img src=\"/img/help/genhelp6.jpg\" align=\"RIGHT\">\r\n      <b>Jump to a new region by clicking on the overview panel</b>\r\n\r\n  <dd>Click on the overview panel to immediately jump\r\n      to the corresponding region of the genome.\r\n</dl>\r\n\r\n<br clear=\"all\">\r\n\r\n<hr>\r\n\r\n<h2><a name=\"detail\">The Detail Panel</a></h2>\r\n\r\n<p>\r\n\r\nThe detailed view is composed of a number of distinct tracks which\r\nstretch horizontally from one end of the display to another.  Each\r\ntrack corresponds to a different type of genomic feature, and is\r\ndistinguished by a distinctive graphical shape and color.\r\n\r\n<p>\r\n\r\n<center>\r\n\r\n<img src=\"/img/help/genhelp7.jpg\" align=\"CENTER\">\r\n</center>\r\n\r\n<p>\r\n\r\nThe key to the tracks is shown at the bottom of the detail panel.  For\r\nmore information on the source and nature of the track, click on the\r\ntrack label in the \"Search Settings\" area (discussed below).\r\n\r\n<h3>Customizing the Detail Panel</h3>\r\n\r\nYou can customize the detailed display in a number of ways:\r\n\r\n<p>\r\n\r\n<dl>\r\n  <dt><b>Turn tracks on and off using the \"Search Settings\" area</b>\r\n  <dd><img src=\"/img/help/genhelp8.jpg\" border=\"1\"><p>\r\n\r\n      The panel labeled \"Search Settings\" contains a series of\r\n      checkboxes.  Each checkbox corresponds to a track type.  Selecting\r\n      the checkbox activates its type.  Select the label to the\r\n      right of the checkbox to display a window that provides more\r\n      detailed information on the track, such the algorithm used to\r\n      generate it, its author, or citations.\r\n      <p>\r\n  <dt><b>Change the properties of the tracks using the \"Set Track Options\" button</b>\r\n  <dd><img src=\"/img/help/genhelp9.jpg\" border=\"1\"><p>\r\n      This will bring up a window that has detailed settings for each of the tracks.\r\n      Toggle the checkbox in the \"Show\" column to turn the track on\r\n      and off (this is the same as changing the checkbox in the Search\r\n      Settings area). Change the popup menu in the \"Format\" column to\r\n      alter the appearance of the corresponding track.  Options include:\r\n      <i>Compact</i> which forces all items in the track onto a single overlapping line without\r\n      labels or descriptions; <i>Expand</i>, which causes items to bump each other so that\r\n      they don\'t collide; and <i>Expand &amp; Label</i>, which causes items to be labeled\r\n      with their names and a brief description.  The default, <i>Auto</i> will choose compact\r\n      mode if there are too many features on the track, or one of the expanded modes if there\r\n      is sufficient room.  Any changes you make are remembered the next time you visit the browser.\r\n      Press <b>Accept Changes and Return...</b> when you are satisfied with the current options.\r\n      <p>\r\n\r\n  <dt><b>Change the order of tracks using the \"Set Track Options\" button</b>\r\n  <dd>The last column of the track options window allows you to change the order of the\r\n      tracks.  The popup menu lists all possible feature types in alphabetic order.  Select\r\n      the feature type you wish to assign to the track.  The window should refresh with the\r\n      adjusted order automatically, but if it doesn\'t, select the \"Refresh\" button to see the\r\n      new order.\r\n      \r\n</dl>\r\n\r\n<hr>\r\n\r\n<h2><a name=\"upload\">Uploading Your Own and 3d Party Annotations</a></h2>\r\n\r\n<p>\r\n\r\nThis browser supports third party annotations, both your own private\r\nannotations and published annotations contributed by third parties.\r\n\r\n<h3>Uploading Your Own Annotations</h3>\r\n\r\n<img src=\"/img/help/genhelp10.jpg\">\r\n\r\n<p>\r\n\r\nTo view your own annotations on the displayed genome, go to the bottom\r\nof the screen and click on the <b>Browse...</b> button in the file\r\nupload area.  This will prompt you for a text file containing your\r\nannotations.\r\n\r\n<p>\r\n\r\nOnce loaded, tracks containing these annotations will appear on the\r\ndetailed display and you can control them just like any of the\r\nbuilt-in tracks.  In addition new <b>Edit</b>, <b>Delete</b> and\r\n\r\n<b>Download</b> buttons will appear in the file upload area.  As their\r\nnames imply, these buttons allow you to edit the uploaded file,\r\ndownload it, or delete it completely.\r\n\r\n<p>\r\n\r\nThe date at which the uploaded file was created or last modified is\r\nprinted next to its name.  If there are a manageable number of\r\nannotated areas, GBrowse will create links that allow you to jump\r\ndirectly to them.\r\n\r\n<p>\r\n\r\nYou may upload as many files as you wish, but be advised that the\r\nperformance of the browser may decrease if there are many large\r\nuploads to process.\r\n\r\n<h3>Viewing 3d Party Annotations</h3>\r\n\r\n<p>\r\n\r\nTo view 3d party annotations, the annotations must be published on a\r\nreachable web server and you must know the annotation file\'s URL.\r\n<p>\r\n\r\n<img src=\"/img/help/genhelp11.jpg\">\r\n\r\n<p>\r\n\r\nAt the bottom of the browser window is a text box labeled \"Enter\r\nRemote Annotation URL\".  Type in the URL and then press \"Update URLs\".\r\nThe system will attempt to upload the indicated URL.  If successful,\r\nthe data will appear as one or more new tracks.  Otherwise you will\r\nbe alerted with an error message.\r\n\r\n<p>\r\n\r\nYou may add as many remote URLs as you wish.  To delete one, simply\r\nerase it and press \"Update URLs\" again.\r\n\r\n<hr>\r\n\r\n<h2><a NAME=\"bugs\">Software Bugs</a></h2>\r\n\r\n<p> DB is continually evolving, so this software may contain bugs.  Please report any that\r\nyou suspect to <a href=\"mailto:gmod@lists.mbl.edu\">gmod@lists.mbl.edu</a>, along with whatever information that you can\r\nprovide as to what you were doing when the bug appeared.</p>\r\n\r\n<p>\r\n');
INSERT IGNORE INTO `html` VALUES ('SAGEhelp','html_column','<p><h3><center>Hierarchial Clustering Using Log-likelihood Ratio Statistic (R)</center></h3>\r\nRecommended cluster analysis directions:\r\n<ul> \r\n<li>Download <a href=\"http://bonsai.ims.u-tokyo.ac.jp/~mdehoon/software/cluster/software.htm\">CLUSTER 3.0 </a> and  <a href=\"http://genome-www.stanford.edu/~alok/TreeView\">TreeView.</a></li>\r\n<li>Select which libraries to include, minimum tag count, etc (make sure export format says <b>CLUSTER3.0</b>).</li>\r\n<li>Hit the <b>submit</b> button.  This will create a text file called <b>sageresults.txt.</b></li>\r\n<li>Open Cluster 3.0.  Go to File, Open data, and click on the file you just created (<b>sageresults.txt</b>).</li>\r\n<li>Click on the <b>Adjust data</b> tab.  Check <b>log transformation data, genes and arrays under median center</b> and click <b>APPLY.</b></li>\r\n<li>Click on the Hierarchical tab.  Check <b>Cluster</b> and <b>Correlation (centered)</b> for BOTH genes and arrays.</li>\r\n<li>Click on <b>Average Linkage</b>.  This will create a file called <b>sageresults.cdt.</b></li>\r\n<li>Now open the TreeView folder and click on TreeView.jar.</li>\r\n<li>Go to File and open the text file you just created (sageresults.cdt).</li>\r\n<li>This will give you a tree similar to this:</li> \r\n<img width=250 src=\"/img/help/new_treeview.png\">\r\n<br>\r\n<br>\r\n</ul>\r\nNote:  Other programs such as <a href=\"http://cluto.ccgb.umn.edu/\">wCLUTO</a>, <a href=\"http://ccgb.umn.edu/software/java/apps/TableView/\">TableView</a>, and <a href=\"http://telethon.bio.unipd.it/bioinfo/IDEG6/readme.html\">IDEG6</a> may be used for additional/other analysis.\r\n<br><br>\r\nTag type codes found in the cluster data are abbreviated as:\r\n<ul> \r\n<li>PS=Primary Sense</li>\r\n<li>PA=Primary Antisense</li>\r\n<li>AS=Alternate Anitisense</li>\r\n<li>AA=Alternate Antisense</li>\r\n<li>UK=Unknown</li>\r\n</ul>\r\n</p>');
INSERT IGNORE INTO `html` VALUES ('orfs','html_leftcolumn','<h3><center>Gene Prediction Strategy</center></h3>\r\n<p>Gene prediction primarily uses the  \r\ncomputer programs <a  \r\nhref=\"http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=pubmed&dopt=Abstract&list_uids=10556321\">GLIMMER</a>  \r\nand <a  \r\nhref=\"http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=pubmed&dopt=Abstract&list_uids=10331277\">CRITICA</a>,  \r\ndetection of genes via transcription by Serial Analysis of Gene  \r\nExpression (<a href=\"sagehomepage\">see SAGE data</a>), and by manual  \r\ncuration of genes reported in the literature and GenBank.   The terms  \r\n<i>predicted open reading frames</i> or <i>protein coding genes</i> are  \r\nused interchangably throughout the DB. ORFs are presented in  \r\nthe context of gene models which include exons, introns, and the  \r\nuntranslated regions (UTRs) of theoretical or cDNA transcripts. The  \r\naccuracy of the 3&acute; UTR model is important for assignment of  \r\nprimary SAGE tags.</p>\r\n<p>As the underlying genome assembly approaches closure, effort has  \r\nbeen made to track predicted genes between assemblies.  Each ORF is  \r\nassigned an identification number, its ORF ID.  When a new assembly is  \r\nproduced, existing ORFs are re-mapped to the genome based on 100%  \r\nnucleotide identity, including searches for new additional copies of  \r\nthe gene.  Some ORFs may <i>fall off</i> the assembly if a single (or  \r\nmore) mismatch exists between the ORF nucleotide sequence and assembly  \r\nconsensus.  In this case, a new ORF ID is assigned to the newly  \r\npredicted gene sequence and tools are provided to trace the fate of  \r\nORFs <i>falling off</i> the assembly.  Multiple iterations of <a  \r\nhref=\"http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=pubmed&dopt=Abstract&list_uids=10556321\">GLIMMER</a>  \r\nand <a  \r\nhref=\"http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?cmd=Retrieve&db=pubmed&dopt=Abstract&list_uids=10331277\">CRITICA</a>  \r\nare performed between assemblies to ensure the most complete gene  \r\nprediction coverage.</p>\r\n<p>A degree of ORF screening is performed to ensure the quality of  \r\npredicted genes.  Partial ORFs are not supported - each ORF must have a  \r\nproper start and stop codon.  This means that partial ORFs will not be  \r\npredicted for the end of assembly contigs.  If same-frame, overlapping  \r\nORFs are predicted that differ in the predicted start codon only, the  \r\ngene prediction giving the longest protein is retained.  As such,  \r\ninitial gene preditions are likely to be overly greedy about start  \r\ncodons until experimental evidence is found to revise the position of  \r\nthe start codon.</p>\r\n<p>ORFs overlapping in different reading frames are retained.  No ORF  \r\nfilters based on ORF length or homology scores are currently in use.   \r\nIntrons are tracked where known from experimental evidence.</p>\r\n<center><h3>Annotation</h3></center>\r\n<p>Annotation of proteins is provided primarily by BLAST (1e<sup>-20</sup> cut-off), except where provided by curation and third party annotation. A number of precompiled results (BLAST, PFam, etc.) and expression profiles (SAGE) are available for each ORF.</p>');
INSERT IGNORE INTO `html` VALUES ('orfs','html_header','<center><p><font size=\"+4\" color=\"red\"><b>Open Reading Frames</b></font></p></center><center>\r\n<h3>Gene Prediction</h3>\r\n</center>	');
INSERT IGNORE INTO `html` VALUES ('sage','html_header','<center><p><font size=\"+4\" color=\"red\"><b>Serial Analysis of Gene Expression</b></font></p></center>\r\n<center><h3>Characterization of the Transcriptome</center>');
INSERT IGNORE INTO `html` VALUES ('sageresults','html_header','<center><p><font size=\"+4\" color=\"red\"><b>SAGE Analysis Results</b></font></p>');
INSERT IGNORE INTO `html` VALUES ('general_help','html_header','<center>\r\n\r\n<p><font size=\"+4\" color=\"red\"><b>General Help</b></font></p>\r\n\r\n</center>	');
INSERT IGNORE INTO `html` VALUES ('gblast','html_header','<center>\r\n\r\n<p><font size=\"+4\" color=\"red\"><b>Graphical BLAST</b></font></p>\r\n<h3><b>Searching the Genome</b></h3>\r\n\r\n</center>	\r\n\r\n<hr>');
INSERT IGNORE INTO `html` VALUES ('orfanalysis','html_header','<center><p><font size=\"+4\" color=\"red\"><b>Open Reading Frames</b></font></p></center><center>\r\n<h3>Gene Prediction</h3>\r\n</center>	');
INSERT IGNORE INTO `html` VALUES ('sagesearch','html_header','<center><p><font size=\"+4\" color=\"red\"><b>SAGE Analysis Results</b></font></p>');
INSERT IGNORE INTO `html` VALUES ('default','sage_result_header','<br><p>SAGE tags matching your search criteria are listed below.\r\nClick on the SAGE tag or ORF identification numbers for more details.  Tag frequencies are presented as percentages of the total sample of tags, after removal of sequencing error.  Possible tag types are PS (primary sense tag), PA (primary anti-sense tag), AS (alternate sense tag), AA (alternate anti-sense tag), UK (unknown - not resolved to an ORF).  The R-Value (if shown) is the log-likelihood ratio statistic of <a href=\"http://www.ncbi.nlm.nih.gov:80/entrez/query.fcgi?cmd=Retrieve&db=pubmed&dopt=Abstract&list_uids=11116099\">Stekel et al. (2000)</a>, which scores tags by their deviation from the null hypothesis of equal frequencies.  Higher scores represent a greater deviation from the null hypothesis, while scores close to zero represent near constitutive expression.</p><br>\r\n');
INSERT IGNORE INTO `html` VALUES ('sage','sagelibraries_description','Describe your sage libraries here.<br>');
INSERT IGNORE INTO `html` VALUES ('sage','sage_tagmap_description','<center><p>SAGE tags are mapped to theoretical transcripts, which are modeled as the complete ORF plus x bp of 3&acute; UTR. Primary SAGE tags are those generated by the most 3&acute; <a href=\"http://www.neb.com/neb/products/res_enzymes/125.html\">Nla III</a> restriction site on the theoretical transcript.</p></center> ');
INSERT IGNORE INTO `html` VALUES ('news','html_header','<center><p><font size=\"+4\" color=\"red\"><b>Latest News</b></font></p></center><center>\n<h3>Updates from the >DB Curators</h3>\n</center>	');
INSERT IGNORE INTO `html` VALUES ('orfsearch','html_header','<center><p><font color=\"red\" size=\"+4\"><b>ORF Analysis Results</b></font></p>\r\n</center>');
INSERT IGNORE INTO `html` VALUES ('default','database_version','dbversion');
INSERT IGNORE INTO `html` VALUES ('intro','overview_statistics_footer','                                <i>Statistics updated every 24 hours.<br>\r\n                                Detailed statistics: <a href=\"?page=assembly\">Assembly</a>, <a href=\"?page=orfs\">ORFs</a>, <a href=\"?page=sage\">SAGE</a></i>\r\n');
INSERT IGNORE INTO `html` VALUES ('login','login_text','Private data include unpublished results, third party data tracking, and analyses in development.  Contact us if you have questions about data access.');

--
-- Table structure for table `phylo_current`
--

CREATE TABLE IF NOT EXISTS `phylo_current` (
  `id` int(11) NOT NULL default '0',
  `idname` varchar(30) default NULL,
  `sequence_type_id` int(11) default NULL,
  `translate` char(1) default NULL,
  `sequence` longtext,
  `type` varchar(30) default NULL,
  `options` varchar(255) default NULL
);

--
-- Dumping data for table `phylo_current`
--


--
-- Table structure for table `phylo_pipe`
--

CREATE TABLE IF NOT EXISTS `phylo_pipe` (
  `id` int(11) NOT NULL auto_increment,
  `idname` varchar(30) default NULL,
  `sequence_type_id` int(11) default NULL,
  `translate` char(1) default NULL,
  `sequence` longtext,
  `type` varchar(30) default NULL,
  `options` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
);

--
-- Dumping data for table `phylo_pipe`
--


--
-- Table structure for table `sequence_search`
--

CREATE TABLE IF NOT EXISTS `sequence_search` (
  `id` int(11) NOT NULL auto_increment,
  `idname` varchar(30) default NULL,
  `sequence_type_id` int(11) default NULL,
  `db_id` int(11) default NULL,
  `algorithm_id` int(11) default NULL,
  `sequence` longtext,
  `translate` char(1) default NULL,
  PRIMARY KEY  (`id`)
);

--
-- Dumping data for table `sequence_search`
--


--
-- Table structure for table `sequence_type`
--

CREATE TABLE IF NOT EXISTS `sequence_type` (
  `id` int(11) NOT NULL auto_increment,
  `type` varchar(20) default NULL,
  PRIMARY KEY  (`id`),
  KEY `sequence_type_type_id_idx` (`type`,`id`),
  KEY `sequence_type_id_type_idx` (`id`,`type`)
);

--
-- Dumping data for table `sequence_type`
--

INSERT IGNORE INTO `sequence_type` VALUES (5,'contig');
INSERT IGNORE INTO `sequence_type` VALUES (6,'est');
INSERT IGNORE INTO `sequence_type` VALUES (2,'orf');
INSERT IGNORE INTO `sequence_type` VALUES (3,'orfspace');
INSERT IGNORE INTO `sequence_type` VALUES (1,'read');
INSERT IGNORE INTO `sequence_type` VALUES (4,'sagetag');

--
-- Table structure for table `db`
--

CREATE TABLE IF NOT EXISTS `db` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(20) default NULL,
  PRIMARY KEY  (`id`),
  KEY `db_name_id` (`name`,`id`),
  KEY `db_id_name` (`id`,`name`)
);

--
-- Dumping data for table `db`
--

INSERT IGNORE INTO `db` VALUES (8,'ecoli.aa');
INSERT IGNORE INTO `db` VALUES (7,'gdb');
INSERT IGNORE INTO `db` VALUES (10,'interpro');
INSERT IGNORE INTO `db` VALUES (13,'ipsort');
INSERT IGNORE INTO `db` VALUES (6,'mitop');
INSERT IGNORE INTO `db` VALUES (2,'nr');
INSERT IGNORE INTO `db` VALUES (1,'nt');
INSERT IGNORE INTO `db` VALUES (5,'Pfam_fs');
INSERT IGNORE INTO `db` VALUES (4,'Pfam_ls');
INSERT IGNORE INTO `db` VALUES (11,'protfun');
INSERT IGNORE INTO `db` VALUES (9,'RefTax');
INSERT IGNORE INTO `db` VALUES (14,'signalp');
INSERT IGNORE INTO `db` VALUES (3,'swissprot');
INSERT IGNORE INTO `db` VALUES (15,'targetp');
INSERT IGNORE INTO `db` VALUES (12,'tmhmm');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;

