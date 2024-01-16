package com.winter.app.board.qna;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.winter.app.board.BoardDAO;
import com.winter.app.board.BoardDTO;
import com.winter.app.board.BoardFileDTO;
import com.winter.app.util.Pager;

@Repository
public class QnaDAO implements BoardDAO {
	
	@Autowired
	private SqlSession sqlSession;
	final String nameSpace = "com.winter.app.board.qna.QnaDAO.";

	@Override
	public Long getTotalCount(Pager pager) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<BoardDTO> getList(Pager pager) throws Exception {
		return sqlSession.selectList(nameSpace+"getList", pager);
	}

	@Override
	public BoardDTO getDetail(BoardDTO boardDTO) throws Exception {
		return sqlSession.selectOne(nameSpace+"getDetail", boardDTO);
	}

	@Override
	public int setAdd(BoardDTO boardDTO) throws Exception {
		return sqlSession.insert(nameSpace+"setAdd", boardDTO);
	}

	@Override
	public int setUpdate(BoardDTO boardDTO) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int setDelete(BoardDTO boardDTO) throws Exception {
		return sqlSession.update(nameSpace+"setDelete", boardDTO);
	}
	
	public int setReplyUpdate(QnaDTO qnaDTO)throws Exception{
		return sqlSession.update(nameSpace+"setReplyUpdate", qnaDTO);
	}
	
	public int setReplyAdd(QnaDTO qnaDTO) throws Exception{
		return sqlSession.insert(nameSpace+"setReplyAdd",qnaDTO);
	}
	
	public int setFileAdd(BoardFileDTO boardFileDTO)throws Exception {
		return sqlSession.insert(nameSpace+"setFileAdd", boardFileDTO);
	}
	
	public List<BoardFileDTO> getFileList(BoardDTO boardDTO)throws Exception{
		return sqlSession.selectList(nameSpace+"getFileList", boardDTO);
	}
	
	public int setFileDelete(BoardDTO boardDTO)throws Exception{
		return sqlSession.delete(nameSpace+"setFileDelete", boardDTO);
	}
	
}
