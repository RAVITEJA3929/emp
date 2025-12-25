<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.devops.dao.DatabaseManager,com.devops.model.Employee,java.util.List" %>
<%
    String role = (String) session.getAttribute("userRole");
    String email = (String) session.getAttribute("userEmail");
    String userName = (String) session.getAttribute("userName");
    if (role == null || !"Employee".equalsIgnoreCase(role)) {
        response.sendRedirect("login.jsp");
        return;
    }
    // simple lookup of current employee from list
    Employee me = null;
    for (Employee e : DatabaseManager.getAllEmployees()) {
        if (e.getEmail().equals(email)) { me = e; break; }
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>My Workspace - EMS</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
          rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/boxicons@2.1.4/css/boxicons.min.css"
          rel="stylesheet">
    <link rel="stylesheet" href="css/style.css">
</head>
<body class="dashboard-body employee-theme">
<div class="d-flex flex-column min-vh-100">
    <!-- Top bar -->
    <nav class="navbar navbar-expand-lg navbar-dark employee-navbar shadow-sm">
        <div class="container-fluid">
            <span class="navbar-brand fw-bold">
                <i class='bx bxs-briefcase-alt-2 me-1'></i>My Workspace
            </span>
            <div class="d-flex ms-auto align-items-center gap-3">
                <span class="text-white-50 small d-none d-md-inline">Logged in as</span>
                <span class="badge bg-light text-primary">
                    <i class='bx bxs-user-circle me-1'></i><%= userName %>
                </span>
                <a href="logout" class="btn btn-sm btn-outline-light">
                    <i class='bx bx-log-out'></i>
                </a>
            </div>
        </div>
    </nav>

    <!-- Content -->
    <main class="flex-grow-1 py-4">
        <div class="container">
            <div class="row g-4">
                <!-- Profile card -->
                <div class="col-lg-4">
                    <div class="card shadow border-0 rounded-4 employee-card">
                        <div class="card-body text-center">
                            <div class="avatar-circle mb-3">
                                <span><%= userName != null ? userName.substring(0,1).toUpperCase() : "E" %></span>
                            </div>
                            <h4 class="fw-bold mb-1"><%= userName %></h4>
                            <p class="text-muted mb-2"><%= me != null ? me.getRole() : "Employee" %> •
                                <%= me != null ? me.getDepartment() : "" %></p>
                            <p class="small text-muted mb-3"><%= email %></p>
                            <button class="btn btn-outline-primary btn-sm">Update Profile</button>
                        </div>
                    </div>
                </div>

                <!-- Quick stats -->
                <div class="col-lg-8">
                    <div class="row g-3 mb-3">
                        <div class="col-md-4">
                            <div class="mini-stat-card soft-blue">
                                <div class="label">Status</div>
                                <div class="value"><%= me != null ? me.getStatus() : "Active" %></div>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="mini-stat-card soft-green">
                                <div class="label">Salary</div>
                                <div class="value">₹<%= me != null ? (int) me.getSalary() : 0 %></div>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="mini-stat-card soft-purple">
                                <div class="label">Role</div>
                                <div class="value"><%= me != null ? me.getRole() : "Employee" %></div>
                            </div>
                        </div>
                    </div>

                    <!-- Activity / shortcuts -->
                    <div class="card shadow border-0 rounded-4">
                        <div class="card-header bg-transparent border-0">
                            <h5 class="mb-0">Quick Actions</h5>
                        </div>
                        <div class="card-body">
                            <div class="row g-3">
                                <div class="col-md-4">
                                    <button class="btn w-100 btn-outline-primary">
                                        <i class='bx bx-file me-1'></i>View Payslip
                                    </button>
                                </div>
                                <div class="col-md-4">
                                    <button class="btn w-100 btn-outline-success">
                                        <i class='bx bx-calendar-event me-1'></i>Request Leave
                                    </button>
                                </div>
                                <div class="col-md-4">
                                    <button class="btn w-100 btn-outline-warning">
                                        <i class='bx bx-lock-alt me-1'></i>Change Password
                                    </button>
                                </div>
                            </div>
                            <hr>
                            <p class="small text-muted mb-0">
                                More options like timesheets, documents, and notifications can be added here later.
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </main>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
