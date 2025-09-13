const jwt = require("jsonwebtoken");

function authMiddleware(req, res, next) {
  const authHeader = req.headers["authorization"];
  if (!authHeader) {
    return res.status(401).json({ status: false, message: "No token provided" });
  }

  const token = authHeader.split(" ")[1]; // Extract Bearer token
  if (!token) {
    return res.status(401).json({ status: false, message: "Invalid token format" });
  }

  try {
    const decoded = jwt.verify(token, process.env.JWT_SECRET || "secretKey");
    req.user = decoded; // attach user data to request
    next();
  } catch (error) {
    return res.status(401).json({ status: false, message: "Unauthorized" });
  }
}

module.exports = authMiddleware;
