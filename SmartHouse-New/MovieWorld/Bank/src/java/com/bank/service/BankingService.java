/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bank.service;

import com.filmstore.service.Service;
import javax.jws.WebService;
import javax.jws.WebMethod;
import javax.jws.WebParam;

@WebService(serviceName = "BankingService")
public class BankingService {

    /** This is a sample web service operation */
    @WebMethod(operationName = "orderPayment")
    public String orderPayment(@WebParam(name = "buyerAccountNumber") long buyerAccountNumber,@WebParam(name = "price") int price) {
       System.out.println("entered into ordered payment,buyerAccountNumber, price is "+buyerAccountNumber+price);
        
        boolean result;
        Service service=new Service();
        result=service.bank(price, buyerAccountNumber);
        
        return result+"";
    }
    
    
    
}
