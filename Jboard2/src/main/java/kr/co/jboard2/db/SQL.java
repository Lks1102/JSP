package kr.co.jboard2.db;

public class SQL {

	
	// User
	public static final String INSERT_USER = "insert into `User` set "
											+ "`uid`=?, "
											+ "`pass`=SHA2(?, 256), "
											+ "`name`=?, "
											+ "`nick`=?, "
											+ "`email`=?, "
											+ "`hp`=?, "
											+ "`zip`=?,"
											+ "`addr1`=?, "
											+ "`addr2`=?, "
											+ "`regip`=?, "
											+ "`regDate`=NOW()";
	
	
	public static final String SELECT_USER = "select * from `User` where `uid`=? and `pass`=SHA2(?, 256)";
	
	public static final String SELECT_USER_BY_NAME_AND_EMAIL = "select * from `User` where `name`=? and `email`=?";
	
	public static final String SELECT_COUNT_UID 	= "select count(*) from `User` where `uid`=?";
	public static final String SELECT_COUNT_NICK 	= "select count(*) from `User` where `nick`=?";
	public static final String SELECT_COUNT_EMAIL 	= "select count(*) from `User` where `email`=?";
	public static final String SELECT_COUNT_NAME_EMAIL 	= "select count(*) from `User` where `name`=? AND `email`=?";
	public static final String SELECT_COUNT_UID_EMAIL 	= "select count(*) from `User` where `uid`=? AND `email`=?";
	public static final String SELECT_COUNT_HP 		= "select count(*) from `User` where `hp`=?";
	public static final String SELECT_TERMS 		= "select * from `Terms`";
	public static final String UPDATE_USER			= "UPDATE `User` SET"
													+ " `name`=?, "
													+ " `nick`=?, "
													+ " `email`=?, "
													+ " `hp`=?, "
													+ " `zip`=?, "
													+ " `addr1`=?, "
													+ " `addr2`=? "
													+ " WHERE `uid`=? ";
	public static final String UPDATE_USER_PASS		= "UPDATE `User` SET `pass`=SHA2(?, 256) WHERE `uid`=?";
	public static final String UPDATE_USER_FOR_WITHDRAW		= "UPDATE `User` SET"
															+ " `pass`=null, "
															+ " `name`=null, "
															+ " `nick`=null, "
															+ " `email`=null, "
															+ " `hp`=null, "
															+ " `role`=null, "
															+ " `zip`=null, "
															+ " `addr1`=null, "
															+ " `addr2`=null, "
															+ " `leaveDate`=NOW() "
															+ " WHERE `uid`=? ";
	
	// Article
	public static final String INSERT_ARTICLE = "INSERT INTO `Article` set "
												+ "`title`=?, "
												+ "`content`=?, "
												+ "`file`=?, "
												+ "`writer`=?, "
												+ "`regip`=?, "
												+ "`rdate`=NOW()";
	
	public static final String INSERT_COMMENT = "INSERT INTO `Article` SET "
												+ "`parent`=?, "
												+ "`content`=?,"
												+ "`writer`=?,"
												+ "`regip`=?,"
												+ "`rdate`=NOW()";
	
	public static final String SELECT_MAX_NO = "SELECT MAX(`no`) FROM `Article`";
	public static final String SELECT_ARTICLE = "SELECT * FROM `Article` AS a "
												+ "LEFT JOIN `File` AS b "
												+ "ON a.`no`= b.`ano` "
												+ "WHERE `no`=?";
	
	public static final String SELECT_ARTICLES = "SELECT a.*, b.nick FROM `Article` AS a "
												+ "JOIN `User` AS b "
												+ "ON a.writer = b.uid "
												+ "WHERE `parent`= 0 "
												+ "ORDER BY `no` DESC "
												+ "LIMIT ?, 10";
	
	public static final String SELECT_ARTICLES_FOR_SEARCH = "SELECT a.*, b.nick FROM `Article` AS a "
														+ "JOIN `User` AS b "
														+ "ON a.writer = b.uid "
														+ "WHERE `parent`= 0 AND `title` LIKE ?"
														+ "ORDER BY `no` DESC "
														+ "LIMIT ?, 10";
	
	public static final String SELECT_COMMENTS = "SELECT "
												+ "a.*, "
												+ "b.`nick` "
												+ "FROM `Article` AS a "
												+ "JOIN `User` AS b ON a.writer = b.uid "
												+ "WHERE `parent`=?";
	

	
	public static final String SELECT_COUNT_TOTAL = "SELECT COUNT(*) FROM `Article` WHERE `parent`= 0";
	public static final String SELECT_COUNT_TOTAL_FOR_SEARCH = "SELECT COUNT(*) FROM `Article` WHERE `parent`=0 AND `title` LIKE ?";
	
	public final static String UPDATE_ARTICLE = "UPDATE `Article` SET `title`=?, `content`=? WHERE `no`=?";
	public static final String UPDATE_ARTICLE_FOR_COMMENT_PLUS = "update `Article` set `comment` = `comment`+1 where `no`=?";
	public final static String UPDATE_ARTICLE_FOR_COMMENT_MINUS = "UPDATE `Article` SET `comment` = `comment` - 1 WHERE `no`=?";
	public final static String UPDATE_COMMENT = "update `Article` set `content`=? where `no`=?";
	
	public final static String DELETE_ARTICLE = "DELETE FROM `Article` WHERE `no`=? OR `parent`=?";
	public static final String DELETE_COMMENT = "DELETE FROM `Article` WHERE `no`=?";
	
	// File
	public static final String INSERT_FILE = "INSERT INTO `File` SET "
																+ "`ano`=?, "
																+ "`ofile`=?, "
																+ "`sfile`=?, "
																+ "`rdate`=NOW()";
	
	public static final String SELECT_FILE = "SELECT * FROM `File` WHERE `fno`=?";
	
	public static final String DELETE_FILE = "DELETE FROM `File` WHERE `ano`=?";
}
