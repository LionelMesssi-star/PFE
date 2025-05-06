<%@ Page Language="C#" AutoEventWireup="true" CodeFile="DepenseFormation.aspx.cs" Inherits="DepenseFormation" %>

<%@ Register Assembly="DevExpress.Web.v20.1, Version=20.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Depense Formation</title>
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
            min-height: auto;
            display: flex;
            justify-content: center;
            align-items: flex-start;
        }

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

        #form1 {
            max-width: 1200px;
            width: 100%;
            background: #ffffff;
            border-radius: 16px;
            box-shadow: 0 10px 40px rgba(0, 0, 0, 0.08);
            padding: 24px;
            min-height: auto;
            animation: fadeIn 0.6s ease-out;
            display: flex;
            flex-direction: column;
            gap: 20px;
        }

        .card {
            background: #ffffff;
            border-radius: 12px;
            box-shadow: 0 6px 24px rgba(0, 0, 0, 0.1);
            padding: 16px;
            animation: fadeIn 0.6s ease-out;
            width: 100%;
            overflow: hidden;
        }

        .grid-container {
            width: 100%;
            overflow: hidden;
            flex: 1;
            display: flex;
            flex-direction: column;
        }

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
            display: flex !important;
            justify-content: center !important;
            align-items: center !important;
            gap: 4px !important;
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

        .dxbButton_iOS[title="Add New Depense"] {
            background: radial-gradient(circle at center, #fb923c, #f97316) !important;
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

        .dxbButton_iOS[title="Add New Depense"]:hover {
            background: radial-gradient(circle at center, #f97316, #ea580c) !important;
        }

        .add-button-container {
            display: flex !important;
            justify-content: center !important;
            align-items: center !important;
            padding: 8px 0 !important;
        }

        .dxgvCommandColumn_iOS .dxbButton_iOS[title="Edit"],
        .dxgvCommandColumn_iOS .dxbButton_iOS[title="Edit"] {
            background: linear-gradient(to right, #0d9488, #14b8a6) !important;
            margin: 0 2px !important;
            padding: 8px 16px !important;
            font-size: 14px !important;
            font-weight: 600 !important;
            min-width: 60px !important;
            height: 36px !important;
            border-radius: 8px !important;
        }

        .dxgvCommandColumn_iOS .dxbButton_iOS[title="Edit"]:hover,
        .dxgvCommandColumn_iOS .dxbButton_iOS[title="Edit"]:hover {
            background: linear-gradient(to right, #0f766e, #0d9488) !important;
            transform: translateY(-2px) !important;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.15) !important;
        }

        .dxgvCommandColumn_iOS .dxbButton_iOS[title="Delete"],
        .dxgvCommandColumn_iOS .dxbButton_iOS[title="Delete"] {
            background: linear-gradient(to right, #b91c1c, #7f1d1d) !important;
            margin: 0 2px !important;
            padding: 8px 16px !important;
            font-size: 14px !important;
            font-weight: 600 !important;
            min-width: 60px !important;
            height: 36px !important;
            border-radius: 8px !important;
        }

        .dxgvCommandColumn_iOS .dxbButton_iOS[title="Delete"]:hover,
        .dxgvCommandColumn_iOS .dxbButton_iOS[title="Delete"]:hover {
            background: linear-gradient(to right, #7f1d1d, #b91c1c) !important;
            transform: translateY(-2px) !important;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.15) !important;
        }

        .dxgvCommandColumn_iOS .dxbButton_iOS {
            margin: 0 !important;
        }

        .dxbButton_iOS[title="Save"] {
            background: linear-gradient(to right, #2563eb, #3b82f6) !important;
            margin: 0 4px !important;
        }

        .dxbButton_iOS[title="Save"]:hover {
            background: linear-gradient(to right, #1e40af, #2563eb) !important;
        }

        .dxbButton_iOS[title="Cancel"] {
            background: linear-gradient(to right, #6b7280, #9ca3af) !important;
            margin: 0 4px !important;
        }

        .dxbButton_iOS[title="Cancel"]:hover {
            background: linear-gradient(to right, #4b5563, #6b7280) !important;
        }

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
            color: #2563eb !important;
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
            background: url('data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxNiIgaGVpZ2h0PSIxNiIgZmlsbD0iIzRiNTU2MyIgdmlld0JveD0iMCAwIDI1NiAyNTYiPjxwYXRoIGQ9Ik0yMzIuNDksMjI0LjUsMTc4LjQzLDE3MC40M2EyMS4yNiwyMS4yNiwwLDAsMC03LjM0LTUuNDUsOTYsOTYsMCwxLDAtMTI3LjgyLDEyNy44MiwyMS4yNiwyMS2Niw0LDAsMCwwLDkuNDUsNy4zNGw1NC4wNiw1NC4wNmE4LDAsMCwwLDExLjMyLDAsOCw4LDAsMCwwLDAtMTEuMzJabS0zOC44MS0xNS4zNmE4MCw4MCwwLDExLDE2OS43OC0xNjkuNzgsODAsODAsMCwwLDEtMTY5Ljc4LDE2OS43OFoiPjwvcGF0aD48L3N2Zz4=') no-repeat center;
            position: absolute;
            left: 10px;
            top: 50%;
            transform: translateY(-50%);
            transition: transform 0.2s ease;
        }

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
            color: #1f2937 !important;
            margin-bottom: 8px !important;
        }

        .dxpc-content .dxeTextBoxSys,
        .dxpc-content .dxeComboBoxSys {
            width: 100% !important;
            padding: 10px 14px !important;
            border: 2px solid #e5e7eb !important;
            border-radius: 8px !important;
            font-size: 14px !important;
            color: #1f2937 !important;
            background: #f8fafc !important;
            transition: border-color 0.3s ease, box-shadow 0.3s ease !important;
        }

        .dxpc-content .dxeTextBoxSys:focus,
        .dxpc-content .dxeComboBoxSys:focus {
            outline: none !important;
            border-color: #2563eb !important;
            box-shadow: 0 0 0 4px rgba(37, 99, 235, 0.2) !important;
        }

        .dxpc-content .dxeEditAreaSys {
            width: 100% !important;
        }

        .popup-buttons {
            display: flex !important;
            justify-content: center !important;
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

        @media (max-width: 768px) {
            body {
                padding: 16px;
            }

            #form1 {
                padding: 16px;
                min-height: auto;
            }

            .dashboard-header-title {
                font-size: 20px;
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

            .dxbButton_iOS[title="Add New Depense"] {
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
            }

            .dashboard-header-title {
                font-size: 18px;
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

            .dxbButton_iOS[title="Add New Depense"] {
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
    <script type="text/javascript">
        // Particle Background Effect
        document.addEventListener('DOMContentLoaded', function () {
            const canvas = document.getElementById('particle-canvas');
            const ctx = canvas.getContext('2d');
            canvas.width = window.innerWidth;
            canvas.height = window.innerHeight;

            let particlesArray = [];
            const numberOfParticles = 50;
            let mouse = { x: null, y: null, radius: 100 };

            window.addEventListener('mousemove', function (event) {
                mouse.x = event.x;
                mouse.y = event.y;
            });

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

                    if (this.x + this.size > canvas.width || this.x - this.size < 0) {
                        this.speedX = -this.speedX;
                    }
                    if (this.y + this.size > canvas.height || this.y - this.size < 0) {
                        this.speedY = -this.speedY;
                    }

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

            function init() {
                particlesArray = [];
                for (let i = 0; i < numberOfParticles; i++) {
                    particlesArray.push(new Particle());
                }
            }

            function animate() {
                ctx.clearRect(0, 0, canvas.width, canvas.height);
                for (let i = 0; i < particlesArray.length; i++) {
                    particlesArray[i].update();
                    particlesArray[i].draw();

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

            window.addEventListener('resize', function () {
                canvas.width = window.innerWidth;
                canvas.height = window.innerHeight;
                init();
            });
        });

        var currentDepenseId = '';

        function CliTest() {
            var Nom = lbNom.GetText();
            lbRepe.SetText(Nom);
        }

        function CallAP() {
            cmbArticle.PerformCallback();
            GrdAp.PerformCallback();
        }

        function ShowAddPopup() {
            try {
                console.log('ShowAddPopup called');
                if (typeof popupDepense === 'undefined' || typeof txtTypeDepense === 'undefined' || typeof txtMontant === 'undefined' || typeof dtDate === 'undefined') {
                    alert('Error: Popup or fields not initialized.');
                    return;
                }
                txtTypeDepense.SetText('');
                txtMontant.SetText('');
                dtDate.SetValue(null);
                popupDepense.SetHeaderText('Add New Depense');
                currentDepenseId = '';
                popupDepense.Show();
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
                    GridCl.GetRowValues(index, 'Type_Depense;Montant;Date', function (values) {
                        txtTypeDepense.SetText(values[0] || '');
                        txtMontant.SetText(values[1] || '');
                        dtDate.SetValue(values[2] ? new Date(values[2]) : null);
                        var id = GridCl.GetRowKey(index);
                        popupDepense.SetHeaderText('Edit Depense');
                        currentDepenseId = id;
                        popupDepense.Show();
                    });
                }
            } catch (e) {
                console.error('Error in ShowEditPopup:', e);
                alert('An error occurred while opening the edit popup: ' + e.message);
            }
        }

        function SavePopup() {
            try {
                var typeDepense = txtTypeDepense.GetText();
                var montant = txtMontant.GetText();
                var date = dtDate.GetValue();

                if (typeDepense.trim() === '' || montant.trim() === '' || !date) {
                    alert('All fields are required.');
                    return;
                }

                if (currentDepenseId === '') {
                    // Add new depense
                    GridCl.AddNewRow();
                    GridCl.SetEditValue('Type_Depense', typeDepense);
                    GridCl.SetEditValue('Montant', montant);
                    GridCl.SetEditValue('Date', date);
                    GridCl.UpdateEdit();
                } else {
                    // Update existing depense
                    var index = GridCl.GetFocusedRowIndex();
                    if (index >= 0) {
                        GridCl.StartEditRow(index);
                        GridCl.SetEditValue('Type_Depense', typeDepense);
                        GridCl.SetEditValue('Montant', montant);
                        GridCl.SetEditValue('Date', date);
                        GridCl.UpdateEdit();
                    }
                }
                popupDepense.Hide();
            } catch (e) {
                console.error('Error in SavePopup:', e);
                alert('An error occurred while saving: ' + e.message);
            }
        }

        function CancelPopup() {
            popupDepense.Hide();
        }

        function MenuItemClickGamme(e) {
            if (e.item == null) return;
            var name = e.item.name;
            if (name == "mAdd") ShowAddPopup();
            if (name == "mDelete") DelCl();
        }

        function DelCl() {
            var index = GridCl.GetFocusedRowIndex();
            if (index >= 0) {
                GridCl.DeleteRow(index);
            }
        }

        function grdInterventionContextMenu(s, e) {
            var x = ASPxClientUtils.GetEventX(e.htmlEvent);
            var y = ASPxClientUtils.GetEventY(e.htmlEvent);
            GridCl.SetFocusedRowIndex(e.index);
            pupmnInspection.ShowAtPos(x, y);
        }

        function GridMenuItemInspectionClick(e) {
            if (e.item == null) return;
            var name = e.item.name;
            alert(name);
            if (name == "mAdd") ShowAddPopup();
            if (name == "mDelete") DelCl();
        }

        function OnCustomButtonClick(s, e) {
            if (e.buttonID === "EditButton") {
                GridCl.SetFocusedRowIndex(e.visibleIndex);
                ShowEditPopup(s, e);
            }
        }
    </script>
</head>
<body>
    <canvas id="particle-canvas"></canvas>
    <form id="form1" runat="server">
        <div class="dashboard-header">
            <div class="dashboard-header-title">
                <span>Depense Formation</span>
            </div>
        </div>

        <div class="card">
            <div class="grid-container">
                <asp:SqlDataSource ID="SqlDF" runat="server" ConnectionString="<%$ ConnectionStrings:ErpbilansocialConnectionString %>"
                    SelectCommand="SelectDepense_Formation" SelectCommandType="StoredProcedure"
                    DeleteCommand="deleteDepense_Formation" DeleteCommandType="StoredProcedure"
                    UpdateCommand="updateDepense_Formation" UpdateCommandType="StoredProcedure"
                    InsertCommand="insertDepense_Formation" InsertCommandType="StoredProcedure">
                    <DeleteParameters>
                        <asp:Parameter Name="ID" />
                    </DeleteParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="ID" />
                        <asp:Parameter Name="Type_Depense" />
                        <asp:Parameter Name="Montant" />
                        <asp:Parameter Name="Date" />
                    </UpdateParameters>
                    <InsertParameters>
                        <asp:Parameter Name="Type_Depense" />
                        <asp:Parameter Name="Montant" />
                        <asp:Parameter Name="Date" />
                    </InsertParameters>
                </asp:SqlDataSource>
                <div>
                    <dx:ASPxGridView ID="GridCl" ClientInstanceName="GridCl" Theme="iOS"
                        runat="server" AutoGenerateColumns="False" DataSourceID="SqlDF"
                        KeyFieldName="ID" Width="100%">
                        <ClientSideEvents 
                            ContextMenu="grdInterventionContextMenu" 
                            RowDblClick="ShowEditPopup" 
                            CustomButtonClick="OnCustomButtonClick" 
                            RowClick="function(s, e) { s.SetFocusedRowIndex(e.visibleIndex); }" />
                        <Columns>
                            <dx:GridViewCommandColumn ButtonType="Image" Caption=" " Width="150px"
                                ShowSelectCheckbox="false" VisibleIndex="0"
                                ShowEditButton="false"
                                ShowUpdateButton="true"
                                ShowDeleteButton="true"
                                ShowCancelButton="true">
                                <CustomButtons>
                                    <dx:GridViewCommandColumnCustomButton ID="EditButton" Text="Edit">
                                        <Image IconID="iconbuilder_actions_edit_svg_16x16" Width="16px" ToolTip="Edit" />
                                    </dx:GridViewCommandColumnCustomButton>
                                </CustomButtons>
                                <HeaderTemplate>
                                    <div class="add-button-container">
                                        <dx:ASPxButton ID="btnAddDepense" ClientInstanceName="btnAddDepense" HorizontalAlign="Center" runat="server" Text=" " RenderMode="Link" AutoPostBack="false" ToolTip="Add New Depense">
                                            <Image IconID="iconbuilder_actions_add_svg_16x16" Width="16px"></Image>
                                            <ClientSideEvents Click="function(s, e) { ShowAddPopup(); }" />
                                        </dx:ASPxButton>
                                    </div>
                                </HeaderTemplate>
                            </dx:GridViewCommandColumn>
                            <dx:GridViewDataTextColumn FieldName="ID" Visible="false">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataDateColumn FieldName="Date" Caption="Date" Visible="true">
                                <PropertiesDateEdit>
                                    <CalendarProperties TodayButtonText="Aujourd'hui" ClearButtonText="Effacer">
                                    </CalendarProperties>
                                </PropertiesDateEdit>
                                <EditFormSettings Visible="True" />
                            </dx:GridViewDataDateColumn>
                            <dx:GridViewDataTextColumn FieldName="Type_Depense" Caption="Type Depense"/>
                            <dx:GridViewDataTextColumn FieldName="Montant" Caption="Montant" />
                        </Columns>
                        <SettingsSearchPanel Visible="true" />
                        <SettingsCommandButton>
                            <PreviewChangesButton Text="Preview">
                            </PreviewChangesButton>
                            <EditButton>
                                <Image IconID="iconbuilder_actions_edit_svg_16x16" Width="16px">
                                </Image>
                            </EditButton>
                            <DeleteButton>
                                <Image IconID="iconbuilder_actions_delete_svg_16x16" Width="16px">
                                </Image>
                            </DeleteButton>
                            <CancelButton Text="Cancel">
                                <Image IconID="iconbuilder_actions_undo_svg_16x16" Width="16px">
                                </Image>
                            </CancelButton>
                            <UpdateButton Text="Save">
                                <Image IconID="iconbuilder_actions_edit_svg_16x16" Width="16px">
                                </Image>
                            </UpdateButton>
                        </SettingsCommandButton>
                        <Styles>
                            <FocusedRow BackColor="#F0F8FF" ForeColor="Black"></FocusedRow>
                        </Styles>
                        <SettingsPager PageSize="50" EnableAdaptivity="true">
                            <PageSizeItemSettings Visible="true" Position="Right" ShowAllItem="true">
                            </PageSizeItemSettings>
                        </SettingsPager>
                        <SettingsEditing Mode="Batch">
                        </SettingsEditing>
                        <SettingsBehavior AutoExpandAllGroups="true" AllowDragDrop="False" AllowGroup="False" AllowFocusedRow="True" />
                        <Settings ShowFooter="false" ShowColumnHeaders="true" ShowGroupPanel="false" ShowGroupFooter="VisibleIfExpanded"
                            VerticalScrollableHeight="250" VerticalScrollBarMode="Visible"></Settings>
                    </dx:ASPxGridView>
                </div>

                <dx:ASPxPopupControl ID="popupDepense" ClientInstanceName="popupDepense" runat="server" Theme="iOS"
                    PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="TopSides" Modal="true"
                    CloseAction="CloseButton" HeaderText="Add New Depense">
                    <ContentCollection>
                        <dx:PopupControlContentControl>
                            <div class="dxpc-content">
                                <div style="margin-bottom: 16px;">
                                    <label for="txtTypeDepense">Type Depense</label>
                                    <dx:ASPxTextBox ID="txtTypeDepense" ClientInstanceName="txtTypeDepense" runat="server"
                                        Width="100%" Theme="iOS">
                                    </dx:ASPxTextBox>
                                </div>
                                <div style="margin-bottom: 16px;">
                                    <label for="txtMontant">Montant</label>
                                    <dx:ASPxTextBox ID="txtMontant" ClientInstanceName="txtMontant" runat="server"
                                        Width="100%" Theme="iOS">
                                    </dx:ASPxTextBox>
                                </div>
                                <div style="margin-bottom: 16px;">
                                    <label for="dtDate">Date</label>
                                    <dx:ASPxDateEdit ID="dtDate" ClientInstanceName="dtDate" runat="server"
                                        Width="100%" Theme="iOS">
                                        <CalendarProperties TodayButtonText="Aujourd'hui" ClearButtonText="Effacer">
                                        </CalendarProperties>
                                    </dx:ASPxDateEdit>
                                </div>
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
            </div>
        </div>
        <asp:SqlDataSource ID="SqlEmployes" runat="server" ConnectionString="<%$ ConnectionStrings:ErpbilansocialConnectionString %>"
            SelectCommand="SelectEmployes" SelectCommandType="StoredProcedure" />
    </form>
</body>
</html>