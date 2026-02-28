// src/routes/ai.routes.js
const express = require('express');
const { getEfficiencyPlan } = require('../controllers/ai.controller');
// uncomment underneath to secure the endpoint
// const { authenticate } = require('../middleware/authMiddleware');

const router = express.Router();

// Generate AI Efficiency Plan based on user stats
// router.post('/generate-plan', authenticate, getEfficiencyPlan);
router.post('/generate-plan', getEfficiencyPlan);

module.exports = router;
