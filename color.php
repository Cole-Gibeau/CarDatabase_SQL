<?php 
include 'db_config.php';

$sql = "SELECT * FROM Color";
$result = $conn->query($sql);

if($result->num_rows > 0) {
    echo "<h2>Colors</h2>";
    echo "<table border='1' cellpadding='5'>";
    echo "<tr>
            <th>ID</th>
            <th>Description</th>
          </tr>";

    while($row = $result->fetch_assoc()) {
        echo "<tr>
                <td>".$row['Color_ID']."</td>
                <td>".$row['Color_Description']."</td>
              </tr>";
    }
    echo "</table>";
} else {
    echo "No colors found.";
}
$conn->close();
?> 