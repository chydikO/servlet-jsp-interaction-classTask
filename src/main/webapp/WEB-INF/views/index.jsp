<%@ page import="java.util.List" %>
<%@ page import="com.chudik0.CalculationEntry" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <title>Simple Calculator</title>
    </head>
    <body>
        <h1>Simple Calculator</h1>
        <section>
            <h2>Addition</h2>
            <form method="post" action="calculate">
                <label>Operand 1: <input name="operand1" required></label>
                <label>Operand 2: <input name="operand2" required></label>
                <input type="submit" value="Add">
            </form>
        </section>
        <section>
            <h2>History</h2>
            <table>
                <tr>
                    <th>#</th>
                    <th>Time</th>
                    <th>Calculation</th>
                    <th>Result</th>
                </tr>
                <% List<CalculationEntry> calculations = (List<CalculationEntry>) request.getAttribute("calculations"); %>
                <% int index = 1; %>
                <% for (CalculationEntry entry : calculations) { %>
                <tr>
                    <td><%= index++ %></td>
                    <td><%= entry.time() %></td>
                    <td><%= entry.calculation() %></td>
                    <td><%= entry.result() %></td>
                </tr>
                <% } %>
            </table>
        </section>
    </body>
</html>