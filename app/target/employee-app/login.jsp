<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>EMS Login</title>
    <style>
        * { margin:0; padding:0; box-sizing:border-box; }
        body { 
            font-family: system-ui; 
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh; display: flex; align-items: center; justify-content: center;
        }
        .login-card { 
            background: rgba(255,255,255,0.95); 
            padding: 40px; border-radius: 20px; width: 100%; max-width: 400px;
            box-shadow: 0 20px 40px rgba(0,0,0,0.1);
        }
        h1 { color: #667eea; text-align: center; margin-bottom: 20px; }
        input { width: 100%; padding: 12px; margin: 10px 0; border: 1px solid #ddd; border-radius: 8px; }
        button { width: 100%; padding: 12px; background: #667eea; color: white; border: none; border-radius: 8px; cursor: pointer; }
        .error { color: red; text-align: center; margin: 10px 0; }
        .demo { background: #f0f0f0; padding: 15px; border-radius: 8px; margin-top: 20px; font-size: 14px; }
    </style>
</head>
<body>
    <div class="login-card">
        <h1>🏢 EMS</h1>
        <% if (request.getAttribute("error") != null) { %>
            <div class="error"><%= request.getAttribute("error") %></div>
        <% } %>
        <form method="post" action="login">
            <input type="email" name="email" placeholder="Email" required>
            <input type="password" name="password" placeholder="Password" required>
            <button type="submit">Login</button>
        </form>
        <div class="demo">
            <strong>Demo:</strong><br>
            Admin: admin@company.com / admin123<br>
            Employee: john@company.com / pass123
        </div>
    </div>
</body>
</html>
