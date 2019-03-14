/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package userservlet;

import db.address;
import db.dblogin;
import db.specialization_tab;
import java.io.IOException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
public class aboutus extends HttpServlet {

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
        
        RequestDispatcher dp=request.getRequestDispatcher("/pages/user/aboutus.jsp");
        dp.forward(request, response);
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
            Object ob=session.load(address.class, Integer.parseInt(request.getParameter("add_id").toString()));
            address add=(address)ob;
            add.setStreet_no(request.getParameter("street"));
            add.setLandmark(request.getParameter("landmark"));
            add.setCity(request.getParameter("city"));
            add.setState(request.getParameter("state"));
            add.setPincode(request.getParameter("pin"));
            add.setCountry(request.getParameter("country"));
            t.commit();
            session.close();
        }
        response.sendRedirect("/profile?profile");
    }

    @Override
    public String getServletInfo() {
        return "about us servlet";
    }

}
