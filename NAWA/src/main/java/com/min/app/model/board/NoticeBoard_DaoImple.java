package com.min.app.model.board;

import java.util.Date;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.min.app.dto.board.PagingBrdDto;
import com.min.app.dto.board.WriteBrdDto;

/**
 * Mybatis를 실행시켜 처리
 * @author Aejeong
 * *
 */

@Repository
public class NoticeBoard_DaoImple implements NoticeBoard_IDao {
	
	private final String NS="com.min.app.model.board.";
	private Logger logger = LoggerFactory.getLogger(NoticeBoard_DaoImple.class);
	
	@Autowired
	SqlSessionTemplate sqlsession;
	
	@Override
	public List<WriteBrdDto> boardList() {
		logger.info("NoticeBoard_DaoImple.boardList");
		return sqlsession.selectList(NS+"boardList");
	}

	@Override
	public WriteBrdDto boardSelectOne(String seq) {
		logger.info("NoticeBoard_DaoImple.boardSelectOne");
		return sqlsession.selectOne(NS+"boardSelectOne",seq);
	}

	@Override
	public int insertBoard(WriteBrdDto dto) {
		logger.info("NoticeBoard_DaoImple.insertBoard");
		return sqlsession.insert(NS+"insertBoard",dto);
	}

	@Override
	public int updateBoard(WriteBrdDto dto) {
		logger.info("NoticeBoard_DaoImple.updateBoard");
		return sqlsession.update(NS+"updateBoard",dto);
	}

	@Override
	public int deleteNotice(String seq) {
		logger.info("NoticeBoard_DaoImple.deleteNotice");
		return sqlsession.delete(NS+"deleteNotice",seq);
	}

	@Override
	public int fileImage(WriteBrdDto dto) {
		logger.info("NoticeBoard_DaoImple.fileImage");
		return sqlsession.insert(NS+"fileImage",dto);
	}

	@Override
	public int fileId(WriteBrdDto dto) {
		logger.info("NoticeBoard_DaoImple.fileId");
		return sqlsession.insert(NS+"fileId",dto);
	}



	@Override
	public int selectTotalPaging() {
		logger.info("NoticeBoard_DaoImple.selectTotalPaging");
		return sqlsession.selectOne(NS+"selectTotalPaging");
	}
	@Override
	public List<WriteBrdDto> selectPaging(PagingBrdDto paging) {
		logger.info("========================================================페이징DAO selectPaging() 실행 시간 : "+(new Date())+"========================================================");
		return sqlsession.selectList(NS+"selectPaging",paging);
	}
	

}
