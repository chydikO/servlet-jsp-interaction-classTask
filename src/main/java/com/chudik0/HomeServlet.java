package com.chudik0;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.time.LocalDateTime;
import java.util.List;
import java.util.concurrent.CopyOnWriteArrayList;

/**
 * Створити простий калькулятор на одну дію (додавання) з можливістю зберігати історію розрахунків.
 * Попередні розрахунки виводяться у вигляді списку (або таблиці) під формою.
 * Використовувати обчислення на боці servlet, відтворення данних - у jsp
 * Додаткове завданн: виводити не тільки розрахунки, але ще й часі і порядковий номер.
 */

@WebServlet(urlPatterns = "/")
public class HomeServlet extends HttpServlet {

    private final List<CalculationEntry> calculations = new CopyOnWriteArrayList<>();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setAttribute("calculations", calculations);
        req.getRequestDispatcher("/WEB-INF/views/index.jsp")
                .forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        int operand1 = Integer.parseInt(req.getParameter("operand1"));
        int operand2 = Integer.parseInt(req.getParameter("operand2"));

        int result = operand1 + operand2;

        String calculation = operand1 + " + " + operand2 + " = " + result;
        calculations.add(new CalculationEntry(LocalDateTime.now(), calculation, result));

        resp.sendRedirect(req.getContextPath());
    }
}