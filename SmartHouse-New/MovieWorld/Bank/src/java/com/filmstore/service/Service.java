/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.filmstore.service;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import util.NewHibernateUtil;


public class Service {
    
    public boolean bank(int price, long buyerAccNo){
        
      System.out.println("entered into ordered "+buyerAccNo+price);
      Session session = NewHibernateUtil.getSessionFactory().openSession();
      Transaction tx = null;
      boolean result;
       
	 
	 try {
             System.out.println("entered into try");
		 tx = session.getTransaction();
                 tx.begin();
                 synchronized(this) {
		 
                 withdrawBuyerAccount(session, price, buyerAccNo);
                 depositSellerAccount(session, price);
                 
                 }
		 tx.commit();
                  result=true;  
                  return result; 
	 } catch (Exception e) {
		 if (tx != null) {
                tx.rollback();}
                 result=false;
		 
	 } finally {
		 session.close();
	 }
         return result;
	 
}
    private void withdrawBuyerAccount(Session session, int price, long buyerAccNo) throws Exception   {
        System.out.println("entered into withdrawBuyerAccount");
        int newBalance = 0;
        try{
           
            
             Query query1 = session.createQuery("select balance from Bank where accountNo = '"+buyerAccNo+"'");
           
             int balance=(Integer)query1.uniqueResult();
             String queryString = "UPDATE Bank SET balance = :balance WHERE accountNo = :accountNo";
             Query query2 = session.createQuery(queryString);
             newBalance = balance-price;
             
             if(newBalance<0){
                 throw new Exception("insufficient balance");
             }else{
                 query2.setParameter("balance", newBalance);
                 query2.setParameter("accountNo", buyerAccNo);
                 long s=query2.executeUpdate();
                
             }
            
            
        }catch (Exception e){
            throw e;
        }    
        
    }
    private void depositSellerAccount(Session session, int price) throws Exception{
        
        System.out.println("entered into withdrawBuyerAccount");
        
        int newBalance = 0;
        long sellerAccNo = 11219;
        try{
             Query query1 = session.createQuery("select balance from Selleraccount where accountNo = '"+sellerAccNo+"'");
             int balance = (Integer)query1.uniqueResult();
             System.out.println(balance);
             String queryString = "UPDATE Selleraccount SET balance = :balance WHERE accountNo = :accountNo";
             Query query2 = session.createQuery(queryString);
             newBalance = balance+price;
                 query2.setParameter("balance", newBalance);
                 query2.setParameter("accountNo", sellerAccNo);
                  long s=query2.executeUpdate();
                
        }catch (Exception e){
            throw e;
        }    
       
    }
}

