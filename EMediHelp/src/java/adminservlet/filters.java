/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package adminservlet;

import db.dblogin;
import java.io.IOException;
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

import db.role;
import db.image_type;
import db.medicine_practice_type;
import db.specialization_tab;
import java.util.List;
import javax.servlet.http.HttpSession;

/**
 *
 * @author ku1d33p
 */
public class filters extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        //check login
        HttpSession ss = request.getSession();
        if (ss.getAttribute("page_acc_lvl") != null && ss.getAttribute("sessionId")!= null) {
            Configuration configuration = new Configuration();
            configuration.configure();
            ServiceRegistry serviceRegistry = new StandardServiceRegistryBuilder().applySettings(configuration.getProperties()).build();
            SessionFactory factory = new Configuration().configure().buildSessionFactory(serviceRegistry);
            Session session = factory.openSession();
            Transaction t = session.beginTransaction();
            try {
                //fill filters

                Query role_query = session.createQuery("from role where is_active=1 and deleted=0");
                List<role> role_data = (List<role>) role_query.list();

                request.setAttribute("role_data", role_data);

                Query img_type_query = session.createQuery("from image_type where is_active=1 and deleted=0");
                List<image_type> img_type_data = (List<image_type>) img_type_query.list();

                request.setAttribute("img_type_data", img_type_data);

                Query speci_query = session.createQuery("from specialization_tab where is_active=1 and deleted=0");
                List<specialization_tab> speci_data = (List<specialization_tab>) speci_query.list();

                request.setAttribute("speci_data", speci_data);

                Query med_prct_query = session.createQuery("from medicine_practice_type where is_active=1 and deleted=0");
                List<specialization_tab> med_prct_data = (List<specialization_tab>) med_prct_query.list();

                request.setAttribute("med_prct_data", med_prct_data);
            } catch (Exception e) {
            } finally {
                t.commit();
                session.close();
            }

            RequestDispatcher dp = request.getRequestDispatcher("/pages/admin/filters.jsp");
            dp.forward(request, response);

        } else {
            String returnurl = request.getRequestURI() + "?" + request.getQueryString();
            response.sendRedirect("/login?return_url=" + returnurl);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //add new filter categories
        if (request.getParameter("operation").equals("add")) {

            Configuration configuration = new Configuration();
            configuration.configure();
            ServiceRegistry serviceRegistry = new StandardServiceRegistryBuilder().applySettings(configuration.getProperties()).build();
            SessionFactory factory = new Configuration().configure().buildSessionFactory(serviceRegistry);
            Session session = factory.openSession();
            Transaction t = session.beginTransaction();

            switch (request.getParameter("type")) {
                case "role":
                    role r = new role(request.getParameter("add-role-type-inp"), 1, "no", 3);
                    session.persist(r);
                    break;
                case "img_type":
                    image_type i = new image_type(request.getParameter("add-img-type-inp"), "no", 1);
                    session.persist(i);
                    break;
                case "speci":
                    specialization_tab s = new specialization_tab(request.getParameter("add-speci-type-inp"), "no", 1);
                    session.persist(s);
                    break;
                case "practi":
                    medicine_practice_type m = new medicine_practice_type(request.getParameter("add-parti-type-inp"), "no", 1);
                    session.persist(m);
                    break;
                default:
                    response.sendRedirect("/filters");
            }

            t.commit();
            session.close();
            response.sendRedirect("/filters");
        }
    }

    @Override
    public String getServletInfo() {
        return "filter";
    }// </editor-fold>

}
