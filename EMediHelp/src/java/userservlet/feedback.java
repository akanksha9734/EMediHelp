/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package userservlet;

import db.feedback_tab;
import db.specialization_tab;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.catalina.ha.ClusterSession;
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
public class feedback extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Configuration configuration = new Configuration();
        configuration.configure();
        ServiceRegistry serviceRegistry = new StandardServiceRegistryBuilder().applySettings(configuration.getProperties()).build();
        SessionFactory factory = new Configuration().configure().buildSessionFactory(serviceRegistry);
        Session session = factory.openSession();
        Transaction t = session.beginTransaction();
        HttpSession ss = request.getSession();

        if (ss.getAttribute("page_acc_lvl") != null && ss.getAttribute("sessionId") != null) {
            try {

            } catch (Exception e) {
            } finally {
                feedback_tab feed = new feedback_tab(Integer.parseInt(ss.getAttribute("sessionId").toString()), Integer.parseInt(request.getParameter("doc_id")), Integer.parseInt(request.getParameter("recomend").equals("Yes") ? "1" : "0"), request.getParameter("problem"), request.getParameter("message"), Integer.parseInt(request.getParameter("visibility") != null ? "1" : "0"), Integer.parseInt(request.getParameter("ratting")), "no", Integer.parseInt(ss.getAttribute("sessionId").toString()));
                session.persist(feed);

                t.commit();
                session.close();
            }

            response.sendRedirect("/doctor/info?doc_id=" + request.getParameter("doc_id"));
        } else {
            String returnurl = request.getRequestURI() + "?" + request.getQueryString();
            response.sendRedirect("/login?return_url=" + returnurl);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
