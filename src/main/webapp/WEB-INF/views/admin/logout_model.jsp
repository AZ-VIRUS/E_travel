<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- Logout Modal -->
<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="logoutModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            
            <div class="modal-header">
                <h5 class="modal-title" id="logoutModalLabel">Ready to Leave?</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
            </div>
            
            <div class="modal-body">
                Select "Logout" below if you are ready to end your current session.
            </div>
            
            <div class="modal-footer">
                <!-- Cancel button -->
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>

                <!-- Logout form using POST and CSRF token -->
                <form action="${pageContext.request.contextPath}/logout" method="post" style="display:inline;">
                    <c:if test="${not empty _csrf}">
                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                    </c:if>
                    <button type="submit" class="btn btn-primary">Logout</button>
                </form>
            </div>
            
        </div>
    </div>
</div>
