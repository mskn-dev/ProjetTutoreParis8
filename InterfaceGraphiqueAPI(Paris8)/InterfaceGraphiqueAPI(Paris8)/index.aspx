<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="index.aspx.vb" Inherits="InterfaceGraphiqueAPI_Paris8_.index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8"/>
    <title> interface graphique utilisateur et APIs</title>

    <!-- Bootstrap CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet"/>

    <!-- CSS Perso -->
    <link href="css/theme.css" rel="stylesheet"/>
    <link href="css/main.css" rel="stylesheet"/>

    <!-- Fonts Perso -->
    <link href="font-awesome-4.1.0/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
    <link href="http://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,700,300italic,400italic,700italic" rel="stylesheet" type="text/css"/>
</head>
<body>
     <!-- Navigation -->
    <a id="menu-toggle" href="#" class="btn btn-dark btn-lg toggle"><i class="fa fa-bars"></i></a>
    <nav id="sidebar-wrapper">
        <ul class="sidebar-nav">
            <a id="menu-close" href="#" class="btn btn-light btn-lg pull-right toggle"><i class="fa fa-times"></i></a>
            <li class="sidebar-brand">
                <a href="#top">Projet Tuteuré</a>
            </li>
            <li>
                <a href="#top">Acceuil</a>
            </li>
            <li>
                <a href="#about">Projet</a>
            </li>
            <li>
                <a href="#services">Technologies</a>
            </li>
            <li>
                <a href="#contact">Contact</a>
            </li>
        </ul>
    </nav>

    <!-- Header -->
    <header id="top" class="header">
        <div class="text-vertical-center">
            <div class="main-title p-10">
                <h1> <b>Departement</b> <span class="text-danger">Hypermédia</span></h1>
                <h2> <b>interface graphique utilisateur et APIs</b></h2>
                <br>
                <%-- <a href="#about" class="btn btn-dark btn-lg">Find Out More</a>--%>
            </div>
        </div>
    </header>

    <!-- About -->
    <section id="about" class="about">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <h2>interface graphique utilisateur et APIs</h2>
                    <p class="lead">l’objectif est de réaliser la conception et le développement d'une interface utilisateur permettant l'exploration d'un API à travers un espace graphique interactive.</p>
                </div>
            </div>
            <!-- /.row -->
        </div>
        <!-- /.container -->
    </section>

    <!-- Services -->
    <!-- The circle icons use Font Awesome's stacked icon classes. For more information, visit http://fontawesome.io/examples/ -->
    <section id="services" class="services bg-danger text-white">
        <div class="container">
            <div class="row text-center">
                <div class="col-lg-10 col-lg-offset-1">
                    <h2>Technologies utilisées</h2>
                    <hr class="small">
                    <div class="row">
                        <div class="col-md-4 col-sm-7">
                            <div class="service-item">
                                <span class="fa-stack fa-4x">
                                <i class="fa fa-circle fa-stack-2x"></i>
                                <i class="fa fa-html5 fa-stack-1x text-black"></i>
                            </span>
                                <h4>
                                    <strong>Html 5</strong>
                                </h4>
                                <p>Html 5 et ses nombreuses innovations, notamment sa couche d'applications (Canvas, Geolocalisation, FullScreen, ...)</p>
                            </div>
                        </div>
                        <div class="col-md-4 col-sm-7">
                            <div class="service-item">
                                <span class="fa-stack fa-4x">
                                <i class="fa fa-circle fa-stack-2x"></i>
                                <i class="fa fa-css3 fa-stack-1x text-black"></i>
                            </span>
                                <h4>
                                    <strong>CSS 3</strong>
                                </h4>
                                <p>Les feuilles de styles en cascade.</p>
                            </div>
                        </div>
                        <div class="col-md-4 col-sm-7">
                            <div class="service-item">
                                <span class="fa-stack fa-4x">
                                <i class="fa fa-circle fa-stack-2x"></i>
                                <i class="fa fa-bold fa-stack-1x text-black"></i>
                            </span>
                                <h4>
                                    <strong>Bootstrap 3</strong>
                                </h4>
                                <p>Une collection d'outils utile à la création de sites web et applications web au design adaptatif.</p>
                            </div>
                        </div>
                    </div>
                    <!-- /.row (nested) -->
                </div>
                <!-- /.col-lg-10 -->
            </div>
            <!-- /.row -->
        </div>
        <!-- /.container -->
    </section>
    <!-- Map -->
    <section id="contact" class="map">
        <iframe src="https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d2620.4150132356062!2d2.3625490000000005!3d48.945583000000006!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x47e6695017810e3d%3A0x95196baf9263e53a!2sUniversit%C3%A9+Paris+8+Vincennes-Saint-Denis!5e0!3m2!1sfr!2sfr!4v1414536716193" width="100%" height="100%" frameborder="0" style="border:0"></iframe>
    </section>

    <!-- Footer -->
    <footer>
        <div class="container">
            <div class="row">
                <div class="col-lg-10 col-lg-offset-1 text-center">
                    <h4><strong>interface graphique utilisateur et APIs</strong>
                    </h4>
                    <p>Mehdi AMASKANE<br>Zineb SLAOUI</p>
                    <ul class="list-unstyled">
                        <li><i class="fa fa-envelope-o fa-fw"></i>  <a href="mailto:msknmehdi@gmail.com">msknmehdi@gmail.com</a>
                        </li>
                        <li><i class="fa fa-envelope-o fa-fw"></i>  <a href="mailto:z.slaoui@gmail.com">z.slaoui@gmail.com</a>
                        </li>
                    </ul>
                    <br>
                    <%--<ul class="list-inline">
                        <li>
                            <a href="#"><i class="fa fa-facebook fa-fw fa-3x"></i></a>
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-twitter fa-fw fa-3x"></i></a>
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-dribbble fa-fw fa-3x"></i></a>
                        </li>
                    </ul>--%>
                    <hr class="small">
                    <p class="text-muted">Université Paris VIII 2014-2015</p>
                </div>
            </div>
        </div>
    </footer>

    <!-- jQuery Version 1.11.0 -->
    <script src="js/jquery-1.11.0.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>

    <!-- Custom Theme JavaScript -->
    <script>
        // Closes the sidebar menu
        $("#menu-close").click(function (e) {
            e.preventDefault();
            $("#sidebar-wrapper").toggleClass("active");
        });

        // Opens the sidebar menu
        $("#menu-toggle").click(function (e) {
            e.preventDefault();
            $("#sidebar-wrapper").toggleClass("active");
        });

        // Scrolls to the selected menu item on the page
        $(function () {
            $('a[href*=#]:not([href=#])').click(function () {
                if (location.pathname.replace(/^\//, '') == this.pathname.replace(/^\//, '') || location.hostname == this.hostname) {

                    var target = $(this.hash);
                    target = target.length ? target : $('[name=' + this.hash.slice(1) + ']');
                    if (target.length) {
                        $('html,body').animate({
                            scrollTop: target.offset().top
                        }, 1000);
                        return false;
                    }
                }
            });
        });
    </script>
</body>
</html>
