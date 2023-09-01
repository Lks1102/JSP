package kr.co.jboard1.db;

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
											+ "`addr2`=?,"
											+ "`regip`=?,"
											+ "`regDate`=NOW()";
	
	
	public static final String SELECT_USER = "select * from `User` where `uid`=? and `pass`=SHA2(?, 256)";
	
	public static final String SELECT_COUNT_UID 	= "select count(*) from `User` where `uid`=?";
	public static final String SELECT_COUNT_NICK 	= "select count(*) from `User` where `nick`=?";
	public static final String SELECT_COUNT_EMAIL 	= "select count(*) from `User` where `email`=?";
	public static final String SELECT_COUNT_HP 		= "select count(*) from `User` where `hp`=?";
	public static final String SELECT_TERMS 		= "select * from `Terms`";
	
	// Article
	public static final String INSERT_ARTICLE = "insert into `Article` set "
												+ "`title`=?, "
												+ "`content`=?, "
												+ "`writer`=?, "
												+ "`regip`=?, "
												+ "`rdate`=NOW()";
	
	public static final String INSERT_COMMENT = "INSERT INTO `Article` SET "
												+ "`parent`=?, "
												+ "`content`=?,"
												+ "`writer`=?,"
												+ "`regip`=?,"
												+ "`rdate`=NOW()";
	
	public static final String SELECT_ARTICLE = "SELECT * FROM `Article` WHERE `no`=?";
	
	public static final String SELECT_ARTICLES = "SELECT a.*, b.nick FROM `Article` AS a "
												+ "JOIN `User` AS b "
												+ "ON a.writer = b.uid "
												+ "where `parent`= 0 "
												+ "ORDER BY `no` DESC "
												+ "LIMIT ?, 10";
	
	public static final String SELECT_COMMENTS = "SELECT "
												+ "a.*, "
												+ "b.`nick` "
												+ "FROM `Article` AS a "
												+ "JOIN `User` AS b ON a.writer = b.uid "
												+ "WHERE `parent`=?";
	

	
	public static final String SELECT_COUNT_TOTAL = "SELECT COUNT(*) FROM `Article` where `parent`= 0";
	
	public final static String UPDATE_ARTICLE = "UPDATE `Article` SET `title`=?, `content`=? WHERE `no`=?";
	public static final String UPDATE_ARTICLE_FOR_COMMENT_PLUS = "update `Article` set `comment` = `comment`+1 where `no`=?";
	public final static String UPDATE_ARTICLE_FOR_COMMENT_MINUS = "UPDATE `Article` SET `comment` = `comment` - 1 WHERE `no`=?";
	public final static String UPDATE_COMMENT = "update `Article` set `content`=? where `no`=?";
	
	public final static String DELETE_ARTICLE = "DELETE FROM `Article` WHERE `no`=? OR `parent`=?";
	public static final String DELETE_COMMENT = "DELETE FROM `Article` WHERE `no`=?";
	
}
