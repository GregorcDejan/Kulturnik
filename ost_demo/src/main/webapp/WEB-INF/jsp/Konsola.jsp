< xmlns:h="http://xmlns.jcp.org/jsf/html" />
< xmlns:h="http://java.sun.com/jsf/html"/>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="h" uri="http://www.springframework.org/tags/form" %>



<html>

<head>
<title>Test</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"></link>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

</head>

<body>





<h:form>
    <p:commandButton id="downloadLink" value="Download" ajax="false">
        <p:fileDownload value="#{filemanagement.prepDownload}" />
    </p:commandButton>
</h:form>

<script type="text/javascript">
    function start() {
        PF('statusDialog').show();
    }

    function stop() {
        PF('statusDialog').hide();
    }
</script>

</body>

</html>