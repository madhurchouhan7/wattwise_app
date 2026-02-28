// src/controllers/ai.controller.js
const { generateEfficiencyPlan } = require('../services/gemini.service');

/**
 * @desc    Generate AI Efficiency Plan via Gemini
 * @route   POST /api/v1/ai/generate-plan
 * @access  Private
 */
const getEfficiencyPlan = async (req, res, next) => {
    try {
        const userData = req.body;

        if (!userData || Object.keys(userData).length === 0) {
            return res.status(400).json({
                success: false,
                message: 'No user data provided. Send appliances, bill, and context.',
            });
        }

        // Call Gemini Service
        const plan = await generateEfficiencyPlan(userData);

        res.status(200).json({
            success: true,
            data: plan,
        });
    } catch (error) {
        console.error('AI Plan Generation Error:', error.message);
        next(error);
    }
};

module.exports = {
    getEfficiencyPlan,
};
