/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package userservlet;

import db.blog;
import db.dblogin;
import db.specialization_tab;
import java.io.IOException;
import java.util.Collections;
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
public class article extends HttpServlet {

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

        Query blog_query = session.createQuery("from blog where is_active=1 and deleted=0");
        List<blog> blog_data = (List<blog>) blog_query.list();

        Collections.reverse(blog_data);
        request.setAttribute("blog_data", blog_data);
        
        Query log_query = session.createQuery("from dblogin where is_active=1 and deleted=0");
        List<dblogin> log_data = (List<dblogin>) log_query.list();

        request.setAttribute("log_data", log_data);


        t.commit();
        session.close();

        RequestDispatcher dp = request.getRequestDispatcher("/pages/user/article.jsp");
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
        } finally {
            blog bl = new blog();
            bl.setImg_id(1);
            bl.setHeading(request.getParameter("heading"));
            bl.setDetail(request.getParameter("articledetail"));
            bl.setLike_count(0);
            bl.setViews(0);
            bl.setIs_active(1);
            bl.setAdded_on("24-07-2017");
            bl.setEdited_on("no");
            bl.setDeleted(0);
            bl.setAdded_by(Integer.parseInt(request.getSession().getAttribute("sessionId").toString()));
            session.save(bl);

            t.commit();
            session.close();
        }
        
        response.sendRedirect("/article");
    }

    @Override
    public String getServletInfo() {
        return "article servlet";
    }

}
