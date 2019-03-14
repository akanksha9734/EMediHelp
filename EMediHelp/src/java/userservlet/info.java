/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package userservlet;

import db.address;
import db.blog;
import db.dblogin;
import db.doc_working_tab;
import db.doctor_info;
import db.feedback_tab;
import db.image;
import db.specialization_tab;
import java.io.IOException;
import java.util.ArrayList;
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
public class info extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //fill filters
        Configuration configuration = new Configuration();
        configuration.configure();
        ServiceRegistry serviceRegistry = new StandardServiceRegistryBuilder().applySettings(configuration.getProperties()).build();
        SessionFactory factory = new Configuration().configure().buildSessionFactory(serviceRegistry);
        Session session = factory.openSession();
        Transaction t = session.beginTransaction();
    
        //fill menu
        Query speci_query = session.createQuery("from specialization_tab where is_active=1 and deleted=0");
        List<specialization_tab> speci_data = (List<specialization_tab>) speci_query.list();
        request.setAttribute("speci_data", speci_data);
        
        //fill recent articles
        Query blog_query = session.createQuery("from blog where is_active=1 and deleted=0");
        List<blog> blog_data = (List<blog>) blog_query.list();
        Collections.reverse(blog_data);
        request.setAttribute("blog_data", blog_data);

        //fill doctor info
        doctor_info doc_data = (doctor_info) session.get(doctor_info.class, Integer.parseInt(request.getParameter("doc_id")));
        request.setAttribute("doc_data", doc_data);
        
        dblogin fullname = (dblogin) session.get(dblogin.class, doc_data.getLog_id());
        request.setAttribute("fullname", fullname.getFull_name().toUpperCase());
        
        Query add_query = session.createQuery("from address where is_active=1 and deleted=0 and log_id="+doc_data.getLog_id());
        ArrayList add_data = (ArrayList) add_query.list();
        address add=(address)add_data.get(0);
        request.setAttribute("full_add", add.getStreet_no() + ", " + add.getCity()+ ", " + add.getState()+ ", " + add.getCountry()+ " " + add.getPincode());
        request.setAttribute("near_add", add.getLandmark());

        
        
        Query work_query = session.createQuery("from doc_working_tab where is_active=1 and deleted=0 and doc_id="+doc_data.getDoc_id());
        List<doc_working_tab> work_data = (List<doc_working_tab>) work_query.list();

        request.setAttribute("work_data", work_data);

        specialization_tab spci_data = (specialization_tab) session.get(specialization_tab.class, doc_data.getSpecialization_id());
        request.setAttribute("spci_data", spci_data.getSpecialization());
        
        //fill feedback
        Query img_query = session.createQuery("from image where is_active=1 and deleted=0");
        List<image> img_data = (List<image>) img_query.list();
        request.setAttribute("img_data", img_data);
        
        Query feedback_query = session.createQuery("from feedback_tab where is_active=1 and deleted=0 and public_visible=1 and doc_id="+request.getParameter("doc_id"));
        List<feedback_tab> feedback_data = (List<feedback_tab>) feedback_query.list();
        Collections.reverse(feedback_data);
        request.setAttribute("feedback_data", feedback_data);
        
        Query log_query = session.createQuery("from dblogin where is_active=1 and deleted=0");
        List<dblogin> log_data = (List<dblogin>) log_query.list();
        request.setAttribute("log_data", log_data);

        t.commit();
        session.close();
        
        RequestDispatcher dp=request.getRequestDispatcher("/pages/user/info.jsp");
        dp.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
    }

    @Override
    public String getServletInfo() {
        return "info servlet";
    }
}
