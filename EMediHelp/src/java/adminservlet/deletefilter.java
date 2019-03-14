/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package adminservlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import db.role;
import db.image_type;
import db.specialization_tab;
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
public class deletefilter extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Configuration configuration = new Configuration();
        configuration.configure();
        ServiceRegistry serviceRegistry = new StandardServiceRegistryBuilder().applySettings(configuration.getProperties()).build();
        SessionFactory factory = new Configuration().configure().buildSessionFactory(serviceRegistry);
        Session session = factory.openSession();
        Transaction t = session.beginTransaction();

        int status=0;
        switch (request.getParameter("type")) {
            case "role":
                Query rq = session.createQuery("update role set deleted=1 where role_id=" + request.getParameter("id"));
                status = rq.executeUpdate();
                break;
            case "img_type":
                Query iq = session.createQuery("update image_type set deleted=1 where img_type_id=" + request.getParameter("id"));
                status = iq.executeUpdate();
                break;
            case "speci":
                Query sq = session.createQuery("update specialization_tab set deleted=1 where specialization_id=" + request.getParameter("id"));
                status = sq.executeUpdate();
                break;
            case "practi":
                Query pq = session.createQuery("update medicine_practice_type set deleted=1 where medi_pract_id=" + request.getParameter("id"));
                status = pq.executeUpdate();
                break;                
            default:
                response.sendRedirect("/filters");
        }

        t.commit();
        session.close();
        response.sendRedirect("/filters");
    }

    @Override
    public String getServletInfo() {
        return "delete filter";
    }

}
