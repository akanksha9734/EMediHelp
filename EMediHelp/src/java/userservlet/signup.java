/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package userservlet;

import db.dblogin;
import db.specialization_tab;
import java.io.IOException;
import java.util.Date;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;
import org.hibernate.service.ServiceRegistry;

/**
 *
 * @author ku1d33p
 */
public class signup extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //fill filters
        Configuration configuration = new Configuration();
        configuration.configure();
        ServiceRegistry serviceRegistry = new StandardServiceRegistryBuilder().applySettings(configuration.getProperties()).build();
        SessionFactory factory = new Configuration().configure().buildSessionFactory(serviceRegistry);
        Session session = factory.openSession();
        Transaction t = session.beginTransaction();

        Query speci_query = session.createQuery("from specialization_tab where is_active=1 and deleted=0");
        List<specialization_tab> speci_data = (List<specialization_tab>) speci_query.list();

        request.setAttribute("speci_data", speci_data);

        t.commit();
        session.close();
        
        //check login
        HttpSession ss = request.getSession();
        if (ss.getAttribute("page_acc_lvl") != null && ss.getAttribute("sessionId") != null) {
            if (request.getParameter("return_url") != null) {
                response.sendRedirect(request.getParameter("return_url"));
            } else {
                response.sendRedirect("/home");
            }
        } else {
            RequestDispatcher dp = request.getRequestDispatcher("/pages/user/signup.jsp");
            dp.forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Configuration configuration = new Configuration();
        configuration.configure();
        ServiceRegistry serviceRegistry = new StandardServiceRegistryBuilder().applySettings(configuration.getProperties()).build();
        SessionFactory factory = new Configuration().configure().buildSessionFactory(serviceRegistry);
        Session session = factory.openSession();
        Transaction t = session.beginTransaction();
        try {
            
        } catch (Exception e) {
        }finally{
            dblogin log=new dblogin(1, request.getParameter("fname").toString().trim()+" "+request.getParameter("lname").toString().trim(), request.getParameter("mail").toString().trim(), request.getParameter("dob").toString().trim(), request.getParameter("contact").toString().trim(), request.getParameter("pass").toString().trim(), "no");
            session.persist(log);
            
            t.commit();
            session.close();
        }
        
        response.sendRedirect("/login");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
