<?php
include('db_connect.php');

$deleted_tenants_query = "SELECT * FROM deleted_tenants"; // Modify this query as per your database structure
$deleted_tenants_result = $conn->query($deleted_tenants_query);

if ($deleted_tenants_result) {
    if ($deleted_tenants_result->num_rows > 0) {
        echo '<table class="table table-condensed table-bordered table-hover">';
        echo '<thead>';
        echo '<tr>';
        echo '<th class="text-center">#</th>';
        echo '<th class="">First Name</th>';
        echo '<th class="">Middle Name</th>';
        echo '<th class="">Last Name</th>';
        echo '<th class="">Email</th>';
        echo '<th class="">Contact</th>';
        echo '<th class="">House ID</th>';
        echo '<th class="">Status</th>';
        echo '<th class="">Date In</th>';
        echo '</tr>';
        echo '</thead>';
        echo '<tbody>';

        $i = 1;
        while ($row = $deleted_tenants_result->fetch_assoc()) {
            echo '<tr>';
            echo '<td class="text-center">' . $i++ . '</td>';
            echo '<td>' . $row['firstname'] . '</td>';
            echo '<td>' . $row['middlename'] . '</td>';
            echo '<td>' . $row['lastname'] . '</td>';
            echo '<td>' . $row['email'] . '</td>';
            echo '<td>' . $row['contact'] . '</td>';
            echo '<td>' . $row['house_id'] . '</td>';
            echo '<td>' . ($row['status'] == 1 ? 'Active' : 'Inactive') . '</td>';
            echo '<td>' . $row['date_in'] . '</td>';
            echo '</tr>';
        }

        echo '</tbody>';
        echo '</table>';
    } else {
        echo '<p>No deleted tenants found.</p>';
    }
} else {
    echo 'Error: ' . $conn->error;
}

$conn->close();
?>
