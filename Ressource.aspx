<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Ressource.aspx.cs" Inherits="Ressource" %>
<%@ Register Assembly="DevExpress.Web.v20.1, Version=20.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Gestion des Ressources</title>
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
            max-width: 1500px;
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

        .dxbButton_iOS[title="Add New"] {
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

        .dxbButton_iOS[title="Add New"]:hover {
            background: radial-gradient(circle at center, #f97316, #ea580c) !important;
        }

        .add-button-container {
            display: flex !important;
            justify-content: center !important;
            align-items: center !important;
            padding: 8px 0 !important;
        }

        /* Adjusted selectors for Edit and Delete buttons to ensure styles apply */
        .dxgvCommandColumn_iOS .dxbButton_iOS[title="Edit"],
        .dxgvCommandColumn_iOS .dxbButton_iOS[title~="Edit"] {
            background: linear-gradient(to right, #16a34a, #22c55e) !important;
            margin: 0 2px !important;
            padding: 8px 16px !important;
            font-size: 14px !important;
            font-weight: 600 !important;
            min-width: 80px !important;
            height: 36px !important;
            border-radius: 8px !important;
        }

        .dxgvCommandColumn_iOS .dxbButton_iOS[title="Edit"]:hover,
        .dxgvCommandColumn_iOS .dxbButton_iOS[title~="Edit"]:hover {
            background: linear-gradient(to right, #15803d, #16a34a) !important;
            transform: translateY(-2px) !important;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.15) !important;
        }

        .dxgvCommandColumn_iOS .dxbButton_iOS[title="Delete"],
        .dxgvCommandColumn_iOS .dxbButton_iOS[title~="Delete"] {
            background: linear-gradient(to right, #dc2626, #ef4444) !important;
            margin: 0 2px !important;
            padding: 8px 16px !important;
            font-size: 14px !important;
            font-weight: 600 !important;
            min-width: 80px !important;
            height: 36px !important;
            border-radius: 8px !important;
        }

        .dxgvCommandColumn_iOS .dxbButton_iOS[title="Delete"]:hover,
        .dxgvCommandColumn_iOS .dxbButton_iOS[title~="Delete"]:hover {
            background: linear-gradient(to right, #b91c1c, #dc2626) !important;
            transform: translateY(-2px) !important;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.15) !important;
        }

        /* Remove spacing and separators between command buttons */
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

            .section-title {
                font-size: 16px;
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

            .dxbButton_iOS[title="Add New"] {
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

            .section-title {
                font-size: 14px;
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

            .dxbButton_iOS[title="Add New"] {
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

        // Debug functions
        function debugCallback(s, e) {
            console.log('Callback executed:', s.GetMainElement());
        }

        function grdInterventionContextMenu(s, e) {
            console.log('Context menu triggered for row index:', e.index);
            var x = ASPxClientUtils.GetEventX(e.htmlEvent);
            var y = ASPxClientUtils.GetEventY(e.htmlEvent);
            GridCl.SetFocusedRowIndex(e.index);
            popupBonEntree.ShowAtPos(x, y);
        }

        function CliTest() {
            console.log('CliTest called');
            var Nom = lbNom.GetText();
            lbRepe.SetText(Nom);
        }

        function MenuItemClickGamme(e) {
            if (e.item == null) {
                console.log('MenuItemClickGamme: No item selected');
                return;
            }
            var name = e.item.name;
            console.log('MenuItemClickGamme called with item:', name);

            if (name == "mAdd") {
                AddCl();
            }
            if (name == "mDelete") {
                DelCl();
            }
        }

        function AddCl() {
            console.log('AddCl called');
            try {
                if (typeof popuAdd === 'undefined') {
                    console.error('popuAdd is not initialized');
                    alert('Error: Add popup not initialized.');
                    return;
                }
                // Clear the form fields
                txtNomPrenom.SetValue('');
                txtLogin.SetValue('');
                txtEmail.SetValue('');
                txtPassword.SetValue('');
                cbRole.SetSelectedIndex(-1);
                popuAdd.Show();
            } catch (e) {
                console.error('Error in AddCl:', e);
                alert('An error occurred while opening the add popup: ' + e.message);
            }
        }

        function DelCl() {
            console.log('DelCl called');
            var index = GridCl.GetFocusedRowIndex();
            console.log('Focused row index:', index);
            if (index >= 0) {
                try {
                    GridCl.DeleteRow(index);
                } catch (e) {
                    console.error('Error in DelCl:', e);
                    alert('An error occurred while deleting the row: ' + e.message);
                }
            } else {
                alert('Please select a row to delete.');
            }
        }

        function GridMenuItemInspectionClick(e) {
            if (e.item == null) return;
            var name = e.item.name;

            if (name == "MenuEditRessource") EditRessource();
        }

        function EditRessource() {
            PopupUpdate.Show();
        }

        function EditRessources(s, e) {
            console.log('EditRessources called');
            try {
                if (typeof popuPassword === 'undefined') {
                    console.error('popuPassword is not initialized');
                    alert('Error: Edit popup not initialized.');
                    return;
                }
                var index = GridCl.GetFocusedRowIndex();
                if (index < 0) {
                    alert('Please select a row to edit.');
                    return;
                }
                // Populate the form with the selected row's data
                GridCl.GetRowValues(index, 'Nom_Prenom;Login;Email;Password;ID_Role', function (values) {
                    txtEditNomPrenom.SetValue(values[0]);
                    txtEditLogin.SetValue(values[1]);
                    txtEditEmail.SetValue(values[2]);
                    txtEditPassword.SetValue(values[3]);
                    cbEditRole.SetValue(values[4]);
                });
                popuPassword.Show();
            } catch (e) {
                console.error('Error in EditRessources:', e);
                alert('An error occurred while opening the edit popup: ' + e.message);
            }
        }

        function OnCustomButtonClick(s, e) {
            console.log('OnCustomButtonClick called, buttonID:', e.buttonID);
            if (e.buttonID === 'btnEdit') {
                EditRessources(s, e);
            }
        }

        function MoPa() {
            console.log('MoPa called');
            window.parent.MoPa();
        }

        function btnAddValider() {
            console.log('btnAddValider called');
            try {
                var nomPrenom = txtNomPrenom.GetValue();
                var login = txtLogin.GetValue();
                var email = txtEmail.GetValue();
                var password = txtPassword.GetValue();
                var role = cbRole.GetValue();

                if (!nomPrenom || !login || !email || !password || !role) {
                    alert('Please fill in all fields.');
                    return;
                }

                GridCl.AddNewRow();
                var index = GridCl.GetRowCount() - 1;
                GridCl.SetEditValue('Nom_Prenom', nomPrenom);
                GridCl.SetEditValue('Login', login);
                GridCl.SetEditValue('Email', email);
                GridCl.SetEditValue('Password', password);
                GridCl.SetEditValue('ID_Role', role);

                GridCl.UpdateEdit();
                popuAdd.Hide();
            } catch (e) {
                console.error('Error in btnAddValider:', e);
                alert('An error occurred while adding the new resource: ' + e.message);
            }
        }

        function btnValider() {
            GridCl.PerformCallback();
        }

        function btnEditValider() {
            console.log('btnEditValider called');
            try {
                var index = GridCl.GetFocusedRowIndex();
                if (index < 0) {
                    alert('No row selected for editing.');
                    return;
                }

                var nomPrenom = txtEditNomPrenom.GetValue();
                var login = txtEditLogin.GetValue();
                var email = txtEditEmail.GetValue();
                var password = txtEditPassword.GetValue();
                var role = cbEditRole.GetValue();

                if (!nomPrenom || !login || !email || !password || !role) {
                    alert('Please fill in all fields.');
                    return;
                }

                GridCl.StartEditRow(index);
                GridCl.SetEditValue('Nom_Prenom', nomPrenom);
                GridCl.SetEditValue('Login', login);
                GridCl.SetEditValue('Email', email);
                GridCl.SetEditValue('Password', password);
                GridCl.SetEditValue('ID_Role', role);
                GridCl.UpdateEdit();

                popuPassword.Hide();
            } catch (e) {
                console.error('Error in btnEditValider:', e);
                alert('An error occurred while updating the resource: ' + e.message);
            }
        }

        function OnGridClCallbackComplete(s, e) {
            console.log('OnGridClCallbackComplete called');
            if (s.cp_Update) {
                DevExpress.ui.notify(s.cp_Update, "success", 2000);
                delete s.cp_Update;
            }
        }
    </script>
</head>
<body>
    <canvas id="particle-canvas"></canvas>
    <form id="form1" runat="server">
        <div class="dashboard-header">
            <div class="dashboard-header-title">
                <span>Gestion des Ressources</span>
            </div>
        </div>

        <div class="card">
            <div class="grid-container">
                <dx:ASPxPopupMenu ID="popupBonEntree" runat="server" ClientInstanceName="popupBonEntree" GutterWidth="0px" Theme="Office365"
                    SeparatorColor="#7EACB1">
                    <Items>
                        <dx:MenuItem Name="MenuEditRessource" Text="Modifier">
                            <Image IconID="dashboards_update_svg_16x16" Width="16px" Height="16px" />
                        </dx:MenuItem>
                    </Items>
                    <ItemStyle ImageSpacing="5px" />
                    <SubMenuStyle BackColor="#EDF3F4" GutterWidth="0px" SeparatorColor="#7EACB1" />
                    <ClientSideEvents ItemClick="function(s, e) {GridMenuItemInspectionClick(e) ;}" />
                    <SubMenuItemImage Height="7px" Width="7px" />
                </dx:ASPxPopupMenu>

                <dx:ASPxGridView ID="GridCl" ClientInstanceName="GridCl" Theme="iOS" OnCustomCallback="GridCl_CustomCallback"
                    runat="server" AutoGenerateColumns="False" DataSourceID="SqlRessources"
                    KeyFieldName="ID" Width="100%">
                    <ClientSideEvents ContextMenu="grdInterventionContextMenu" EndCallback="OnGridClCallbackComplete" CustomButtonClick="OnCustomButtonClick" />

                    <SettingsBehavior AllowFocusedRow="true" AllowSelectByRowClick="true" />

                    <Columns>
                        <dx:GridViewCommandColumn ButtonType="Image" Caption=" " Width="120px"
                            ShowSelectCheckbox="false" VisibleIndex="0"
                            ShowDeleteButton="true"
                            ShowCancelButton="false">
                            <CustomButtons>
                                <dx:GridViewCommandColumnCustomButton ID="btnEdit" Text="Edit">
                                    <Image IconID="iconbuilder_actions_edit_svg_16x16" Width="16px" />
                                </dx:GridViewCommandColumnCustomButton>
                            </CustomButtons>
                            <HeaderTemplate>
                                <div class="add-button-container">
                                    <dx:ASPxButton HorizontalAlign="Center" runat="server" Text=" " RenderMode="Link" AutoPostBack="false" ToolTip="Add New">
                                        <Image IconID="iconbuilder_actions_add_svg_16x16" Width="16px"></Image>
                                        <ClientSideEvents Click="AddCl" />
                                    </dx:ASPxButton>
                                </div>
                            </HeaderTemplate>
                        </dx:GridViewCommandColumn>
                        <dx:GridViewDataTextColumn FieldName="ID" Visible="false">
                        </dx:GridViewDataTextColumn>

                        <dx:GridViewDataTextColumn Caption="NomPrenom" FieldName="Nom_Prenom" Width="40%" Visible="True" HeaderStyle-Font-Bold="true" HeaderStyle-BackColor="#dedede" />
                        <dx:GridViewDataTextColumn Caption="Login" FieldName="Login" Width="40%" Visible="True" HeaderStyle-Font-Bold="true" HeaderStyle-BackColor="#dedede" />
                        <dx:GridViewDataTextColumn Caption="Email" FieldName="Email" Width="40%" Visible="True" HeaderStyle-Font-Bold="true" HeaderStyle-BackColor="#dedede" />

                        <dx:GridViewDataTextColumn Caption="Password" FieldName="Password" Width="40%" Visible="True" HeaderStyle-Font-Bold="true" HeaderStyle-BackColor="#dedede">
                            <PropertiesTextEdit Password="true" />
                            <CellStyle CssClass="password-field" />
                        </dx:GridViewDataTextColumn>
                        
                        <dx:GridViewDataComboBoxColumn FieldName="ID_Role" Caption="Role" HeaderStyle-Font-Bold="true" HeaderStyle-BackColor="#dedede" Width="40%">
                            <PropertiesComboBox DataSourceID="SqlRole" TextField="Description" ValueField="ID_Role" />
                        </dx:GridViewDataComboBoxColumn>
                    </Columns>
                    <SettingsSearchPanel Visible="true" />
                    <SettingsEditing Mode="Batch" />
                    <SettingsCommandButton>
                        <PreviewChangesButton Text="Preview">
                        </PreviewChangesButton>
                        <DeleteButton Text="Delete">
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
                        <Header Font-Bold="True" ForeColor="#333333"></Header>
                        <AlternatingRow Enabled="True" BackColor="#FAFAFA"></AlternatingRow>
                    </Styles>
                    <SettingsPager PageSize="50" EnableAdaptivity="true">
                        <PageSizeItemSettings Visible="true" Position="Right" ShowAllItem="true">
                        </PageSizeItemSettings>
                    </SettingsPager>

                    <SettingsBehavior AutoExpandAllGroups="true" AllowDragDrop="False" AllowGroup="False" AllowFocusedRow="True" />
                    <Settings ShowFooter="false" ShowColumnHeaders="true" ShowGroupPanel="false" ShowGroupFooter="VisibleIfExpanded"
                        VerticalScrollableHeight="400" VerticalScrollBarMode="Visible"></Settings>
                </dx:ASPxGridView>

                <asp:SqlDataSource ID="SqlRessources" runat="server"
                    ConnectionString="<%$ ConnectionStrings:ErpbilansocialConnectionString %>"
                    SelectCommand="SelectUsersession" SelectCommandType="StoredProcedure"
                    DeleteCommand="deleteUsersession" DeleteCommandType="StoredProcedure"
                    UpdateCommand="updateUsersession" UpdateCommandType="StoredProcedure"
                    InsertCommand="insertUsersession" InsertCommandType="StoredProcedure">
                    <DeleteParameters>
                        <asp:Parameter Name="ID" />
                    </DeleteParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="Email" />
                        <asp:Parameter Name="Password" />
                        <asp:Parameter Name="Nom_Prenom" />
                        <asp:Parameter Name="Login" />
                        <asp:Parameter Name="ID_Role" />
                    </UpdateParameters>
                    <InsertParameters>
                        <asp:Parameter Name="Email" />
                        <asp:Parameter Name="Password" />
                        <asp:Parameter Name="Nom_Prenom" />
                        <asp:Parameter Name="Login" />
                        <asp:Parameter Name="ID_Role" />
                    </InsertParameters>
                </asp:SqlDataSource>

                <asp:SqlDataSource ID="SqlRole" runat="server"
                    ConnectionString="<%$ ConnectionStrings:ErpbilansocialConnectionString %>"
                    SelectCommand="SelectRole" SelectCommandType="StoredProcedure"></asp:SqlDataSource>

                <!-- Add Popup -->
                <dx:ASPxPopupControl ID="popuAdd" ClientInstanceName="popuAdd" ShowCloseButton="true" ShowHeader="true" HeaderText="Add New Resource"
                    Width="400px" PopupVerticalAlign="TopSides" PopupHorizontalAlign="WindowCenter"
                    runat="server" Theme="iOS">
                    <ContentCollection>
                        <dx:PopupControlContentControl>
                            <div class="dxpc-content">
                                <div>
                                    <label for="txtNomPrenom">Nom Prenom</label>
                                    <dx:ASPxTextBox ID="txtNomPrenom" ClientInstanceName="txtNomPrenom" runat="server" Width="100%" Theme="iOS" />
                                </div>
                                <div>
                                    <label for="txtLogin">Login</label>
                                    <dx:ASPxTextBox ID="txtLogin" ClientInstanceName="txtLogin" runat="server" Width="100%" Theme="iOS" />
                                </div>
                                <div>
                                    <label for="txtEmail">Email</label>
                                    <dx:ASPxTextBox ID="txtEmail" ClientInstanceName="txtEmail" runat="server" Width="100%" Theme="iOS" />
                                </div>
                                <div>
                                    <label for="txtPassword">Password</label>
                                    <dx:ASPxTextBox ID="txtPassword" ClientInstanceName="txtPassword" runat="server" Width="100%" Theme="iOS" Password="true" />
                                </div>
                                <div>
                                    <label for="cbRole">Role</label>
                                    <dx:ASPxComboBox ID="cbRole" ClientInstanceName="cbRole" runat="server" Width="100%" Theme="iOS"
                                        DataSourceID="SqlRole" TextField="Description" ValueField="ID_Role">
                                    </dx:ASPxComboBox>
                                </div>
                                <div class="popup-buttons">
                                    <dx:ASPxButton ID="btnAddOK" runat="server" Width="100px" ClientInstanceName="btnAddOK" Text="OK" Theme="iOS" AutoPostBack="false">
                                        <ClientSideEvents Click="btnAddValider" />
                                    </dx:ASPxButton>
                                    <dx:ASPxButton ID="btnAddCancel" runat="server" Width="100px" ClientInstanceName="btnAddCancel" Text="Cancel" Theme="iOS" AutoPostBack="false">
                                        <ClientSideEvents Click="function(s, e) { popuAdd.Hide(); }" />
                                    </dx:ASPxButton>
                                </div>
                            </div>
                        </dx:PopupControlContentControl>
                    </ContentCollection>
                </dx:ASPxPopupControl>

                <!-- Edit Popup -->
                <dx:ASPxPopupControl ID="popuPassword" ClientInstanceName="popuPassword" ShowCloseButton="true" ShowHeader="true" HeaderText="Edit Resource"
                    Width="400px" PopupVerticalAlign="TopSides" PopupHorizontalAlign="WindowCenter"
                    runat="server" Theme="iOS">
                    <ContentCollection>
                        <dx:PopupControlContentControl>
                            <div class="dxpc-content">
                                <div>
                                    <label for="txtEditNomPrenom">Nom Prenom</label>
                                    <dx:ASPxTextBox ID="txtEditNomPrenom" ClientInstanceName="txtEditNomPrenom" runat="server" Width="100%" Theme="iOS" />
                                </div>
                                <div>
                                    <label for="txtEditLogin">Login</label>
                                    <dx:ASPxTextBox ID="txtEditLogin" ClientInstanceName="txtEditLogin" runat="server" Width="100%" Theme="iOS" />
                                </div>
                                <div>
                                    <label for="txtEditEmail">Email</label>
                                    <dx:ASPxTextBox ID="txtEditEmail" ClientInstanceName="txtEditEmail" runat="server" Width="100%" Theme="iOS" />
                                </div>
                                
                                <div>
                                    <label for="cbEditRole">Role</label>
                                    <dx:ASPxComboBox ID="cbEditRole" ClientInstanceName="cbEditRole" runat="server" Width="100%" Theme="iOS"
                                        DataSourceID="SqlRole" TextField="Description" ValueField="ID_Role">
                                    </dx:ASPxComboBox>
                                </div>
                                <div class="popup-buttons">
                                    <dx:ASPxButton ID="ASPxButton1" runat="server" Width="100px" ClientInstanceName="btnok" Text="OK" Theme="iOS" AutoPostBack="false">
                                        <ClientSideEvents Click="btnEditValider" />
                                    </dx:ASPxButton>
                                    <dx:ASPxButton ID="btnok1" runat="server" Width="100px" ClientInstanceName="btnok" Text="Cancel" Theme="iOS" AutoPostBack="false">
                                        <ClientSideEvents Click="function(s, e) { popuPassword.Hide(); }" />
                                    </dx:ASPxButton>
                                </div>
                            </div>
                        </dx:PopupControlContentControl>
                    </ContentCollection>
                </dx:ASPxPopupControl>
                <dx:ASPxPopupControl ID="PopupUpdate" ClientInstanceName="PopupUpdate" ShowCloseButton="true" ShowHeader="true" HeaderText="Information"
                    Width="450px" PopupVerticalAlign="TopSides" PopupHorizontalAlign="WindowCenter"
                    runat="server" Theme="IOS">
                    <ContentCollection>
                        <dx:PopupControlContentControl>
                            <style type="text/css">
                                @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap');

                                .popup-container {
                                    font-family: 'Poppins', sans-serif;
                                    padding: 25px;
                                    background: linear-gradient(145deg, #8b5cf6, #ec4899);
                                    border-radius: 20px;
                                    box-shadow: 0 8px 30px rgba(0, 0, 0, 0.2), 0 0 15px rgba(139, 92, 246, 0.5);
                                    text-align: center;
                                    max-width: 400px;
                                    margin: 0 auto;
                                    animation: popupEntrance 0.6s ease-out forwards;
                                    border: 2px solid rgba(255, 255, 255, 0.2);
                                }

                                .message-container {
                                    margin-bottom: 25px;
                                    background: rgba(255, 255, 255, 0.1);
                                    padding: 15px;
                                    border-radius: 12px;
                                    box-shadow: inset 0 2px 10px rgba(0, 0, 0, 0.1);
                                }

                                .message-container .dxeBase {
                                    font-size: 18px;
                                    font-weight: 600;
                                    color: #ffffff;
                                    text-shadow: 0 2px 4px rgba(0, 0, 0, 0.3);
                                    background: transparent;
                                    padding: 0;
                                    display: block;
                                    transition: transform 0.3s ease;
                                }

                                .message-container .dxeBase:hover {
                                    transform: scale(1.02);
                                }

                                .button-panel {
                                    display: flex;
                                    justify-content: center;
                                    gap: 20px;
                                }

                                .button-panel .dxbButton {
                                    border-radius: 10px;
                                    padding: 12px 25px;
                                    font-size: 16px;
                                    font-weight: 600;
                                    transition: all 0.3s ease;
                                    animation: pulseGlow 1.5s infinite ease-in-out;
                                    box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
                                    cursor: pointer;
                                }

                                .button-panel .dxbButton:first-child {
                                    background: linear-gradient(90deg, #10b981, #34d399);
                                    color: #ffffff;
                                }

                                .button-panel .dxbButton:first-child:hover {
                                    background: linear-gradient(90deg, #059669, #10b981);
                                    box-shadow: 0 6px 20px rgba(16, 185, 129, 0.5);
                                    transform: translateY(-3px);
                                }

                                .button-panel .dxbButton:last-child {
                                    background: linear-gradient(90deg, #f87171, #f43f5e);
                                    color: #ffffff;
                                }

                                .button-panel .dxbButton:last-child:hover {
                                    background: linear-gradient(90deg, #ef4444, #dc2626);
                                    box-shadow: 0 6px 20px rgba(244, 63, 94, 0.5);
                                    transform: translateY(-3px);
                                }

                                @keyframes popupEntrance {
                                    0% {
                                        opacity: 0;
                                        transform: scale(0.8) translateY(20px);
                                    }
                                    70% {
                                        opacity: 1;
                                        transform: scale(1.05) translateY(0);
                                    }
                                    100% {
                                        opacity: 1;
                                        transform: scale(1) translateY(0);
                                    }
                                }

                                @keyframes pulseGlow {
                                    0% {
                                        box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
                                    }
                                    50% {
                                        box-shadow: 0 6px 25px rgba(0, 0, 0, 0.3), 0 0 20px rgba(255, 255, 255, 0.3);
                                    }
                                    100% {
                                        box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
                                    }
                                }

                                @media (max-width: 400px) {
                                    .popup-container {
                                        padding: 20px;
                                        max-width: 100%;
                                    }

                                    .button-panel {
                                        flex-direction: column;
                                        gap: 15px;
                                    }

                                    .button-panel .dxbButton {
                                        width: 100%;
                                        padding: 10px;
                                    }
                                }
                            </style>

                            <div class="popup-container">
                                <div class="message-container">
                                    <dx:ASPxLabel ID="txtEror" ClientInstanceName="txtEror" Text="Souhaitez-vous réinitialiser le mot de passe de cet utilisateur ?" 
                                        ForeColor="White" Font-Bold="true" runat="server"></dx:ASPxLabel>
                                </div>
                                <div class="button-panel">
                                    <dx:ASPxButton ID="ASPxButton2" runat="server" Width="100px" ClientInstanceName="btnok" Text="OK" Theme="Moderno" AutoPostBack="false">
                                        <ClientSideEvents Click="btnValider" />
                                    </dx:ASPxButton>
                                    <dx:ASPxButton ID="ASPxButton3" runat="server" Width="100px" ClientInstanceName="btnok" Text="Fermer" Theme="Moderno" AutoPostBack="false">
                                        <ClientSideEvents Click="function(s, e) { PopupUpdate.Hide(); }" />
                                    </dx:ASPxButton>
                                </div>
                            </div>
                        </dx:PopupControlContentControl>
                    </ContentCollection>
                </dx:ASPxPopupControl>
            </div>
        </div>
    </form>
</body>
</html>