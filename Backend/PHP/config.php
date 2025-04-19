<?php
$host = 'localhost';
$dbname = 'codelens'; // Change this to your local database name if different
$username = 'root';
$password = '';

try {
    // Connect directly to the InfinityFree database
    $pdo = new PDO("mysql:host=$host;dbname=$dbname", $username, $password);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    // No need to create or select the database, just connect
    // Remove all table creation and alteration code for production

    $sql2 = "CREATE TABLE IF NOT EXISTS questions (
        id INT PRIMARY KEY AUTO_INCREMENT,
        admin_id INT NOT NULL,
        question_text TEXT NOT NULL,
        option_a TEXT NOT NULL,
        option_b TEXT NOT NULL,
        option_c TEXT NOT NULL,
        option_d TEXT NOT NULL,
        correct_option CHAR(1) NOT NULL,
        category VARCHAR(50) NOT NULL,
        difficulty ENUM('easy', 'medium', 'hard') NOT NULL,
        created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
        FOREIGN KEY (admin_id) REFERENCES users(id)
    )";

    // Create tests table
    $sql3 = "CREATE TABLE IF NOT EXISTS tests (
        id INT PRIMARY KEY AUTO_INCREMENT,
        title VARCHAR(100) NOT NULL,
        description TEXT,
        duration INT NOT NULL, -- in minutes
        passing_score FLOAT NOT NULL,
        active BOOLEAN DEFAULT TRUE,
        created_by INT NOT NULL,
        created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
        FOREIGN KEY (created_by) REFERENCES users(id)
    )";

    // Create test_questions junction table
    $sql4 = "CREATE TABLE IF NOT EXISTS test_questions (
        id INT PRIMARY KEY AUTO_INCREMENT,
        test_id INT NOT NULL,
        question_id INT NOT NULL,
        FOREIGN KEY (test_id) REFERENCES tests(id),
        FOREIGN KEY (question_id) REFERENCES questions(id)
    )";

    // Create test_attempts table
    $sql5 = "CREATE TABLE IF NOT EXISTS test_attempts (
        id INT PRIMARY KEY AUTO_INCREMENT,
        user_id INT NOT NULL,
        test_id INT NOT NULL,
        score FLOAT NOT NULL,
        total_questions INT NOT NULL,
        correct_answers INT NOT NULL,
        time_taken INT NOT NULL, -- in seconds
        completed_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
        FOREIGN KEY (user_id) REFERENCES users(id),
        FOREIGN KEY (test_id) REFERENCES tests(id)
    )";

    // Create test_answers table
    $sql6 = "CREATE TABLE IF NOT EXISTS user_answers (
        id INT PRIMARY KEY AUTO_INCREMENT,
        attempt_id INT NOT NULL,
        question_id INT NOT NULL,
        selected_option CHAR(1),
        FOREIGN KEY (attempt_id) REFERENCES test_attempts(id),
        FOREIGN KEY (question_id) REFERENCES questions(id)
    )";

    // Table creation code removed for production

} catch(PDOException $e) {
    die("Connection failed: " . $e->getMessage());
}

// Function to check if user is logged in
function isLoggedIn() {
    return isset($_SESSION['user_id']);
}

// Function to redirect with message
function redirectWith($url, $message, $type = 'error') {
    $separator = (strpos($url, '?') !== false) ? '&' : '?';
    header("Location: $url$separator$type=" . urlencode($message));
    exit();
}
?>