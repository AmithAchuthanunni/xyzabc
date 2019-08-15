package com.cts.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import com.cts.beans.TransactionBean;
import com.cts.utility.DBUtil;

public class TransactionDaoImpl implements TransactionDao{

	@Override
	public boolean addTransaction(TransactionBean tb) {
		// TODO Auto-generated method stub
		boolean status= false;
		
		Connection conn=DBUtil.getDBConnection();
		
		try {
			PreparedStatement ps=conn.prepareStatement("insert into Transaction values(?,?,?,?)");
			
			ps.setString(4,tb.getId());
			ps.setString(1,tb.getActivity());
			ps.setString(2,tb.getDateRange());
			ps.setString(3,tb.getEffort());
			
			int x=ps.executeUpdate();
			
			if(x>0)
				status=true;
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		
		
		return status;
	}

}
