/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package userservlet;

import db.address;
import db.appointment_tab;
import db.dblogin;
import db.doctor_info;
import db.feedback_tab;
import db.specialization_tab;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Collections;
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
public class profile extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //check login
        HttpSession ss = request.getSession();
        if (ss.getAttribute("page_acc_lvl") != null && ss.getAttribute("sessionId") != null) {
            Configuration configuration = new Configuration();
            configuration.configure();
            ServiceRegistry serviceRegistry = new StandardServiceRegistryBuilder().applySettings(configuration.getProperties()).build();
            SessionFactory factory = new Configuration().configure().buildSessionFactory(serviceRegistry);
            Session session = factory.openSession();
            Transaction t = session.beginTransaction();

            Query speci_query = session.createQuery("from specialization_tab where is_active=1 and deleted=0");
            List<specialization_tab> speci_data = (List<specialization_tab>) speci_query.list();
            request.setAttribute("speci_data", speci_data);

            Query feedback_query = session.createQuery("from feedback_tab where is_active=1 and deleted=0 and public_visible=1 and log_id=" + request.getSession().getAttribute("sessionId"));
            List<feedback_tab> feedback_data = (List<feedback_tab>) feedback_query.list();
            Collections.reverse(feedback_data);
            request.setAttribute("feedback_data", feedback_data);

            Query log_query = session.createQuery("from dblogin where is_active=1 and deleted=0");
            List<dblogin> log_data = (List<dblogin>) log_query.list();
            request.setAttribute("log_data", log_data);

            Query doc_query = session.createQuery("from doctor_info where is_active=1 and deleted=0");
            List<doctor_info> doc_data = (List<doctor_info>) doc_query.list();
            request.setAttribute("doc_data", doc_data);

            Query app_query = session.createQuery("from appointment_tab where is_active=1 and deleted=0 and log_id=" + request.getSession().getAttribute("sessionId"));
            List<appointment_tab> app_data = (List<appointment_tab>) app_query.list();
            Collections.reverse(app_data);
            request.setAttribute("app_data", app_data);

            Query add_query = session.createQuery("from address where is_active=1 and deleted=0");
            List<address> add_data = (List<address>) add_query.list();
            request.setAttribute("add_data", add_data);

            Object ob = session.load(doctor_info.class, Integer.parseInt(request.getSession().getAttribute("sessionId").toString()));
            doctor_info doctor_data = (doctor_info) ob;
            request.setAttribute("doctor_data", doctor_data);

            Query addr_query = session.createQuery("from address where is_active=1 and deleted=0 and log_id=" + request.getSession().getAttribute("sessionId"));
            ArrayList addr_data = (ArrayList) addr_query.list();
            if (add_data.size() > 0) {
                request.setAttribute("addr_data", add_data.get(0));
            } else {
                request.setAttribute("addr_data", null);
            }

            t.commit();
            session.close();

            RequestDispatcher dp = request.getRequestDispatcher("/pages/user/profile.jsp");
            dp.forward(request, response);
        } else {
            String returnurl = request.getRequestURI() + "?" + request.getQueryString();
            response.sendRedirect("/login?return_url=" + returnurl);
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
        } finally {
            Object ob = session.load(dblogin.class, Integer.parseInt(request.getSession().getAttribute("sessionId").toString()));
            dblogin log = (dblogin) ob;
            log.setFull_name(request.getParameter("fullname").toString());
            log.setDob(request.getParameter("dob").toString());
            log.setPhone_no(request.getParameter("phone").toString());
            t.commit();
            session.close();
        }
        response.sendRedirect("/profile?profile");
    }

    @Override
    public String getServletInfo() {
        return "profile servlet";
    }

}
