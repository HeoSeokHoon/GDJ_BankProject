package com.winter.app.board.notice;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.winter.app.board.BoardDAO;
import com.winter.app.board.BoardDTO;
import com.winter.app.board.BoardFileDTO;
import com.winter.app.util.Pager;
import com.winter.app.util.TagManager;

@Repository
public class NoticeDAO implements BoardDAO {
		
	@Autowired
	private TagManager tg;
	
	@Autowired
	private SqlSession sqlSession;
	final String nameSpace = "com.winter.app.board.notice.NoticeDAO.";
	
	@Override
	public Long getTotalCount(Pager pager) throws Exception {
		return sqlSession.selectOne(nameSpace+"getTotalCount", pager);
	}

	@Override
	public List<BoardDTO> getList(Pager pager) throws Exception {
		List<BoardDTO> ar = sqlSession.selectList(nameSpace+"getList", pager);
		for(var boardDTO:ar) {
			boardDTO = tg.tagManager(boardDTO);
		}
		return ar;
	}

	@Override
	public BoardDTO getDetail(BoardDTO boardDTO) throws Exception {
		return sqlSession.selectOne(nameSpace+"getDetail", boardDTO);
	}

	@Override
	public int setAdd(BoardDTO boardDTO) throws Exception {
		boardDTO = tg.tagManager(boardDTO);
		return sqlSession.insert(nameSpace+"setAdd", boardDTO);
	}

	@Override
	public int setUpdate(BoardDTO boardDTO) throws Exception {
		return sqlSession.update(nameSpace+"setUpdate",boardDTO);
	}

	@Override
	public int setDelete(BoardDTO boardDTO) throws Exception {
		return sqlSession.delete(nameSpace+"setDelete", boardDTO);
	}
	
	public int setFileAdd(BoardFileDTO boardFileDTO)throws Exception{
		return sqlSession.insert(nameSpace+"setFileAdd",boardFileDTO);
	}
	
	public List<BoardFileDTO> getFileList(BoardDTO boardDTO) throws Exception{
		return sqlSession.selectList(nameSpace+"getFileList", boardDTO);
	}
	
	public int setFileDelete(BoardDTO boardDTO)throws Exception{
		return sqlSession.delete(nameSpace+"setFileDelete", boardDTO);
	}
	
}
