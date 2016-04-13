/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.filmstore.service;

//import com.bankingpayment.client.BankingService;
//import com.bankingpayment.client.BankingService_Service;
import com.bankingpayment.client.BankingService;
import com.bankingpayment.client.BankingService_Service;
import com.filmstore.model.Bank;
import com.filmstore.model.Movie;

import com.filmstore.model.Purchase;
import com.filmstore.model.User;
import java.math.BigDecimal;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import org.hibernate.FlushMode;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import util.NewHibernateUtil;


public class Service {
    //register
    public String register(User user){
      Session session = NewHibernateUtil.getSessionFactory().openSession();
       Transaction tx = null;
      String message=null;
       if(isUserExists(user)) return "user allready exists";	 
	 
	 try {
		 tx = session.getTransaction();
                 tx.begin();
		 session.save(user);		
		 tx.commit();
                  message="Successfully Registered";  
                  return message; 
	 } catch (Exception e) {
		 if (tx != null) {
                tx.rollback();}
		 return(e.getMessage());
	 } finally {
		 session.close();
	 }	
	 
}
     
     public boolean isUserExists(User user){
	 Session session = NewHibernateUtil.getSessionFactory().openSession();
	 boolean result = false;
	 Transaction tx = null;
	 try{
		  tx = session.getTransaction();
                  tx.begin();
		 Query query = session.createQuery("from User where email='"+user.getEmail()+"'");
		 User u = (User)query.uniqueResult();
		 tx.commit();
		 if(u!=null) result = true;
	 }catch(Exception ex){
		if (tx != null) {
                tx.rollback();}
	 }finally{
		 session.close();
	 }
	 return result;
}

    //login
     
     
     public User authenticateUser(User user) {
       Session session = NewHibernateUtil.getSessionFactory().openSession();
       Transaction tx = null;
        
        try {
            tx = session.getTransaction();
                  tx.begin();
           
           Query query = session.createQuery("from User where email=:email And password=:password");
            query.setParameter("email",user.getEmail());
            query.setParameter("password",user.getPassword()); 
            user = (User)query.uniqueResult();
            tx.commit();
          
           //  System.out.println(login.getUserName()+"in service");
        } catch (Exception e) {
           if (tx != null) {
                tx.rollback();}
            
        } finally {
            session.close();
        }         
        if(user!=null && user.getEmail().equals(user.getEmail()) && user.getPassword().equals(user.getPassword())){
            return user;
        }else{ 
            return user;
        }
    }
     
    //adding movie
     
     public String addOrUpdateMovie(Movie movie, String action){
      Session session = NewHibernateUtil.getSessionFactory().openSession();
      String message=null;	 
	
	 try {
		 if(action.equalsIgnoreCase("addMovie")){
                     if(isMovie(movie)){
                         message = "Movie Already Exists.";
                                 }
		 session.save(movie);		
		
                  message="Movie Successfully Added";  
                 }
                 else if(action.equalsIgnoreCase("updateMovie")){
                     
                    Query query4 = session.createQuery("update Movie set title =:title ,description =:description,duration=:duration,releasedate=:releasedate,price=:price,numberOfMovies=:numberOfMovies where  id =:id ");
                    query4.setParameter("title", movie.getTitle());
                     query4.setParameter("description", movie.getDescription());
                      query4.setParameter("duration", movie.getDuration());
                       query4.setParameter("releasedate", movie.getReleasedate());
                       query4.setParameter("price", movie.getPrice());
                       query4.setParameter("releasedate", movie.getReleasedate());
                       query4.setParameter("numberOfMovies", movie.getNumberOfMovies());
                       query4.setParameter("id", movie.getId());
                      long s1=query4.executeUpdate();
                      if(s1==1){
                          message = "Movie Successfully Updated.";
                      }else
                      {
                           message = "Something went wrong";
                      }
                     
                     
                     
                     
                     
                 }
	 } catch (Exception e){
		 return(e.getMessage());
	 } finally {
		 session.close();
	 }	
	 return message;
}
     
     public boolean isMovie(Movie movie){
	 Session session = NewHibernateUtil.getSessionFactory().openSession();
	 boolean result = false;
	 Transaction tx = null;
	 try{
		 tx = session.getTransaction();
                  tx.begin();
		 Query query = session.createQuery("from Movie where title='"+movie.getTitle()+"'");
		 Movie m = (Movie)query.uniqueResult();
		tx.commit();
		 if(m!=null) result = true;
	 }catch(Exception ex){
		 if (tx != null) {
                tx.rollback();}
	 }finally{
		 session.close();
	 }
	 return result;
}

     
     //search movie
     public ArrayList<Movie> searchMovie(String title)
    {
          String message=null;
        Session session=null;
        Transaction tx = null;
	 ArrayList<Movie> movie = null;
	 try {
                 session=NewHibernateUtil.getSessionFactory().openSession();
		 tx = session.getTransaction();
                  tx.begin();
		 
                 Query query = session.createQuery("from Movie where title like :title");
            query.setParameter("title","%"+title+"%");
		movie = (ArrayList)query.list();
		 tx.commit();
	 } catch (Exception e) {
		 if (tx != null) {
                tx.rollback();}
		
	 } finally {
		 session.close();
	 }
	 return movie;
    }
     
     public String purchaseMovie(int id, int price, long buyerAccNo,User user) throws Exception {
        
        Session session=null;
        Transaction tx = null;
      
         
         if(isMovieExists(user,id)) return "you already purchased ";	
       try {
           
                   Movie movie=new Movie();
                   movie.setId(id);
                   System.out.println(movie.getId()+"akkkddd");
                   
                  session=NewHibernateUtil.getSessionFactory().openSession();
		 tx = session.getTransaction();
		 tx.begin();
                
                  System.out.println("akkkddd1");
		//  withdrawBuyerAccount(session, price, buyerAccNo);
                  System.out.println("akkkddd2");
                  BankingService_Service service=new BankingService_Service() ;
                  reduceMovieQuantity(session, id);
                  BankingService port = service.getBankingServicePort();
                  String result=port.orderPayment(buyerAccNo, price);
                  System.out.println("result is"+result);
                 // depositSellerAccount(session, price);
                  if(result.equals("true")) {
                  purchaseOrder(session,user,movie);
                  } else {
                      throw new Exception("Payment Unsucessfull. Please Contact administrator for more detail.");
                       
                  }
                  
		  tx.commit();
                  
                   System.out.println("mine");
                 
	 } catch (Exception e) {
		 if (tx != null) {
			 tx.rollback();
		 }
		 return e.getMessage();
	 } finally {
		 session.close();
	 }
            return "success";
         
    }
    public boolean isMovieExists(User user,int id){
	 Session session = NewHibernateUtil.getSessionFactory().openSession();
	 boolean result = false;
	 Transaction tx = null;
	 try{
		 tx = session.getTransaction();
                  tx.begin();
		 Query query = session.createQuery("from Purchase where email=:email and id=:id");
                 query.setParameter("email", user.getEmail());
                  query.setParameter("id", id);
		 Purchase u = (Purchase)query.uniqueResult();
		tx.commit();
		 if(u!=null) result = true;
	 }catch(Exception ex){
		 if (tx != null) {
                tx.rollback();}
                 
	 }finally{
		 session.close();
	 }
	 return result;
}

   

    private void reduceMovieQuantity(Session session, int id) throws Exception {
        int newQuantity = 0;
        try{
             Query query1 = session.createQuery("select numberOfMovies from Movie where id = '"+id+"'");
             int numberOfMovies = (Integer)query1.uniqueResult();
            System.out.println("pb"+numberOfMovies);
             String queryString = "UPDATE Movie SET numberOfMovies = :numberOfMovies WHERE id = :id";
             Query query2 = session.createQuery(queryString);
             newQuantity = numberOfMovies-1;
             if(newQuantity<0){
                 throw new Exception("No movie available");
             }else{
                 query2.setParameter("numberOfMovies", newQuantity);
                 query2.setParameter("id", id);
                  long s=query2.executeUpdate();
                
             }
        }catch (Exception e){
            throw e;
        } 
        
    }

   
     
     
    
     
     public void sendEmail(String email,String orderNumber) {
		// reads form fields
		
		String subject = "Movie Purchased";
		String content = "You Have Purchased Movie ,It will delivered shortly to you"+"\n"+"Your order number:"+orderNumber;

		String resultMessage = "";

		try {
			EmailUtility.sendEmail("smtp.gmail.com", "587", "moviestore2016@gmail.com", "moviestore2016&&", email, subject,
					content);
			resultMessage = "The e-mail was sent successfully";
		} catch (Exception ex) {
			ex.printStackTrace();
			resultMessage = "There were an error: " + ex.getMessage();
		} finally {
			
			
		}
	}
     
     
     public void registerSendEmail(String email,String content) {
		
		
		String subject = "Registeration on Movie Store";
		

		String resultMessage = "";

		try {
			EmailUtility.sendEmail("smtp.gmail.com", "587", "moviestore2016@gmail.com", "moviestore2016&&", email, subject,
					content);
			resultMessage = "The e-mail was sent successfully";
		} catch (Exception ex) {
			ex.printStackTrace();
			resultMessage = "There were an error: " + ex.getMessage();
		} 
	}

    private void purchaseOrder( Session session,User user, Movie movie) {
        Purchase purchase=new Purchase();
       purchase.setEmail(user.getEmail());
       purchase.setId(movie.getId());
       purchase.setStatus("N");
       
       
 
        try {
		 
                 
		 session.save(purchase);
               
                   
                 
	 } catch (Exception e) {
		 
		e.printStackTrace();
	 } 
    }
     
    public int getOrderNumber(int id,User user)
    {
      Session session = NewHibernateUtil.getSessionFactory().openSession();
	ArrayList<Integer> pur =new ArrayList<Integer>();
	 Transaction tx = null;
         int purchaseid =0;
	 try{
		 tx = session.getTransaction();
                  tx.begin();
		  Query query1 = session.createQuery("select  purchaseid from Purchase  WHERE email = :email AND id= :id order by purchaseid desc ");
                  query1.setParameter("email", user.getEmail());
                 query1.setParameter("id", id);
                  pur = (ArrayList<Integer>)query1.list();
                  if(pur!=null)
                  {
                    purchaseid=pur.get(0); 
                  }
		tx.commit();
		
	 }catch(Exception ex){
		 if (tx != null) {
                tx.rollback();}
                 ex.printStackTrace();
	 }finally{
		 session.close();
	 }
	 return purchaseid;
    }
    public List<String> retreiveFeedbackMovieList(String email) {
          Session session=null;
          String status="N";
	       List<String> movieList = new ArrayList<String>();
	 try {
                 session=NewHibernateUtil.getSessionFactory().openSession();
                 Query query = session.createQuery("select movie.title from Movie as movie where movie.id in (select purchase.id from Purchase as purchase where email =:email and status =:status)" );
                 query.setParameter("email", email);
                 query.setParameter("status",status );
		 movieList = (List)query.list();
	 } catch (Exception e) {
             e.printStackTrace();
	 } finally {
		 session.close();
	 }
	 return movieList;
    }

    public boolean sendMovieFeedback(String email, String title, float rating) {
        Session session = null;
        Transaction tx = null;
        try{
            
            session = NewHibernateUtil.getSessionFactory().openSession();
            tx = session.getTransaction();
                  tx.begin();
                  Query query1 = session.createQuery("select count(purchaseid) from Purchase where status =:status and id in (select id from Movie where title =:title)");
               query1.setParameter("title", title);
               query1.setParameter("status", "Y");
              Long count = (Long)query1.uniqueResult();
              System.out.println(count+"provide");
             Query query2 = session.createQuery("select feedback from Movie where title =:title");
           query2.setParameter("title", title);
            
             Double oldFeedback= (Double)query2.uniqueResult();
            // Double oldFeedback =b.doubleValue();
             
            Double newFeedback = ((oldFeedback * count)+rating)/(count+1);
            System.out.println(oldFeedback+"old"+email+rating);
            Query querynew = session.createQuery("select id from Movie where title = '"+title+"'");
            
            int id = (Integer)querynew.uniqueResult();
            System.out.println("Movie id is "+id);
            Query query3 = session.createQuery("update Movie set feedback = :feedback where id =:id");
            query3.setParameter("feedback", newFeedback);
            query3.setParameter("id", id);
            long s=query3.executeUpdate();
            System.out.println("update"+s);
            
       Query query4 = session.createQuery("update Purchase set status =:status where  email =:email and id=(select id from Movie where title=:title)");
          query4.setParameter("status", "Y");
           query4.setParameter("title", title);
            query4.setParameter("email", email);
           long s1=query4.executeUpdate();
            System.out.println("update2"+s1);
            tx.commit();
        }catch(Exception e){
            e.printStackTrace();
            
        }finally{
            session.close();
        }
        return true;
    }

    public ArrayList<Movie> latestMovie() {
      
        Session session=null;
        Transaction tx = null;
	 ArrayList<Movie> movie = null;
	 try {
                 session=NewHibernateUtil.getSessionFactory().openSession();
		 tx = session.getTransaction();
                  tx.begin();
		 
                Query query = session.createQuery("from Movie order by timestamp desc");
            
		movie = (ArrayList)query.list();
                //System.out.println(movie.get(0).getTitle());
		 tx.commit();
	 } catch (Exception e) {
		 if (tx != null) {
                tx.rollback();}
		
	 } finally {
		 session.close();
	 }
         return movie;
    }

    public boolean deleteMovie(int id) {
         Session session = null;
        Boolean success = false;
        try{
            session = NewHibernateUtil.getSessionFactory().openSession();
            Query query = session.createQuery("delete from Movie where id =:id");
            query.setParameter("id", id);
            int i = query.executeUpdate();
            if(i==1){
                 success = true;
            }else{
                success = false;
            }
        }catch(Exception e){
            e.printStackTrace();
        }finally{
            session.close();
        }
        return success;
    }

    private boolean validAccountNumber(long buyerAccNo) {
       int result;
       Session session=null;
        Transaction tx = null;
        System.out.println("inside validaccountnumber");
        try{
            session = NewHibernateUtil.getSessionFactory().openSession();
             System.out.println("inside try");
       
         Query query1 = session.createQuery("select count(accountNo) from Bank where accountNo = :accountNo");
           query1.setParameter("accountNo", buyerAccNo);
             result = (Integer)query1.uniqueResult();
             System.out.println(result+"validaccountNumber");
        tx.commit();
	 } catch (Exception e) {
		 if (tx != null) {
                tx.rollback();}
		result=0;
	 } finally {
		 session.close();
	 }  
           if(result==1)
               return true;
           else{
               return false;
           }
    }
    
}
