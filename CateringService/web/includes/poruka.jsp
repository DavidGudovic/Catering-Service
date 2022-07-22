<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>

<c:if test="${param.Status == 'uspeh'}">
    <div class="poruka">
        <p id="hvala">Hvala što ste koristili naše usluge!<br>Nakon ostvarenja osvojićete ${param.Poeni} poena!</p>
    </form>
</div>
</c:if>
<c:if test="${param.Status == 'greska'}">
    <div class="poruka">
        <p id="hvala">Došlo je do greške, pokušajte ponovo</p>
    </form>
</div>
</c:if>
