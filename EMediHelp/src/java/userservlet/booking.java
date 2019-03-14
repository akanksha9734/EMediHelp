/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package userservlet;

import db.appointment_tab;
import db.feedback_tab;
import java.io.IOException;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
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
public class booking extends HttpServlet {

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
                String _day="";
                String _date="";
                switch(request.getParameter("day")){
                    case "today":
                        _day=(new Date()).getDay()+"";
                        _date=(new Date()).getDate()+"";
                        break;
                    case "tomorrow":
                        _day=((new Date()).getDay()+1)+"";
                        _date=((new Date()).getDate()+1)+"";
                        break;
                    case "aftertomorrow":
                        _day=((new Date()).getDay()+2)+"";
                        _date=((new Date()).getDate()+2)+"";
                        break;
                }
                appointment_tab app=new appointment_tab(Integer.parseInt(ss.getAttribute("sessionId").toString()), Integer.parseInt(request.getParameter("doc_id")), _date, _day, request.getParameter("time"), "no", 0, "no", Integer.parseInt(ss.getAttribute("sessionId").toString()));
                session.persist(app);

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
        return "booking servlet";
    }

}
