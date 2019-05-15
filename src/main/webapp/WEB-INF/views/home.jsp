<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<html>
<head>
    <title>Home</title>
    <script src="<c:url value="/webjars/jquery/3.0.0/jquery.min.js"/>"></script>
    <script src="<c:url value="/webjars/bootstrap/4.3.1/js/bootstrap.min.js"/>"></script>
    <link href="<c:url value="/webjars/bootstrap/4.3.1/css/bootstrap.min.css"/>" rel="stylesheet">
    <link href="<c:url value="/resources/css/main.css"/>" rel="stylesheet">

    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,500,600,700,700i|Montserrat:300,400,500,600,700" rel="stylesheet">

    <!-- Libraries CSS Files -->
    <link href="/resources/css/lib/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <link href="/resources/css/lib/ionicons/css/ionicons.min.css" rel="stylesheet">
    <link href="/resources/css/lib/animate/animate.min.css" rel="stylesheet">

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
                    <h2>Find out<br>what volunteers learn <br>in your <span>project!</span></h2>
                    <div>
                        <a href="/register" class="btn-get-started scrollto">Get Started</a>
                    </div>
                </div>

                <div class="col-md-6 intro-img order-md-last order-first">
                    <img src="/resources/css/img/intro-img.svg" alt="" class="img-fluid">
                </div>
            </div>

        </div>
    </section>

    <!-- ------------
    # About Section
    --------------- -->
    <section id="about" >
        <div class="container">

            <header class="section-header">
                <br>
                <h3>About</h3>
                <p>Competence Test is a free online app, allowing you to ask your volunteers what did they learn when supporting your organisation.
                Communication, flexibility, teamwork - these are just few competencies that can be developed through volunteering.
                    Find out, which of them can be developed in your organisation!</p>
            </header>
        </div>
    </section>

    <!-- ------------
    # How it works Section
    --------------- -->
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
                        <p class="description">Type the name of the project and we'll generate a special Competence Test form for you.</p>
                    </div>
                </div>

                <div class="col-md-6 col-lg-4 wow bounceInUp" data-wow-duration="1.4s">
                    <div class="box">
                        <div class="icon" style="background: #fff0da;"><i class="ion-ios-bookmarks-outline" style="color: #e98e06;"></i></div>
                        <h4 class="title"><a href="">Invite volunteers</a></h4>
                        <p class="description">Send them the link to the Competence Test.</p>
                    </div>
                </div>

                <div class="col-md-6 col-lg-4 wow bounceInUp" data-wow-delay="0.1s" data-wow-duration="1.4s">
                    <div class="box">
                        <div class="icon" style="background: #e6fdfc;"><i class="ion-ios-paper-outline" style="color: #3fcdc7;"></i></div>
                        <h4 class="title"><a href="">View the results</a></h4>
                        <p class="description">Take a look on volunteers' responses and find out what they learnt!</p>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!--==========================
      Why Us Section
    ============================-->
    <section id="why-us" class="wow fadeIn">
        <div class="container-fluid">

            <header class="section-header">
                <h3>Why choose us?</h3>
                <p>Laudem latine persequeris id sed, ex fabulas delectus quo. No vel partiendo abhorreant vituperatoribus.</p>
            </header>
        </div>

        <div class="container">
            <div class="row counters">

                <div class="col-lg-3 col-6 text-center">
                    <span data-toggle="counter-up">650</span>
                    <p>Volunteers</p>
                </div>

                <div class="col-lg-3 col-6 text-center">
                    <span data-toggle="counter-up">300</span>
                    <p>Organisations</p>
                </div>

                <div class="col-lg-3 col-6 text-center">
                    <span data-toggle="counter-up">300</span>
                    <p>Projects</p>
                </div>

                <div class="col-lg-3 col-6 text-center">
                    <span data-toggle="counter-up">3</span>
                    <p>Competencies</p>
                </div>

            </div>

        </div>
    </section>

    <!--==========================
      Call To Action Section
    ============================-->
    <section id="call-to-action" class="wow fadeInUp">
        <div class="container">
            <div class="row">
                <div class="col-lg-9 text-center text-lg-left">
                    <h3 class="cta-title">Try it now!</h3>
                    <p class="cta-text"> Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
                </div>
                <div class="col-lg-3 cta-btn-container text-center">
                    <a class="cta-btn align-middle" href="#">Get started</a>
                </div>
            </div>

        </div>
    </section><!-- #call-to-action -->

    <!--==========================
      Features Section
    ============================-->
    <section id="features">
        <div class="container">

            <div class="row feature-item">
                <div class="col-lg-6 wow fadeInUp">
                    <img src="img/features-1.svg" class="img-fluid" alt="">
                </div>
                <div class="col-lg-6 wow fadeInUp pt-5 pt-lg-0">
                    <h4>Voluptatem dignissimos provident quasi corporis voluptates sit assumenda.</h4>
                    <p>
                        Ipsum in aspernatur ut possimus sint. Quia omnis est occaecati possimus ea. Quas molestiae perspiciatis occaecati qui rerum. Deleniti quod porro sed quisquam saepe. Numquam mollitia recusandae non ad at et a.
                    </p>
                    <p>
                        Ad vitae recusandae odit possimus. Quaerat cum ipsum corrupti. Odit qui asperiores ea corporis deserunt veritatis quidem expedita perferendis. Qui rerum eligendi ex doloribus quia sit. Porro rerum eum eum.
                    </p>
                </div>
            </div>

            <div class="row feature-item mt-5 pt-5">
                <div class="col-lg-6 wow fadeInUp order-1 order-lg-2">
                    <img src="img/features-2.svg" class="img-fluid" alt="">
                </div>

                <div class="col-lg-6 wow fadeInUp pt-4 pt-lg-0 order-2 order-lg-1">
                    <h4>Neque saepe temporibus repellat ea ipsum et. Id vel et quia tempora facere reprehenderit.</h4>
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
      Testimonials Section
    ============================-->
    <section id="testimonials">
        <div class="container">

            <header class="section-header">
                <h3>Testimonials</h3>
            </header>

            <div class="row justify-content-center">
                <div class="col-lg-8">

                    <div class="owl-carousel testimonials-carousel wow fadeInUp">

                        <div class="testimonial-item">
                            <img src="img/testimonial-1.jpg" class="testimonial-img" alt="">
                            <h3>Saul Goodman</h3>
                            <h4>Ceo &amp; Founder</h4>
                            <p>
                                Proin iaculis purus consequat sem cure digni ssim donec porttitora entum suscipit rhoncus. Accusantium quam, ultricies eget id, aliquam eget nibh et. Maecen aliquam, risus at semper.
                            </p>
                        </div>

                        <div class="testimonial-item">
                            <img src="img/testimonial-2.jpg" class="testimonial-img" alt="">
                            <h3>Sara Wilsson</h3>
                            <h4>Designer</h4>
                            <p>
                                Export tempor illum tamen malis malis eram quae irure esse labore quem cillum quid cillum eram malis quorum velit fore eram velit sunt aliqua noster fugiat irure amet legam anim culpa.
                            </p>
                        </div>

                        <div class="testimonial-item">
                            <img src="img/testimonial-3.jpg" class="testimonial-img" alt="">
                            <h3>Jena Karlis</h3>
                            <h4>Store Owner</h4>
                            <p>
                                Enim nisi quem export duis labore cillum quae magna enim sint quorum nulla quem veniam duis minim tempor labore quem eram duis noster aute amet eram fore quis sint minim.
                            </p>
                        </div>

                        <div class="testimonial-item">
                            <img src="img/testimonial-4.jpg" class="testimonial-img" alt="">
                            <h3>Matt Brandon</h3>
                            <h4>Freelancer</h4>
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
    <section id="pricing" class="wow fadeInUp section-bg">

        <div class="container">

            <header class="section-header">
                <h3>Pricing</h3>
                <p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque</p>
            </header>

            <div class="row flex-items-xs-middle flex-items-xs-center">

                <!-- Basic Plan  -->
                <div class="col-xs-12 col-lg-4">
                    <div class="card">
                        <div class="card-header">
                            <h3><span class="currency">$</span>19<span class="period">/month</span></h3>
                        </div>
                        <div class="card-block">
                            <h4 class="card-title">
                                Basic Plan
                            </h4>
                            <ul class="list-group">
                                <li class="list-group-item">Odio animi voluptates</li>
                                <li class="list-group-item">Inventore quisquam et</li>
                                <li class="list-group-item">Et perspiciatis suscipit</li>
                                <li class="list-group-item">24/7 Support System</li>
                            </ul>
                            <a href="#" class="btn">Choose Plan</a>
                        </div>
                    </div>
                </div>

                <!-- Regular Plan  -->
                <div class="col-xs-12 col-lg-4">
                    <div class="card">
                        <div class="card-header">
                            <h3><span class="currency">$</span>29<span class="period">/month</span></h3>
                        </div>
                        <div class="card-block">
                            <h4 class="card-title">
                                Regular Plan
                            </h4>
                            <ul class="list-group">
                                <li class="list-group-item">Odio animi voluptates</li>
                                <li class="list-group-item">Inventore quisquam et</li>
                                <li class="list-group-item">Et perspiciatis suscipit</li>
                                <li class="list-group-item">24/7 Support System</li>
                            </ul>
                            <a href="#" class="btn">Choose Plan</a>
                        </div>
                    </div>
                </div>

                <!-- Premium Plan  -->
                <div class="col-xs-12 col-lg-4">
                    <div class="card">
                        <div class="card-header">
                            <h3><span class="currency">$</span>39<span class="period">/month</span></h3>
                        </div>
                        <div class="card-block">
                            <h4 class="card-title">
                                Premium Plan
                            </h4>
                            <ul class="list-group">
                                <li class="list-group-item">Odio animi voluptates</li>
                                <li class="list-group-item">Inventore quisquam et</li>
                                <li class="list-group-item">Et perspiciatis suscipit</li>
                                <li class="list-group-item">24/7 Support System</li>
                            </ul>
                            <a href="#" class="btn">Choose Plan</a>
                        </div>
                    </div>
                </div>

            </div>
        </div>

    </section><!-- #pricing -->

    <!--==========================
      FAQ Section
    ============================-->
    <section id="faq">
        <div class="container">
            <header class="section-header">
                <h3>Frequently Asked Questions</h3>
                <p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque</p>
            </header>

            <ul id="faq-list" class="wow fadeInUp">
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
      Footer Section
    ============================-->
    <footer id="footer" class="section-bg">

        <div class="footer-top">
            <div class="container">

                <div class="row">

                    <div class="col-lg-8">

                        <div class="row">

                            <div class="col-sm-6">
                                <div class="footer-info">
                                    <h3>Rapid</h3>
                                    <p>Cras fermentum odio eu feugiat lide par naso tierra. Justo eget nada terra videa magna derita valies darta donna mare fermentum iaculis eu non diam phasellus. Scelerisque felis imperdiet proin fermentum leo. Amet volutpat consequat mauris nunc congue.</p>
                                </div>

                                <div class="social-links">
                                    <a href="#" class="twitter"><i class="fa fa-twitter"></i></a>
                                    <a href="#" class="facebook"><i class="fa fa-facebook"></i></a>
                                    <a href="#" class="instagram"><i class="fa fa-instagram"></i></a>
                                    <a href="#" class="linkedin"><i class="fa fa-linkedin"></i></a>
                                </div>
                            </div>

                            <div class="col-sm-6">
                                <div class="footer-links">
                                    <h4>Useful Links</h4>
                                    <ul>
                                        <li><a href="#">Home</a></li>
                                        <li><a href="#">About us</a></li>
                                        <li><a href="#">Services</a></li>
                                        <li><a href="#">Terms of service</a></li>
                                        <li><a href="#">Privacy policy</a></li>
                                    </ul>
                                </div>
                            </div>

                        </div>

                    </div>

                    <div class="col-lg-4">
                        <div class="row">

                            <div class="col-sm-8">
                                <div class="footer-newsletter">
                                    <h4>Our Newsletter</h4>
                                    <p>Tamen quem nulla quae legam multos aute sint culpa legam noster magna veniam enim veniam illum dolore legam minim quorum culpa amet magna export quem.</p>
                                    <form action="" method="post">
                                        <input type="email" name="email"><input type="submit"  value="Subscribe">
                                    </form>
                                </div>
                            </div>
                        </div>

                    </div>

                </div>

            </div>
        </div>

        <div class="container">
            <div class="copyright">
                &copy; Copyright <strong>Marzena Kaa</strong>. All Rights Reserved
            </div>
        </div>
    </footer><!-- #footer -->

</body>
</html>
