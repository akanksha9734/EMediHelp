/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package userservlet;

import java.util.*;
import java.io.IOException;
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

import db.dblogin;
import db.specialization_tab;

/**
 *
 * @author ku1d33p
 */
public class login extends HttpServlet {

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

        //check dblogin
        HttpSession ss = request.getSession();
        if (ss.getAttribute("page_acc_lvl") != null && ss.getAttribute("sessionId") != null) {
            if (request.getParameter("return_url") != null) {
                response.sendRedirect(request.getParameter("return_url"));
            } else {
                response.sendRedirect("/home");
            }
        } else {
            RequestDispatcher dp = request.getRequestDispatcher("/pages/user/login.jsp");
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
        HttpSession ss = request.getSession();

        try {
            String log_query = "select log_id from dblogin where email=\'" + request.getParameter("email").toString().trim() + "\' and password=\'" + request.getParameter("pass").toString().trim() + "\'";
            Query query = session.createQuery(log_query);
            ArrayList log_id = (ArrayList) query.list();
            dblogin log_data = (dblogin) session.get(dblogin.class, (int) log_id.get(0));

            ss.setAttribute("sessionId", log_data.getLog_id());
            ss.setAttribute("page_acc_lvl", log_data.getRole_id());
            ss.setAttribute("user_name", log_data.getFull_name());
        } catch (Exception e) {
        } finally {
            t.commit();
            session.close();
        }
        if (ss.getAttribute("page_acc_lvl") != null && ss.getAttribute("sessionId") != null) {
            if (request.getParameter("return_url") != null) {
                response.sendRedirect(request.getParameter("return_url"));
            } else {
                response.sendRedirect("/home");
            }
        } else {
            RequestDispatcher dp = request.getRequestDispatcher("/pages/user/login.jsp");
            dp.forward(request, response);
        }
    }

    @Override
    public String getServletInfo() {
        return "login Servlet";
    }

}
