<?php
include 'db_config.php'; // connect to database

$sql = "SELECT * FROM Branch";
$result = $conn->query($sql);

if ($result->num_rows > 0) {
    echo "<h2>Branches</h2>";
    echo "<table border='1' cellpadding='5'>";
    echo "<tr>
            <th>ID</th>
            <th>Name</th>
            <th>Phone</th>
            <th>Hours</th>
            <th>Address</th>
            <th>City</th>
            <th>Zip</th>
            <th>State</th>
          </tr>";

    while($row = $result->fetch_assoc()) {
        echo "<tr>
                <td>".$row['Branch_ID']."</td>
                <td>".$row['Branch_Name']."</td>
                <td>".$row['Branch_Phone_Number']."</td>
                <td>".$row['Branch_Hours']."</td>
                <td>".$row['Branch_Address']."</td>
                <td>".$row['Branch_City']."</td>
                <td>".$row['Branch_Zip_Code']."</td>
                <td>".$row['Branch_State_Abbreviation']."</td>
              </tr>";
    }
    echo "</table>";
} else {
    echo "No branches found.";
}

$conn->close();
?>
