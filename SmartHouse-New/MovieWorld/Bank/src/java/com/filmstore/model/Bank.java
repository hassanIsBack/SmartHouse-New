package com.filmstore.model;
// Generated 19-Jan-2016 04:42:30 by Hibernate Tools 4.3.1



/**
 * Bank generated by hbm2java
 */
public class Bank  implements java.io.Serializable {


     private long accountNo;
     private int balance;

    public Bank() {
    }

    public Bank(long accountNo, int balance) {
       this.accountNo = accountNo;
       this.balance = balance;
    }
   
    public long getAccountNo() {
        return this.accountNo;
    }
    
    public void setAccountNo(long accountNo) {
        this.accountNo = accountNo;
    }
    public int getBalance() {
        return this.balance;
    }
    
    public void setBalance(int balance) {
        this.balance = balance;
    }




}


