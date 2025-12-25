<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.devops.dao.DatabaseManager,com.devops.model.Employee,java.util.List" %>
<%
    String role = (String) session.getAttribute("userRole");
    if (role == null || !"Admin".equalsIgnoreCase(role)) {
        response.sendRedirect("login.jsp");
        return;
    }
    String userName = (String) session.getAttribute("userName");
    List<Employee> employees = DatabaseManager.getAllEmployees();
    int total = DatabaseManager.getEmployeeCount();
    int active = DatabaseManager.getActiveEmployeeCount();
    int deptCount = DatabaseManager.getDepartmentCount();
    double avgSalary = DatabaseManager.getAverageSalary();
%>
<!DOCTYPE html>
<html>
<head>
    <title>Admin Dashboard - EMS</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
          rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/boxicons@2.1.4/css/boxicons.min.css"
          rel="stylesheet">
    <link rel="stylesheet" href="css/style.css">
</head>
<body class="dashboard-body admin-theme">
<div class="d-flex">
    <!-- Sidebar -->
    <aside class="sidebar bg-gradient-primary text-white">
        <div class="sidebar-header">
            <i class='bx bxs-building-house'></i>
            <span>EMS Admin</span>
        </div>
        <nav class="nav flex-column sidebar-nav">
            <a class="nav-link active" href="admin-dashboard.jsp">
                <i class='bx bxs-dashboard'></i><span>Dashboard</span>
            </a>
            <a class="nav-link" href="#">
                <i class='bx bxs-user-detail'></i><span>Employees</span>
            </a>
            <a class="nav-link" href="#">
                <i class='bx bxs-group'></i><span>Departments</span>
            </a>
            <a class="nav-link" href="#">
                <i class='bx bxs-report'></i><span>Reports</span>
            </a>
            <a class="nav-link" href="#">
                <i class='bx bxs-cog'></i><span>Settings</span>
            </a>
            <a class="nav-link logout-link" href="logout">
                <i class='bx bx-log-out'></i><span>Logout</span>
            </a>
        </nav>
    </aside>

    <!-- Main content -->
    <main class="flex-grow-1 main-panel">
        <!-- Top navbar -->
        <nav class="navbar navbar-expand-lg navbar-light bg-white shadow-sm">
            <div class="container-fluid">
                <span class="navbar-brand fw-bold text-primary">Admin Dashboard</span>
                <form class="d-flex ms-auto me-3">
                    <input id="employeeSearch" class="form-control form-control-sm"
                           type="search" placeholder="Search employees..." aria-label="Search">
                </form>
                <div class="d-flex align-items-center gap-3">
                    <span class="badge rounded-pill bg-primary-subtle text-primary">
                        <i class='bx bxs-user-circle me-1'></i><%= userName %> (Admin)
                    </span>
                </div>
            </div>
        </nav>

        <!-- Content -->
        <!-- (rest of existing admin-dashboard.jsp content stays exactly as before) -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="js/app.js"></script>
</body>
</html>
