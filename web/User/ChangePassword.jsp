<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.Cookie" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Rau củ tươi G7</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/changepass.css">
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>

        <style>
            .text-danger{
                margin-top: 10px;
                color: red;
            }
        </style>
    </head>

    <body>
        <section class="container">
            <header>Thay đổi mật khẩu</header>
            <p class="text-danger">${mess}</p>
            <form action="${pageContext.request.contextPath}/changePassword" method="post" class="form" onsubmit="return validateForm()">
                <div class="input-box">
                    <label>Nhập mật khẩu hiện tại</label>
                    <input id="oldpassword" name="oldpassword" type="password"  placeholder="Nhập mật khẩu hiện tại của bạn" />
                    <span id="oldpassError"></span>
                </div>

                <div class="input-box">
                    <label>Nhập mật khẩu</label>
                    <input id="password" name="password" type="password"  placeholder="Nhập mật khẩu mới của bạn" />
                    <span id="passwordError"></span>
                </div>

                <div class="input-box">
                    <label>Nhập lại mật khẩu</label>
                    <input id="repassword" name="repassword" type="password" placeholder="Nhập lại mật khẩu" />
                    <span id="repasswordError"></span>
                </div>
                <button class="btn-prime">Cập nhật</button>      
            </form>

            <!--popup-->
            <div id="myModal" class="modal" style="display: ${mess ? 'block' : 'none'};">
                <div class="modal-content">
                    <span class="close">&times;</span>
                    <p id="popupMessage" class="${messSuccess ? 'text-success' : 'text-danger'}">${messSuccess ? messSuccess : mess}</p>
                </div>
            </div>
        </section>

        <script>
                function validateForm() {
                    var oldPassword = document.getElementById("oldpassword").value;
                    var password = document.getElementById("password").value;
                    var repassword = document.getElementById("repassword").value;

                    var oldpassError = document.getElementById("oldpassError");
                    var passwordError = document.getElementById("passwordError");
                    var repasswordError = document.getElementById("repasswordError");

                    var hasError = false;

                    if (oldPassword === "") {
                        oldpassError.innerText = "Điền vào ô này";
                        hasError = true;
                    } else {
                        if (oldPassword.length < 3) {
                            oldpassError.innerText = "Mật khẩu phải dài hơn 3";
                            hasError = true;
                        } else {
                            oldpassError.innerText = "";
                        }
                    }

                    if (password === "") {
                        passwordError.innerText = "Điền vào ô này";
                        hasError = true;
                    } else {
                        if (password.length < 3) {
                            passwordError.innerText = "Mật khẩu phải dài hơn 3";
                            hasError = true;
                        } else {
                            passwordError.innerText = "";
                        }
                    }

                    if (repassword === "") {
                        repasswordError.innerText = "Điền vào ô này";
                        hasError = true;
                    } else if (repassword !== password) {
                        repasswordError.innerText = "Nhập lại mật khẩu không trùng khớp";
                        hasError = true;
                    } else {
                        repasswordError.innerText = "";
                    }

                    return !hasError;
                }
        </script>
    </body>

</html>