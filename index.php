<?php
include 'db_config.php'; // make sure this connects to CarRentalDB

// Get selected branch (if any)
$branch_id = $_GET['branch_id'] ?? '';

// Fetch all branches for dropdown
$branches = $conn->query("SELECT Branch_ID, Branch_Name FROM Branch");

// Build the main query
$sql = "
SELECT b.Branch_ID, b.Branch_Name, SUM(Payment_Amount) AS Total_Revenue
FROM Booking BK
JOIN Branch B
on BK.PickUp_Branch_ID = B.Branch_ID
JOIN Payment P
on BK.Payment_ID = P.Payment_ID
";

if (!empty($branch_id)) {
    $sql .= " WHERE b.Branch_ID = ?";
}

$sql .= " GROUP BY b.Branch_ID, b.Branch_Name"; // Group by needs to be here incase a single branch is selected 

$stmt = $conn->prepare($sql);
if (!$stmt) {
    // show the exact SQL error from MySQL to help debug
    die("Prepare failed: (" . $conn->errno . ") " . $conn->error . "\n\nSQL: " . $sql);
}
if (!empty($branch_id)) {
    $stmt->bind_param("i", $branch_id);
}

$stmt->execute();
$result = $stmt->get_result();
?>

<!DOCTYPE html>
<html>
<head>
  <title>Branch Revenue Report</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      background-color: #f8f9fa;
      margin: 40px;
    }
    h1 {
      text-align: center;
      color: #333;
    }
    form {
      text-align: center;
      margin-bottom: 20px;
    }
    select, button {
      padding: 8px;
      font-size: 14px;
    }
    table {
      width: 60%;
      margin: 0 auto;
      border-collapse: collapse;
      background-color: #fff;
      box-shadow: 0 0 5px rgba(0,0,0,0.1);
    }
    th, td {
      padding: 10px;
      border: 1px solid #ddd;
      text-align: center;
    }
    th {
      background-color: #007bff;
      color: white;
    }
    tr:nth-child(even) {
      background-color: #f2f2f2;
    }
  </style>
</head>
<body>

<h1>Branch Revenue Report</h1>

<form method="GET" action="">
  <label for="branch_id"><strong>Select Branch:</strong></label>
  <select name="branch_id" id="branch_id">
    <option value="">All Branches</option>
    <?php while($b = $branches->fetch_assoc()): ?>
      <option value="<?= $b['Branch_ID'] ?>" <?= ($b['Branch_ID'] == $branch_id) ? 'selected' : '' ?>>
        <?= htmlspecialchars($b['Branch_Name']) ?>
      </option>
    <?php endwhile; ?>
  </select>
  <button type="submit">Show Results</button>
</form>

<table>
  <tr>
    <th>Branch ID</th>
    <th>Branch Name</th>
    <th>Total Revenue</th>
  </tr>
  <?php while($row = $result->fetch_assoc()): ?>
    <tr>
      <td><?= htmlspecialchars($row['Branch_ID']) ?></td>
      <td><?= htmlspecialchars($row['Branch_Name']) ?></td>
      <td>$<?= number_format($row['Total_Revenue'], 2) ?></td>
    </tr>
  <?php endwhile; ?>
</table>

</body>
</html>
