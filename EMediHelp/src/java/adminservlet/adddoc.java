/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package adminservlet;

import db.address;
import db.dblogin;
import db.doctor_info;
import db.specialization_tab;
import java.io.IOException;
import java.io.PrintWriter;
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
public class adddoc extends HttpServlet {

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
        
        RequestDispatcher rs=request.getRequestDispatcher("/pages/admin/docadd.jsp");
        rs.forward(request, response);
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
            
            dblogin log=new dblogin(2, request.getParameter("fullname"), request.getParameter("email"), request.getParameter("dob"), request.getParameter("phone"), request.getParameter("pass"), "no");
            session.persist(log);
            
            doctor_info doc=new doctor_info(1, log.getLog_id(), Integer.parseInt(request.getParameter("spci")), 1, Integer.parseInt(request.getParameter("gen")), request.getParameter("expr"), 1, request.getParameter("detail"), Integer.parseInt(request.getParameter("fee")), Integer.parseInt(request.getParameter("ratting")), "no", Integer.parseInt(request.getSession().getAttribute("sessionId").toString()));
            session.persist(doc);
            
            address add=new address(log.getLog_id(), request.getParameter("street"), request.getParameter("landmark"), request.getParameter("city"), request.getParameter("state"), request.getParameter("pin"), request.getParameter("country"), "no", "no", Integer.parseInt(request.getSession().getAttribute("sessionId").toString()));
            session.persist(add);
            
            t.commit();
            session.close();
        }
        
        response.sendRedirect("/adddoc");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
