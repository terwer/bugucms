package com.terwergreen.bugucms.core.dao.impl;

import java.util.List;
import java.util.Map;

import com.terwergreen.bugucms.base.dao.BaseDAO;
import com.terwergreen.bugucms.core.dao.CommonDAO;
import com.terwergreen.bugucms.exception.DAOException;
import org.apache.ibatis.session.RowBounds;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;
import sun.reflect.generics.reflectiveObjects.NotImplementedException;

@Repository
public class CommonDAOImpl extends BaseDAO implements CommonDAO {

    @Override
    public List queryList(String sql) {
        checkDaoConfig();
        return getSqlSession().selectList(sql);
    }

    @Override
    public List queryListByString(String sql, String str) {
        checkDaoConfig();
        return getSqlSession().selectList(sql, str);
    }

    @Override
    public List queryListByMap(String sql, Map paraMap) {
        checkDaoConfig();
        return getSqlSession().selectList(sql, paraMap);
    }


    @Override
    public List queryListByObject(String sql, Object object) {
        checkDaoConfig();
        return getSqlSession().selectList(sql, object);
    }

    @Override
    public List queryPageListByString(String sql, String str, int start, int pageSize) {
        checkDaoConfig();
        pageSize = pageSize > MAX_ROW ? MAX_ROW : pageSize;
        try {
            return getSqlSession().selectList(sql, str, new RowBounds(start - 1, pageSize));
        } catch (DataAccessException e) {
            super.logger.error("分页查询发生异常：", e);
        }
        return null;
    }

    @Override
    public List queryPageList(String sql, Map paraMap, int start, int pageSize) {
        checkDaoConfig();
        pageSize = pageSize > MAX_ROW ? MAX_ROW : pageSize;
        try {
            return getSqlSession().selectList(sql, paraMap, new RowBounds(start - 1, pageSize));
        } catch (DataAccessException e) {
            super.logger.error("分页查询发生异常：", e);
        }
        return null;
    }

    @Override
    public List queryPageListByObject(String sql, Object object, int start, int pageSize) {
        checkDaoConfig();
        pageSize = pageSize > MAX_ROW ? MAX_ROW : pageSize;
        try {
            return getSqlSession().selectList(sql, object, new RowBounds(start - 1, pageSize));
        } catch (DataAccessException e) {
            super.logger.error("分页查询发生异常：", e);
        }
        return null;
    }

    @Override
    public Object querySingleByString(String sql) {
        checkDaoConfig();
        List list = getSqlSession().selectList(sql);
        if (list != null && list.size() > 0) {
            return list.get(0);
        }
        return null;
    }

    @Override
    public Object querySingleByString(String sql, String str) {
        checkDaoConfig();
        List list = getSqlSession().selectList(sql, str);
        if (list != null && list.size() > 0) {
            return list.get(0);
        }
        return null;
    }

    @Override
    public Object querySingle(String sql, Map paraMap) {
        checkDaoConfig();
        List list = getSqlSession().selectList(sql, paraMap);
        if (list != null && list.size() > 0) {
            return list.get(0);
        }
        return null;
    }

    @Override
    public Object querySingleByObject(String sql, Object object) {
        checkDaoConfig();
        List list = getSqlSession().selectList(sql, object);
        if (list != null && list.size() > 0) {
            return list.get(0);
        }
        return null;
    }

    @Override
    public Object insert(String sql, Map paraMap) {
        checkDaoConfig();
        return getSqlSession().insert(sql, paraMap);
    }

    @Override
    public Object insertByObject(String sql, Object object) {
        checkDaoConfig();
        return getSqlSession().insert(sql, object);
    }

    @Override
    public int delete(String sql, Map paraMap) {
        checkDaoConfig();
        return getSqlSession().delete(sql, paraMap);
    }

    @Override
    public int deleteByObject(String sql, Object object) {
        checkDaoConfig();
        return getSqlSession().delete(sql, object);
    }

    @Override
    public boolean checkDelete(String sql, Map paraMap) {
        checkDaoConfig();
        int row = this.delete(sql, paraMap);
        if (row > 0) {
            return true;
        }
        return false;
    }

    @Override
    public boolean checkDeleteByObject(String sql, Object object) {
        checkDaoConfig();
        int row = this.deleteByObject(sql, object);
        if (row > 0) {
            return true;
        }
        return false;
    }

    @Override
    public int update(String sql, Map paraMap) {
        checkDaoConfig();
        return getSqlSession().update(sql, paraMap);
    }

    @Override
    public int updateByObject(String sql, Object object) {
        checkDaoConfig();
        return getSqlSession().update(sql, object);
    }

    @Override
    public boolean checkUpdate(String sql, Map paraMap) {
        checkDaoConfig();
        int row = this.update(sql, paraMap);
        if (row > 0) {
            return true;
        }
        return false;
    }

    @Override
    public boolean checkUpdateByObject(String sql, Object object) {
        checkDaoConfig();
        int row = this.updateByObject(sql, object);
        if (row > 0) {
            return true;
        }
        return false;
    }

    @Override
    public Integer updateBatch(final String sql, final List updateList) throws DAOException {
        try {
            throw new NotImplementedException();
        } catch (Exception e) {
            throw e;
        }
    }

	@Override
    public Integer insertBatch(final String sql, final List insertList) throws DAOException {
        try {
            throw new NotImplementedException();
        } catch (Exception e) {
            throw e;
        }
    }

}