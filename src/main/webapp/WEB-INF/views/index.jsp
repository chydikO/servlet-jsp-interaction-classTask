<%@ page import="java.util.List" %>
<%@ page import="com.chudik0.CalculationEntry" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <title>Simple Calculator</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                margin: 20px;
            }

            h1 {
                text-align: center;
            }

            section {
                margin-bottom: 40px;
            }

            form {
                display: flex;
                justify-content: center;
                align-items: center;
                margin-bottom: 10px;
            }

            form label {
                margin-right: 10px;
            }

            table {
                width: 100%;
                border-collapse: collapse;
            }

            th, td {
                padding: 8px;
                border-bottom: 1px solid #ddd;
                text-align: left;
            }

            th {
                background-color: #f2f2f2;
            }

            ul {
                list-style-type: none;
                padding-left: 20px;
            }

            li {
                margin-bottom: 8px;
            }

            /* Optional: Add some styling for the "Add" button */
            input[type="submit"] {
                padding: 5px 10px;
                background-color: #007BFF;
                color: #fff;
                border: none;
                cursor: pointer;
            }

            input[type="submit"]:hover {
                background-color: #0056b3;
            }

            /* Optional: Add some styling for the table rows */
            tr:nth-child(even) {
                background-color: #f2f2f2;
            }

            tr:hover {
                background-color: #f9f9f9;
            }
        </style>
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