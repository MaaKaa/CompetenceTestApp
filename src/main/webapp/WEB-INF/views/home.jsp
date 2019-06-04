<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<html>
<head>
    <title>Home</title>
    <link href="<c:url value="/webjars/bootstrap/4.3.1/css/bootstrap.min.css"/>" rel="stylesheet">
    <script src="<c:url value="/webjars/bootstrap/4.3.1/js/bootstrap.min.js"/>"></script>
    <link href="<c:url value="/resources/css/main.css"/>" rel="stylesheet">
    <script src="<c:url value="/webjars/jquery/3.0.0/jquery.min.js"/>"></script>

    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,500,600,700,700i|Montserrat:300,400,500,600,700" rel="stylesheet">

    <!-- Libraries CSS Files -->
    <link href="/resources/lib/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <link href="/resources/lib/ionicons/css/ionicons.min.css" rel="stylesheet">
    <link href="/resources/lib/animate/animate.min.css" rel="stylesheet">

</head>
<body>

<%@ include file="header.jspf" %>

    <!-- ------------
    # Intro Section
    --------------- -->

    <section id="intro" class="clearfix">
        <div class="container d-flex h-100">
            <div class="row justify-content-center align-self-center">
                <div class="col-md-6 intro-info order-md-first order-last">
                    <h2>Find out<br>what volunteers learn <br>in your <span>projects!</span></h2>
                    <div>
                        <a href="/register" class="btn-get-started scrollto">Get Started</a>
                    </div>
                </div>

                <div class="col-md-6 intro-img order-md-last order-first">
                    <img src="/resources/img/intro-img.svg" alt="" class="img-fluid">
                </div>
            </div>

        </div>
    </section>

    <!--==========================
        About Section
        ============================-->
    <section id="about" class="section-bg">
        <div class="container-fluid">
            <header class="section-header">
                <br>
                <h3>About</h3>
                <p>Communication, flexibility, teamwork - there are lots of competencies that can be developed through volunteering. Also in your organisation!<br>
                   Thanks to the Competence Test App you can easily find out what volunteers learn within your projects!</p>
            </header>
        </div>
    </section>

    <!--==========================
          Features Section
        ============================-->
    <section id="features">
        <div class="container">
            <header class="section-header">
                <h3>How it works?</h3>
                <p>There are just three simple steps:</p>
            </header>

            <div class="row feature-item mt-5 pt-5 align-items-center">
                <div class="col-lg-6 order-1 order-lg-2">
                    <img src="/resources/img/Org-dashboard.png" class="img-fluid" alt="">
                </div>

                <div class="col-lg-6 pt-4 pt-lg-0 order-2 order-lg-1">
                    <h4>1. Create a project</h4>
                    <p>
                        Delectus alias ut incidunt delectus nam placeat in consequatur. Sed cupiditate quia ea quis. Voluptas nemo qui aut distinctio. Cumque fugit earum est quam officiis numquam. Ducimus corporis autem at blanditiis beatae incidunt sunt.
                    </p>
                    <p>
                        Voluptas saepe natus quidem blanditiis. Non sunt impedit voluptas mollitia beatae. Qui esse molestias. Laudantium libero nisi vitae debitis. Dolorem cupiditate est perferendis iusto.
                    </p>
                    <p>
                        Eum quia in. Magni quas ipsum a. Quis ex voluptatem inventore sint quia modi. Numquam est aut fuga mollitia exercitationem nam accusantium provident quia.
                    </p>
                </div>
            </div>

            <div class="row align-items-center">
                <div class="col-lg-6">
                    <img src="/resources/img/Manage-project.png" class="img-fluid" alt="">
                </div>
                <div class="col-lg-6 pt-5 pt-lg-0">
                    <h4>2. Invite volunteers</h4>
                    <p>
                        Ipsum in aspernatur ut possimus sint. Quia omnis est occaecati possimus ea. Quas molestiae perspiciatis occaecati qui rerum. Deleniti quod porro sed quisquam saepe. Numquam mollitia recusandae non ad at et a.
                    </p>
                    <p>
                        Ad vitae recusandae odit possimus. Quaerat cum ipsum corrupti. Odit qui asperiores ea corporis deserunt veritatis quidem expedita perferendis. Qui rerum eligendi ex doloribus quia sit. Porro rerum eum eum.
                    </p>
                </div>
            </div>

            <div class="row feature-item mt-5 pt-5 align-items-center">
                <div class="col-lg-6 order-1 order-lg-2">
                    <img src="resources/img/competencies-result.png" class="img-fluid" alt="">
                </div>

                <div class="col-lg-6 pt-4 pt-lg-0 order-2 order-lg-1">
                    <h4>3. View results!</h4>
                    <p>
                        Delectus alias ut incidunt delectus nam placeat in consequatur. Sed cupiditate quia ea quis. Voluptas nemo qui aut distinctio. Cumque fugit earum est quam officiis numquam. Ducimus corporis autem at blanditiis beatae incidunt sunt.
                    </p>
                    <p>
                        Voluptas saepe natus quidem blanditiis. Non sunt impedit voluptas mollitia beatae. Qui esse molestias. Laudantium libero nisi vitae debitis. Dolorem cupiditate est perferendis iusto.
                    </p>
                    <p>
                        Eum quia in. Magni quas ipsum a. Quis ex voluptatem inventore sint quia modi. Numquam est aut fuga mollitia exercitationem nam accusantium provident quia.
                    </p>
                </div>
            </div>

        </div>
    </section><!-- #features -->

    <!--==========================
         Get Started Section
        ============================-->
    <section id="get-started" class="section-bg">
        <div class="container">
            <div class="row justify-content-center">
                <a href="/register" class="btn-get-started">Get Started!</a>
            </div>
        </div>
    </section>

    <!--==========================
          Counter Section
        ============================-->
    <section id="counter">
        <div class="container-fluid">

            <header class="section-header">
                <br>
                <h3>So far there are:</h3>
            </header>
        </div>

        <div class="container">
            <div class="row counters">

                <div class="col-lg-3 col-6 text-center card-body">
                    <c:set var="noOfVolunteers" value="${noOfVolunteers}"/>
                    <span data-toggle="counter-up">${fn:length(noOfVolunteers)}</span>
                    <p>Volunteers</p>
                </div>

                <div class="col-lg-3 col-6 text-center card-body">
                    <c:set var="noOfOrganisation" value="${noOfOrganisations}"/>
                    <span data-toggle="counter-up">${fn:length(noOfOrganisations)}</span>
                    <p>Organisations</p>
                </div>

                <div class="col-lg-3 col-6 text-center card-body">
                    <c:set var="noOfProjects" value="${noOfProjects}"/>
                    <span data-toggle="counter-up">${fn:length(noOfProjects)}</span>
                    <p>Projects</p>
                </div>

                <div class="col-lg-3 col-6 text-center card-body">
                    <c:set var="noOfSolutions" value="${noOfSolutions}"/>
                    <span data-toggle="counter-up">${fn:length(noOfSolutions)}</span>
                    <p>Tests completed</p>
                </div>

            </div>
        </div>
        <br>
    </section> <!-- Counter -->

    <!--==========================
          Testimonials Section
        ============================-->
    <section id="testimonials" class="section-bg">
        <div class="container">

            <header class="section-header">
                <h3>Testimonials</h3>
            </header>

            <div class="row justify-content-center">
                <div class="col-lg-8">

                    <div class="owl-carousel testimonials-carousel">

                        <div class="testimonial-item">
                            <img src="/resources/img/testimonial-1.jpg" class="testimonial-img" alt="">
                            <h3>Yan Kowalsky</h3>
                            <h4>Ceo &amp; Founder</h4>
                            <p>
                                Proin iaculis purus consequat sem cure digni ssim donec porttitora entum suscipit rhoncus. Accusantium quam, ultricies eget id, aliquam eget nibh et. Maecen aliquam, risus at semper.
                            </p>
                        </div>

                        <div class="testimonial-item">
                            <img src="/resources/img/testimonial-2.jpg" class="testimonial-img" alt="">
                            <h3>Sara Wilsson</h3>
                            <h4>Ceo &amp; Founder</h4>
                            <p>
                                Export tempor illum tamen malis malis eram quae irure esse labore quem cillum quid cillum eram malis quorum velit fore eram velit sunt aliqua noster fugiat irure amet legam anim culpa.
                            </p>
                        </div>

                        <div class="testimonial-item">
                            <img src="/resources/img/testimonial-3.jpg" class="testimonial-img" alt="">
                            <h3>Jana Karlova</h3>
                            <h4>Ceo &amp; Founder</h4>
                            <p>
                                Enim nisi quem export duis labore cillum quae magna enim sint quorum nulla quem veniam duis minim tempor labore quem eram duis noster aute amet eram fore quis sint minim.
                            </p>
                        </div>

                        <div class="testimonial-item">
                            <img src="/resources/img/testimonial-4.jpg" class="testimonial-img" alt="">
                            <h3>Francesco Piazzini</h3>
                            <h4>Ceo &amp; Founder</h4>
                            <p>
                                Fugiat enim eram quae cillum dolore dolor amet nulla culpa multos export minim fugiat minim velit minim dolor enim duis veniam ipsum anim magna sunt elit fore quem dolore labore illum veniam.
                            </p>
                        </div>

                    </div>

                </div>
            </div>


        </div>
    </section><!-- #testimonials -->

    <!--==========================
          Pricing Section
        ============================-->
    <section id="pricing">

        <div class="container">

            <header class="section-header">
                <h3>Pricing</h3>
                <p>Choose the plan that suits you best:</p>
            </header>

            <div class="row flex-items-xs-middle flex-items-xs-center">

                <!-- Basic Plan  -->
                <div class="col-xs-12 col-lg-4">
                    <div class="card">
                        <div class="card-header">
                            <h3><span class="currency">$</span>0<span class="period">/month</span></h3>
                        </div>
                        <div class="card-block">
                            <h4 class="card-title">
                                Basic Plan
                            </h4>
                            <ul class="list-group">
                                <li class="list-group-item">Up to 3 Projects</li>
                                <li class="list-group-item">Up to 10 volunteers</li>
                                <li class="list-group-item">Basic statistics</li>
                                <li class="list-group-item">24/7 Support System</li>
                            </ul>
                            <a href="/register" class="btn">Choose Plan</a>
                        </div>
                    </div>
                </div>

                <!-- Regular Plan  -->
                <div class="col-xs-12 col-lg-4">
                    <div class="card">
                        <div class="card-header">
                            <h3><span class="currency">$</span>19<span class="period">/month</span></h3>
                        </div>
                        <div class="card-block">
                            <h4 class="card-title">
                                Regular Plan
                            </h4>
                            <ul class="list-group">
                                <li class="list-group-item">Up to 10 Projects</li>
                                <li class="list-group-item">Up to 100 volunteers</li>
                                <li class="list-group-item">Basic statistics</li>
                                <li class="list-group-item">24/7 Support System</li>
                            </ul>
                            <a href="/register" class="btn">Choose Plan</a>
                        </div>
                    </div>
                </div>

                <!-- Premium Plan  -->
                <div class="col-xs-12 col-lg-4">
                    <div class="card">
                        <div class="card-header">
                            <h3><span class="currency">$</span>29<span class="period">/month</span></h3>
                        </div>
                        <div class="card-block">
                            <h4 class="card-title">
                                Premium Plan
                            </h4>
                            <ul class="list-group">
                                <li class="list-group-item">Unlimited no. of Projects</li>
                                <li class="list-group-item">Unlimited no. of volunteers</li>
                                <li class="list-group-item">In depth reports</li>
                                <li class="list-group-item">24/7 Support System</li>
                            </ul>
                            <a href="/register" class="btn">Choose Plan</a>
                        </div>
                    </div>
                </div>

            </div>
        </div>

    </section><!-- #pricing -->

    <!--==========================
      FAQ Section
    ============================-->
    <section id="faq" class="section-bg">
        <div class="container">
            <header class="section-header">
                <h3>Frequently Asked Questions</h3>
                <p>Sed ut perspiciatis unde omnis iste natuse</p>
            </header>

            <ul id="faq-list">
                <li>
                    <a data-toggle="collapse" class="collapsed" href="#faq1">Non consectetur a erat nam at lectus urna duis? <i class="ion-android-remove"></i></a>
                    <div id="faq1" class="collapse" data-parent="#faq-list">
                        <p>
                            Feugiat pretium nibh ipsum consequat. Tempus iaculis urna id volutpat lacus laoreet non curabitur gravida. Venenatis lectus magna fringilla urna porttitor rhoncus dolor purus non.
                        </p>
                    </div>
                </li>

                <li>
                    <a data-toggle="collapse" href="#faq2" class="collapsed">Feugiat scelerisque varius morbi enim nunc faucibus a pellentesque? <i class="ion-android-remove"></i></a>
                    <div id="faq2" class="collapse" data-parent="#faq-list">
                        <p>
                            Dolor sit amet consectetur adipiscing elit pellentesque habitant morbi. Id interdum velit laoreet id donec ultrices. Fringilla phasellus faucibus scelerisque eleifend donec pretium. Est pellentesque elit ullamcorper dignissim. Mauris ultrices eros in cursus turpis massa tincidunt dui.
                        </p>
                    </div>
                </li>

                <li>
                    <a data-toggle="collapse" href="#faq3" class="collapsed">Dolor sit amet consectetur adipiscing elit pellentesque habitant morbi? <i class="ion-android-remove"></i></a>
                    <div id="faq3" class="collapse" data-parent="#faq-list">
                        <p>
                            Eleifend mi in nulla posuere sollicitudin aliquam ultrices sagittis orci. Faucibus pulvinar elementum integer enim. Sem nulla pharetra diam sit amet nisl suscipit. Rutrum tellus pellentesque eu tincidunt. Lectus urna duis convallis convallis tellus. Urna molestie at elementum eu facilisis sed odio morbi quis
                        </p>
                    </div>
                </li>

                <li>
                    <a data-toggle="collapse" href="#faq4" class="collapsed">Ac odio tempor orci dapibus. Aliquam eleifend mi in nulla? <i class="ion-android-remove"></i></a>
                    <div id="faq4" class="collapse" data-parent="#faq-list">
                        <p>
                            Dolor sit amet consectetur adipiscing elit pellentesque habitant morbi. Id interdum velit laoreet id donec ultrices. Fringilla phasellus faucibus scelerisque eleifend donec pretium. Est pellentesque elit ullamcorper dignissim. Mauris ultrices eros in cursus turpis massa tincidunt dui.
                        </p>
                    </div>
                </li>

                <li>
                    <a data-toggle="collapse" href="#faq5" class="collapsed">Tempus quam pellentesque nec nam aliquam sem et tortor consequat? <i class="ion-android-remove"></i></a>
                    <div id="faq5" class="collapse" data-parent="#faq-list">
                        <p>
                            Molestie a iaculis at erat pellentesque adipiscing commodo. Dignissim suspendisse in est ante in. Nunc vel risus commodo viverra maecenas accumsan. Sit amet nisl suscipit adipiscing bibendum est. Purus gravida quis blandit turpis cursus in
                        </p>
                    </div>
                </li>

                <li>
                    <a data-toggle="collapse" href="#faq6" class="collapsed">Tortor vitae purus faucibus ornare. Varius vel pharetra vel turpis nunc eget lorem dolor? <i class="ion-android-remove"></i></a>
                    <div id="faq6" class="collapse" data-parent="#faq-list">
                        <p>
                            Laoreet sit amet cursus sit amet dictum sit amet justo. Mauris vitae ultricies leo integer malesuada nunc vel. Tincidunt eget nullam non nisi est sit amet. Turpis nunc eget lorem dolor sed. Ut venenatis tellus in metus vulputate eu scelerisque. Pellentesque diam volutpat commodo sed egestas egestas fringilla phasellus faucibus. Nibh tellus molestie nunc non blandit massa enim nec.
                        </p>
                    </div>
                </li>

            </ul>

        </div>
    </section><!-- #faq -->

    <!--==========================
         Get Started Section
        ============================-->
    <section id="get-started" class="section-bg">
        <div class="container">
            <div class="row justify-content-center">
                <a href="/register" class="btn-get-started">Get Started!</a>
            </div>
        </div>
    </section>

    <!-- ------------
    # Services Section
    ---------------
    <section id="services" class="section-bg">
        <div class="container">

            <header class="section-header">
                <h3>How it works?</h3>
                <p>There are just 3 simple steps:</p>
            </header>

            <div class="row">
                <div class="col-md-6 col-lg-4 wow bounceInUp" data-wow-duration="1.4s">
                    <div class="box">
                        <div class="icon" style="background: #fceef3;"><i class="ion-ios-analytics-outline" style="color: #ff689b;"></i></div>
                        <h4 class="title"><a href="">Create a project</a></h4>
                        <p class="description text-center">Type the name of the project <br>in which volunteers helped you <br>and we'll generate a special Competence Test form for you.</p>
                    </div>
                </div>

                <div class="col-md-6 col-lg-4 wow bounceInUp" data-wow-duration="1.4s">
                    <div class="box">
                        <div class="icon" style="background: #fff0da;"><i class="ion-ios-bookmarks-outline" style="color: #e98e06;"></i></div>
                        <h4 class="title"><a href="">Invite volunteers</a></h4>
                        <p class="description text-center">Type volunteer's name and email address and we'll sent him/her <br>an invitation to take <br>the Competence Test.</p>
                    </div>
                </div>

                <div class="col-md-6 col-lg-4 wow bounceInUp" data-wow-delay="0.1s" data-wow-duration="1.4s">
                    <div class="box">
                        <div class="icon" style="background: #e6fdfc;"><i class="ion-ios-paper-outline" style="color: #3fcdc7;"></i></div>
                        <h4 class="title"><a href="">View the results</a></h4>
                        <p class="description text-center">Watch the live statistics <br>based on volunteers' responses <br>and find out what they learnt thanks to your project!</p>
                    </div>
                </div>
            </div>
        </div>
    </section>



    ==========================
      Call To Action Section
    ============================
    <section id="call-to-action" class="wow fadeInUp">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-lg-9 text-center text-lg-left">
                    <h3 class="cta-title">Try it now!</h3>
                    <p class="cta-text"> The Competence Test App is free of charge and easy to use. Try it out now and give your volunteers a chance to get to know their competencies!</p>
                </div>
                <div class="col-lg-3 cta-btn-container text-center">
                    <a class="cta-btn align-middle" href="#">Get started</a>
                </div>
            </div>

        </div>
    </section>-->


<%@ include file="footer.jspf" %>


</body>
</html>
