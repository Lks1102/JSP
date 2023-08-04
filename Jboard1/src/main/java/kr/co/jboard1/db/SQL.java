package kr.co.jboard1.db;

public class SQL {

	
	// user
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
	public static final String SELECT_TERMS 		= "select * from `terms`";
	
}
