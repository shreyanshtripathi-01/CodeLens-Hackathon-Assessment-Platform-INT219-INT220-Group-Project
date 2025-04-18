<?php
require_once '../../Backend/PHP/auth.php';
require_once '../../Backend/PHP/config.php';
requireLogin();

// Ensure user is candidate
if ($_SESSION['user_role'] !== 'candidate') {
    header('Location: admin-dashboard.php');
    exit();
}

$userId = $_SESSION['user_id'];

if (!isset($_GET['test_id']) || !is_numeric($_GET['test_id'])) {
    die('Invalid test ID.');
}
$test_id = intval($_GET['test_id']);

// Fetch test details
$stmt = $pdo->prepare("SELECT * FROM tests WHERE id = ? AND active = 1");
$stmt->execute([$test_id]);
$test = $stmt->fetch();
if (!$test) {
    die('Test not found or inactive.');
}

// Fetch questions for the test
$stmt = $pdo->prepare("SELECT q.*, q.correct_option FROM questions q INNER JOIN test_questions tq ON q.id = tq.question_id WHERE tq.test_id = ?");
$stmt->execute([$test_id]);
$questions = $stmt->fetchAll();
if (empty($questions)) {
    die('No questions found for this test.');
}

// Handle form submission
// --- Time tracking ---
if (!isset($_SESSION['test_start_time'])) {
    $_SESSION['test_start_time'] = time();
}

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $answers = $_POST['answers'] ?? [];
    $correct = 0;
    foreach ($questions as $question) {
        $qid = $question['id'];
        $right = isset($question['correct_option']) ? $question['correct_option'] : '';
        $selected = isset($answers[$qid]) ? strtoupper($answers[$qid]) : null;
        if ($selected !== null && $selected === $right) {
            $correct++;
        }
    }
    $score = ($correct / count($questions)) * 100;
    // Calculate time taken
    $timeTaken = 0;
    if (isset($_SESSION['test_start_time'])) {
        $timeTaken = time() - $_SESSION['test_start_time'];
        unset($_SESSION['test_start_time']);
    }
    try {
        $pdo->beginTransaction();
        // Insert test attempt with completed_at as NOW()
        $stmt = $pdo->prepare("INSERT INTO test_attempts (user_id, score, total_questions, test_id, correct_answers, time_taken, completed_at) VALUES (?, ?, ?, ?, ?, ?, NOW())");
        $stmt->execute([$userId, $score, count($questions), $test_id, $correct, $timeTaken]);
        $attempt_id = $pdo->lastInsertId();
        // Save each answer
        foreach ($questions as $question) {
            $qid = $question['id'];
            $selected = isset($answers[$qid]) ? strtoupper($answers[$qid]) : null;
            $stmt = $pdo->prepare("INSERT INTO user_answers (attempt_id, question_id, selected_option) VALUES (?, ?, ?)");
            $stmt->execute([$attempt_id, $qid, $selected]);
        }
        $pdo->commit();
        header('Location: test-result.php?attempt_id=' . $attempt_id);
        exit();
    } catch (PDOException $e) {
        $pdo->rollBack();
        echo '<div class="bg-red-100 border border-red-400 text-red-700 px-4 py-3 rounded mb-4">Error saving test attempt: ' . htmlspecialchars($e->getMessage()) . '</div>';
    }
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="/Frontend/src/tailwind.css" rel="stylesheet">
    <title>Take Test - CodeLens</title>
</head>
<body class="bg-gray-100">
    <div class="max-w-3xl mx-auto py-8">
        <h1 class="text-3xl font-bold mb-4">Test: <?php echo htmlspecialchars($test['title']); ?></h1>
        <form method="POST">
            <?php foreach ($questions as $index => $question): ?>
                <div class="bg-white rounded shadow p-4 mb-6">
                    <h2 class="font-semibold mb-2">Q<?php echo $index + 1; ?>. <?php echo htmlspecialchars($question['question_text']); ?></h2>
                    <div class="space-y-2 ml-4">
                        <label><input type="radio" name="answers[<?php echo $question['id']; ?>]" value="A" required> <?php echo htmlspecialchars($question['option_a']); ?></label><br>
                        <label><input type="radio" name="answers[<?php echo $question['id']; ?>]" value="B"> <?php echo htmlspecialchars($question['option_b']); ?></label><br>
                        <label><input type="radio" name="answers[<?php echo $question['id']; ?>]" value="C"> <?php echo htmlspecialchars($question['option_c']); ?></label><br>
                        <label><input type="radio" name="answers[<?php echo $question['id']; ?>]" value="D"> <?php echo htmlspecialchars($question['option_d']); ?></label>
                    </div>
                </div>
            <?php endforeach; ?>
            <button type="submit" class="bg-green-100 text-green-800 px-6 py-2 rounded hover:bg-green-200">Submit Test</button>
        </form>
        <script>
        // Set test start time in session via AJAX if not already set
        if (!sessionStorage.getItem('testStartTimeSet')) {
            fetch(window.location.pathname + '?test_id=<?php echo $test_id; ?>&start=1');
            sessionStorage.setItem('testStartTimeSet', '1');
        }
        </script>
    </div>
</body>
</html>
