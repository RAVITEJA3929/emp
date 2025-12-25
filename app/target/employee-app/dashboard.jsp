<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.devops.dao.DatabaseManager" %>
<%@ page import="com.devops.model.Employee" %>
<%@ page import="java.util.List" %>
<% 
if (session.getAttribute("userEmail") == null) {
    response.sendRedirect("login.jsp"); return;
}
List<Employee> employees = DatabaseManager.getAllEmployees();
int total = DatabaseManager.getEmployeeCount();
%>
<!DOCTYPE html>
<html>
<head>
    <title>EMS Dashboard</title>
    <style>
        * { margin:0; padding:0; box-sizing:border-box; }
        body { font-family: system-ui; background: linear-gradient(135deg, #667eea 0%, #764ba2 100%); color: #333; }
        .navbar { background: rgba(255,255,255,0.95); padding: 20px; display: flex; justify-content: space-between; }
        .navbar h2 { color: #667eea; }
        .logout { background: #ff6b6b; color: white; padding: 8px 16px; text-decoration: none; border-radius: 20px; }
        .stats { display: grid; grid-template-columns: repeat(auto-fit, minmax(200px, 1fr)); gap: 20px; padding: 40px; }
        .stat-card { background: white; padding: 30px; border-radius: 15px; text-align: center; box-shadow: 0 10px 30px rgba(0,0,0,0.1); }
        .stat-value { font-size: 2.5em; font-weight: bold; color: #667eea; }
        table { width: 100%; border-collapse: collapse; background: white; margin: 20px 40px; border-radius: 15px; overflow: hidden; box-shadow: 0 10px 30px rgba(0,0,0,0.1); }
        th, td { padding: 15px; text-align: left; }
        th { background: #667eea; color: white; }
        tr:nth-child(even) { background: #f8f9ff; }
        .badge { padding: 4px 12px; border-radius: 20px; color: white; font-size: 12px; }
        .admin { background: #ff6b6b; }
        .employee { background: #51cf66; }
    </style>
</head>
<body>
    <nav class="navbar">
        <h2>🏢 Employee Management System</h2>
        <div>
            <span>👤 <%= session.getAttribute("userEmail") %></span>
            <a href="logout" class="logout">Logout</a>
        </div>
    </nav>
    
    <div class="stats">
        <div class="stat-card">
            <div class="stat-value"><%= total %></div>
            <div>Total Employees</div>
        </div>
        <div class="stat-card">
            <div class="stat-value">$75,000</div>
            <div>Avg Salary</div>
        </div>
    </div>
    
    <table>
        <tr><th>ID</th><th>Name</th><th>Email</th><th>Department</th><th>Salary</th><th>Role</th></tr>
        <% for(Employee emp : employees) { %>
        <tr>
            <td><%= emp.getId() %></td>
            <td><%= emp.getName() %></td>
            <td><%= emp.getEmail() %></td>
            <td><%= emp.getDepartment() %></td>
            <td>$<%= String.format("%.0f", emp.getSalary()) %></td>
            <td><span class="badge <%= emp.getRole().toLowerCase() %>"><%= emp.getRole() %></span></td>
        </tr>
        <% } %>
    </table>
</body>
</html>
