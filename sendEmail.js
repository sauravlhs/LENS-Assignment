const nodemailer = require('nodemailer');

const transporter = nodemailer.createTransport({
  host: process.env.SMTP_SERVER,
  port: process.env.SMTP_PORT,
  secure: false, // true for 465, false for other ports
  auth: {
    user: process.env.SMTP_USER,
    pass: process.env.SMTP_PASSWORD,
  },
});

const mailOptions = {
  from: process.env.SMTP_USER, // sender address
  to: "recipient@example.com", // list of receivers
  subject: "CI/CD Pipeline Status",
  text: "Your build was successful!",
};

transporter.sendMail(mailOptions, (error, info) => {
  if (error) {
    console.log("Error sending email:", error);
  } else {
    console.log("Email sent:", info.response);
  }
});
