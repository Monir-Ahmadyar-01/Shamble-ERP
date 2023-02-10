<?php
    include("database.php");
    include("jdf.php");
    session_start();
    if(isset($_POST["login_username"]))
    {
        $login_username = $_POST["login_username"];
        $password = base64_encode($_POST["password"]);
        
        $sql_query_001 = mysqli_query($connection,"select * from user_accounts where username='$login_username' and password = '$password'");
        
        if (mysqli_num_rows($sql_query_001) > 0)
        {   
            $fetch_001 = mysqli_fetch_assoc($sql_query_001);
            $_SESSION["username"] = $fetch_001["username"];
            $_SESSION["password"] = base64_decode($fetch_001["password"]);
            if($fetch_001["authority"] != "SuperAdmin")
            {
                $_SESSION["agency_id"] = $fetch_001["authority"];
            }
            $_SESSION["user_id"] = $fetch_001["id"];
            $_SESSION["employee_id"] = $fetch_001["employee_id"];

            echo "success";
        }
        else
        {
            echo "failed";
        }

        exit();
        
    }

    $agency_id_user = $_SESSION["agency_id"];
    $user_id = $_SESSION["user_id"];

    
    
    if(isset($_POST["units_list"]))
    {
        $sql_query_001 = mysqli_query($connection,"SELECT * FROM minor_units");
        
        $array_tb = array();
        $counter = 0;
        while ($rows = mysqli_fetch_array($sql_query_001)) {
            
            array_push($array_tb,$rows);

            $counter++;
        }

        print_r(json_encode($array_tb));

        exit();
        
    }


    if(isset($_POST["sale_item_id"]))
    {
        $sale_item_id = $_POST["sale_item_id"];
        $agency_id = $_SESSION["agency_id"];

        $sql_query_001 = mysqli_query($connection,"SELECT rates_tb.item_stock_minor_id,rates_tb.purchase_rate,rates_tb.sale_rate,stock_minor.item_name FROM `rates_tb` LEFT JOIN stock_minor ON rates_tb.item_stock_minor_id = stock_minor.id WHERE rates_tb.item_stock_minor_id='$sale_item_id' and rates_tb.agency_id='$agency_id'");
        
        
        $counter = 0;
       

        print_r(json_encode(mysqli_fetch_array($sql_query_001)));

        exit();
        
    }

    if(isset($_POST["minor_unit_id"]))
    {
        $minor_unit_id = $_POST["minor_unit_id"];
        $sql_query_001 = mysqli_query($connection,"SELECT pack_quantity,kg_factor FROM minor_units where id='$minor_unit_id'");
        
        $array_tb = array();
            array_push($array_tb,mysqli_fetch_array($sql_query_001));

        print_r(json_encode($array_tb));

        exit();
        
    }

    if(isset($_POST["stuff_full_name"]))
    {
        $stuff_full_name = $_POST["stuff_full_name"];
        $phone_number = $_POST["phone_number"];
        $address = $_POST["address"];

        // upload the image 
        $picUpload = $_FILES['image']['name'];
        $picSource = $_FILES['image']['tmp_name'];
        $picTarget = 'stuff_documents/images/'.$_FILES['image']['name'];
        move_uploaded_file($picSource, $picTarget);


        $input_date = $_POST["input_date"];
        $date_sh_exp = explode("/",$input_date);
        $date =  jalali_to_gregorian($date_sh_exp[2],$date_sh_exp[1],$date_sh_exp[0],'/');

        

        $sql_query_001 = mysqli_query($connection,"INSERT INTO `stuff` (`id`, `full_name`, `phone_number`, `agency_id`, `address`, `image`, `user_id`, `date`) VALUES (NULL, '$stuff_full_name', '$phone_number', '', '$address', '$picUpload', '$user_id', '$date')");
        
        if ($sql_query_001)
        {
            echo "success";
        }
        else
        {
            echo "failed";
        }

        exit();
        
    }

    if(isset($_POST["user_name_employee"]))
    {
        $user_name_employee = $_POST["user_name_employee"];
        $employee_id = $_POST["employee_id"];
        $password_employee = base64_encode($_POST["password_employee"]);
        $authority = $_POST["authority"];

        $sql_query_001 = mysqli_query($connection,"INSERT INTO `user_accounts` (`id`, `employee_id`, `username`, `password`, `authority`, `user_id`) VALUES (NULL, '$employee_id', '$user_name_employee', '$password_employee', '$authority', '$user_id')");
        
        if ($sql_query_001)
        {
            echo "success";
        }
        else
        {
            echo "failed";
        }

        exit();
        
    }

    

    if(isset($_POST["agency_name"]))
    {
        $agency_name = $_POST["agency_name"];
        $agency_type = $_POST["agency_type"];   
        $agency_admin_id = $_POST["agency_admin_id"];   
        $date = date("Y-m-d");

        $sql_query_001 = mysqli_query($connection,"INSERT INTO `agencies` (`id`, `agency_name`, `agency_admin_id`,`agency_type`, `user_id`, `date`) VALUES (NULL, '$agency_name','$agency_admin_id', '$agency_type', '$user_id', '$date')");
        
        if ($sql_query_001)
        {
            echo "success";
        }
        else
        {
            echo "failed";
        }

        exit();
        
    }

    if(isset($_POST["agency_item_name"]))
    {
        $agency_item_name = $_POST["agency_item_name"];
        $agency_admin_id = $_POST["agency_admin_id"];
        $quantity = $_POST["quantity"];
        $feyat = $_POST["feyat"];
        $details = $_POST["details"];

        $input_date = $_POST["input_date"];
        $date_sh_exp = explode("/",$input_date);
        $date =  jalali_to_gregorian($date_sh_exp[2],$date_sh_exp[1],$date_sh_exp[0],'/');

        $sql_query_001 = mysqli_query($connection,"INSERT INTO `supplies` (`id`, `agency_id`, `item_name`, `quantity`, `feyat`, `details`, `user_id`, `date`) VALUES (NULL, '$agency_admin_id', '$agency_item_name', '$quantity', '$feyat', '$details', '$user_id', '$date')");
        
        if ($sql_query_001)
        {
            echo "success";
        }
        else
        {
            echo "failed";
        }

        exit();
        
    }

    if(isset($_POST["good_name"]))
    {
        $good_name = $_POST["good_name"];
        
        $sql_query_001 = mysqli_query($connection,"INSERT INTO `stock_minor` (`id`, `item_name`) VALUES (NULL, '$good_name')");
        
        if ($sql_query_001)
        {
            echo "success";
        }
        else
        {
            echo "failed";
        }

        exit();
        
    }

    if(isset($_POST["good_agency_admin_id"]))
    {
        $good_agency_admin_id = $_POST["good_agency_admin_id"];
        $good_id = $_POST["good_id"];
        $amount = $_POST["amount"];
        $unit_id = $_POST["unit_id"];
        
        $sql_query_001 = mysqli_query($connection,"INSERT INTO `stock_major` (`id`, `item_id`, `agency_id`, `amount`, `unit_id`) VALUES (NULL, '$good_id', '$good_agency_admin_id', '$amount', '$unit_id')");
        
        if ($sql_query_001)
        {
            echo "success";
        }
        else
        {
            echo "failed";
        }

        exit();
        
    }

    if(isset($_POST["customer_full_name"]))
    {
        $customer_full_name = $_POST["customer_full_name"];
        $phone_number = $_POST["phone_number"];
        $address = $_POST["address"];
        $customer_agency_id = $_POST["customer_agency_id"];
        $date = date("Y-m-d");
        
        $sql_query_001 = mysqli_query($connection,"INSERT INTO `customers_major` (`id`, `full_name`, `phone_number`, `address`, `agency_id`, `user_id`, `date`) VALUES (NULL, '$customer_full_name', '$phone_number', '$address', '$customer_agency_id', '$user_id', '$date')");
        
        if ($sql_query_001)
        {
            echo "success";
        }
        else
        {
            echo "failed";
        }

        exit();
        
    }

    if(isset($_POST["unit_name"]))
    {
        $unit_name = $_POST["unit_name"];
        $unit_pack_qantity = $_POST["unit_pack_qantity"];
        $kg_factor = $_POST["kg_factor"];
        
        $sql_query_001 = mysqli_query($connection,"INSERT INTO `minor_units` (`id`, `unit_name`, `pack_quantity`, `kg_factor`) VALUES (NULL, '$unit_name', '$unit_pack_qantity', '$kg_factor')");
        
        if ($sql_query_001)
        {
            echo "success";
        }
        else
        {
            echo "failed";
        }

        exit();
        
    }
    if(isset($_POST["expenses_category"]))
    {
        $expenses_category = $_POST["expenses_category"];
        $category_agency_id = $_POST["category_agency_id"];
        
        
        $sql_query_001 = mysqli_query($connection,"INSERT INTO `expenses_categories` (`id`, `name`, `agency_id`) VALUES (NULL, '$expenses_category', '$category_agency_id')");
        
        if ($sql_query_001)
        {
            echo "success";
        }
        else
        {
            echo "failed";
        }

        exit();
        
    }

    if(isset($_POST["expense_category_id"]))
    {
        $expense_category_id = $_POST["expense_category_id"];
        $details = $_POST["details"];
        $amount = $_POST["amount"];
        $expense_agency_id = $_POST["expense_agency_id"];

        $input_date = $_POST["input_date"];
        $date_sh_exp = explode("/",$input_date);
        $date =  jalali_to_gregorian($date_sh_exp[2],$date_sh_exp[1],$date_sh_exp[0],'/');
        
        
        $sql_query_001 = mysqli_query($connection,"INSERT INTO `expenses_major` (`id`, `details`, `ex_cat_id`, `amount`, `agency_id`, `user_id`, `date`) VALUES (NULL, '$details', '$expense_category_id', '$amount', '$expense_agency_id', '$user_id', '$date')");
        
        if ($sql_query_001)
        {
            echo "success";
        }
        else
        {
            echo "failed";
        }

        exit();
        
    }

    if(isset($_POST["rate_agency_admin_id"]))
    {
        $rate_agency_admin_id = $_POST["rate_agency_admin_id"];
        $good_id = $_POST["good_id"];
        $purchase_rate = $_POST["purchase_rate"];
        $sale_rate = $_POST["sale_rate"];
        $date = date("Y-m-d");
        
        $sql_query_001 = mysqli_query($connection,"INSERT INTO `rates_tb` (`id`, `agency_id`, `item_stock_minor_id`, `purchase_rate`, `sale_rate`,`date`) VALUES (NULL, '$rate_agency_admin_id', '$good_id', '$purchase_rate', '$sale_rate','$date')");
        
        if ($sql_query_001)
        {
            echo "success";
        }
        else
        {
            echo "failed";
        }

        exit();
        
    }


    if(isset($_POST["major_customer_id"]))
    {
        
        $minor_customer = $_POST["minor_customer"];
        $total_price = $_POST["total_price"];
        $total_reciept = $_POST["total_reciept"];
        $input_date = $_POST["input_date"];
        $second_reciept ="";
        if($input_date != "")
        {
            $date_sh_exp = explode("/",$input_date);
            $second_reciept =  jalali_to_gregorian($date_sh_exp[2],$date_sh_exp[1],$date_sh_exp[0],'/');
        }
        
        $sale_date = date("Y-m-d");
        $sql_query_001;
        if($minor_customer != "")
        {
            $sql_query_001 = mysqli_query($connection,"INSERT INTO `agency_sale_major` (`id`, `customer_id`, `customer_name`, `agency_id`, `user_id`, `reciept`, `date`,`remain_date`) VALUES (NULL, NULL, '$minor_customer', '$agency_id_user', '$user_id', '$total_reciept', '$sale_date','$second_reciept')");
        }
        else
        {   
            $major_customer_id_arr = explode(":" , $_POST["major_customer_id"]);
            $major_customer_id = $major_customer_id_arr[1];

            $sql_query_001 = mysqli_query($connection,"INSERT INTO `agency_sale_major` (`id`, `customer_id`, `customer_name`, `agency_id`, `user_id`, `reciept`, `date`,`remain_date`) VALUES (NULL, '$major_customer_id', NULL, '$agency_id_user', '$user_id', '$total_reciept', '$sale_date','$second_reciept')");
        }

        if($sql_query_001)
        {

            $sql_query_003 = mysqli_query($connection,"SELECT agency_sale_major.id FROM `agency_sale_major`  ORDER BY id DESC LIMIT 1");
            $fetch_003 = mysqli_fetch_assoc($sql_query_003);

            // map
            $sale_supply_id_arr = $_POST["sale_supply_id"];
            $minor_units_arr = $_POST["minor_units"];
            $purchase_rate_arr = $_POST["purchase_rate"];
            $sale_rate_arr = $_POST["sale_rate"];
            $discount_arr = $_POST["discount"];
            $details_arr = $_POST["details"];
            $quantity_arr = $_POST["quantity"];
            $sale_major_id = $fetch_003["id"];
    
            for ($i=0; $i < count($sale_supply_id_arr); $i++)
            {
                
                $sale_supply_id = $sale_supply_id_arr[$i];
                $minor_units = $minor_units_arr[$i];
                $purchase_rate = $purchase_rate_arr[$i];
                $sale_rate = $sale_rate_arr[$i];
                $discount = $discount_arr[$i];
                $details = $details_arr[$i];
                $quantity = $quantity_arr[$i];


                $sql_query_002 = mysqli_query($connection,"INSERT INTO `agency_sale_minor` (`id`, `sale_major_id`, `item_id_stock_major`, `amount`, `unit_id`, `discount`, `purchase_rate`, `sale_rate`, `details`) VALUES (NULL, '$sale_major_id', '$sale_supply_id', '$quantity', '$minor_units', '$discount', '$purchase_rate', '$sale_rate', '$details')");

                if ($sql_query_002)
                {
                    $sql_query_004 = mysqli_query($connection,"SELECT * FROM stock_major where item_id='$sale_supply_id' and agency_id='$agency_id_user' and unit_id='$minor_units'");

                    $fetch_004 = mysqli_fetch_assoc($sql_query_004);
                    $major_stock_amount = $fetch_004["amount"];
                    
                    $remain_amount = $major_stock_amount - $quantity;

                    $sql_query_005 = mysqli_query($connection,"UPDATE stock_major SET amount='$remain_amount' where item_id='$sale_supply_id' and agency_id='$agency_id_user' and unit_id='$minor_units'");

                    if ($sql_query_005)
                    {
                        echo "success";
                    }
                    else
                    {
                        echo "failed";
                    }



                }
            
            }


        }
        

        exit();
        
    }

    

    if(isset($_POST["tr_fr_fac_supply_id"]))
    {
        
        $to_agency_admin_id = $_POST["to_agency_admin_id"];
        
        
        
        $transfer_date = date("Y-m-d");
        
        
        $sql_query_001 = mysqli_query($connection,"INSERT INTO `transfer_fr_factory_to_agencies_major` (`id`, `from_agency_id`, `to_agency_id`, `sender_status`, `receiver_status`, `user_id`, `date`, `details`) VALUES (NULL, '$agency_id_user', '$to_agency_admin_id', '', '', '$user_id', '$transfer_date', '')");
        
        if($sql_query_001)
        {

            $sql_query_003 = mysqli_query($connection,"SELECT transfer_fr_factory_to_agencies_major.id FROM `transfer_fr_factory_to_agencies_major`  ORDER BY id DESC LIMIT 1");
            $fetch_003 = mysqli_fetch_assoc($sql_query_003);

            // map
            $tr_fr_fac_supply_id_arr = $_POST["tr_fr_fac_supply_id"];
            $to_agency_admin_id = $_POST["to_agency_admin_id"];
            $minor_units_arr = $_POST["minor_units"];
            $details_arr = $_POST["details"];
            $quantity_arr = $_POST["quantity"];
            $transfer_major_id = $fetch_003["id"];
    
            for ($i=0; $i < count($tr_fr_fac_supply_id_arr); $i++)
            {
                
                $tr_fr_fac_supply_id = $tr_fr_fac_supply_id_arr[$i];
                $minor_units = $minor_units_arr[$i];
                $details = $details_arr[$i];
                $quantity = $quantity_arr[$i];


                $sql_query_002 = mysqli_query($connection,"INSERT INTO `transfer_fr_factory_to_agencies_minor` (`id`, `transfer_major_id`, `item_id_stock_minor`, `amount`, `unit_id`, `details`) VALUES (NULL, '$transfer_major_id', '$tr_fr_fac_supply_id', '$quantity', '$minor_units', '$details')");

                if ($sql_query_002)
                {
                    $sql_query_004 = mysqli_query($connection,"SELECT * FROM stock_major where item_id='$tr_fr_fac_supply_id' and agency_id='$to_agency_admin_id' and unit_id='$minor_units'");

                    $fetch_004 = mysqli_fetch_assoc($sql_query_004);
                    $major_stock_amount = $fetch_004["amount"];
                    
                    $remain_amount = $major_stock_amount + $quantity;

                    $sql_query_005 = mysqli_query($connection,"UPDATE stock_major SET amount='$remain_amount' where item_id='$tr_fr_fac_supply_id' and agency_id='$to_agency_admin_id' and unit_id='$minor_units'");

                    if ($sql_query_005)
                    {
                        echo "success";
                    }
                    else
                    {
                        echo "failed";
                    }



                }
            
            }


        }
        

        exit();
        
    }


    if(isset($_POST["tr_fr_ag_to_ag_supply_id"]))
    {
        
        $from_agency_admin_id = $_POST["from_agency_admin_id"];
        $to_agency_admin_id = $_POST["to_agency_admin_id"];
        
        
        
        $transfer_date = date("Y-m-d");
        
        
        $sql_query_001 = mysqli_query($connection,"INSERT INTO `transfer_fr_agency_to_agencies_major` (`id`, `from_agency_id`, `to_agency_id`, `sender_status`, `receiver_status`, `user_id`, `date`, `details`) VALUES (NULL, '$from_agency_admin_id', '$to_agency_admin_id', '', '', '$user_id', '$transfer_date', '')");
        
        if($sql_query_001)
        {

            $sql_query_003 = mysqli_query($connection,"SELECT transfer_fr_agency_to_agencies_major.id FROM `transfer_fr_agency_to_agencies_major`  ORDER BY id DESC LIMIT 1");
            $fetch_003 = mysqli_fetch_assoc($sql_query_003);

            // map
            $tr_fr_ag_to_ag_supply_id_arr = $_POST["tr_fr_ag_to_ag_supply_id"];
            $minor_units_arr = $_POST["minor_units"];
            $details_arr = $_POST["details"];
            $quantity_arr = $_POST["quantity"];
            $transfer_major_id = $fetch_003["id"];
    
            for ($i=0; $i < count($tr_fr_ag_to_ag_supply_id_arr); $i++)
            {
                
                $tr_fr_ag_to_ag_supply_id = $tr_fr_ag_to_ag_supply_id_arr[$i];
                $minor_units = $minor_units_arr[$i];
                $details = $details_arr[$i];
                $quantity = $quantity_arr[$i];


                $sql_query_002 = mysqli_query($connection,"INSERT INTO `transfer_fr_agency_to_agencies_minor` (`id`, `transfer_major_id`, `item_id_stock_major`, `amount`, `unit_id`, `details`) VALUES (NULL, '$transfer_major_id', '$tr_fr_ag_to_ag_supply_id', '$quantity', '$minor_units', '$details')");

                if ($sql_query_002)
                {
                    $sql_query_004 = mysqli_query($connection,"SELECT * FROM stock_major where item_id='$tr_fr_ag_to_ag_supply_id' and agency_id='$from_agency_admin_id' and unit_id='$minor_units'");

                    $fetch_004 = mysqli_fetch_assoc($sql_query_004);
                    $major_stock_amount = $fetch_004["amount"];
                    
                    $remain_amount = $major_stock_amount - $quantity;

                    $sql_query_005 = mysqli_query($connection,"UPDATE stock_major SET amount='$remain_amount' where item_id='$tr_fr_ag_to_ag_supply_id' and agency_id='$from_agency_admin_id' and unit_id='$minor_units'");

                    if ($sql_query_005)
                    {
                        echo "success";
                    }
                    else
                    {
                        echo "failed";
                    }



                }
            
            }


        }
        

        exit();
        
    }



    
    
?>