<?php
    

    // delete employee_id
    if(isset($_GET["employee_id"]))
    {
        $employee_id = $_GET["employee_id"];
        delete_func($employee_id,"stuff");
    }
    // delete user_id
    if(isset($_GET["user_id"]))
    {
        $user_id = $_GET["user_id"];
        delete_func($user_id,"user_accounts");
    }
  
    // delete agency_id
    if(isset($_GET["agency_id"]))
    {
        $agency_id = $_GET["agency_id"];
        delete_func($agency_id,"agencies");
    }

    // delete supply_id
    if(isset($_GET["supply_id"]))
    {
        $supply_id = $_GET["supply_id"];
        delete_func($supply_id,"supplies");
    }
    // delete good_id
    if(isset($_GET["good_id"]))
    {
        $good_id = $_GET["good_id"];
        delete_func($good_id,"stock_minor");
    }
 


    function delete_func($id,$table)
    {
        include_once("database.php");
        $sql_query_01 = mysqli_query($connection,"delete from $table where id='$id'");
        if($sql_query_01)
        {
            echo $id;
        }
        else {
            echo $id;
        }

    }
?>