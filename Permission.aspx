
<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Permission.aspx.cs" Inherits="Permission" %>
<%@ Register Assembly="DevExpress.Web.v20.1, Version=20.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Permission Management</title>
    <link href="https://fonts.googleapis.com/css2?family=Manrope:wght@300;400;500;600;700&display=swap" rel="stylesheet" />
    <style>
        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }

        body {
            font-family: 'Manrope', sans-serif;
            background: linear-gradient(135deg, #dbeafe, #ffedd5);
            margin: 0;
            padding: 24px;
            color: #1f2937;
            overflow-x: hidden;
            position: relative;
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: flex-start;
        }

        /* Particle Background Canvas */
        #particle-canvas {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            z-index: -1;
            pointer-events: none;
            opacity: 0.3;
        }

        /* Conteneur principal */
        #form1 {
            max-width: 1300px;
            width: 100%;
            background: #ffffff;
            border-radius: 16px;
            box-shadow: 0 10px 40px rgba(0, 0, 0, 0.08);
            padding: 24px;
            max-height: auto;
            animation: fadeIn 0.6s ease-out;
            display: flex;
            flex-direction: column;
            gap: 20px;
        }

        /* Card styles */
        .card {
            background: #ffffff;
            border-radius: 12px;
            box-shadow: 0 6px 24px rgba(0, 0, 0, 0.1);
            padding: 16px;
            animation: fadeIn 0.6s ease-out;
            width: 100%;
            overflow: hidden;
        }

        /* Flex container for Splitters */
        .splitter-container {
            display: flex;
            gap: 20px;
            flex-wrap: nowrap;
            width: 100%;
            height: 600px; /* Fixed height for consistency */
        }

        .splitter-item-roles {
            flex: 1;
            min-width: 300px;
            display: flex;
            flex-direction: column;
        }

        .splitter-item-resources {
            flex: 2;
            min-width: 500px;
            display: flex;
            flex-direction: column;
        }

        /* Grid container */
        .grid-container {
            width: 100%;
            overflow: hidden;
            flex: 1;
            display: flex;
            flex-direction: column;
        }

        /* ASPxGridView */
        .dxgvTable_iOS {
            border-collapse: collapse !important;
            background: #ffffff !important;
            border-radius: 12px !important;
            box-shadow: 0 6px 24px rgba(0, 0, 0, 0.1) !important;
            display: table !important;
            visibility: visible !important;
            transition: transform 0.3s ease !important;
            width: 100% !important;
            table-layout: fixed !important;
        }

        .dxgvTable_iOS:hover {
            transform: translateY(-2px) !important;
        }

        .dxgvHeader_iOS {
            background: linear-gradient(135deg, #2563eb, #1e40af) !important;
            color: #ffffff !important;
            font-weight: 700 !important;
            font-size: 14px !important;
            padding: 14px !important;
            border: none !important;
            text-transform: uppercase !important;
            letter-spacing: 1.2px !important;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.15) !important;
            position: relative !important;
            overflow: hidden !important;
            transition: background 0.3s ease, transform 0.2s ease !important;
            text-align: center !important;
        }

        .dxgvHeader_iOS:first-child {
            text-align: center !important;
        }

        .dxgvHeader_iOS:hover {
            background: linear-gradient(135deg, #1e40af, #2563eb) !important;
            transform: translateY(-1px) !important;
        }

        .dxgvHeader_iOS::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(90deg, transparent, rgba(255, 255, 255, 0.2), transparent);
            transition: 0.5s;
        }

        .dxgvHeader_iOS:hover::before {
            left: 100%;
        }

        .dxgvHeader_iOS::after {
            content: '';
            position: absolute;
            bottom: 0;
            left: 0;
            width: 100%;
            height: 3px;
            background: #f97316;
            transition: transform 0.3s ease;
        }

        .dxgvDataRow_iOS td {
            padding: 12px !important;
            font-size: 14px !important;
            line-height: 1.4 !important;
            color: #1f2937 !important;
            border-bottom: 1px solid #e5e7eb !important;
            transition: background-color 0.2s ease, color 0.2s ease !important;
            overflow: hidden;
            text-overflow: ellipsis;
            white-space: nowrap;
        }

        .dxgvDataRow_iOS td:first-child {
            text-align: center !important;
        }

        .dxgvDataRow_iOS:hover td {
            background-color: #ffedd5 !important;
            color: #7c2d12 !important;
        }

        .dxgvFocusedRow_iOS td {
            background-color: #dbeafe !important;
            color: #1e40af !important;
            font-weight: 500 !important;
            border-left: 3px solid #f97316 !important;
            animation: highlightRow 0.3s ease !important;
        }

        /* Buttons */
        .dxbButton_iOS {
            border: none !important;
            border-radius: 8px !important;
            padding: 6px 10px !important;
            font-size: 12px !important;
            font-weight: 500 !important;
            display: inline-flex !important;
            align-items: center !important;
            justify-content: center !important;
            min-width: 24px !important;
            height: 24px !important;
            transition: transform 0.2s ease, box-shadow 0.2s ease, background 0.3s ease !important;
            cursor: pointer !important;
        }

        .dxbButton_iOS:hover {
            transform: translateY(-1px) !important;
            box-shadow: 0 3px 10px rgba(0, 0, 0, 0.2) !important;
        }

        .dxbButton_iOS img {
            filter: brightness(0) invert(1) !important;
            width: 16px !important;
            height: 16px !important;
        }

        /* Add button */
        .dxbButton_iOS[title="Add New Role"] {
            background: radial-gradient(circle at center, #f923c, #f97316) !important;
            animation: pulse 2s ease-in-out infinite !important;
            margin: 0 auto !important;
            display: flex !important;
            justify-content: center !important;
            align-items: center !important;
            width: 40px !important;
            height: 40px !important;
            padding: 8px !important;
            border-radius: 50% !important;
            z-index: 10 !important;
        }

        .dxbButton_iOS[title="Add New Role"]:hover {
            background: radial-gradient(circle at center, #f97316, #ea580c) !important;
        }

        /* Add button container */
        .add-button-container {
            display: flex !important;
            justify-content: center !important;
            align-items: center !important;
            padding: 8px 0 !important;
        }

        /* Edit button */
        .dxbButton_iOS[title="Edit"] {
            background: linear-gradient(to right, #16a34a, #22c55e) !important;
            margin: 0 4px !important;
        }

        .dxbButton_iOS[title="Edit"]:hover {
            background: linear-gradient(to right, #15803d, #16a34a) !important;
        }

        /* Delete button */
        .dxbButton_iOS[title="Delete"] {
            background: linear-gradient(to right, #dc2626, #ef4444) !important;
            margin: 0 4px !important;
        }

        .dxbButton_iOS[title="Delete"]:hover {
            background: linear-gradient(to right, #b91c1c, #dc2626) !important;
        }

        /* Save button */
        .dxbButton_iOS[title="Save"] {
            background: linear-gradient(to right, #2563eb, #3b82f6) !important;
            margin: 0 4px !important;
        }

        .dxbButton_iOS[title="Save"]:hover {
            background: linear-gradient(to right, #1e40af, #2563eb) !important;
        }

        /* Cancel button */
        .dxbButton_iOS[title="Cancel"] {
            background: linear-gradient(to right, #6b7280, #9ca3af) !important;
            margin: 0 4px !important;
        }

        .dxbButton_iOS[title="Cancel"]:hover {
            background: linear-gradient(to right, #4b5563, #6b7280) !important;
        }

        /* Pagination and footer buttons */
        .dxgvPagerBottomPanel_iOS {
            padding: 12px !important;
            background: #f8fafc !important;
            border-top: 1px solid #e5e7eb !important;
            border-radius: 0 0 12px 12px !important;
            display: flex !important;
            justify-content: space-between !important;
            align-items: center !important;
        }

        .dxgvPagerBottomPanel_iOS .dxp-num {
            color: #2563eb !important;
            font-weight: 600 !important;
        }

        .dxgvPagerBottomPanel_iOS .dxp-button {
            border: none !important;
            background: #e5e7eb !important;
            padding: 4px 8px !important;
            border-radius: 4px !important;
            transition: background 0.3s ease !important;
        }

        .dxgvPagerBottomPanel_iOS .dxp-button:hover {
            background: #d1d5db !important;
        }

        .dxgvPagerBottomPanel_iOS .dxp-button img {
            filter: brightness(0) invert(0.5) !important;
            width: 12px !important;
            height: 12px !important;
        }

        .dxgvPagerBottomPanel_iOS a[href*="PreviewChanges"],
        .dxgvPagerBottomPanel_iOS a[href*="HidePreview"] {
            color: #dbeafe !important;
            font-size: 12px !important;
            font-weight: 500 !important;
            text-decoration: none !important;
            padding: 4px 8px !important;
            border-radius: 4px !important;
            transition: background 0.3s ease, color 0.3s ease !important;
        }

        .dxgvPagerBottomPanel_iOS a[href*="PreviewChanges"]:hover,
        .dxgvPagerBottomPanel_iOS a[href*="HidePreview"]:hover {
            background: #dbeafe !important;
            color: #1e40af !important;
        }

        /* Search panel */
        .dxgvSearchPanel_iOS {
            background: #f8fafc !important;
            border: 2px solid #e5e7eb !important;
            border-radius: 8px !important;
            padding: 8px 12px !important;
            margin: 8px 0 !important;
            display: flex !important;
            align-items: center !important;
            position: relative !important;
            width: 100% !important;
        }

        .dxgvSearchPanel_iOS input {
            border: none !important;
            background: transparent !important;
            font-size: 14px !important;
            color: #1f2937 !important;
            padding-left: 28px !important;
            width: 100% !important;
        }

        .dxgvSearchPanel_iOS input:focus {
            outline: none !important;
            box-shadow: 0 0 0 3px rgba(37, 99, 235, 0.15) !important;
        }

        .dxgvSearchPanel_iOS::before {
            content: '';
            display: block;
            width: 16px;
            height: 16px;
             position: absolute;
            left: 10px;
            top: 50%;
            transform: translateY(-50%);
            transition: transform 0.2s ease;
        }

        /* Popup styles */
        .dxpc-mainDiv_iOS {
            background: rgba(255, 255, 255, 0.95) !important;
            backdrop-filter: blur(10px) !important;
            border-radius: 16px !important;
            box-shadow: 0 12px 48px rgba(0, 0, 0, 0.2) !important;
            padding: 0 !important;
            max-width: 480px !important;
            width: 90% !important;
            border: 1px solid rgba(255, 255, 255, 0.2) !important;
            overflow: hidden !important;
            animation: popupOpen 0.3s ease-out forwards !important;
        }

        .dxpc-header_iOS {
            background: linear-gradient(135deg, #2563eb, #f97316) !important;
            color: #ffffff !important;
            font-weight: 600 !important;
            font-size: 16px !important;
            padding: 12px 20px !important;
            border-bottom: none !important;
            display: flex !important;
            align-items: center !important;
            justify-content: space-between !important;
        }

        .dxpc-header_iOS .dxpc-closeBtn {
            filter: brightness(0) invert(1) !important;
            width: 18px !important;
            height: 18px !important;
            transition: transform 0.2s ease !important;
        }

        .dxpc-header_iOS .dxpc-closeBtn:hover {
            transform: rotate(90deg) !important;
        }

        .dxpc-content {
            padding: 20px !important;
        }

        .dxpc-content label {
            display: block !important;
            font-size: 14px !important;
            font-weight: 600 !important;
            color: #12937 !important;
            margin-bottom: 8px !important;
        }

        .dxpc-content .dxeTextBoxSys {
            width: 100% !important;
            padding: 10px 14px !important;
            border: 2px solid #e5e7eb !important;
            border-radius: 8px !important;
            font-size: 14px !important;
            color: #1f2937 !important;
            background: #f8fafc !important;
            transition: border-color 0.3s ease, box-shadow 0.3s ease !important;
        }

        .dxpc-content .dxeTextBoxSys:focus {
            outline: none !important;
            border-color: #2563eb !important;
            box-shadow: 0 0 0 4px rgba(37, 99, 235, 0.2) !important;
        }

        .popup-buttons {
            display: flex !important;
            justify-content: flex-end !important;
            gap: 10px !important;
            margin-top: 20px !important;
        }

        .popup-buttons .dxbButton_iOS {
            padding: 8px 16px !important;
            font-size: 14px !important;
            font-weight: 600 !important;
            min-width: 80px !important;
            height: 36px !important;
            border-radius: 8px !important;
            transition: transform 0.2s ease, box-shadow 0.2s ease !important;
        }

        .popup-buttons .dxbButton_iOS:hover {
            transform: translateY(-2px) !important;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.15) !important;
        }

        .popup-buttons .dxbButton_iOS img {
            margin-right: 6px !important;
            width: 14px !important;
            height: 14px !important;
        }

        /* Splitter styles */
        .dxsplControl_iOS {
            border-radius: 12px !important;
            overflow: hidden !important;
            background: #ffffff !important;
            box-shadow: 0 6px 24px rgba(0, 0, 0, 0.1) !important;
            animation: fadeIn 0.6s ease-out;
            width: 100% !important;
            height: 100% !important;
        }

        .dxsplPane_iOS {
            overflow: hidden !important;
        }

        /* Tab styles */
        .dxtc-strip_iOS {
            background: transparent !important;
            position: relative !important;
            width: 100% !important;
            border-bottom: 1px solid #e5e7eb !important;
        }

        .dxtc-tab_iOS {
            border-radius: 8px 8px 0 0 !important;
            border: none !important;
            background: #f8fafc !important;
            font-weight: 500 !important;
            font-size: 14px !important;
            padding: 10px 20px !important;
            color: #1f2937 !important;
            transition: color 0.3s ease, background 0.3s ease !important;
        }

        .dxtc-tab_iOS:hover {
            color: #2563eb !important;
            background: #dbeafe !important;
        }

        .dxtc-activeTab_iOS {
            color: #2563eb !important;
            background: #dbeafe !important;
            border-bottom: 2px solid #f97316 !important;
        }

        .dxtc-content_iOS {
            padding: 16px !important;
            background: #ffffff !important;
            border-radius: 0 0 12px 12px !important;
        }

        /* Header styles */
        .dashboard-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
            width: 100%;
        }

        .dashboard-header-title {
             font-size: 24px;
 font-weight: 700;
 color: #2563eb;
 display: flex;
 align-items: center;
 gap: 12px;
 animation: slideIn 0.8s ease-out;
 position: relative;
 padding-bottom: 6px;
     border-block-start:100px
        }

        .dashboard-header-title::after {
            content: '';
            position: absolute;
            bottom: 0;
            left: 0;
            width: 50%;
            height: 2px;
            background: linear-gradient(to right, #2563eb, #f97316);
            border-radius: 2px;
        }

        /* Section titles */
        .section-title {
            font-size: 18px;
            font-weight: 700;
            color: #2563eb;
            margin: 0 0 16px 0;
            position: relative;
            display: inline-block;
            padding-bottom: 6px;
        }

        .section-title::after {
            content: '';
            position: absolute;
            bottom: 0;
            left: 0;
            width: 50%;
            height: 2px;
            background: linear-gradient(to right, #2563eb, #f97316);
            border-radius: 2px;
        }

        /* Loading animation */
        .dxgvLoadingPanel_iOS {
            background: rgba(255, 255, 255, 0.95) !important;
            border-radius: 12px !important;
            box-shadow: 0 6px 24px rgba(0, 0, 0, 0.1) !important;
        }

        .dxgvLoadingPanel_iOS .dxlp-loadingImage {
            display: none !important;
        }

        .dxgvLoadingPanel_iOS::after {
            content: '';
            position: absolute;
            top: 50%;
            left: 50%;
            width: 36px;
            height: 36px;
            border: 4px solid #2563eb;
            border-top: 4px solid #f97316;
            border-radius: 50%;
            animation: spin 1s linear infinite;
            transform: translate(-50%, -50%);
        }

        /* Animations */
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(12px); }
            to { opacity: 1; transform: translateY(0); }
        }

        @keyframes pulse {
            0% { transform: scale(1); }
            50% { transform: scale(1.05); }
            100% { transform: scale(1); }
        }

        @keyframes highlightRow {
            from { background-color: #ffffff; }
            to { background-color: #dbeafe; }
        }

        @keyframes popupOpen {
            from { opacity: 0; transform: scale(0.9); }
            to { opacity: 1; transform: scale(1); }
        }

        @keyframes slideIn {
            from { opacity: 0; transform: translateX(-20px); }
            to { opacity: 1; transform: translateX(0); }
        }

        @keyframes spin {
            0% { transform: translate(-50%, -50%) rotate(0deg); }
            100% { transform: translate(-50%, -50%) rotate(360deg); }
        }

        /* Responsive design */
        @media (max-width: 1024px) {
            .splitter-container {
                flex-wrap: wrap;
                height: auto;
            }

            .splitter-item-roles, .splitter-item-resources {
                min-width: 100%;
                height: 400px;
            }
        }

        @media (max-width: 768px) {
            body {
                padding: 16px;
            }

            #form1 {
                padding: 16px;
            min-height: auto;
                min-width:auto ; 
            }

            .dashboard-header-title {
                font-size: 20px;
            }

            .section-title {
                font-size: 16px;
            }

            .splitter-item-roles, .splitter-item-resources {
                height: 350px;
            }

            .dxgvHeader_iOS {
                font-size: 12px !important;
                padding: 10px !important;
            }

            .dxgvDataRow_iOS td {
                font-size: 13px !important;
                padding: 8px !important;
            }

            .dxbButton_iOS {
                padding: 4px 8px !important;
                min-width: 20px !important;
                height: 20px !important;
            }

            .dxbButton_iOS[title="Add New Role"] {
                width: 36px !important;
                height: 36px !important;
            }
        }

        @media (max-width: 480px) {
            body {
                padding: 12px;
            }

            #form1 {
                padding: 12px;
                min-height: auto;
                min-width:5000px;
            }

            .dashboard-header-title {
                font-size: 18px;
            }

            .section-title {
                font-size: 14px;
            }

            .splitter-item-roles, .splitter-item-resources {
                height: auto;
            }

            .dxgvHeader_iOS {
                font-size: 11px !important;
                padding: 8px !important;
            }

            .dxgvDataRow_iOS td {
                font-size: 12px !important;
                padding: 6px !important;
            }

            .dxbButton_iOS {
                padding: 3px 6px !important;
                min-width: 18px !important;
                height: 18px !important;
            }

            .dxbButton_iOS[title="Add New Role"] {
                width: 32px !important;
                height: 32px !important;
            }

            .dxpc-mainDiv_iOS {
                width: 95% !important;
            }

            .popup-buttons {
                flex-direction: column !important;
                gap: 8px !important;
            }

            .popup-buttons .dxbButton_iOS {
                width: 100% !important;
                min-width: unset !important;
            }
        }
    </style>
    <script>
        // Debug DevExpress callbacks
        function debugCallback(s, e) {
            console.log('Callback executed:', s.GetMainElement());
        }

        // Particle Background Effect
        document.addEventListener('DOMContentLoaded', function () {
            const canvas = document.getElementById('particle-canvas');
            const ctx = canvas.getContext('2d');
            canvas.width = window.innerWidth;
            canvas.height = window.innerHeight;

            let particlesArray = [];
            const numberOfParticles = 50;
            let mouse = { x: null, y: null, radius: 100 };

            // Handle mouse movement
            window.addEventListener('mousemove', function (event) {
                mouse.x = event.x;
                mouse.y = event.y;
            });

            // Particle class
            class Particle {
                constructor() {
                    this.x = Math.random() * canvas.width;
                    this.y = Math.random() * canvas.height;
                    this.size = Math.random() * 5 + 1;
                    this.speedX = Math.random() * 3 - 1.5;
                    this.speedY = Math.random() * 3 - 1.5;
                    this.color = `rgba(${Math.random() * 255}, ${Math.random() * 255}, ${Math.random() * 255}, 0.7)`;
                }

                update() {
                    this.x += this.speedX;
                    this.y += this.speedY;

                    // Bounce off edges
                    if (this.x + this.size > canvas.width || this.x - this.size < 0) {
                        this.speedX = -this.speedX;
                    }
                    if (this.y + this.size > canvas.height || this.y - this.size < 0) {
                        this.speedY = -this.speedY;
                    }

                    // Interaction with mouse
                    let dx = mouse.x - this.x;
                    let dy = mouse.y - this.y;
                    let distance = Math.sqrt(dx * dx + dy * dy);
                    if (distance < mouse.radius) {
                        let force = (mouse.radius - distance) / mouse.radius;
                        let angle = Math.atan2(dy, dx);
                        this.speedX -= Math.cos(angle) * force * 2;
                        this.speedY -= Math.sin(angle) * force * 2;
                    }
                }

                draw() {
                    ctx.fillStyle = this.color;
                    ctx.beginPath();
                    ctx.arc(this.x, this.y, this.size, 0, Math.PI * 2);
                    ctx.fill();
                }
            }

            // Initialize particles
            function init() {
                particlesArray = [];
                for (let i = 0; i < numberOfParticles; i++) {
                    particlesArray.push(new Particle());
                }
            }

            // Animate particles
            function animate() {
                ctx.clearRect(0, 0, canvas.width, canvas.height);
                for (let i = 0; i < particlesArray.length; i++) {
                    particlesArray[i].update();
                    particlesArray[i].draw();

                    // Connect particles
                    for (let j = i + 1; j < particlesArray.length; j++) {
                        let dx = particlesArray[i].x - particlesArray[j].x;
                        let dy = particlesArray[i].y - particlesArray[j].y;
                        let distance = Math.sqrt(dx * dx + dy * dy);
                        if (distance < 100) {
                            ctx.strokeStyle = `rgba(37, 99, 235, ${1 - distance / 100})`;
                            ctx.lineWidth = 1;
                            ctx.beginPath();
                            ctx.moveTo(particlesArray[i].x, particlesArray[i].y);
                            ctx.lineTo(particlesArray[j].x, particlesArray[j].y);
                            ctx.stroke();
                        }
                    }
                }
                requestAnimationFrame(animate);
            }

            init();
            animate();

            // Handle window resize
            window.addEventListener('resize', function () {
                canvas.width = window.innerWidth;
                canvas.height = window.innerHeight;
                init();
            });
        });
    </script>
</head>
<body>
    <canvas id="particle-canvas"></canvas>
    <form id="form1" runat="server">
        <script type="text/javascript">
            var currentRoleId = '';

            function ShowAddPopup() {
                try {
                    console.log('ShowAddPopup called');
                    if (typeof popupRole === 'undefined' || typeof txtDescription === 'undefined') {
                        alert('Error: Popup or text box not initialized.');
                        return;
                    }
                    txtDescription.SetText('');
                    popupRole.SetHeaderText('Add New Role');
                    currentRoleId = '';
                    popupRole.Show();
                } catch (e) {
                    console.error('Error in ShowAddPopup:', e);
                    alert('An error occurred while opening the popup: ' + e.message);
                }
            }

            function ShowEditPopup(s, e) {
                try {
                    console.log('ShowEditPopup called');
                    var index = GridCl.GetFocusedRowIndex();
                    if (index >= 0) {
                        var description = GridCl.GetRowValues(index, 'Description');
                        var id = GridCl.GetRowKey(index);
                        txtDescription.SetText(description);
                        popupRole.SetHeaderText('Edit Role');
                        currentRoleId = id;
                        popupRole.Show();
                    }
                } catch (e) {
                    console.error('Error in ShowEditPopup:', e);
                    alert('An error occurred while opening the edit popup: ' + e.message);
                }
            }

            function SavePopup() {
                try {
                    var description = txtDescription.GetText();
                    if (description.trim() === '') {
                        alert('Description cannot be empty.');
                        return;
                    }
                    if (currentRoleId === '') {
                        GridCl.AddNewRow();
                        GridCl.SetEditValue('Description', description);
                        GridCl.UpdateEdit();
                    } else {
                        var index = GridCl.GetFocusedRowIndex();
                        if (index >= 0) {
                            GridCl.SetEditValue('Description', description);
                            GridCl.UpdateEdit();
                        }
                    }
                    popupRole.Hide();
                } catch (e) {
                    console.error('Error in SavePopup:', e);
                    alert('An error occurred while saving: ' + e.message);
                }
            }

            function CancelPopup() {
                popupRole.Hide();
            }

            function AddCl() {
                ShowAddPopup();
            }

            function DelCl() {
                var index = GridCl.GetFocusedRowIndex();
                if (index >= 0) {
                    GridCl.DeleteRow(index);
                }
            }

            function MenuItemClickGamme(e) {
                if (!e.item) return;
                var name = e.item.name;
                if (name === "mAdd") AddCl();
                if (name === "mDelete") DelCl();
            }

            function grdInterventionContextMenu(s, e) {
                var x = ASPxClientUtils.GetEventX(e.htmlEvent);
                var y = ASPxClientUtils.GetEventY(e.htmlEvent);
                GridCl.SetFocusedRowIndex(e.index);
                pupmnInspection.ShowAtPos(x, y);
            }

            function onRowClick() {
                console.log('onRowClick called');
                GridRessources.PerformCallback();
                GridRC.PerformCallback();
                GridCl.GetRowValues(GridCl.GetFocusedRowIndex(), 'ID_Role', ShowRole);
            }

            function ShowRole(value) {
                console.log('ShowRole called with value:', value);
                txtRole.SetText(value);
            }

            function calback_Ressource() {
                console.log('calback_Ressource called');
                GridRessources.PerformCallback();
            }

            function OnCustomButtonClick(s, e) {
                if (e.buttonID === "EditButton") {
                    GridCl.SetFocusedRowIndex(e.visibleIndex);
                    ShowEditPopup();
                }
            }
        </script>

        <div class="dashboard-header">
            <div class="dashboard-header-title">
                <span>  Permission Management</span>
            </div>
        </div>

        <div class="card">
            <h3 class="section-title">Current Role</h3>
            <dx:ASPxTextBox ID="txtRole" ClientInstanceName="txtRole" runat="server" Width="100%" Theme="iOS" ReadOnly="true"></dx:ASPxTextBox>
        </div>
        <div class="card">
    
    <div class="grid-container">
        <div class="splitter-container">
            <!-- Splitter 1: Roles Management -->
            <div class="splitter-item-roles">
                <dx:ASPxSplitter ID="ASPxSplitter1" runat="server" Height="100%" Width="100%" Theme="iOS" FullscreenMode="true">
                    <Panes>
                        <dx:SplitterPane ScrollBars="vertical">
                            <ContentCollection>
                                <dx:SplitterContentControl ID="SplitterContentControl1" runat="server" ClientInstanceName="clientSplitterContentControl1">
                                    <div class="card">
                                        <h3 class="section-title">Roles </h3>
                                        <div class="grid-container">
                                            <dx:ASPxGridView ID="GridCl" ClientInstanceName="GridCl" Theme="iOS"
                                                runat="server" AutoGenerateColumns="False" DataSourceID="SqlRole"
                                                KeyFieldName="ID_Role" Width="100%">
                                                <ClientSideEvents ContextMenu="grdInterventionContextMenu" FocusedRowChanged="onRowClick" RowDblClick="ShowEditPopup" CustomButtonClick="OnCustomButtonClick" EndCallback="debugCallback" />
                                                <Columns>
                                                    <dx:GridViewCommandColumn ButtonType="Image" Caption=" " Width="0px"
                                                        ShowSelectCheckbox="false" VisibleIndex="0"
                                                        ShowUpdateButton="false"
                                                        ShowDeleteButton="false"
                                                        ShowCancelButton="false">
                                                        <CustomButtons>
                                                            <dx:GridViewCommandColumnCustomButton ID="EditButton" Text="Edit">
                                                                <Image IconID="iconbuilder_actions_edit_svg_16x16" Width="16px" ToolTip="Edit" />
                                                            </dx:GridViewCommandColumnCustomButton>
                                                        </CustomButtons>
                                                        <HeaderTemplate>
                                                            <div class="add-button-container">
                                                                <dx:ASPxButton ID="btnAdd" ClientInstanceName="btnAdd" HorizontalAlign="Center" runat="server" Text=" " RenderMode="Link" AutoPostBack="false" ToolTip="Add New Role">
                                                                    <Image IconID="iconbuilder_actions_add_svg_16x16" Width="16px"></Image>
                                                                    <ClientSideEvents Click="function(s, e) { ShowAddPopup(); }" />
                                                                </dx:ASPxButton>
                                                            </div>
                                                        </HeaderTemplate>
                                                    </dx:GridViewCommandColumn>
                                                    <dx:GridViewDataTextColumn FieldName="ID_Role" Visible="false" />
                                                    <dx:GridViewDataTextColumn FieldName="Description" Caption="Description" Width="410px" />
                                                </Columns>
                                                <SettingsCommandButton>
                                                    <DeleteButton>
                                                        <Image IconID="iconbuilder_actions_delete_svg_16x16" Width="16px" ToolTip="Delete" />
                                                    </DeleteButton>
                                                    <CancelButton Text="Cancel">
                                                        <Image IconID="iconbuilder_actions_undo_svg_16x16" Width="16px" />
                                                    </CancelButton>
                                                    <UpdateButton Text="Save">
                                                        <Image IconID="iconbuilder_actions_edit_svg_16x16" Width="16px" />
                                                    </UpdateButton>
                                                </SettingsCommandButton>
                                                <SettingsPager PageSize="50" EnableAdaptivity="true">
                                                    <PageSizeItemSettings Visible="true" Position="Right" ShowAllItem="true" />
                                                </SettingsPager>
                                                <SettingsSearchPanel Visible="true" />
                                                <SettingsEditing Mode="Batch" />
                                                <SettingsBehavior AutoExpandAllGroups="true" AllowFocusedRow="True" AllowDragDrop="False" AllowGroup="False" />
                                                <Settings ShowColumnHeaders="true" VerticalScrollableHeight="250" VerticalScrollBarMode="Visible" HorizontalScrollBarMode="Auto" />
                                            </dx:ASPxGridView>
                                        </div>
                                    </div>
                                </dx:SplitterContentControl>
                            </ContentCollection>
                        </dx:SplitterPane>
                    </Panes>
                </dx:ASPxSplitter>
            </div>

            <!-- Splitter 2: Resources, Control Assignment, and User List -->
            <div class="splitter-item-resources">
                <dx:ASPxSplitter ID="ASPxSplitter2" runat="server" Height="100%" Width="100%" Theme="iOS" FullscreenMode="true">
                    <Panes>
                        <dx:SplitterPane ScrollBars="Auto">
                            <ContentCollection>
                                <dx:SplitterContentControl ID="SplitterContentControl2" runat="server" ClientInstanceName="clientSplitterContentControl2">
                                    <div class="card">
                                        <dx:ASPxPageControl ID="MainTabControl" runat="server" Width="100%" Height="100%" EnableTabScrolling="true" EnableCallBacks="true" ActiveTabIndex="0" ClientInstanceName="clientMainTabControl" Theme="iOS">
                                            <TabPages>
                                                <dx:TabPage Text="Ressources">
                                                    <ContentCollection>
                                                        <dx:ContentControl ID="ContentControl1" runat="server">
                                                            <dx:ASPxCallbackPanel ID="callDetailArticle" runat="server" Width="100%" ClientInstanceName="callDetailArticle" OnCallback="callDetailArticle_Callback">
                                                                <ClientSideEvents EndCallback="debugCallback" />
                                                                <PanelCollection>
                                                                    <dx:PanelContent>
                                                                        <div style="width: 100%; height: 100%;">
                                                                            <dx:ASPxFormLayout ID="formLayout" runat="server" Width="100%" Height="100%">
                                                                                <Items>
                                                                                    <dx:LayoutGroup Caption="Ressource" ShowCaption="False" GroupBoxStyle-Caption-Font-Bold="true" Width="100%">
                                                                                        <Items>
                                                                                            <dx:LayoutItem ShowCaption="False">
                                                                                                <LayoutItemNestedControlCollection>
                                                                                                    <dx:LayoutItemNestedControlContainer>
                                                                                                        <div class="card">
                                                                                                            <h3 class="section-title">Resources</h3>
                                                                                                            <div class="grid-container">
                                                                                                                <dx:ASPxGridView ID="GridRessources" ClientInstanceName="GridRessources" runat="server"
                                                                                                                    Width="100%" AutoGenerateColumns="False" Theme="iOS"
                                                                                                                    OnCustomCallback="GridRessources_CustomCallback"
                                                                                                                    KeyFieldName="ID"
                                                                                                                    DataSourceID="SqlAP_Ressource">
                                                                                                                    <ClientSideEvents EndCallback="debugCallback" />
                                                                                                                    <SettingsBehavior AllowFocusedRow="true" AllowSelectByRowClick="false" />
                                                                                                                    <Columns>
                                                                                                                        <dx:GridViewDataTextColumn Caption="Nom & Prénom" FieldName="Nom_Prenom" Width="100%" HeaderStyle-Font-Bold="true" />
                                                                                                                    </Columns>
                                                                                                                    <Settings ShowFilterRow="true" ShowFooter="true" VerticalScrollableHeight="100" VerticalScrollBarMode="Visible" />
                                                                                                                    <SettingsPager>
                                                                                                                        <PageSizeItemSettings Visible="true" Items="10, 20, 50" />
                                                                                                                    </SettingsPager>
                                                                                                                </dx:ASPxGridView>
                                                                                                            </div>
                                                                                                        </div>
                                                                                                    </dx:LayoutItemNestedControlContainer>
                                                                                                </LayoutItemNestedControlCollection>
                                                                                            </dx:LayoutItem>
                                                                                        </Items>
                                                                                    </dx:LayoutGroup>
                                                                                    <dx:LayoutGroup Caption="Affectation_Controle" ShowCaption="False" GroupBoxStyle-Caption-Font-Bold="true" Width="100%">
                                                                                        <Items>
                                                                                            <dx:LayoutItem ShowCaption="False">
                                                                                                <LayoutItemNestedControlCollection>
                                                                                                    <dx:LayoutItemNestedControlContainer>
                                                                                                        <div class="card">
                                                                                                            <h3 class="section-title">Control Assignment</h3>
                                                                                                            <div class="grid-container">
                                                                                                                <dx:ASPxGridView ID="GridRC" ClientInstanceName="GridRC" runat="server"
                                                                                                                    Theme="iOS" Width="100%" AutoGenerateColumns="False"
                                                                                                                    KeyFieldName="ID_Controle" DataSourceID="SqlRC"
                                                                                                                    OnCustomCallback="GridRC_CustomCallback">
                                                                                                                    <ClientSideEvents EndCallback="debugCallback" />
                                                                                                                    <SettingsBehavior AllowFocusedRow="true" />
                                                                                                                    <Columns>
                                                                                                                        <dx:GridViewDataTextColumn FieldName="ID_Controle" Visible="false" HeaderStyle-Font-Bold="true" />
                                                                                                                        <dx:GridViewDataTextColumn Caption="Description" FieldName="Description" Width="70%" HeaderStyle-Font-Bold="true" />
                                                                                                                        <dx:GridViewDataCheckColumn Caption="Etat" FieldName="Etat" Width="30%" />
                                                                                                                    </Columns>
                                                                                                                    <SettingsEditing Mode="Batch" />
                                                                                                                    <Settings ShowFooter="true" VerticalScrollableHeight="400" VerticalScrollBarMode="Visible" />
                                                                                                                    <SettingsPager>
                                                                                                                        <PageSizeItemSettings Visible="true" Items="10, 20, 50" />
                                                                                                                    </SettingsPager>
                                                                                                                </dx:ASPxGridView>

                                                                                                            </div>
                                                                                                        </div>
                                                                                                    </dx:LayoutItemNestedControlContainer>
                                                                                                </LayoutItemNestedControlCollection>
                                                                                            </dx:LayoutItem>
                                                                                        </Items>
                                                                                    </dx:LayoutGroup>
                                                                                </Items>
                                                                            </dx:ASPxFormLayout>
                                                                        </div>

                                                                    </dx:PanelContent>
                                                                </PanelCollection>
                                                            </dx:ASPxCallbackPanel>
                                                        </dx:ContentControl>
                                                    </ContentCollection>
                                                </dx:TabPage>

                                                <dx:TabPage Text="Liste des Utilisateurs">
                                                    <ContentCollection>
                                                        <dx:ContentControl ID="ContentControl3" runat="server">
                                                            <div style="width: 100%; height: 100%;">
                                                                <dx:ASPxFormLayout ID="ASPxFormLayout2" runat="server" Width="100%" Height="100%">
                                                                    <Items>
                                                                        <dx:LayoutItem ShowCaption="false">
                                                                            <LayoutItemNestedControlCollection>
                                                                                <dx:LayoutItemNestedControlContainer>
                                                                                    <div class="card">
                                                                                        <h3 class="section-title">User List</h3>
                                                                                        <div class="grid-container">
                                                                                            <dx:ASPxGridView ID="GridUsers" ClientInstanceName="GridUsers" runat="server"
                                                                                                Theme="iOS" Width="100%" AutoGenerateColumns="False"
                                                                                                KeyFieldName="ID" DataSourceID="SqlAllRessource">
                                                                                                <ClientSideEvents EndCallback="calback_Ressource" />
                                                                                                <SettingsBehavior AllowFocusedRow="true" />
                                                                                                <Columns>
                                                                                                    <dx:GridViewDataTextColumn Caption="Nom & Prénom" FieldName="Nom_Prenom" Width="50%" />
                                                                                                    <dx:GridViewDataComboBoxColumn FieldName="ID_Role" Caption="Role" Width="50%">
                                                                                                        <PropertiesComboBox DataSourceID="SqlRoleAllUser"
                                                                                                            TextField="Description" ValueField="ID_Role" />
                                                                                                    </dx:GridViewDataComboBoxColumn>
                                                                                                </Columns>
                                                                                                <SettingsEditing Mode="Batch" />
                                                                                                <Settings
                                                                                                    ShowFilterRow="true"
                                                                                                    ShowGroupPanel="true"
                                                                                                    ShowFooter="true"
                                                                                                    VerticalScrollableHeight="300"
                                                                                                    VerticalScrollBarMode="Visible" />
                                                                                                <SettingsPager>
                                                                                                    <PageSizeItemSettings Visible="true" Items="10, 20, 50" />
                                                                                                </SettingsPager>
                                                                                            </dx:ASPxGridView>
                                                                                        </div>
                                                                                    </div>
                                                                                </dx:LayoutItemNestedControlContainer>
                                                                            </LayoutItemNestedControlCollection>
                                                                        </dx:LayoutItem>
                                                                    </Items>
                                                                </dx:ASPxFormLayout>
                                                            </div>
                                                        </dx:ContentControl>
                                                    </ContentCollection>
                                                </dx:TabPage>
                                            </TabPages>
                                        </dx:ASPxPageControl>
                                    </div>
                                </dx:SplitterContentControl>
                            </ContentCollection>
                        </dx:SplitterPane>
                    </Panes>
                </dx:ASPxSplitter>
            </div>
        </div>
        </div>

        <dx:ASPxPopupControl ID="popupRole" ClientInstanceName="popupRole" runat="server" Theme="iOS"
            PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" Modal="true"
            CloseAction="CloseButton" HeaderText="Add New Role">
            <ContentCollection>
                <dx:PopupControlContentControl>
                    <div class="dxpc-content">
                        <label for="txtDescription">Role Description</label>
                        <dx:ASPxTextBox ID="txtDescription" ClientInstanceName="txtDescription" runat="server"
                            Width="100%" Theme="iOS">
                        </dx:ASPxTextBox>
                        <div class="popup-buttons">
                            <dx:ASPxButton ID="btnSavePopup" runat="server" Text="Save" Theme="iOS" AutoPostBack="false" ToolTip="Save">
                                <Image IconID="iconbuilder_actions_save_svg_16x16" Width="16px" />
                                <ClientSideEvents Click="SavePopup" />
                            </dx:ASPxButton>
                            <dx:ASPxButton ID="btnCancelPopup" runat="server" Text="Cancel" Theme="iOS" AutoPostBack="false" ToolTip="Cancel">
                                <Image IconID="iconbuilder_actions_close_svg_16x16" Width="16px" />
                                <ClientSideEvents Click="CancelPopup" />
                            </dx:ASPxButton>
                        </div>
                    </div>
                </dx:PopupControlContentControl>
            </ContentCollection>
        </dx:ASPxPopupControl>

        <!-- Context Menu for GridCl -->
        <dx:ASPxPopupMenu ID="pupmnInspection" ClientInstanceName="pupmnInspection" runat="server" Theme="iOS">
            <Items>
                <dx:MenuItem Name="mAdd" Text="Add"></dx:MenuItem>
                <dx:MenuItem Name="mDelete" Text="Delete"></dx:MenuItem>
            </Items>
            <ClientSideEvents ItemClick="MenuItemClickGamme" />
        </dx:ASPxPopupMenu>

        <asp:SqlDataSource ID="SqlRole" runat="server"
            ConnectionString="<%$ ConnectionStrings:ErpbilansocialConnectionString %>"
            SelectCommand="SelectRole" SelectCommandType="StoredProcedure"
            DeleteCommand="deleteRole" DeleteCommandType="StoredProcedure"
            UpdateCommand="updateRole" UpdateCommandType="StoredProcedure"
            InsertCommand="insertRole" InsertCommandType="StoredProcedure">
            <DeleteParameters>
                <asp:Parameter Name="ID_Role" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:Parameter Name="ID_Role" />
                <asp:Parameter Name="Description" />
            </UpdateParameters>
            <InsertParameters>
                <asp:Parameter Name="Description" />
            </InsertParameters>
        </asp:SqlDataSource>

        <asp:SqlDataSource ID="SqlRoleAllUser" runat="server"
            ConnectionString="<%$ ConnectionStrings:ErpbilansocialConnectionString %>"
            SelectCommand="SelectRole" SelectCommandType="StoredProcedure"></asp:SqlDataSource>

        <asp:SqlDataSource ID="SqlAP_Ressource" runat="server"
            ConnectionString="<%$ ConnectionStrings:ErpbilansocialConnectionString %>"
            SelectCommand="User_session_GetByIdRole" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:Parameter Name="ID_Role" />
            </SelectParameters>
        </asp:SqlDataSource>

        <asp:SqlDataSource ID="SqlAllRessource" runat="server"
            ConnectionString="<%$ ConnectionStrings:ErpbilansocialConnectionString %>"
            SelectCommand="SelectUsersession" SelectCommandType="StoredProcedure"
            UpdateCommand="UpdateUsersession1" UpdateCommandType="StoredProcedure">
            <UpdateParameters>
                <asp:Parameter Name="ID" />
                <asp:Parameter Name="ID_Role" />
            </UpdateParameters>
        </asp:SqlDataSource>

        <asp:SqlDataSource ID="SqlRC" runat="server"
            ConnectionString="<%$ ConnectionStrings:ErpbilansocialConnectionString %>"
            SelectCommand="GetByRole" SelectCommandType="StoredProcedure"
            UpdateCommand="Role_Controle_UpdateEtatC" UpdateCommandType="StoredProcedure" OnSelecting="SqlRC_Selecting">
            <UpdateParameters>
                <asp:Parameter Name="ID_Controle" />
                <asp:Parameter Name="Etat" />
                <asp:ControlParameter ControlID="txtRole" Name="ID_Role" />
            </UpdateParameters>
            <SelectParameters>
                <asp:Parameter Name="ID_Role" />
            </SelectParameters>
        </asp:SqlDataSource>
    </form>
</body>
</html>
l>