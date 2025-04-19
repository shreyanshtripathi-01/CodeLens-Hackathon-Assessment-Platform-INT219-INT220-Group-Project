-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 19, 2025 at 07:32 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `codelens`
--

-- --------------------------------------------------------

--
-- Table structure for table `coding_submissions`
--

CREATE TABLE `coding_submissions` (
  `id` int(11) NOT NULL,
  `attempt_id` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  `user_code` text NOT NULL,
  `language` varchar(50) NOT NULL,
  `status` enum('passed','failed','error','timeout') NOT NULL,
  `execution_time` float DEFAULT NULL,
  `memory_used` int(11) DEFAULT NULL,
  `test_results` text DEFAULT NULL,
  `submitted_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `questions`
--

CREATE TABLE `questions` (
  `id` int(11) NOT NULL,
  `admin_id` int(11) NOT NULL,
  `admin_name` varchar(100) NOT NULL,
  `question_text` text NOT NULL,
  `question_type` enum('mcq','true_false','coding') NOT NULL DEFAULT 'mcq',
  `category` varchar(50) NOT NULL,
  `difficulty` enum('easy','medium','hard') NOT NULL DEFAULT 'medium',
  `option_a` text DEFAULT NULL,
  `option_b` text DEFAULT NULL,
  `option_c` text DEFAULT NULL,
  `option_d` text DEFAULT NULL,
  `correct_answer` text DEFAULT NULL,
  `coding_language` varchar(50) DEFAULT NULL,
  `code_snippet` text DEFAULT NULL,
  `function_name` varchar(100) DEFAULT NULL,
  `test_cases` text DEFAULT NULL,
  `expected_outputs` text DEFAULT NULL,
  `time_limit` int(11) DEFAULT NULL,
  `memory_limit` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `points` int(11) NOT NULL DEFAULT 10,
  `correct_option` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `questions`
--

INSERT INTO `questions` (`id`, `admin_id`, `admin_name`, `question_text`, `question_type`, `category`, `difficulty`, `option_a`, `option_b`, `option_c`, `option_d`, `correct_answer`, `coding_language`, `code_snippet`, `function_name`, `test_cases`, `expected_outputs`, `time_limit`, `memory_limit`, `created_at`, `points`, `correct_option`) VALUES
(3, 1, '', 'Which of the following is NOT a programming language?', 'mcq', 'other', 'easy', 'Python', 'Java', 'HTML', 'C++', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-04-17 17:55:33', 10, 'C'),
(4, 1, '', 'What does SQL stand for?', 'mcq', 'general', 'easy', 'Simple Query Language', 'Sequential Query Language', 'Structured Query Language', 'Statement Query Language', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-04-17 17:58:53', 10, 'C'),
(5, 1, '', 'Which data structure uses FIFO (First In, First Out)?', 'mcq', 'general', 'easy', 'Stack', 'Queue', 'Graph', 'Tree', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-04-17 17:59:33', 10, 'B'),
(6, 1, '', 'Which symbol is used for single-line comments in Python?', 'mcq', 'general', 'easy', '/*', '#', '//', '<!--', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-04-17 18:01:08', 10, 'C'),
(7, 1, '', 'What is the output of print(2 ** 3) in Python?', 'mcq', 'general', 'easy', '6', '8', '9', '5', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-04-17 18:01:33', 10, 'B'),
(8, 1, '', 'Which keyword is used to define a function in C?', 'mcq', 'general', 'easy', 'define', 'function', 'func', 'None of the above', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-04-17 18:02:05', 10, 'D'),
(9, 1, '', 'Which of the following is not a valid variable name in Java?', 'mcq', 'general', 'medium', '_myVar', 'myVar2', '2myVar', 'my_var', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-04-17 18:03:20', 10, 'C'),
(10, 1, '', 'What is the default value of a boolean variable in Java?', 'mcq', 'general', 'easy', 'true', 'false', 'zero (0)', 'null', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-04-17 18:04:05', 10, 'B'),
(11, 1, '', 'Which of the following is NOT an OOP concept?', 'mcq', 'general', 'medium', 'Encapsulation', 'Inheritance', 'Polymorphism', 'Compilation', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-04-17 18:05:03', 10, 'D'),
(12, 1, '', 'Which sorting algorithm has the best average-case time complexity?', 'mcq', 'data_structures', 'easy', 'Insertion Sort', 'Quick Sort', 'Bubble Sort', 'Selection Sort', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-04-17 18:06:10', 10, 'B'),
(13, 1, '', 'What is the capital of India?', 'mcq', 'General Knowledge', 'easy', 'Mumbai', 'Delhi', 'Kolkata', 'Chennai', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-04-18 14:09:43', 10, 'B'),
(14, 1, '', 'Which language is primarily spoken in Maharashtra?', 'mcq', 'Languages', 'easy', 'Hindi', 'Marathi', 'Gujarati', 'Kannada', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-04-18 14:09:43', 10, 'B'),
(15, 1, '', '5 + 7 = ?', 'mcq', 'Mathematics', 'easy', '10', '12', '13', '11', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-04-18 14:09:43', 10, 'B');

-- --------------------------------------------------------

--
-- Table structure for table `tests`
--

CREATE TABLE `tests` (
  `id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  `duration` int(11) NOT NULL,
  `passing_score` float NOT NULL,
  `active` tinyint(1) DEFAULT 1,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `type` enum('MCQs','Coding','MIX') NOT NULL DEFAULT 'MCQs'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tests`
--

INSERT INTO `tests` (`id`, `title`, `description`, `duration`, `passing_score`, `active`, `created_by`, `created_at`, `type`) VALUES
(1, 'Mock Test 1', 'This is the official mock test for candidates.', 0, 40, 1, 1, '2025-04-18 14:09:42', 'MCQs'),
(2, 'Mock Test - I', 'Prepare yourself for the real exam with this comprehensive mock test. This test is designed to simulate actual exam conditions and covers a variety of topics, including multiple-choice questions and coding challenges. Use this opportunity to assess your knowledge, identify areas for improvement, and build confidence before the final assessment. Good luck!', 5, 45, 1, 1, '2025-04-17 17:53:37', 'MCQs');

-- --------------------------------------------------------

--
-- Table structure for table `test_answers`
--

CREATE TABLE `test_answers` (
  `id` int(11) NOT NULL,
  `attempt_id` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  `user_answer` text NOT NULL,
  `is_correct` tinyint(1) NOT NULL DEFAULT 0,
  `points_earned` int(11) NOT NULL DEFAULT 0,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `test_attempts`
--

CREATE TABLE `test_attempts` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  `total_questions` int(11) NOT NULL,
  `completed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `test_id` int(11) NOT NULL,
  `correct_answers` int(11) DEFAULT 0,
  `time_taken` int(11) DEFAULT 0,
  `fullscreen_violations` int(11) DEFAULT 0,
  `tab_violations` int(11) DEFAULT 0,
  `duration` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `test_attempts`
--

INSERT INTO `test_attempts` (`id`, `user_id`, `score`, `total_questions`, `completed_at`, `test_id`, `correct_answers`, `time_taken`, `fullscreen_violations`, `tab_violations`, `duration`) VALUES
(1, 2, 0, 2, '2025-04-17 07:08:54', 1, 0, 0, 0, 0, 0),
(2, 2, 50, 2, '2025-04-17 07:26:53', 1, 0, 0, 0, 0, 0),
(3, 2, 0, 10, '2025-04-18 05:22:31', 2, 0, 0, 0, 0, 0),
(4, 2, 0, 10, '2025-04-18 05:26:13', 2, 0, 15, 0, 0, 0),
(5, 2, 30, 10, '2025-04-18 05:32:30', 2, 3, 13, 0, 0, 0),
(6, 2, 20, 10, '2025-04-18 10:59:17', 2, 2, 461, 0, 0, 0),
(7, 2, 20, 10, '2025-04-18 11:07:14', 2, 2, 0, 2, 1, 0),
(8, 2, 10, 10, '2025-04-18 11:13:17', 2, 1, 108, 2, 7, 0),
(9, 2, 0, 10, '2025-04-18 11:14:37', 2, 0, 19, 3, 9, 0),
(10, 2, 20, 10, '2025-04-18 11:18:02', 2, 2, 0, 3, 9, 300),
(11, 2, 40, 10, '2025-04-18 11:18:27', 2, 4, 13, 3, 9, 300),
(12, 2, 10, 10, '2025-04-18 12:41:51', 2, 1, 17, 3, 10, 300),
(13, 2, 10, 10, '2025-04-18 12:44:54', 2, 1, 7, 3, 10, 300),
(14, 2, 10, 10, '2025-04-18 12:47:23', 2, 1, 13, 0, 0, 300),
(15, 2, 20, 10, '2025-04-18 13:07:33', 2, 2, 176, 0, 0, 300),
(16, 2, 0, 10, '2025-04-18 13:09:43', 2, 0, 123, 0, 0, 300),
(17, 2, 33, 3, '2025-04-18 14:10:34', 1, 1, 47, 0, 0, 0),
(18, 2, 67, 3, '2025-04-18 14:40:17', 1, 2, 19, 0, 0, 0),
(19, 2, 70, 10, '2025-04-18 14:41:26', 2, 7, 56, 0, 0, 300);

-- --------------------------------------------------------

--
-- Table structure for table `test_questions`
--

CREATE TABLE `test_questions` (
  `id` int(11) NOT NULL,
  `test_id` int(11) NOT NULL,
  `question_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `test_questions`
--

INSERT INTO `test_questions` (`id`, `test_id`, `question_id`) VALUES
(3, 2, 12),
(4, 2, 11),
(5, 2, 10),
(6, 2, 9),
(7, 2, 8),
(8, 2, 7),
(9, 2, 6),
(10, 2, 5),
(11, 2, 4),
(12, 2, 3),
(13, 1, 13),
(14, 1, 14),
(15, 1, 15),
(16, 2, 13),
(17, 2, 14);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `fullname` varchar(100) NOT NULL,
  `uid` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('admin','candidate') NOT NULL DEFAULT 'candidate',
  `remember_token` varchar(64) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `fullname`, `uid`, `email`, `phone`, `password`, `role`, `remember_token`, `created_at`) VALUES
(1, 'Shreyansh', '12354', 's_ravi@gmail.com', '6859990000', '$2y$10$eLe/BvBDG4ANJnnEt56PO.zKbAi5yktJN7RxdwrFpAEjhMZnE6mMe', 'admin', NULL, '2025-04-13 17:03:49'),
(2, 'Shreyansh', '12324055', 'shreyanshcloud2023@gmail.com', '9875256987', '$2y$10$kPeNmItWwbnWHJCGA4m2oO2iitMgAhtfX/ggWOh6WE0YjFhFe0rvS', 'candidate', NULL, '2025-04-15 10:55:07'),
(3, 'Anmol Singh', '12345678', 'anmol.singh@gmail.com', '9876543210', '$2y$10$h5j3GZV1f6uFZyE4y9j7gO4QFQ1iUQ6FQK2Zq6yE2Q3K2FQ6FQ1iU', 'candidate', NULL, '2025-04-18 14:01:03'),
(4, 'Priya Sharma', '12498765', 'priya.sharma@gmail.com', '9123456789', '$2y$10$8g7h2Kj3k8l9H8j4L2q3P4k5N7m8Q9z6B7n8M9v7C8x9W0r1T2y3', 'candidate', NULL, '2025-04-18 14:01:03'),
(5, 'Rohan Verma', '12123456', 'rohan.verma@gmail.com', '9988776655', '$2y$10$3k8l9H8j4L2q3P4k5N7m8Q9z6B7n8M9v7C8x9W0r1T2y3h5j3GZV', 'candidate', NULL, '2025-04-18 14:01:03'),
(6, 'Sneha Patel', '12234567', 'sneha.patel@gmail.com', '9765432109', '$2y$10$QFQ1iUQ6FQK2Zq6yE2Q3K2FQ6FQ1iUh5j3GZV1f6uFZyE4y9j7gO', 'candidate', NULL, '2025-04-18 14:01:03'),
(7, 'Vikas Gupta', '12387654', 'vikas.gupta@gmail.com', '9876123450', '$2y$10$8g7h2Kj3k8l9H8j4L2q3P4k5N7m8Q9z6B7n8M9v7C8x9W0r1T2y3', 'candidate', NULL, '2025-04-18 14:01:03'),
(8, 'Meera Nair', '12412345', 'meera.nair@gmail.com', '9123987654', '$2y$10$3k8l9H8j4L2q3P4k5N7m8Q9z6B7n8M9v7C8x9W0r1T2y3h5j3GZV', 'candidate', NULL, '2025-04-18 14:01:03'),
(9, 'Amit Joshi', '12198765', 'amit.joshi@gmail.com', '9812345678', '$2y$10$QFQ1iUQ6FQK2Zq6yE2Q3K2FQ6FQ1iUh5j3GZV1f6uFZyE4y9j7gO', 'candidate', NULL, '2025-04-18 14:01:03'),
(10, 'Neha Yadav', '12287654', 'neha.yadav@gmail.com', '9900123456', '$2y$10$8g7h2Kj3k8l9H8j4L2q3P4k5N7m8Q9z6B7n8M9v7C8x9W0r1T2y3', 'candidate', NULL, '2025-04-18 14:01:03'),
(11, 'Sahil Kumar', '12323456', 'sahil.kumar@gmail.com', '9876001234', '$2y$10$3k8l9H8j4L2q3P4k5N7m8Q9z6B7n8M9v7C8x9W0r1T2y3h5j3GZV', 'candidate', NULL, '2025-04-18 14:01:03'),
(12, 'Kavya Reddy', '12456789', 'kavya.reddy@gmail.com', '9123009876', '$2y$10$QFQ1iUQ6FQK2Zq6yE2Q3K2FQ6FQ1iUh5j3GZV1f6uFZyE4y9j7gO', 'candidate', NULL, '2025-04-18 14:01:03'),
(13, 'Manish Saini', '12134567', 'manish.saini@gmail.com', '9834567890', '$2y$10$8g7h2Kj3k8l9H8j4L2q3P4k5N7m8Q9z6B7n8M9v7C8x9W0r1T2y3', 'candidate', NULL, '2025-04-18 14:01:03'),
(14, 'Pooja Jain', '12212345', 'pooja.jain@gmail.com', '9911223344', '$2y$10$3k8l9H8j4L2q3P4k5N7m8Q9z6B7n8M9v7C8x9W0r1T2y3h5j3GZV', 'candidate', NULL, '2025-04-18 14:01:03'),
(15, 'Arjun Das', '12376543', 'arjun.das@gmail.com', '9876540987', '$2y$10$QFQ1iUQ6FQK2Zq6yE2Q3K2FQ6FQ1iUh5j3GZV1f6uFZyE4y9j7gO', 'candidate', NULL, '2025-04-18 14:01:03'),
(16, 'Divya Singh', '12423456', 'divya.singh@gmail.com', '9123450098', '$2y$10$8g7h2Kj3k8l9H8j4L2q3P4k5N7m8Q9z6B7n8M9v7C8x9W0r1T2y3', 'candidate', NULL, '2025-04-18 14:01:03'),
(17, 'Rahul Mehta', '12187654', 'rahul.mehta@gmail.com', '9811122233', '$2y$10$3k8l9H8j4L2q3P4k5N7m8Q9z6B7n8M9v7C8x9W0r1T2y3h5j3GZV', 'candidate', NULL, '2025-04-18 14:01:03'),
(18, 'Simran Kaur', '12256789', 'simran.kaur@gmail.com', '9900112233', '$2y$10$QFQ1iUQ6FQK2Zq6yE2Q3K2FQ6FQ1iUh5j3GZV1f6uFZyE4y9j7gO', 'candidate', NULL, '2025-04-18 14:01:03'),
(19, 'Nikhil Bansal', '12312345', 'nikhil.bansal@gmail.com', '9876012345', '$2y$10$8g7h2Kj3k8l9H8j4L2q3P4k5N7m8Q9z6B7n8M9v7C8x9W0r1T2y3', 'candidate', NULL, '2025-04-18 14:01:03'),
(20, 'Ayesha Khan', '12487654', 'ayesha.khan@gmail.com', '9123098765', '$2y$10$3k8l9H8j4L2q3P4k5N7m8Q9z6B7n8M9v7C8x9W0r1T2y3h5j3GZV', 'candidate', NULL, '2025-04-18 14:01:03'),
(21, 'Deepak Mishra', '12156789', 'deepak.mishra@gmail.com', '9834009876', '$2y$10$QFQ1iUQ6FQK2Zq6yE2Q3K2FQ6FQ1iUh5j3GZV1f6uFZyE4y9j7gO', 'candidate', NULL, '2025-04-18 14:01:03'),
(22, 'Ritu Agarwal', '12223456', 'ritu.agarwal@gmail.com', '9911002233', '$2y$10$8g7h2Kj3k8l9H8j4L2q3P4k5N7m8Q9z6B7n8M9v7C8x9W0r1T2y3', 'candidate', NULL, '2025-04-18 14:01:03'),
(23, 'Harsh Vardhan', '12365432', 'harsh.vardhan@gmail.com', '9876509876', '$2y$10$3k8l9H8j4L2q3P4k5N7m8Q9z6B7n8M9v7C8x9W0r1T2y3h5j3GZV', 'candidate', NULL, '2025-04-18 14:01:03'),
(24, 'Swati Chawla', '12434567', 'swati.chawla@gmail.com', '9123409876', '$2y$10$QFQ1iUQ6FQK2Zq6yE2Q3K2FQ6FQ1iUh5j3GZV1f6uFZyE4y9j7gO', 'candidate', NULL, '2025-04-18 14:01:03'),
(25, 'Gaurav Pandey', '12165432', 'gaurav.pandey@gmail.com', '9811234567', '$2y$10$8g7h2Kj3k8l9H8j4L2q3P4k5N7m8Q9z6B7n8M9v7C8x9W0r1T2y3', 'candidate', NULL, '2025-04-18 14:01:03'),
(26, 'Tanvi Bhatt', '12234568', 'tanvi.bhatt@gmail.com', '9900123498', '$2y$10$3k8l9H8j4L2q3P4k5N7m8Q9z6B7n8M9v7C8x9W0r1T2y3h5j3GZV', 'candidate', NULL, '2025-04-18 14:01:03'),
(27, 'Yash Saxena', '12398765', 'yash.saxena@gmail.com', '9876098765', '$2y$10$QFQ1iUQ6FQK2Zq6yE2Q3K2FQ6FQ1iUh5j3GZV1f6uFZyE4y9j7gO', 'candidate', NULL, '2025-04-18 14:01:03');

-- --------------------------------------------------------

--
-- Table structure for table `user_answers`
--

CREATE TABLE `user_answers` (
  `id` int(11) NOT NULL,
  `attempt_id` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  `selected_option` char(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_answers`
--

INSERT INTO `user_answers` (`id`, `attempt_id`, `question_id`, `selected_option`) VALUES
(1, 3, 12, 'C'),
(2, 3, 11, 'B'),
(3, 3, 10, 'D'),
(4, 3, 9, 'C'),
(5, 3, 8, 'B'),
(6, 3, 7, 'A'),
(7, 3, 6, 'B'),
(8, 3, 5, 'B'),
(9, 3, 4, 'C'),
(10, 3, 3, 'C'),
(11, 4, 12, 'C'),
(12, 4, 11, 'C'),
(13, 4, 10, 'C'),
(14, 4, 9, 'C'),
(15, 4, 8, 'C'),
(16, 4, 7, 'C'),
(17, 4, 6, 'C'),
(18, 4, 5, 'A'),
(19, 4, 4, 'B'),
(20, 4, 3, 'C'),
(21, 5, 12, 'C'),
(22, 5, 11, 'C'),
(23, 5, 10, 'C'),
(24, 5, 9, 'C'),
(25, 5, 8, 'C'),
(26, 5, 7, 'C'),
(27, 5, 6, 'B'),
(28, 5, 5, 'C'),
(29, 5, 4, 'C'),
(30, 5, 3, 'C'),
(31, 6, 12, 'A'),
(32, 6, 11, 'B'),
(33, 6, 10, 'C'),
(34, 6, 9, 'B'),
(35, 6, 8, 'B'),
(36, 6, 7, 'C'),
(37, 6, 6, 'C'),
(38, 6, 5, 'B'),
(39, 6, 4, 'B'),
(40, 6, 3, 'B'),
(41, 7, 12, 'C'),
(42, 7, 11, 'C'),
(43, 7, 10, 'C'),
(44, 7, 9, 'B'),
(45, 7, 8, 'C'),
(46, 7, 7, 'D'),
(47, 7, 6, 'D'),
(48, 7, 5, 'B'),
(49, 7, 4, 'C'),
(50, 7, 3, 'B'),
(51, 8, 12, 'B'),
(52, 8, 11, NULL),
(53, 8, 10, NULL),
(54, 8, 9, NULL),
(55, 8, 8, NULL),
(56, 8, 7, NULL),
(57, 8, 6, NULL),
(58, 8, 5, NULL),
(59, 8, 4, NULL),
(60, 8, 3, NULL),
(61, 9, 12, 'A'),
(62, 9, 11, 'B'),
(63, 9, 10, 'C'),
(64, 9, 9, NULL),
(65, 9, 8, NULL),
(66, 9, 7, NULL),
(67, 9, 6, NULL),
(68, 9, 5, NULL),
(69, 9, 4, NULL),
(70, 9, 3, NULL),
(71, 10, 12, 'C'),
(72, 10, 11, 'C'),
(73, 10, 10, 'C'),
(74, 10, 9, 'C'),
(75, 10, 8, 'C'),
(76, 10, 7, 'C'),
(77, 10, 6, 'A'),
(78, 10, 5, 'B'),
(79, 10, 4, 'B'),
(80, 10, 3, 'B'),
(81, 11, 12, 'B'),
(82, 11, 11, 'C'),
(83, 11, 10, 'C'),
(84, 11, 9, 'B'),
(85, 11, 8, 'B'),
(86, 11, 7, 'B'),
(87, 11, 6, 'B'),
(88, 11, 5, 'C'),
(89, 11, 4, 'C'),
(90, 11, 3, 'C'),
(91, 12, 12, 'C'),
(92, 12, 11, 'C'),
(93, 12, 10, 'C'),
(94, 12, 9, 'C'),
(95, 12, 8, 'C'),
(96, 12, 7, 'C'),
(97, 12, 6, NULL),
(98, 12, 5, NULL),
(99, 12, 4, NULL),
(100, 12, 3, NULL),
(101, 13, 12, 'B'),
(102, 13, 11, 'B'),
(103, 13, 10, 'C'),
(104, 13, 9, NULL),
(105, 13, 8, NULL),
(106, 13, 7, NULL),
(107, 13, 6, NULL),
(108, 13, 5, NULL),
(109, 13, 4, NULL),
(110, 13, 3, NULL),
(111, 14, 12, 'C'),
(112, 14, 11, 'B'),
(113, 14, 10, 'A'),
(114, 14, 9, NULL),
(115, 14, 8, 'A'),
(116, 14, 7, 'C'),
(117, 14, 6, 'B'),
(118, 14, 5, 'A'),
(119, 14, 4, 'C'),
(120, 14, 3, NULL),
(121, 15, 12, 'B'),
(122, 15, 11, 'B'),
(123, 15, 10, 'C'),
(124, 15, 9, 'B'),
(125, 15, 8, 'B'),
(126, 15, 7, 'B'),
(127, 15, 6, NULL),
(128, 15, 5, NULL),
(129, 15, 4, NULL),
(130, 15, 3, NULL),
(131, 16, 12, 'A'),
(132, 16, 11, 'C'),
(133, 16, 10, NULL),
(134, 16, 9, NULL),
(135, 16, 8, NULL),
(136, 16, 7, NULL),
(137, 16, 6, NULL),
(138, 16, 5, NULL),
(139, 16, 4, NULL),
(140, 16, 3, NULL),
(141, 17, 13, 'A'),
(142, 17, 14, 'A'),
(143, 17, 15, 'B'),
(144, 18, 13, 'B'),
(145, 18, 14, 'B'),
(146, 18, 15, 'C'),
(147, 19, 12, 'B'),
(148, 19, 11, 'D'),
(149, 19, 10, 'D'),
(150, 19, 9, 'C'),
(151, 19, 8, 'C'),
(152, 19, 7, 'B'),
(153, 19, 6, 'B'),
(154, 19, 5, 'B'),
(155, 19, 4, 'C'),
(156, 19, 3, 'C');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `coding_submissions`
--
ALTER TABLE `coding_submissions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `attempt_id` (`attempt_id`),
  ADD KEY `question_id` (`question_id`);

--
-- Indexes for table `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `admin_id` (`admin_id`);

--
-- Indexes for table `tests`
--
ALTER TABLE `tests`
  ADD PRIMARY KEY (`id`),
  ADD KEY `created_by` (`created_by`);

--
-- Indexes for table `test_answers`
--
ALTER TABLE `test_answers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `test_attempts`
--
ALTER TABLE `test_attempts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `test_questions`
--
ALTER TABLE `test_questions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `test_id` (`test_id`),
  ADD KEY `question_id` (`question_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uid` (`uid`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `user_answers`
--
ALTER TABLE `user_answers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `attempt_id` (`attempt_id`),
  ADD KEY `question_id` (`question_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `coding_submissions`
--
ALTER TABLE `coding_submissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `questions`
--
ALTER TABLE `questions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `tests`
--
ALTER TABLE `tests`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `test_answers`
--
ALTER TABLE `test_answers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `test_attempts`
--
ALTER TABLE `test_attempts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `test_questions`
--
ALTER TABLE `test_questions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `user_answers`
--
ALTER TABLE `user_answers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=157;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `coding_submissions`
--
ALTER TABLE `coding_submissions`
  ADD CONSTRAINT `coding_submissions_ibfk_1` FOREIGN KEY (`attempt_id`) REFERENCES `test_attempts` (`id`),
  ADD CONSTRAINT `coding_submissions_ibfk_2` FOREIGN KEY (`question_id`) REFERENCES `questions` (`id`);

--
-- Constraints for table `questions`
--
ALTER TABLE `questions`
  ADD CONSTRAINT `questions_ibfk_1` FOREIGN KEY (`admin_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `tests`
--
ALTER TABLE `tests`
  ADD CONSTRAINT `tests_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`);

--
-- Constraints for table `test_attempts`
--
ALTER TABLE `test_attempts`
  ADD CONSTRAINT `test_attempts_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `test_questions`
--
ALTER TABLE `test_questions`
  ADD CONSTRAINT `test_questions_ibfk_1` FOREIGN KEY (`test_id`) REFERENCES `tests` (`id`),
  ADD CONSTRAINT `test_questions_ibfk_2` FOREIGN KEY (`question_id`) REFERENCES `questions` (`id`);

--
-- Constraints for table `user_answers`
--
ALTER TABLE `user_answers`
  ADD CONSTRAINT `user_answers_ibfk_1` FOREIGN KEY (`attempt_id`) REFERENCES `test_attempts` (`id`),
  ADD CONSTRAINT `user_answers_ibfk_2` FOREIGN KEY (`question_id`) REFERENCES `questions` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;



/*
Database Name - if0_38782645_codelens
MySQL Username - if0_38782645
MySQL Password - CodeLens42
MySQL Hostname - sql310.infinityfree.com
*/