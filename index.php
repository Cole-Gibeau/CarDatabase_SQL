<?php include 'db_config.php'; ?>

<!DOCTYPE html>
<html>
<head>
    <title>Rental App Dashboard</title>
</head>
<body>
    <h1>Car Rental Database Viewer</h1>

    <form method="GET" action="">
        <label for="table">Select a table:</label>
        <select name="table" id="table">
            <option value="">-- Choose a table --</option>
            <option value="Branch">Branch</option>
            <option value="Color">Color</option>
            <option value="Rental_Rate">Rental_Rate</option>
            <option value="Payment_Type">Payment_Type</option>
            <option value="Discount">Discount</option>
        </select>
        <button type="submit">View</button>
    </form>

    <hr>

    <?php
    if (isset($_GET['table']) && $_GET['table'] !== '') {
        $table = $_GET['table'];
        echo "<h2>Showing data from: $table</h2>";

        $sql = "SELECT * FROM `$table`";
        $result = $conn->query($sql);

        if ($result && $result->num_rows > 0) {
            echo "<table border='1' cellpadding='5'><tr>";

            // Print column names
            while ($field = $result->fetch_field()) {
                echo "<th>" . htmlspecialchars($field->name) . "</th>";
            }
            echo "</tr>";

            // Print table rows
            while ($row = $result->fetch_assoc()) {
                echo "<tr>";
                foreach ($row as $cell) {
                    echo "<td>" . htmlspecialchars($cell) . "</td>";
                }
                echo "</tr>";
            }

            echo "</table>";
        } else {
            echo "No data found in table $table.";
        }
    }

    $conn->close();
    ?>
</body>
</html>
