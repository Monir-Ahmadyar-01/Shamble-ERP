<?php 
include_once("session.php");
include("database.php");  

$emp_id = $_SESSION["employee_id"];

$sql_query_001 = mysqli_query($connection,"select id,full_name,image from stuff where id='$emp_id'");
$fetch_001 = mysqli_fetch_assoc($sql_query_001);

?>
<style>

    @import url('https://fonts.googleapis.com/css2?family=Amiri:wght@400;700&display=swap');
    body,li a{
        font-family: 'Amiri', serif !important;
        font-weight: bold;
    }
</style>

<header id="topnav">

            <!-- Topbar Start -->
            <div class="navbar-custom">
                <div class="container-fluid">
                    <ul class="list-unstyled topnav-menu float-right mb-0">

                        <li class="dropdown notification-list">
                            <!-- Mobile menu toggle-->
                            <a class="navbar-toggle nav-link">
                                <div class="lines">
                                    <span></span>
                                    <span></span>
                                    <span></span>
                                </div>
                            </a>
                            <!-- End mobile menu toggle-->
                        </li>

            
                        <li class="dropdown notification-list">
                            <a class="nav-link dropdown-toggle waves-effect waves-light" data-toggle="dropdown" href="#" role="button" aria-haspopup="false" aria-expanded="false">
                                <i class="dripicons-bell noti-icon"></i>
                                <span class="badge badge-info noti-icon-badge">21</span>
                            </a>
                            <div class="dropdown-menu dropdown-menu-right dropdown-lg">
    
                                <!-- item-->
                                <div class="dropdown-item noti-title">
                                    <h5 class="m-0">
                                        <span class="float-right">
                                            <a href="" class="text-dark">
                                                <small>Clear All</small>
                                            </a>
                                        </span>Notification
                                    </h5>
                                </div>
    
                                <div class="slimscroll noti-scroll">
    
                                    <!-- item-->
                                    <a href="javascript:void(0);" class="dropdown-item notify-item active">
                                        <div class="notify-icon bg-warning"><i class="mdi mdi-comment-account-outline"></i> </div>
                                        <p class="notify-details">Caleb Flakelar commented on Admin<small class="text-muted">1 min ago</small></p>
                                    </a>
    
                                    <!-- item-->
                                    <a href="javascript:void(0);" class="dropdown-item notify-item">
                                        <div class="notify-icon bg-info"><i class="mdi mdi-account-plus"></i></div>
                                        <p class="notify-details">New user registered.<small class="text-muted">5 hours ago</small></p>
                                    </a>
    
                                    <!-- item-->
                                    <a href="javascript:void(0);" class="dropdown-item notify-item">
                                        <div class="notify-icon">
                                            <img src="assets/images/users/avatar.jpg" class="img-fluid rounded-circle" alt="" /> </div>
                                        <p class="notify-details">Cristina Pride</p>
                                        <p class="text-muted mb-0 user-msg">
                                            <small>Hi, How are you? What about our next meeting</small>
                                        </p>
                                    </a>
    
                                    <!-- item-->
                                    <a href="javascript:void(0);" class="dropdown-item notify-item">
                                        <div class="notify-icon bg-danger"><i class="mdi mdi-comment-account-outline"></i></div>
                                        <p class="notify-details">Caleb Flakelar commented on Admin<small class="text-muted">4 days ago</small></p>
                                    </a>
    
                                    <!-- item-->
                                    <a href="javascript:void(0);" class="dropdown-item notify-item">
                                        <div class="notify-icon">
                                            <img src="assets/images/users/avatar.jpg" class="img-fluid rounded-circle" alt="" /> </div>
                                        <p class="notify-details">Karen Robinson</p>
                                        <p class="text-muted mb-0 user-msg">
                                            <small>Wow that's great</small>
                                        </p>
                                    </a>
    
                                    <!-- item-->
                                    <a href="javascript:void(0);" class="dropdown-item notify-item">
                                        <div class="notify-icon bg-primary">
                                            <i class="mdi mdi-heart"></i>
                                        </div>
                                        <p class="notify-details">Carlos Crouch liked
                                            <b>Admin</b>
                                            <small class="text-muted">13 days ago</small>
                                        </p>
                                    </a>
                                </div>
    
                                <!-- All-->
                                <a href="javascript:void(0);" class="dropdown-item text-center text-primary notify-item notify-all">
                                    View all
                                    <i class="fi-arrow-right"></i>
                                </a>
    
                            </div>
                        </li>
    
                        <li class="dropdown notification-list">
                            <a class="nav-link dropdown-toggle nav-user mr-0 waves-effect waves-light" data-toggle="dropdown" href="#" role="button" aria-haspopup="false" aria-expanded="false">
                                <img src="stuff_documents/images/<?php echo $fetch_001["image"]; ?>" alt="user-image" class="rounded-circle">
                                <span class="pro-user-name ml-1">
                                    <?php echo $fetch_001["full_name"]; ?> <i class="mdi mdi-chevron-down"></i> 
                                </span>
                            </a>
                            <div class="dropdown-menu dropdown-menu-right profile-dropdown ">
                                <!-- item-->
                                <div class="dropdown-item noti-title">
                                    <h6 class="m-0">
                                        ?????? ?????????? !
                                    </h6>
                                </div>
    
                                
    
                                <!-- item-->
                                <a href="javascript:void(0);" class="dropdown-item notify-item">
                                    <i class="dripicons-gear"></i>
                                    <span>??????????????</span>
                                </a>
    
                                
    
                                <div class="dropdown-divider"></div>
    
                                <!-- item-->
                                <a href="logout.php" class="dropdown-item notify-item">
                                    <i class="dripicons-power"></i>
                                    <span>??????????????</span>
                                </a>
    
                            </div>
                        </li>
                    </ul>
    
                    <ul class="list-unstyled menu-left mb-0">
                        <li class="float-left logo-box">
                            <a href="index.php" class="logo">
                                <span class="logo-lg">
                                    <img src="assets/images/logo-light.png" alt="" height="22">
                                </span>
                                <span class="logo-sm">
                                    <img src="assets/images/logo-sm.png" alt="" height="24">
                                </span>
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
            <!-- end Topbar -->

            <div class="topbar-menu">
                <div class="container-fluid">
                    <div id="navigation">
                        <!-- Navigation Menu-->
                        <ul class="navigation-menu">

                            <li class="has-submenu">
                                <a href="index.php">
                                    <i class="dripicons-meter"></i>???????? ????????
                                </a>
                            </li>
                            <li class="has-submenu">
                                <a href="#">
                                    <i class="mdi mdi-sale"></i>????????????<div class="arrow-down"></div></a>
                                <ul class="submenu">
                                    <li>
                                        <a href="pages-invoice.php">?????? (????????)</a>
                                    </li>
                                    <li>
                                        <a href="selled_page.php">?????????? (????????????)</a>
                                    </li>
                                    
                                </ul>
                            </li>

                            

                            <li class="has-submenu">
                                <a href="#">
                                    <i class="icon-user-following "></i>????????????????<div class="arrow-down"></div></a>
                                <ul class="submenu">
                                    <li>
                                        <a href="register_employee.php">?????? (????????????)</a>
                                    </li>
                                    <li>
                                        <a href="registered_employees.php">?????????? (????????????)</a>
                                    </li>
                                    <hr>
                                    <li>
                                        <a href="register_user.php">?????? (??????????)</a>
                                    </li>
                                    <li>
                                        <a href="registered_users.php">?????????? (??????????)</a>
                                    </li>
                                </ul>
                            </li>
                            <li class="has-submenu">
                                <a href="#">
                                    <i class="mdi mdi-source-branch"></i>????????????????<div class="arrow-down"></div></a>
                                <ul class="submenu">
                                    <li>
                                        <a href="register_agency.php">?????? (??????????????)</a>
                                    </li>
                                    <li>
                                        <a href="registered_agencies.php">?????????? (????????????????)</a>
                                    </li>
                                    <hr>
                                    <li>
                                        <a href="register_supply.php">?????? ??????????(????????????????)</a>
                                    </li>
                                    <li>
                                        <a href="registered_supplies.php">?????????? ??????????(????????????????)</a>
                                    </li>
                                    <hr>
                                    <li>
                                        <a href="register_agency_good.php">?????? ???????? ????????????(????????????????)</a>
                                    </li>
                                    <li>
                                        <a href="registered_agency_goods.php">?????????? ????????(????????????????)</a>
                                    </li>
                                    <hr>
                                    <li>
                                        <a href="register_good.php">?????? ????????</a>
                                    </li>
                                    <li>
                                        <a href="registered_goods.php">?????????? ???????? ????</a>
                                    </li>

                                </ul>
                            </li>
                            <li class="has-submenu">
                                <a href="#">
                                    <i class="mdi mdi-bank-transfer"></i>????????????????<div class="arrow-down"></div></a>
                                <ul class="submenu">
                                    <li>
                                        <a href="register_transfer.php">?????? ????????????(???? ?????????????? ???? ????????????????)</a>
                                    </li>
                                    <li>
                                        <a href="registered_transfers.php">?????????? ????????????????(???? ?????????????? ???? ????????????????) </a>
                                    </li>
                                    <hr>
                                    <li>
                                        <a href="register_transfer_fr_ag_ag.php">?????? ????????????(???? ???????????????? ???? ????????????????)</a>
                                    </li>
                                    <li>
                                        <a href="registered_transfers_fr_ag_ag.php">?????????? ????????????????(???? ???????????????? ???? ????????????????) </a>
                                    </li>
                                </ul>
                            </li>
                            <li class="has-submenu">
                                <a href="#">
                                    <i class="mdi mdi-home-currency-usd "></i>??????????<div class="arrow-down"></div></a>
                                <ul class="submenu">
                                    <li>
                                        <a href="register_expense.php">?????? (????????)</a>
                                    </li>
                                    <li>
                                        <a href="registered_expenses.php">?????????? (??????????)</a>
                                    </li>
                                    <li>
                                        <a href="register_expense_category.php">?????? ????????????(????????)</a>
                                    </li>
                                    <li>
                                        <a href="registered_expenses_category.php">?????????? ????????????(??????????)</a>
                                    </li>
                                    
                                </ul>
                            </li>
                            <li class="has-submenu">
                                <a href="#">
                                    <i class="mdi mdi-account-badge-horizontal"></i>??????????????<div class="arrow-down"></div></a>
                                <ul class="submenu">
                                    <li>
                                        <a href="register_customer.php">?????? (??????????)</a>
                                    </li>
                                    <li>
                                        <a href="registered_customers.php">?????????? (??????????????)</a>
                                    </li>
                                    <li>
                                        <a href="customers_billance.php">???????????? (?????????????? ??????????)</a>
                                    </li>
                                    
                                </ul>
                            </li>
                            <li class="has-submenu">
                                <a href="#">
                                    <i class="mdi mdi-cash "></i>??????<div class="arrow-down"></div></a>
                                <ul class="submenu">
                                    <li>
                                        <a href="register_rate.php">?????? (??????)</a>
                                    </li>
                                    <li>
                                        <a href="registered_rates.php">?????????? (?????? ????)</a>
                                    </li>
                                    
                                </ul>
                            </li>
                            <li class="has-submenu">
                                <a href="#">
                                    <i class="mdi mdi-format-list-checkbox"></i>????????????<div class="arrow-down"></div></a>
                                <ul class="submenu">
                                    <li>
                                        <a href="register_minor_unit.php">?????? (????????)</a>
                                    </li>
                                    <li>
                                        <a href="registered_minor_units.php">?????????? (????????????)</a>
                                    </li>
                                    
                                </ul>
                            </li>
                            
                           

                        </ul>
                        <!-- End navigation menu -->

                        <div class="clearfix"></div>
                    </div>
                    <!-- end #navigation -->
                </div>
                <!-- end container -->
            </div>
            <!-- end navbar-custom -->

        </header>